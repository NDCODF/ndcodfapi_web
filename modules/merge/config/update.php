<?php
/**
 * @param      $module
 * @param null $prev_version
 *
 * @return bool|null
 */
function xoops_module_update_merge(&$module, $prev_version = null)
{
    $errors = $module->getErrors();
    if (!empty($errors)) {
        print_r($errors);
    }
    update_sql();
    return true;
}

function xoops_module_install_merge($module)
{
    update_sql();
    return true;
}

/*
 * 更新資料庫
 */
function update_sql()
{
    $db = $GLOBALS['xoopsDB'];
    $prefix = $db->prefix('') . '_';
    $sqlcontent = realpath(dirname(__FILE__) . '/..') . "/sql/merge.sql";
    $buf = file_get_contents($sqlcontent);

    $search = array(
        "CREATE TABLE `"
        );
    $replace = array(
        "CREATE TABLE IF NOT EXISTS `{$prefix}"
        );

    $buf = str_replace($search, $replace, $buf);
    foreach(explode(';', $buf) as $sql)
    {
        if('' != trim($sql))
            $db->queryF($sql) or die(mysql_error());
    }
    $sql = sprintf("ALTER TABLE %s ADD `uptime`
                    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
                    ON UPDATE CURRENT_TIMESTAMP AFTER `extname`",
                    $db->prefix('merge_user_templates'));
    $db->queryF($sql);
    $sql = sprintf("ALTER TABLE %s ADD `cid`
                    int NOT NULL DEFAULT 0 AFTER `uid`",
                    $db->prefix('merge_user_templates'));
    $db->queryF($sql);
    $sql = sprintf("ALTER TABLE %s ADD `upcount`
                    int NOT NULL DEFAULT 0 AFTER `uptime`",
                    $db->prefix('merge_user_templates'));
    $db->queryF($sql);
    $sql = sprintf("ALTER TABLE %s ADD `callcount`
                    int NOT NULL DEFAULT 0 AFTER `upcount`",
                    $db->prefix('merge_user_templates'));
    $db->queryF($sql);
    $sql = sprintf("ALTER TABLE %s DROP json_perm",
                    $db->prefix('merge_user_templates'));
    $db->queryF($sql);
    $sql = sprintf("ALTER TABLE %s DROP api_perm",
                    $db->prefix('merge_user_templates'));
    $db->queryF($sql);
    $sql = sprintf("ALTER TABLE %s ADD `hide` BOOLEAN NOT NULL
                    DEFAULT FALSE AFTER `callcount`",
                    $db->prefix('merge_user_templates'));
    $db->queryF($sql);
}
?>
