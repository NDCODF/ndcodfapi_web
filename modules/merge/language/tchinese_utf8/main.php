<?php
// LANGCODE: zh-TW
// CHARSET : UTF-8

// 排序方式
define('_MERGE_LIST_ORDER_CATEGORY', '範本分類');
define('_MERGE_LIST_ORDER_DOCUMENT', '文件類別');
define('_MERGE_LIST_ORDER_CALLED', '呼叫次數');
define('_MERGE_LIST_ORDER_UPDATETIMES', '更新次數');
define('_MERGE_LIST_ORDER_UPDATE', '更新時間');
define('_MERGE_LIST_ORDER_USER', '使用者');
define('_MERGE_LIST_ORDER_NAME', '報表名稱');

// include/pagenav.inc.php
define('_MERGE_USER_TRANSFER_OWNERSHIP', '報表遷移');

//list.php -> user.tpl
define('_MERGE_USER_TRANSFER_OWNERSHIP', '報表遷移');
define('_MERGE_USER_DEPARTMENT', '部門');
define('_MERGE_USER_CURRENT_OWNER', '原擁有報表人員');
define('_MERGE_USER_NEW_OWNER', '新擁有報表人員');
define('_MERGE_USER_UPDATE', '更新');
define('_MERGE_USER_WARN_NO_SELECT', '未選報表人員');
define('_MERGE_USER_WARN_CONFLICT', '原擁有報表人員與新擁有報表人員不能同一人');



//list.php -> group.tpl
define('_MERGE_GROUP_DEPART_ASSIGN', '部門分派');
define('_MERGE_GROUP_DEPART', '部門');
define('_MERGE_GROUP_ALLOW_DISPLAY', '可看到的部門列表');
define('_MERGE_GROUP_UPDATE', '更新');



//list.php -> cate.tpl
define('_MERGE_CATE_TITLE', '新增類別');
define('_MERGE_CATE_CHANGEPAGE_TITLE', '變更類別名稱');
define('_MERGE_CATE_RENAME', '更名');
define('_MERGE_CATE_CLOSE', '關閉');
define('_MERGE_CATE_MAIN_CATE', '主類別');
define('_MERGE_CATE_OPERATE', '功能操作');
define('_MERGE_CATE_WARN_PARENT', '上一層類別也要輸入');
define('_MERGE_CATE_WARN_FAIL_UPDATE', '資料更新失敗');
define('_MERGE_CATE_WARN_DELETE', '確定要刪除？');
define('_MERGE_CATE_WARN_CHILD', '該類別還有指派報表！');
define('_MERGE_CATE_WARN_DB_ERROR', '資料庫錯誤！要刪除的類別還有底層類別！');
define('_MERGE_CATE_WARN_COPY', '該層類別還未輸入資料，不能以此複製一列！');
define('_MERGE_CATE_WARN_DUPLICATED', '名稱重複！');


//list.php -> main.tpl
define('_MERGE_MAIN_TITLE', '新增範本');
define('_MERGE_MAIN_FILE_WARN', '未上傳檔案');
define('_MERGE_MAIN_TYPE_WARN', '上傳檔案類型不是 .ott 或 .ots');
define('_MERGE_MAIN_CATEGORY_WARN', '未選分類');
define('_MERGE_MAIN_NAME_WARN', '未填名稱');
define('_MERGE_MAIN_API_NAME', '範本 API 名稱');
define('_MERGE_MAIN_API_DESC', 'API 範本說明');
define('_MERGE_MAIN_CATEGORY', '分類');
define('_MERGE_MAIN_SHOW_CHECK', '顯示');
define('_MERGE_MAIN_SHOW', '顯示');
define('_MERGE_MAIN_HIDE', '隱藏');
define('_MERGE_MAIN_UPLOAD', '上傳');
define('_MERGE_MAIN_UPDATE', '更新範本檔');
define('_MERGE_MAIN_SUBMIT', '送出');
define('_MERGE_MAIN_CLOSE', '關閉');


// list.php -> list.tpl
define('_MERGE_LIST_TPL_TITLE_ALL', '全部的報表');
define('_MERGE_LIST_TPL_TITLE_DEPARTMENT', '目前部門所在的報表');
define('_MERGE_LIST_TPL_DEPARTMENT', '部門類別');
define('_MERGE_LIST_TPL_ORDER_BY', '請點選排序方式');
define('_MERGE_LIST_TPL_DEPARTMENT', '部門類別');
define('_MERGE_LIST_CALLED', '呼叫次數');
define('_MERGE_LIST_UPDATETIMES', '更新次數');
define('_MERGE_LIST_LAST_UPDATE', '最後更新時間');
define('_MERGE_LIST_JSON_EXAMPLE', '傳送 JSON 範例說明');
define('_MERGE_LIST_YAML_EXAMPLE', 'YAML 格式說明');
define('_MERGE_LIST_DOWNLOAD_TEMP', '下載範本');
define('_MERGE_LIST_DOWNLOAD_APIINFO', '下載 API 資訊');
define('_MERGE_LIST_MODIFY', '修改');
define('_MERGE_LIST_DELETE', '刪除');
define('_MERGE_LIST_SHARE', '分享給...');
define('_MERGE_LIST_CHECK_MESSAGE', '查看留言');
define('_MERGE_LIST_LEAVE_MESSAGE', '我要留言');
define('_MERGE_LIST_CREATE_BY', '的報表');
define('_MERGE_LIST_SHARE_WITH_ME', '分享給我');
define('_MERGE_LIST_FAIL_LIST', '列表失敗');

// list.php -> dialog.tpl
define('_MERGE_DIALOG_CONFIRM_DELETE', '確認刪除？');
define('_MERGE_DIALOG_FAIL_DELETE_YES', '確認');
define('_MERGE_DIALOG_FAIL_DELETE_CANCEL', '取消');
define('_MERGE_DIALOG_FAIL_DIALOG', '列表失敗');
define('_MERGE_DIALOG_API_NAME', 'API 名稱');
define('_MERGE_DIALOG_API_URL', 'API 位置');
define('_MERGE_DIALOG_ALTER_COPY', '已複製');
define('_MERGE_DIALOG_YAML_EXPLAIN', 'YAML 格式說明');
define('_MERGE_DIALOG_JSON_EXPLAIN', 'Json 格式說明');
define('_MERGE_DIALOG_CLOSE', '關閉');
define('_MERGE_DIALOG_MODIFY_DATA', '修改資料');
define('_MERGE_DIALOG_SHARE', '分享給...');
define('_MERGE_DIALOG_YAML_EXAMPLE', 'YAML 範例');
define('_MERGE_DIALOG_JSON_EXAMPLE', 'Json 範例');


// 排序方式
define('_REPO_LIST_ORDER_CATEGORY', '範本分類');
define('_REPO_LIST_ORDER_DOCUMENT', '文件類別');
define('_REPO_LIST_ORDER_CALLED', '呼叫次數');
define('_REPO_LIST_ORDER_UPDATETIMES', '更新次數');
define('_REPO_LIST_ORDER_UPDATE', '更新時間');
define('_REPO_LIST_ORDER_USER', '使用者');
define('_REPO_LIST_ORDER_NAME', '報表名稱');

// include/pagenav.inc.php
define('_REPO_USER_TRANSFER_OWNERSHIP', '報表遷移');

//list.php -> user.tpl
define('_REPO_USER_TRANSFER_OWNERSHIP', '報表遷移');
define('_REPO_USER_DEPARTMENT', '部門');
define('_REPO_USER_CURRENT_OWNER', '原擁有報表人員');
define('_REPO_USER_NEW_OWNER', '新擁有報表人員');
define('_REPO_USER_UPDATE', '更新');
define('_REPO_USER_WARN_NO_SELECT', '未選報表人員');
define('_REPO_USER_WARN_CONFLICT', '原擁有報表人員與新擁有報表人員不能同一人');



//list.php -> group.tpl
define('_REPO_GROUP_DEPART_ASSIGN', '部門分派');
define('_REPO_GROUP_DEPART', '部門');
define('_REPO_GROUP_ALLOW_DISPLAY', '可看到的部門列表');
define('_REPO_GROUP_UPDATE', '更新');



//list.php -> cate.tpl
define('_REPO_CATE_TITLE', '新增類別');
define('_REPO_CATE_CHANGEPAGE_TITLE', '變更類別名稱');
define('_REPO_CATE_RENAME', '更名');
define('_REPO_CATE_CLOSE', '關閉');
define('_REPO_CATE_MAIN_CATE', '主類別');
define('_REPO_CATE_OPERATE', '功能操作');
define('_REPO_CATE_WARN_PARENT', '上一層類別也要輸入');
define('_REPO_CATE_WARN_FAIL_UPDATE', '資料更新失敗');
define('_REPO_CATE_WARN_DELETE', '確定要刪除？');
define('_REPO_CATE_WARN_CHILD', '該類別還有指派報表！');
define('_REPO_CATE_WARN_DB_ERROR', '資料庫錯誤！要刪除的類別還有底層類別！');
define('_REPO_CATE_WARN_COPY', '該層類別還未輸入資料，不能以此複製一列！');
define('_REPO_CATE_WARN_DUPLICATED', '名稱重複！');


//list.php -> main.tpl
define('_REPO_MAIN_TITLE', '新增範本');
define('_REPO_MAIN_FILE_WARN', '未上傳檔案');
define('_REPO_MAIN_TYPE_WARN', '上傳檔案類型不是 .ott 或 .ots');
define('_REPO_MAIN_CATEGORY_WARN', '未選分類');
define('_REPO_MAIN_NAME_WARN', '未填名稱');
define('_REPO_MAIN_API_NAME', '範本名稱');
define('_REPO_MAIN_API_DESC', '範本說明');
define('_REPO_MAIN_CATEGORY', '分類');
define('_REPO_MAIN_SHOW_CHECK', '顯示');
define('_REPO_MAIN_SHOW', '顯示');
define('_REPO_MAIN_HIDE', '隱藏');
define('_REPO_MAIN_UPLOAD', '上傳');
define('_REPO_MAIN_UPDATE', '更新範本檔');
define('_REPO_MAIN_SUBMIT', '送出');
define('_REPO_MAIN_CLOSE', '關閉');


// list.php -> list.tpl
define('_REPO_LIST_TPL_TITLE_ALL', '全部範本');
define('_REPO_LIST_TPL_TITLE_DEPARTMENT', '目前部門所在的報表');
define('_REPO_LIST_TPL_DEPARTMENT', '類別');
define('_REPO_LIST_TPL_ORDER_BY', '請點選排序方式');
define('_REPO_LIST_TPL_DEPARTMENT', '部門類別');
define('_REPO_LIST_CALLED', '呼叫次數');
define('_REPO_LIST_UPDATETIMES', '更新次數');
define('_REPO_LIST_LAST_UPDATE', '最後更新時間');
define('_REPO_LIST_JSON_EXAMPLE', '傳送 JSON 範例說明');
define('_REPO_LIST_YAML_EXAMPLE', 'YAML 格式說明');
define('_REPO_LIST_DOWNLOAD_TEMP', '下載範本');
define('_REPO_LIST_DOWNLOAD_APIINFO', '下載 API 資訊');
define('_REPO_LIST_MODIFY', '修改');
define('_REPO_LIST_DELETE', '刪除');
define('_REPO_LIST_SHARE', '分享給...');
define('_REPO_LIST_CHECK_MESSAGE', '查看留言');
define('_REPO_LIST_LEAVE_MESSAGE', '我要留言');
define('_REPO_LIST_CREATE_BY', '的範本');
define('_REPO_LIST_SHARE_WITH_ME', '分享給我');
define('_REPO_LIST_FAIL_LIST', '列表失敗');

// list.php -> dialog.tpl
define('_REPO_DIALOG_CONFIRM_DELETE', '確認刪除？');
define('_REPO_DIALOG_FAIL_DELETE_YES', '確認');
define('_REPO_DIALOG_FAIL_DELETE_CANCEL', '取消');
define('_REPO_DIALOG_FAIL_DIALOG', '列表失敗');
define('_REPO_DIALOG_API_NAME', 'API 名稱');
define('_REPO_DIALOG_API_URL', 'API 位置');
define('_REPO_DIALOG_ALTER_COPY', '已複製');
define('_REPO_DIALOG_YAML_EXPLAIN', 'YAML 格式說明');
define('_REPO_DIALOG_JSON_EXPLAIN', 'Json 格式說明');
define('_REPO_DIALOG_CLOSE', '關閉');
define('_REPO_DIALOG_MODIFY_DATA', '修改資料');
define('_REPO_DIALOG_SHARE', '分享給...');
define('_REPO_DIALOG_YAML_EXAMPLE', 'YAML 範例');
define('_REPO_DIALOG_JSON_EXAMPLE', 'Json 範例');
