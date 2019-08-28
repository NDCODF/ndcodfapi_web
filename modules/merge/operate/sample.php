<?php
/**
 * =======================================================================
 * Name:
 * show sample page for api/json
 *
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */

if ('api' == $_GET['wo'])
    $xoopsOption['template_main'] = 'sample_api_php.tpl';
if ('json' == $_GET['wo'])
    $xoopsOption['template_main'] = 'sample_json_php.tpl';
if ('windows' == $_GET['wo'])
    $xoopsOption['template_main'] = 'sample_windows.tpl';
?>
