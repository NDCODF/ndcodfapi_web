<?php
/**
 * =======================================================================
 * Name:
 * 上傳報表檔並新建/修改 SQL
 * 
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */

if(!$xoopsUser)
{
    redirect_header("index.php", 2, _MD_NO_RIGHT_ACCESS);
    exit();
}

include_once ('include/common.inc.php');
include_once ('include/cate/ability.class.php');
include_once ('include/cate/category.class.php');
include_once('include/documents.class.php');

/*
 * generate uuid using mysql function
 */
function mysqlUuid()
{
    global $xoopsDB;

    $sql = "SELECT UUID()";
    $rs = $xoopsDB->queryF($sql);
    list($id) = $xoopsDB->fetchRow($rs);
    return $id;
}


/*
 * upload file info: extname & docname
 */
function getUpFileInfo()
{
    $ext = pathinfo($_FILES['uploadFile']['name'])['extension'];
    $docname = str_replace(".$ext", '', $_FILES['uploadFile']['name']);

    if (empty($docname))
    {
        redirect_header($_SERVER['HTTP_REFERER'], 2, '上傳檔名不正確');
        exit;        
    }
    return array($ext, $docname);
}


/*
 * upload file
 *
 * @param obj $db xoopsdb
 * @param obj $cnf xoops module config
 * @param str $tbl
 * @param id int
 * @return str uuid
 */
function uploadFile(&$db, &$cnf, $tbl, $id)
{
    list($ext, $docname) = getUpFileInfo();

    if ($id > 0)
    {
        $doc = new Documents($id);
        $uuid = $doc->get('endpt');
    }
    else
        $uuid = mysqlUuid();

    $copyfrom = $_FILES['uploadFile']['tmp_name'];
    $filename = $_FILES['uploadFile']['name'];
    $copyto = "{$cnf['doctemplatedir']}/{$uuid}.{$ext}";
    // @TODO: 檢查 copyto 是否有檔案 & sql 已存在
    //echo $copyfrom . "=>" . $copyto;exit;
    if (move_uploaded_file($copyfrom, $copyto))
        return $uuid;
    return '';
}


$user = $xoopsUser;
$db = $xoopsDB;
$cnf = $xoopsModuleConfig;
$tbl = $db->prefix('merge_user_templates');

// 分類列表
$cate_abi = new CateAbility;
$tree = $cate_abi->getAbiTree(0);
$xoopsTpl->assign('cateopt',
    format_smartyoption($tree['child'], 'cid', 'title'));

if (isset($_POST['wo']) && 'upload' == $_POST['wo'])
{
    if (trim($_POST['id']) == '')  // 上傳新的
    {
        $uuid = uploadFile($db, $cnf, $tbl, 0);
        if (!empty($uuid))
        {
            list($ext, $docname) = getUpFileInfo();
            $uid = $xoopsUser->uid();

            $doc = new Documents;
            $doc->set('uid', $uid);
            $doc->set('cid', intval($_POST['cid']));
            $doc->set('title', $_POST['title']);
            $doc->set('desc', $_POST['desc']);
            $doc->set('docname', $docname);
            $doc->set('extname', $ext);
            $doc->set('endpt', $uuid);
            $doc->update();

            redirect_header('index.php?op=operate&subop=list',
                            2, 'OK');
            exit();
        }
        else
        {
            redirect_header($_SERVER['HTTP_REFERER'],
                            2, 'upload error');
            exit();
        }
    }
    else  // 修改現有紀錄, 若有選擇上傳檔案則也上傳檔案
    {
        $id = intval($_POST['id']);

        $doc = new Documents($id);
        $doc->set('cid', intval($_POST['cid']));
        $doc->set('title', $_POST['title']);
        $doc->set('desc', $_POST['desc']);
        $doc->set('upcount', $doc->get('upcount') + 1);  // 更新次數
        $doc->set('hide', $_POST['hide']);
        $doc->update();

        if (0 == $_FILES['uploadFile']['error'])
        {
            $isNew = false;
            $uuid = uploadFile($db, $cnf, $tbl, $id);
            if (empty($uuid))
            {
                redirect_header($_SERVER['HTTP_REFERER'],
                                2, 'upload error');
                exit();
            }

            list($ext, $docname) = getUpFileInfo();

            // 上傳後會蓋掉原檔，但若原檔副檔名與上傳的副檔名不同就會變兩個檔
            // 所以在這裡做一次刪檔動作
            // 刪除檔名相同，但不同 extname 的檔案
            $doc = new Documents($id);
            $oldext = $doc->get('extname');
            if ($oldext != $ext)
                @unlink("{$cnf['doctemplatedir']}/{$uuid}.{$oldext}");

            $doc = new Documents($id);
            $doc->set('extname', $ext);
            $doc->set('docname', $docname);
            $doc->update();
        }

        redirect_header('index.php?op=operate&subop=list', 2, 'OK');
        exit();
    }
}
else
    $xoopsOption['template_main'] = 'main.tpl';
?>
