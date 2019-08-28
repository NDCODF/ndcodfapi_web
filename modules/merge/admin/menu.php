<?php
// @TODO: 模組相關擷取功能歸到一個物件內
$modulename = basename(realpath(dirname(__FILE__) . '/..'));
$module_handler =& xoops_gethandler('module');
$xoopsModule =& XoopsModule::getByDirname($modulename);
$moduleInfo =& $module_handler->get($xoopsModule->getVar('mid'));
$pathIcon32 = $moduleInfo->getInfo('icons32');
$iconPath = "../../{$pathIcon32}";

$adminmenu[] = array(
    'title' => _MI_ADMIN_SITEICON,
    'link' => "admin/site_icon.php",
    'icon' => "{$iconPath}/view_detailed.png");
?>
