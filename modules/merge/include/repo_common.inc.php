<?php
/**
 * =======================================================================
 * Name:
 * common functions
 *
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 *
 * =======================================================================
 */
include_once (XOOPS_ROOT_PATH . '/modules/merge/include/repo_group.class.php');

/*
 * 取得部門列表
 */
function getGroupList($listother=false)
{
    global $xoopsUser;

    $grplist = array();
    if ($xoopsUser->isAdmin())
    {  // 管理者列全部部門
        $member = xoops_getHandler('member');
        foreach($member->getGroupList() as $gid => $grpname)
        {
            if (!in_array($gid, array(XOOPS_GROUP_ADMIN,
                                       XOOPS_GROUP_USERS,
                                       XOOPS_GROUP_ANONYMOUS)))
                $grplist[] = array('gid' => $gid, 'title' => $grpname);
        }
    }
    else
    {
        $groups = array();
        foreach($xoopsUser->groups() as $gid)
        {  // 部門能看到的其他部門
            if (!in_array($gid, array(XOOPS_GROUP_ADMIN,
                                       XOOPS_GROUP_USERS,
                                       XOOPS_GROUP_ANONYMOUS)))
            {
                $grp = new Group($gid);
                $groups = array_merge($groups, $grp->get('permit_gid'));
            }
        }
        if (!$listother)
            $groups = $xoopsUser->groups();
        else
            $groups = array_merge($xoopsUser->groups(), $groups);
        foreach($groups as $gid)
        {
            $grp = xoops_getHandler('Group');
            if (!in_array($gid, array(XOOPS_GROUP_ADMIN,
                                       XOOPS_GROUP_USERS,
                                       XOOPS_GROUP_ANONYMOUS)))
            {
                $grplist[] = array('gid' => $gid,
                                    'title' => $grp->get($gid)->name());
            }
        }
    }
    return $grplist;
}


/*
 * 產生 sql query: 依群組列 uid
 */
function uidQuery($gid=0)
{
    global $xoopsUser;

    $uid = $xoopsUser->uid();
    $query = $allUids = array();
    $groups = array($gid);  // $gid > 0: 有選部門，只列部門的報表

    if ($gid == 0)
    {  // 沒選部門 = 全部報表 = 該人員所屬部門及部門能看到的其他部門
        $groups = $xoopsUser->groups();
        foreach ($xoopsUser->groups() as $selgid)
        {
            $grp = new Group($selgid);
            $groups = array_merge($groups, $grp->get('permit_gid'));
        }
    }
    // 移除 admin, users, guest 群組
    $groups = array_diff($groups, array(XOOPS_GROUP_ADMIN,
                                         XOOPS_GROUP_USERS,
                                         XOOPS_GROUP_ANONYMOUS));

    $member = xoops_getHandler('Membership');
    foreach($groups as $grpid)
        $allUids = array_merge($allUids, $member->getUsersByGroup($grpid));

    $allUids = array_unique($allUids);  // 移除重覆

    if (!$xoopsUser->isAdmin() && $gid == 0)
        $query[] = "users.uid='$uid'";

    // 部門所有人的 uid
    if (count($allUids) > 0)
        $query[] = sprintf("users.uid in (%s)", implode(',', $allUids));

    // 管理者且部門選全部：列全部
    if ($xoopsUser->isAdmin() && $gid == 0)
        $query[] = "1=1";

    return $query;
}


/*
 * 產生 sql query: 列 search list
 */
function searchQuery($andor, $keywords)
{
    // for xoops search
    $subq = array();
    $andor = strtolower($andor);
    if (!empty($keywords))
    {
        if ($andor == 'and' || $andor == 'or')
        {
            $subs = array();
            foreach($keywords as $keyword)
                $subs[] = "(CONCAT(merge.`title`, ' ', merge.`desc`)
                             LIKE '%$keyword%')";
            $subq[] = implode($andor, $subs);
        }
        else
        {
            $subq[] = "(CONCAT(merge.`title`, ' ', merge.`desc`)
                          LIKE '%{$keywords[0]}%')";
        }
    }
    return $subq;
}


/*
 * 列表 & 搜尋
 */
function getList($keywords=array(), $andor='', $limit=0, $offset=0,
                 $share4me=false, $sel_rec_id=0, $sel_group_id=0,
                 $cid = -1, $order_col='', $order_acce='ASC')
{
    global $xoopsDB, $xoopsTpl, $xoopsUser;
    $db = $xoopsDB;
    $tpl = $xoopsTpl;

    $uid = $xoopsUser->uid();
    $tbl = $db->prefix('repo_user_templates');
    $permitTb = $db->prefix('repo_user_permit');
    $userTb = $db->prefix('users');

    // for xoops search
    $searchQ = searchQuery($andor, $keywords);
    $datas = array();

    // 1) 要列自己以及分享給自己的列表，也要有分頁，因此先將這兩個列表記到陣列中

    // 列自己的列表, 管理者列全部
    $blackuids = $sameids = array();
    foreach(uidQuery($sel_group_id) as $uidQ)
    {
        $where = " WHERE $uidQ ";
        if (count($searchQ) > 0)
            $where .= 'AND ' . implode($searchQ, ' AND ');

        $sql = "SELECT merge.*, users.uname AS uname FROM $tbl AS merge
                LEFT JOIN $userTb AS users ON users.uid=merge.uid
                $where ORDER BY users.uid, merge.rec_id DESC";
        $rs = $db->queryF($sql) or die($db->error());
        while($row = $db->fetchArray($rs))
        {
            if (!$share4me ||
                $xoopsUser->isAdmin())
            {
                if ($row['hide'] && $row['uid'] != $xoopsUser->uid() &&
                    !$xoopsUser->isAdmin())
                {  // 報表設成隱藏
                    continue;
                }
                $blackuids[] = $row['uid'];
                $sameids[] = $row['rec_id'];
                $datas[] = $row['rec_id'];
            }
            if (!empty($keywords) &&
                ($row['uid'] == $uid || $xoopsUser->isAdmin()))
            {  // for xoops search
                $blackuids[] = $row['uid'];
                $sameids[] = $row['rec_id'];
                $datas[] = $row['rec_id'];
            }
        }
        //break;
    }

    $expectRecId = $expectUid = '';
    // 排除重複列表
    if (count($sameids) > 0)
        $expectRecId = sprintf(" AND merge.rec_id NOT IN (%s)",
                        implode($sameids, ','));
    // 排除上列自己所屬的列表
    if (count($blackuids) > 0)
        $expectUid = sprintf(" AND perm.uid IN (%s)",
                        implode($blackuids, ','));

    $where = ' WHERE ';
    if (!empty($subq))
        $where = ' WHERE ' . implode($subq, ' AND ') . ' AND ';

    // 列自己有權限看到的列表
    $sql = "SELECT merge.*, users.uname AS uname, users.uid AS uid
            FROM $tbl AS merge
            LEFT JOIN $permitTb AS perm ON perm.rec_id=merge.rec_id
            LEFT JOIN $userTb AS users ON users.uid=merge.uid
            $where perm.uid=$uid $expectRecId $expectUid
            ORDER BY users.uid";
    $rs = $db->queryF($sql) or die($db->error());
    while($row = $db->fetchArray($rs))
    {
        if (empty($keywords) && $share4me && $row['uid'] != $uid)
            $datas[] = $row['rec_id'];
        // for xoops search
        if (!empty($keywords) && $row['uid'] != $uid)
            $datas[] = $row['rec_id'];
    }

    if (empty($datas) && $sel_rec_id == 0)  // 沒資料就不必做下列的重列動作
        return array();

    /// 2) 再以分頁重新列表

    $rec_ids = $sel_rec_id > 0 ? $sel_rec_id : implode(',', $datas);
    if ($cid >=0 )
        $where = "WHERE rec_id IN ($rec_ids) and cid = $cid";
    else
        $where = "WHERE rec_id IN ($rec_ids) ";

    $orderby = empty($order_col) ?
                    "ORDER BY FIELD(rec_id, $rec_ids)" :
                        "ORDER BY $order_col $order_acce";

    $sql = "SELECT merge.* FROM $tbl AS merge $where $orderby";
    $datas = array();
    if ($sel_rec_id > 0)
        $rs = $db->queryF($sql) or die($db->error());
    else
        $rs = $db->queryF($sql, $limit, $offset) or die($db->error());
    while($row = $db->fetchArray($rs))
    {
        $user = new XoopsUser($row['uid']);
        $groups = array();
        $grph = xoops_getHandler('group');
        foreach ($user->groups() as $grpid)
        {
            if (!in_array($grpid, array(XOOPS_GROUP_ADMIN,
                                        XOOPS_GROUP_USERS,
                                        XOOPS_GROUP_ANONYMOUS)))
            {
                $grpobj = $grph->get($grpid);
                $groups[$grpid] = $grpobj->name();
            }
        }
        $row['groups'] = $groups;
        $datas[] = $row;
    }

    return $datas;
}


/*
 * 格式化 <select><option> 給 smarty assign 用
 * 
 * @param array $aOption
 * @param str $id_label used for smarty
 * @param str $value_label used for smarty
 * @param bool $show_default 是否顯示預設值
 * @param str $default 預設值的顯示字
 */
function format_smartyoption($aOption, $id_label='', $value_label='',
			    $show_default=true, $default='--select--')
{
    $aNewOption = [];
    if($show_default)
        $aNewOption = array($default);

    foreach($aOption as $aElm)
    {
        $idx = $aElm[$id_label];
        $value = $aElm[$value_label];
        $aNewOption[$idx] = $value;
    }
    return $aNewOption;
}
?>
