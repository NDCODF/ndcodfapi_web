<?php
/**
 * =======================================================================
 * Name:
 * 報表遷移：
 *
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */

if (!in_array(XOOPS_GROUP_ADMIN, $xoopsUser->getGroups()))
{
    redirect_header(XOOPS_URL."/modules/profile/user.php",
                     2, '報表遷移只允許 Admin 進入!');
    exit();
}

include_once ('include/repo_common.inc.php');
include_once ('include/repo_group.class.php');

// form submit
if (isset($_POST['mygid']) &&
    isset($_POST['olduser']) && isset($_POST['newuser']))
{
    $sql = sprintf("UPDATE %s SET uid=%d WHERE uid=%d",
                    $xoopsDB->prefix('merge_user_templates'),
                    $_POST['newuser'], $_POST['olduser']);
    $xoopsDB->queryF($sql);
    redirect_header("{$origuri}", 2, "更新完成");
    exit();
}

/* ajax:
 * 列分享的部門列表
 */
if (isset($_POST['updateList']))
{
    $member = xoops_getHandler('Membership');
    $uids = $member->getUsersByGroup(intval($_POST['gid'][0]));
    foreach ($uids as $uid)
    {
        $user = new XoopsUser($uid);
        $uname = $user->uname();
        // 剔除管理者
        if (!$user->isAdmin())
        {
            // 使用者名稱 = 帳號名稱(顯示名稱)
            if (trim($user->name()) != '')
                $uname .= "({$user->name()})";
        }
        $userlist[] = array('uid' => $uid, 'name' => $uname);

    }
    echo json_encode($userlist);
    exit();
}

$tpl = $xoopsTpl;
$mygid = isset($_GET['mygid']) ? intval($_GET['mygid']) : 0;

// 部門列表
$grplist = getGroupList();
$tpl->assign('groupopt',
                format_smartyoption($grplist, 'gid', 'title'));

$xoopsOption['template_main'] = 'repo_user.tpl';

?>
