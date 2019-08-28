<?php
/**
 * =======================================================================
 * Name:
 * 上傳/刪除網站 logo
 *
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */

include_once('../../../include/cp_header.php');
include_once(XOOPS_ROOT_PATH . '/class/xoopsformloader.php');

xoops_cp_header();

$copyto = XOOPS_UPLOAD_PATH . '/ndcodfapi.png';

if (isset($_POST['op']) && 'upload' == $_POST['op'])
{
    $copyfrom = $_FILES['iconfile']['tmp_name'];
    if (move_uploaded_file($copyfrom, $copyto))
        redirect_header($_SERVER['PHP_SELF'], 3, '已上傳');
    else
        redirect_header($_SERVER['PHP_SELF'], 3, '上傳失敗');

    exit();
}

if (isset($_GET['op']) && 'remove' == $_GET['op'])
{
    @unlink($copyto);
    redirect_header($_SERVER['PHP_SELF'], 3, '已刪除');
    exit();
}

$form = new XoopsThemeForm("", 'form',
                            $_SERVER['PHP_SELF'], 'post', true);
$form->setExtra('enctype="multipart/form-data"');

$tray = new XoopsFormElementTray('上傳');

$img = '<div style="background-color: black">
            <img src="'. XOOPS_UPLOAD_URL . '/ndcodfapi.png'  .'">
            <a href="?op=remove" onclick="return confirm(\'確定刪除？\');">
                刪除</a>
        </div>
        <br />';
$tray->addElement(new XoopsFormFile($img, 'iconfile', 100000000));
$tray->addElement(new XoopsFormHidden('op', 'upload'));
$tray->addElement(new XoopsFormButton('', 'button', '更新', 'submit'));

$form->addElement($tray);
$form->display();

xoops_cp_footer();
?>
