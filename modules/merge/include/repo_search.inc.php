<?php
if( ! defined( 'XOOPS_ROOT_PATH' ) ) exit;
include_once ('repo_common.inc.php');

function merge_search($keywords, $andor, $limit, $offset, $uid)
{
    global $xoopsUser;

    $uid = $xoopsUser->uid();
    $ret = array();

    $datas = getList($keywords, $andor, $limit, $offset);
    foreach($datas as $data)
    {
        $share4me = $data['uid'] == $uid ? '' : '&wo=share';
        $link = "index.php?op=operate&subop=repo_list{$share4me}";
	$link .= "&id={$data['rec_id']}&search";

        $ret[] = array(
            'image' => '',
            'link' => $link,
            'title' => $data['title'],
            'uid' => $uid,
            "context" => $data['title']
        );
    }
    return $ret;
}
?>
