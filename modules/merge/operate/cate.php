<?php
include_once('include/pagenav.inc.php');
include_once ('include/common.inc.php');
include_once (XOOPS_ROOT_PATH . '/class/xoopstree.php');
include_once ('include/cate/ability.class.php');
include_once ('include/cate/category.class.php');

if (!in_array(XOOPS_GROUP_ADMIN, $xoopsUser->getGroups()))
{
    redirect_header(XOOPS_URL."/modules/profile/user.php",
                     2, '分類管理只允許 Admin 進入!');
    exit();
}

/*
 * 傳回每一個分類的底下所有層 cid array
 * 
 * 若該分類底下沒資料了，至少保留自己本身
 * 
 * @param $subj_cid int
 * @return array
 */
function getAbiCids($subj_cid)
{
    global $cate_abi;
    $abiSortIds = array("''");

    if($subj_cid < 0)  // -1: 沒給 $_GET['subj']
        return $abiSortIds;

    $abiSortIds = $cate_abi->getAllAbi($subj_cid);
    // 該層沒下一層了，就保留自己這一層，例外：自己這一層是科目
    if(0 == count($abiSortIds) && $cate_abi->level($subj_cid) != -1)
        $abiSortIds[] = "'" . $subj_cid . "'";
    return $abiSortIds;
}


/*
 * 排序分類列表：排序依據 ordinal 欄位
 * 
 * 有分頁功能
 * 
 * @param $subj_cid int
 * @param $limit int
 * @param $start int
 * @return array
 */
function sortedAbiList($subj_cid, $limit, $start)
{
    $dummy = array('total' => 0, 'abis' => array());
    $abiSortIds = getAbiCids($subj_cid);

    // 直接用 SQL ORDER BY + LIMIT 排序的結果並不正確
    // 所以要先排序列表
    $abiSortIds = CateAdmin::getSortedListByCid($abiSortIds);

    $total = count($abiSortIds);
    if(0 == $total)  return $dummy;

    // 再將列表分頁
    $cids = array();
    for($idx = 0; $idx < $total; $idx ++)
        if($idx >= $start && $idx < $start + $limit)
            $ret[] = $abiSortIds[$idx];

    return array('total' => $total, 'abis' => $ret);
}


/*
 * quick ref. to dict(pid, cid, title)
 *
 * @param $title str
 * @param $pid int
 * @param $cid int
 * @return array
 */
function abiItem($title, $pid, $cid=-1)
{
    return array('pid' => $pid, 'cid' => $cid, 'title' => $title);
}


/*
 * 傳回n格（n層分類）為一列的空陣列
 *
 * @param $subj_cid int
 * @return array
 */
function emptyAbiRow($subj_cid)
{
    $item = array();
    for($idx = 0; $idx < 1; $idx ++)
        //$item[] = abiItem('', 0 == $idx ? $subj_cid : -1);
        $item[] = abiItem('', -1);
    return array($item);
}


/*
 * 科目底下的分類列表：各節點不重複 + 排序
 * 
 * @param $subj_cid int
 * @return array
 */
function getAbiList($subj_cid, $limit, $start)
{
    global $cate_abi;

    $abis = array();
    $cur_pid = 0;
    $sortteddatas = sortedAbiList($subj_cid, $limit, $start);
    //print_R($sortteddatas);
    foreach($sortteddatas['abis'] as $cur_cid)
    {
        $ids = explode('/', $cate_abi->getIdPathFromId($cur_cid));
        $item = array();
        for($idx = 0; $idx <= 0; $idx ++)
        {
            if($idx >= count($ids))
            {  // 沒分類資料就補白
                $item[] = abiItem('', $cur_pid);
                $cur_pid = -1;
                continue;
            }
            $cid = $ids[$idx];
            $subcate = new Category($cid);
            $item[] = abiItem($subcate->title(), $ids[$idx - 1], $cid);
            $cur_pid = $cid;
        }
        $abis[] = $item;
    }
    if(0 == count($abis) && is_null($subj_cid))  // 該科目底下都沒有分類就傳 null
        //return array('total' => 1, 'abis' => emptyAbiRow($subj_cid));  // 該科目底下都沒有分類就傳回一列空的
        return array('total' => 0, 'abis' => array());
    return array('total' => $sortteddatas['total'], 'abis' => $abis);
}


/*
 * 新增分類到資料庫
 * 
 * @param $abis array ajax: [{'cid': cid, 'pid': pid, 'title': title}]
 * @return array [status: true/false - success/fail,
 *            inserted data: [{'cid': cid, 'pid': pid, 'title': title}]]
 */
function ajaxUpdateAbi($abis)
{
    global $db, $cate_abi;

    $db->queryF('BEGIN');
    $ret = array();
    foreach($abis as $abi)
    {
        if($abi['pid'] > -1)  // 有 pid: 傳過來的第一個(層)分類
            $pid = intval($abi['pid']);
        else
            $pid = 0;
        if('' == trim($abi['title']))
            continue;

        if($cate_abi->exists($pid, $abi['title']))
        {  // 檢查重複
            $db->queryF('ROLLBACK');
            return array('status' => false,
                         'ret' => "分類：{$abi['title']}與同層其他分類重複！");
        }

        // 新增到分類表
        $cate = new Category;
        $cate->set('pid', $pid);
        $cate->set('title', $abi['title']);
        $cate->set('created');
        $cate->update();

        $cid = $cate->cid();
        $ret[] = abiItem($abi['title'], $pid, $cid);
        $pid = $cid;  // 除了第一個(層)分類，pid 就是前一個(層)分類的 cid
    }
    $db->queryF('COMMIT');
    return array('status' => true, 'ret' => $ret);
}


/*
 * 刪除一筆分類(該分類底下層沒分類)
 * 
 * @param $cid int
 * @return array [status: true/false - success/fail, delete all row: true/false]
 */
function ajaxDeleteAbi($cid)
{
    global $cate_abi;

    if($cate_abi->hasChild($cid))
        return array('status' => false);  // 有底下層：不能刪

    $idpath = $cate_abi->getIdPathFromId($cid);
    $cate = new Category($cid);
    $cate->delete();
    
    // 上一層是否有下一層分類？
    // 沒有下一層了：則整列不能刪除
    // 有下一層：則可以刪除該列
    $abiarr = explode('/', $idpath);
    array_pop($abiarr);  // self
    $pid = array_pop($abiarr);  // parent
    return array('status' => true,
                 'delete' => $cate_abi->hasChild($pid));
}


/*
 * 分類更名
 * 
 * @param cid int
 * @param title str
 * @return bool
 */
function ajaxEditAbi($cid, $title)
{
    global $db, $cate_abi;

    $cate = new Category($cid);

    // 檢查重複: 同一個 pid, 有一個 $title 就是重複
    $abiarr = explode('/', $cate_abi->getIdPathFromId($cid));
    array_pop($abiarr);  // self
    $pid = array_pop($abiarr);  // parent
    if (empty($pid))
        $pid = 0;
    if($cate_abi->exists($pid, $title))  return false;

    $cate->set('title', $title);
    $cate->set('created');
    $cate->update();
    
    return true;
}


/*
 * 排序分類
 * 
 * @param $cids array
 */
function ajaxUpdateSort($cids)
{
    global $db, $categoryTb;
    
    $idx = 1;
    foreach($cids as $cid)
    {
        $sql = "UPDATE {$categoryTb} SET ordinal='{$idx}' WHERE cid={$cid}";
        $db->queryF($sql);
        $idx ++;
    }
    return true;
}


/*
 * 該分類是否有報表？
 * 
 * @param $cid int
 * @param bool
 */
function ajaxAbiHasQuestion($cid)
{
    // @TODO: 未完成
    return false;
    //return getQtAbilityTotal($cid) > 0;
}

global $xoopsDB;
$db = $xoopsDB;
$categoryTb = $xoopsDB->prefix('merge_category');
$cate_abi = new CateAbility;

$params = "op=operate&subop={$subop}";
$op = isset($_GET['wo']) ? $_GET['wo'] : 'dummy';
$edu_cid = isset($_GET['edu']) ? intval($_GET['edu']) : 0;
$subj_mapcid = isset($_GET['subj']) ? intval($_GET['subj']) : null;
$levelcids = isset($_GET['levelcids']) && '' != trim($_GET['levelcids'])
                ? $_GET['levelcids'] : null;

// 第一層是 subj_cid, 這邊把 subj_cid 加進 levelcids
$lcids = is_null($levelcids) ? array() : explode(',', $levelcids);
array_unshift($lcids, $subj_cid);
$levelcids = $lcids;

if('updateabi' == $op)
{
    echo json_encode(ajaxUpdateAbi($_POST['list']));
    exit;
}
if('abihasquestion' == $op)
{
    echo json_encode(ajaxAbiHasQuestion($_POST['cid']));
    exit;
}
if('deleteabi' == $op)
{
    echo json_encode(ajaxDeleteAbi($_POST['cid']));
    exit;
}
if('editabi' == $op)
{
    echo json_encode(ajaxEditAbi($_POST['cid'], $_POST['title']));
    exit;
}
if('sortabi' == $op)
{
    echo json_encode(ajaxUpdateSort($_POST['cids']));
    exit;
}

$limit = $xoopsModuleConfig['pagenav'];
//$limit = 65535;
$start = isset($_GET['start']) ? intval($_GET['start']) : 0;

$abilists = getAbiList(end($levelcids), $limit, $start);
/* 刪除後若在最後一頁，最後一頁剛好沒列表，則會列空的
 * @TODO: 這段無作用
if (count($abilists['abis']) == 0)
{
    $start = 0;
    $abilists = getAbiList(end($levelcids), $limit, $start);
    header("Location: $origuri");
    exit();
}
*/

$tpl = $xoopsTpl;
$tpl->assign('abis', $abilists['abis']);
$tpl->assign('start', $start);
$tpl->assign('total', $abilists['total']);
$nav = new MergePageNav($abilists['total'], $limit,
                        $start, 'start', 'op=operate&subop=cate');
$tpl->assign('navPath', $nav->renderNav());

$xoopsOption['template_main'] = 'cate.tpl';
?>
