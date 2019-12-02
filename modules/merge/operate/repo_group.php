<?php
/**
 * =======================================================================
 * Name:
 * 部門分派：分享部門給能看到該部門報表的部門
 *
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */

if (!in_array(XOOPS_GROUP_ADMIN, $xoopsUser->getGroups()))
{
    redirect_header(XOOPS_URL."/modules/profile/user.php",
                     2, '部門分派只允許 Admin 進入!');
    exit();
}

include_once ('include/repo_common.inc.php');
include_once ('include/repo_group.class.php');


// form submit
if (isset($_POST['mygid']))
{
    $permit_gid = isset($_POST['selGid']) ? $_POST['selGid'] : '';
    $grp = new Group($_POST['mygid']);
    $grp->set('permit_gid', $permit_gid);
    $grp->update();
    redirect_header("{$origuri}&gid={$_POST['mygid']}", 2, "更新完成");
    exit();
}

/* ajax:
 * 列分享的部門列表
 */
if (isset($_POST['updateList']))
{
    $grp = new Group($_POST['gid'][0]);
    echo json_encode($grp->get('permit_gid'));
    exit();
}

$tpl = $xoopsTpl;
$mygid = isset($_GET['mygid']) ? intval($_GET['mygid']) : 0;

// 部門列表
$grplist = getGroupList();
$tpl->assign('groupopt',
                format_smartyoption($grplist, 'gid', 'title'));

$tpl->assign('selGroupOpt',
                format_smartyoption($grplist, 'gid', 'title', false));

$xoopsOption['template_main'] = 'repo_group.tpl';

?>
