<?php
// _LANGCODE: zh-TW
// _CHARSET : UTF-8
// Translator: 點兩下電腦工作室 http://ck2tw.net/

define('_PROFILE_AM_FIELD', '欄位');
define('_PROFILE_AM_FIELDS', '欄位');
define('_PROFILE_AM_CATEGORY', '類別');
define('_PROFILE_AM_STEP', '註冊步驟');

define('_PROFILE_AM_SAVEDSUCCESS', '%s 儲存成功 ');
define('_PROFILE_AM_DELETEDSUCCESS', '%s 刪除成功 ');
define('_PROFILE_AM_RUSUREDEL', '確定要刪除 %s');
define('_PROFILE_AM_FIELDNOTCONFIGURABLE', '該欄位不可編輯');

define('_PROFILE_AM_ADD', '增加');
define('_PROFILE_AM_EDIT', '修改');
define('_PROFILE_AM_TYPE', '欄位類型');
define('_PROFILE_AM_VALUETYPE', '值類型');
define('_PROFILE_AM_NAME', '名稱');
define('_PROFILE_AM_TITLE', '標題');
define('_PROFILE_AM_DESCRIPTION', '描述');
define('_PROFILE_AM_REQUIRED', '必需');
define('_PROFILE_AM_MAXLENGTH', '最大長度');
define('_PROFILE_AM_WEIGHT', '順序');
define('_PROFILE_AM_DEFAULT', '預設值');
define('_PROFILE_AM_NOTNULL', '非空');

define('_PROFILE_AM_ARRAY', 'Array 陣列');
define('_PROFILE_AM_EMAIL', 'Email 電子郵件');
define('_PROFILE_AM_INT', 'INT 整數');
define('_PROFILE_AM_TXTAREA', 'TextArea 大量文字');
define('_PROFILE_AM_TXTBOX', 'Text 純文字');
define('_PROFILE_AM_URL', 'URL 網址');
define('_PROFILE_AM_OTHER', '其他');
define('_PROFILE_AM_FLOAT', 'Float 浮點數');
define('_PROFILE_AM_DECIMAL', 'Decimal 十進位數字');
define('_PROFILE_AM_UNICODE_ARRAY', 'Unicode Array 陣列');
define('_PROFILE_AM_UNICODE_EMAIL', 'Unicode Email 電子郵件');
define('_PROFILE_AM_UNICODE_TXTAREA', 'Unicode TextArea 大量文字');
define('_PROFILE_AM_UNICODE_TXTBOX', 'Unicode Text 純文字');
define('_PROFILE_AM_UNICODE_URL', 'Unicode URL 網址');

define('_PROFILE_AM_PROF_VISIBLE_ON', '在該群組的資料中顯示');
define('_PROFILE_AM_PROF_VISIBLE_FOR', '資料對該群組可見');
define('_PROFILE_AM_PROF_VISIBLE', '欄位可見性');
define('_PROFILE_AM_PROF_EDITABLE', '編輯用戶資料');
define('_PROFILE_AM_PROF_REGISTER', '在註冊表單中顯示');
define('_PROFILE_AM_PROF_SEARCH', '搜尋用戶資料');
define('_PROFILE_AM_PROF_ACCESS', '造訪用戶資料');
define('_PROFILE_AM_PROF_ACCESS_DESC',
    '<ul>' .
    '<li>被造訪用戶屬於管理員群組: 如果目前用戶所在的某個組被允許造訪管理員群組，則目前用戶有權造訪，否則</li>' .
    '<li>被造訪用戶屬於一個或多個自訂群組（非管理員、 會員、 訪客）：如果目前用戶所在的某個組被允許造訪待造訪用戶的某個自訂群組，則目前用戶有權造訪，否則</li>' .
    '<li>被造訪用戶屬於會員群組：如果目前用戶所在的某個組被允許造訪普通會員群組，則目前用戶有權造訪</li>' .
    '</ul>');

define('_PROFILE_AM_FIELDVISIBLE', '欄位');
define('_PROFILE_AM_FIELDVISIBLEFOR', ' 允許 ');
define('_PROFILE_AM_FIELDVISIBLEON', ' 查看 ');
define('_PROFILE_AM_FIELDVISIBLETOALL', '- 任何人');
define('_PROFILE_AM_FIELDNOTVISIBLE', '不能查看');

define('_PROFILE_AM_CHECKBOX', '複選方框');
define('_PROFILE_AM_GROUP', '群組選單');
define('_PROFILE_AM_GROUPMULTI', '複選群組選單');
define('_PROFILE_AM_LANGUAGE', '語言選單');
define('_PROFILE_AM_RADIO', '單選鈕');
define('_PROFILE_AM_SELECT', '下拉選單');
define('_PROFILE_AM_SELECTMULTI', '複選下拉選單');
define('_PROFILE_AM_TEXTAREA', '大量文字框');
define('_PROFILE_AM_DHTMLTEXTAREA', 'DHTML大量文字框');
define('_PROFILE_AM_TEXTBOX', '文字框');
define('_PROFILE_AM_TIMEZONE', '時區選單');
define('_PROFILE_AM_YESNO', '單選 是/否');
define('_PROFILE_AM_DATE', '日期');
define('_PROFILE_AM_AUTOTEXT', '自動本文');
define('_PROFILE_AM_DATETIME', '日期和時間');
define('_PROFILE_AM_LONGDATE', '長日期格式');

define('_PROFILE_AM_ADDOPTION', '新增選項');
define('_PROFILE_AM_REMOVEOPTIONS', '刪除選項');
define('_PROFILE_AM_KEY', '關鍵字');
define('_PROFILE_AM_VALUE', '值');

// User management
define('_PROFILE_AM_EDITUSER', '編輯用戶');
define('_PROFILE_AM_SELECTUSER', '選擇用戶');
define('_PROFILE_AM_ADDUSER', '新增用戶');
define('_PROFILE_AM_THEME', '主題');
define('_PROFILE_AM_RANK', '等級');
define('_PROFILE_AM_USERDONEXIT', '用戶不存在！');
define('_PROFILE_MA_USERLEVEL', '用戶級別');

define('_PROFILE_MA_ACTIVE', '正式用戶');
define('_PROFILE_MA_INACTIVE', '未啟動');
define('_PROFILE_AM_USERCREATED', '成功建立新用戶');

define('_PROFILE_AM_CANNOTDELETESELF', '不能刪除自己的帳號，請進入帳號管理刪除帳號');
define('_PROFILE_AM_CANNOTDELETEADMIN', '不能刪除管理者帳號');

define('_PROFILE_AM_NOSELECTION', '沒有選擇帳號');
define('_PROFILE_AM_USER_ACTIVATED', '帳號已啟動');
define('_PROFILE_AM_USER_DEACTIVATED', '帳號已停用');
define('_PROFILE_AM_USER_NOT_ACTIVATED', '錯誤: 帳號啟動失敗');
define('_PROFILE_AM_USER_NOT_DEACTIVATED', '錯誤: 帳號停用失敗');

define('_PROFILE_AM_STEPNAME', '步驟名稱');
define('_PROFILE_AM_STEPORDER', '步驟排序');
define('_PROFILE_AM_STEPSAVE', '該步驟是否有資料需儲存');
define('_PROFILE_AM_STEPINTRO', '步驟描述');
//1.62
define('_PROFILE_AM_ACTION', '動作');
//1.63
define('_PROFILE_AM_REQUIRED_TOGGLE', '設定必填欄位');
define('_PROFILE_AM_REQUIRED_TOGGLE_SUCCESS', '成功變更必填欄位');
define('_PROFILE_AM_REQUIRED_TOGGLE_FAILED', '必填欄位變更失敗');

define('_PROFILE_AM_SAVESTEP_TOGGLE', '設定儲存');
define('_PROFILE_AM_SAVESTEP_TOGGLE_SUCCESS', '成功變更儲存後步驟');
define('_PROFILE_AM_SAVESTEP_TOGGLE_FAILED', ' 儲存後步驟變更失敗');
//XOOPS 2.5.9
define('_PROFILE_AM_CANNOTDEACTIVATEWEBMASTERS', '您無法停用網站管理員帳戶');
