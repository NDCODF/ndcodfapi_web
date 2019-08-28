<?php
/**
 * =======================================================================
 * Name:
 * 列表
 * 
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * 
 * Description:
 * 列出使用者的樣板列表
 * =======================================================================
 */

if(!$xoopsUser)
{
    redirect_header("index.php", 2, _MD_NO_RIGHT_ACCESS);
    exit();
}

if (!isset($_REQUEST['id']))
{
    redirect_header("index.php", 2, _MD_NO_RIGHT_ACCESS);
    exit();
}

$db = $xoopsDB;
$tpl = $xoopsTpl;

$uid = $xoopsUser->uid();
$tbl = $db->prefix('merge_user_templates');
$permitTb = $db->prefix('merge_user_permit');
$userTb = $db->prefix('users');

// @TODO: unused
if (isset($_GET['id']))
{
    $id = intval($_GET['id']);

    $sql = "SELECT user.uid, uname FROM {$userTb} AS user";
    $rs = $db->queryF($sql) or die($db->error());
    $userlist = array();
    while($row = $db->fetchArray($rs))
    {
        $userlist[$row['uid']] = $row['uname'];
    }

    $sql = "SELECT uid FROM $permitTb WHERE rec_id='$id'";
    $rs = $db->queryF($sql) or die($db->error());
    $selusers = array();
    while($row = $db->fetchArray($rs))
    {
        $selusers[] = $row['uid'];
    }

    $tpl->assign('userlist', $userlist);
    $tpl->assign('sel_users', $selusers);
    $tpl->assign('id', $id);
    //$tpl->assign('acturi', "index.php?op=operate&subop=setsta");

    $xoopsOption['template_main'] = 'perm.tpl';
}
if (isset($_POST['wo']) && 'update' == $_POST['wo'])
{
    $id = intval($_POST['id']);

    $sql = "DELETE FROM $permitTb WHERE rec_id='$id'";
    $db->queryF($sql) or die($db->error());

    foreach($_POST['uids'] as $curUid)
    {
        $sql = "INSERT INTO $permitTb
                    (rec_id, uid) VALUES ('$id', '$curUid')";
        $db->queryF($sql) or die($db->error());
    }
    redirect_header("index.php?op=operate&subop=list", 2, 'ok');
    exit;
}
?>
