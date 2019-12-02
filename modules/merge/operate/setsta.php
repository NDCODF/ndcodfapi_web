<?php
/**
 * =======================================================================
 * Name:
 * 刪除及以後相關執行進入點
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
if (!isset($_GET['id']) && !isset($_GET['sta']))
{
    redirect_header("index.php", 2, _MD_NO_RIGHT_ACCESS);
    exit();
}

include_once('include/odfapi-utils.php');
$db = $xoopsDB;

$uid = $xoopsUser->uid();
$tbl = $db->prefix('merge_user_templates');
if ($_GET['sta'] == 4)   // 刪除紀錄並刪除檔案   sta=4
{
    $sql = sprintf("SELECT endpt, extname FROM %s WHERE rec_id='%d' ",
            $tbl, $_GET['id']);
    $rs = $db->queryF($sql) or die($db->error());
    list($endpt, $ext) = $db->fetchRow($rs);
    $delfilename = "{$xoopsModuleConfig['doctemplatedir']}/$endpt.$ext";

    $sql = sprintf("DELETE FROM %s WHERE rec_id='%d' ",
            $tbl, $_GET['id']);
    $db->queryF($sql) or die($db->error());
    
    generateTemplateInfo2JSON();

    @unlink($delfilename);
    redirect_header("index.php?op=operate&subop=list", 2, 'ok');
}
?>
