<?php
/**
 * =======================================================================
 * Name:
 * for ajax call: 給修改功能用的。將指定 id 的資料以 json object 回傳。
 *
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */
include_once "../../mainfile.php";

if(!$xoopsUser)
{
    exit();
}
if (!isset($_POST['id']))
{
    exit();
}
$id = intval($_POST['id']);
$db = $xoopsDB;

$tbl = $db->prefix('repo_user_templates');
$sql = "SELECT * FROM $tbl WHERE rec_id='$id' ";
$rs = $db->queryF($sql) or die($db->error());
$field = $db->fetchArray($rs);
echo json_encode(array('title' => $field['title'],
                       'desc' => $field['desc'],
                       'docname' => $field['docname'],
                       'hide' => $field['hide']));
exit();
?>
