<?php
$modversion = array();
$modversion['name'] = _MI_MERGE_NAME;
$modversion['description'] = _MI_MERGE_DESC;
$modversion['credits'] = _MI_CREDITS;
$modversion['version'] = 1.1;
$modversion['author'] = "odf@ndc.gov.tw";
$modversion['official'] = 0;
$modversion['license'] = "MPL";
$modversion['image'] = "images/logo.png";
$modversion['dirname'] = basename(dirname(__FILE__));
$modversion['dirmoduleadmin'] = 'Frameworks/moduleclasses';
$modversion['icons16'] = 'Frameworks/moduleclasses/icons/16';
$modversion['icons32'] = 'Frameworks/moduleclasses/icons/32';

// Admin menu
// Set to 1 if you want to display menu generated by system module
$modversion['system_menu'] = 1;

// Admin things
$modversion['hasAdmin'] = 1;
//$modversion['adminindex'] = "admin/category.php";
$modversion['adminmenu'] = "admin/menu.php";

$modversion['onInstall']   = 'config/update.php';
$modversion['onUpdate']   = 'config/update.php';

// Blocks
/*$modversion['blocks'][] = array(
    'file' => 'sample_php.php',
    'name' => 'api PHP 範例',
    'description' => '',
    'show_func' => 'b_sample_show',
    'template' => 'sample_api_php.tpl');
$modversion['blocks'][] = array(
    'file' => 'sample_php.php',
    'name' => 'json PHP 範例',
    'description' => '',
    'show_func' => 'b_sample_show',
    'template' => 'sample_json_php.tpl');*/

$options = array();
foreach(array('5', '10', '15', '20', '30' , '50', '100') as $page)
    $options[$page] = $page;

// configs
$modversion['config'] = array();
$modversion['config'][] = array(
    'name' => 'oxoolurl',  // oxool url
    'title' => '_MI_MERGE_PREFERENCE_OXOOL_URL',
    'description' => '',
    'formtype' => 'textbox',
    'valuetype' => 'text',
    'default' => 'http://192.168.3.11:9980');
$modversion['config'][] = array(
    'name' => 'doctemplatedir',  // ott/ots 樣板位置
    'title' => '_MI_MERGE_PREFERENCE_TEMPLATEDIR',
    'description' => '',
    'formtype' => 'hidden',
    'valuetype' => 'text',
    'default' => '/usr/share/NDCODFAPI/ODFReport/templates');
$modversion['config'][] = array(
    'name' => 'templaterepodir',  // 範本中心檔案置
    'title' => '_MI_MERGE_PREFERENCE_TEMPLATEDIR',
    'description' => '',
    'formtype' => 'hidden',
    'valuetype' => 'text',
    'default' => '/usr/share/NDCODFAPI/ODFReport/templates/repo');
$modversion['config'][] = array(
    'name' => 'pagenav',  // 列表分頁數量
    'title' => '_MI_MERGE_PREFERENCE_PAGENAV',
    'description' => '',
    'formtype' => 'select',
    'valuetype' => 'text',
    'options' => $options,
    'default' => '10');

// Search
$modversion['hasSearch'] = 1;
$modversion['search']['file'] = "include/search.inc.php";
$modversion['search']['func'] = "merge_search";

// Comments
$modversion['hasComments'] = 1;
$modversion['comments']['itemName'] = 'id';
$modversion['comments']['pageName'] = 'index.php';
// Comment callback functions
//$modversion['comments']['callbackFile'] = 'include/comment_functions.php';
//$modversion['comments']['callback']['approve'] = 'pical_comments_approve';
//$modversion['comments']['callback']['update'] = 'pical_comments_update';

// Menu
$idx = 1;
$modversion['hasMain'] = 1;
if ($GLOBALS['xoopsUser']) {
    $modversion['sub'][$idx]['name'] = _MERGE_MI_CATE;
    $modversion['sub'][$idx]['url']  = 'index.php?op=operate&subop=cate';
    $idx ++;
    $modversion['sub'][$idx]['name'] = _MERGE_MI_UPLOAD;
    $modversion['sub'][$idx]['url']  = 'index.php?op=operate&subop=upload';
    $idx ++;
    $modversion['sub'][$idx]['name'] = _MERGE_MI_LIST;
    $modversion['sub'][$idx]['url']  = 'index.php?op=operate&subop=list';
    $idx ++;
    $modversion['sub'][$idx]['name'] = _MERGE_MI_GROUP;
    $modversion['sub'][$idx]['url']  = 'index.php?op=operate&subop=group';
    $idx ++;
    $modversion['sub'][$idx]['name'] = _MERGE_MI_USER;
    $modversion['sub'][$idx]['url']  = 'index.php?op=operate&subop=user';
    $idx ++;
    /*$modversion['sub'][4]['name'] = _MERGE_MI_LIST_SHARE4ME;
    $modversion['sub'][4]['url']  = 'index.php?op=operate&subop=list&wo=share';
    $idx ++;
    $modversion['sub'][5]['name'] = _MERGE_MI_SAMPLE_API;
    $modversion['sub'][5]['url']  = 'index.php?op=operate&subop=sample&wo=api';
    $idx ++;
    $modversion['sub'][6]['name'] = _MERGE_MI_SAMPLE_JSON;
    $modversion['sub'][6]['url']  = 'index.php?op=operate&subop=sample&wo=json';
    $idx ++;
    $modversion['sub'][7]['name'] = _MERGE_MI_SAMPLE_WINDOWS;
    $modversion['sub'][7]['url']  = 'index.php?op=operate&subop=sample&wo=windows';*/
}
unset($idx);

// Templates
$modversion['templates'] = array();
$modversion['templates'][] = array(
    'file' => 'dialogs.tpl',
    'description' => '共用樣板 - dialogs');
$modversion['templates'][] = array(
    'file' => 'main.tpl',
    'description' => 'main');
$modversion['templates'][] = array(
    'file' => 'list.tpl',
    'description' => 'list');
$modversion['templates'][] = array(
    'file' => 'group.tpl',
    'description' => '部門分派');
$modversion['templates'][] = array(
    'file' => 'user.tpl',
    'description' => '人員調動');
$modversion['templates'][] = array(
    'file' => 'sample_json_php.tpl',
    'description' => 'sample_json');
$modversion['templates'][] = array(
    'file' => 'sample_api_php.tpl',
    'description' => 'sample_api');
$modversion['templates'][] = array(
    'file' => 'sample_windows.tpl',
    'description' => 'sample_windows');
$modversion['templates'][] = array(
    'file' => 'cate.tpl',
    'description' => 'category');
$modversion['templates'][] = array(
    'file' => 'ndcodfapi_landing.tpl',
    'description' => 'landing');
$modversion['templates'][] = array(
    'file' => 'repo_list.tpl',
    'description' => 'template repo list page');
$modversion['templates'][] = array(
    'file' => 'repo_main.tpl',
    'description' => 'template repo upload page');
$modversion['templates'][] = array(
    'file' => 'repo_cate.tpl',
    'description' => 'template repo cate page');
$modversion['templates'][] = array(
    'file' => 'repo_user.tpl',
    'description' => 'template repo user page');
$modversion['templates'][] = array(
    'file' => 'repo_group.tpl',
    'description' => 'template repo group page');
$modversion['templates'][] = array(
    'file' => 'repo_dialogs.tpl',
    'description' => 'template repo dialog page');
?>
