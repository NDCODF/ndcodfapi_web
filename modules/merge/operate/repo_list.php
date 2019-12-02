<?php

if(!$xoopsUser)
{
    redirect_header('index.php', 2, _MD_NO_RIGHT_ACCESS);
    exit();
}

include_once ('include/repo_pagenav.inc.php');
include_once ('include/repo_common.inc.php');
include_once ('include/repo_cate/ability.class.php');
include_once ('include/repo_cate/category.class.php');
include_once ('include/repo_documents.class.php');
include_once ('include/repo_group.class.php');
include_once('include/odfapi-utils.php');


generateTemplateInfo2JSON();

function getCIDList(){
    global $xoopsDB;
    $sql_used = "SELECT distinct cid from ndcodfapi.ndc_repo_user_templates";
    $rs_docname  = $xoopsDB->queryF($sql_used);
    $ret = Array();
    $where = "";
    while($rows = $xoopsDB->fetchArray($rs_docname))
    {
        $ret[]=$rows['cid'];
    };
    $ret = implode(",",$ret);
    $where = " cid in ($ret)";
    $sql_title = "SELECT * from ndcodfapi.ndc_repo_category where $where";
    $rs_docname  = $xoopsDB->queryF($sql_title);
    $obj = Array();
    while($rows = $xoopsDB->fetchArray($rs_docname))
    {
        $obj[]=$rows;
    };
    return $obj;
}
$db = $xoopsDB;
$tpl = $xoopsTpl;

$orderfield = array('cid', 'extname', 'upcount',
                     'uptime', 'uid', 'title');
$orderopt = array(_MERGE_LIST_ORDER_CATEGORY, _MERGE_LIST_ORDER_DOCUMENT, _MERGE_LIST_ORDER_UPDATETIMES, _MERGE_LIST_ORDER_UPDATE, _MERGE_LIST_ORDER_USER, _MERGE_LIST_ORDER_NAME);

$uid = $xoopsUser->uid();
$permitTb = $db->prefix('repo_user_permit');
$cate_abi = new CateAbility;
$tree = $cate_abi->getAbiTree(0);
$userTb = $db->prefix('users');
$hare4me = isset($_GET['wo']) && 'share' == $_GET['wo'];  // 別人分享給我
$rec_id = isset($_GET['id']) && intval($_GET['id']) > 0 ?
            intval($_GET['id']) : 0;

$limit = $xoopsModuleConfig['pagenav'];
$start = isset($_GET['start']) ? intval($_GET['start']) : 0;
#$grpid = isset($_GET['grpid']) ? intval($_GET['grpid']) : 0;
$grpid = 0;
$cid = isset($_GET['cid']) ? intval($_GET['cid']) : -1;
$orderby = isset($_GET['orderby']) ? intval($_GET['orderby']) : -1;
$orderbyf = $orderby > -1 ? $orderfield[$orderby] : '';  // 預設 orderby
if (!isset($_GET['acce']))
    $acce = 'asc';
elseif (strtolower($_GET['acce'] == 'desc'))
    $acce = 'desc';
else
    $acce = 'asc';

$where = '';
$query = array();

$total = count(getList(array(), '', 0, 0, $share4me, $rec_id, $grpid));
$tpl->assign('total', $total);

$arg = $share4me ? '&wo=share' : '';
if (!isset($_GET['search']) && !isset($_GET['id']))
{
    $extra = "grpid=$grpid&orderby=$orderby";
    $nav = new MergePageNav($total, $limit, $start, 'start', $extra);
    $tpl->assign('navPath', $nav->renderNav());
}

$rows = getList(array(), '', $limit, $start, $share4me,
                    $rec_id, $grpid, $cid,  $orderbyf, $acce);
// 列自己的列表
foreach($rows as $row)
{
    $cate = new Category($row['cid']);
    $row['cate'] = $cate->title();
    $row['hide_text'] = $row['hide'] == 0 ? '顯示' : '隱藏';

    // 更新呼叫次數
    // @TODO: 搬到 getList() ?
    $doc = new Documents($row['rec_id']);
    $doc->set('callcount', $row['accesscount']);
    $doc->update();

    // 權限列表：已選之使用者
    $sql = "SELECT uid FROM $permitTb WHERE rec_id='${row['rec_id']}'";
    $rsPerm = $db->queryF($sql) or die($db->error());
    $row['selusers'] = array();
    while($rowPerm = $db->fetchArray($rsPerm))
        $row['selusers'][] = $rowPerm['uid'];

    $user = new XoopsUser($row['uid']);
    // 使用者名稱 = 帳號名稱(顯示名稱)
    $row['uname'] = $user->uname();
    if (trim($user->name()) != '')
        $row['uname'] .= "({$user->name()})";

    // 是否顯示部門標籤? 同部門就不顯示
    $row['show_grpname'] = false;
    foreach ($row['groups'] as $rowGrpIdx => $rowGrpName)
    {
        //var_dump($rowGrpIdx);
        if ($rowGrpIdx != $grpid)
        {
            $row['show_grpname'] = true;
            $row['groupname'] = $rowGrpName;
            break;
        }
    }

    if ($xoopsUser->isAdmin())  // admin 能夠列其他人的報表
        $row['for_admin'] = true;
    if ($row['uid'] != $uid)
        $row['no_perm'] = true;  // 自己不能設他人權限
    if ($rec_id > 0 && $row['rec_id'] == $rec_id)
        $datas[] = $row;
    if (0 == $rec_id)
        $datas[] = $row;
}

// 設定權限顯示 & 文件類型
$newdatas = array();
foreach($datas as $row)
{
    $row['selusers'] = json_encode($row['selusers'], JSON_NUMERIC_CHECK);
    $newdatas[] = $row;
}

// 權限列表:
$sql = "SELECT user.uid, uname FROM {$userTb} AS user";
$rs = $db->queryF($sql) or die($db->error());
$userlist = array();
while($row = $db->fetchArray($rs))
{
    $user = new XoopsUser($row['uid']);
    // 剔除本人&管理者
    if (!$user->isAdmin() && $user->uid() != $uid)
    {
        // 使用者名稱 = 帳號名稱(顯示名稱)
        if (trim($user->name()) != '')
            $row['uname'] .= "({$user->name()})";
        $userlist[$row['uid']] = $row['uname'];
    }
}

// 分類列表
$allCID = getCIDList();
$tpl->assign('cateopt',
                format_smartyoption($allCID, 'cid', 'title'));
// 部門列表
$tpl->assign('grpopt',
                format_smartyoption($allCID, 'cid', 'title'));

$tpl->assign('orderopt', $orderopt);
$tpl->assign('acce', $acce);  // 排序順序: desc or asc
//print_R($newdatas);
$tpl->assign('wo', $share4me ? 'share' : '');
$tpl->assign('start', $start);
$tpl->assign('userlist', $userlist);
$tpl->assign('oxoolurl', $xoopsModuleConfig['oxoolurl']);
$tpl->assign('datas', $newdatas);
$tpl->assign('acturi', 'index.php?op=operate&subop=repo_setsta');

$xoopsOption['template_main'] = 'repo_list.tpl';
?>
