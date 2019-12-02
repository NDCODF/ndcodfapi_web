<?php
include_once "../../mainfile.php";
global $xoopsModule;

if(!$xoopsUser)
{
    //redirect_header(XOOPS_URL."/modules/profile/user.php", 2, '請先登入!');
    header("Location: " . XOOPS_URL."/modules/profile/user.php");
    exit();
}

$moduleName = $xoopsModule->dirname();

/*
 * start page decide here
 */
$op = (isset($_REQUEST["op"]) && !empty($_REQUEST["op"])) ?
            trim($_REQUEST["op"]) : "operate";
$subop = (isset($_REQUEST["subop"]) && !empty($_REQUEST["subop"])) ?
            trim($_REQUEST["subop"]) : "landing";
$origuri = htmlentities($_SERVER['PHP_SELF']) . "?op={$op}&subop={$subop}";

$phpfile = "./".$op.".php";

if(file_exists($phpfile))
{
    include_once XOOPS_ROOT_PATH."/header.php";

    $xoopsTpl->assign('origuri', $origuri);

    //import php file if subop variable is not null
    $subopFile = "./".$op."/".$subop.".php";

    //import php file by op variable value
    include_once($phpfile);

    include_once XOOPS_ROOT_PATH.'/include/comment_view.php';
    include XOOPS_ROOT_PATH.'/footer.php';	
}
else
{
    include XOOPS_ROOT_PATH.'/header.php';
    if('dummy' != $op)
        echo "This operating is error: No {$phpfile} File";
    include XOOPS_ROOT_PATH.'/footer.php';
}
?>
