<?php
/**
 * @copyright       (c) 2000-2016 XOOPS Project (www.xoops.org)
 * @license             GNU GPL 2 (http://www.gnu.org/licenses/gpl-2.0.html)
 * _LANGCODE    zh-TW
 * _CHARSET     UTF-8
 */

// Navigation
define('_AM_SYSTEM_MODULES_ADMIN', '模組後台管理');
define('_AM_SYSTEM_MODULES_LIST', '模組列表');
define('_AM_SYSTEM_MODULES_TOINSTALL', '安裝模組');
define('_AM_SYSTEM_MODULES_VALIDATE', '變更確認');
define('_AM_SYSTEM_MODULES_SUBMITRES', '送出結果');

// Messages
define('_AM_SYSTEM_MODULES_RUSUREINS', '點選以下按鈕安裝此模組');
define('_AM_SYSTEM_MODULES_RUSUREUPD', '點選以下按鈕更新此模組');
define('_AM_SYSTEM_MODULES_RUSUREUNINS', '您是否確實想反安裝此模組？');
define('_AM_SYSTEM_MODULES_BTOMADMIN', '返回模組管理區');
define('_AM_SYSTEM_MODULES_INSTALLING', '正在安裝');
define('_AM_SYSTEM_MODULES_UNINSTAL', '反安裝');
define('_AM_SYSTEM_MODULES_DEACTIVATE', '停用');
define('_AM_SYSTEM_MODULES_ACTIVATE', '啟用');
define('_AM_SYSTEM_MODULES_UPDATING', '更新');

// Main
define('_AM_SYSTEM_MODULES_INSTALL', '安裝');
define('_AM_SYSTEM_MODULES_UNINSTALL', '反安裝');
define('_AM_SYSTEM_MODULES_UPDATE', '更新');
define('_AM_SYSTEM_MODULES_VIEWLARGE', '大圖示');
define('_AM_SYSTEM_MODULES_VIEWLINE', '小圖示');

// %s represents module name
define('_AM_SYSTEM_MODULES_FAILINS', '無法安裝 %s ');
define('_AM_SYSTEM_MODULES_FAILACT', '無法啟用 %s ');
define('_AM_SYSTEM_MODULES_FAILDEACT', '無法停用 %s ');
define('_AM_SYSTEM_MODULES_FAILUPD', '無法更新 %s ');
define('_AM_SYSTEM_MODULES_FAILUNINS', '無法反安裝 %s ');
define('_AM_SYSTEM_MODULES_FAILORDER', '無法重新排列 %s ');
define('_AM_SYSTEM_MODULES_FAILWRITE', '無法寫入主選單。');
define('_AM_SYSTEM_MODULES_ALEXISTS', '模組 %s 已存在。');
define('_AM_SYSTEM_MODULES_ERRORSC', '錯誤(s)：');
define('_AM_SYSTEM_MODULES_OKINS', '模組 %s 安裝成功。');
define('_AM_SYSTEM_MODULES_OKACT', '模組 %s 啟用成功。');
define('_AM_SYSTEM_MODULES_OKDEACT', '模組 %s 停用成功。');
define('_AM_SYSTEM_MODULES_OKUPD', '模組 %s 更新成功。');
define('_AM_SYSTEM_MODULES_OKUNINS', '模組 %s 反安裝成功。');
define('_AM_SYSTEM_MODULES_OKORDER', '模組 %s 更改成功。');

define('_AM_SYSTEM_MODULES_MODULE', '模組名稱');
define('_AM_SYSTEM_MODULES_VERSION', '版本');
define('_AM_SYSTEM_MODULES_LASTUP', '最後更新日期／時間');
define('_AM_SYSTEM_MODULES_DEACTIVATED', '停用');
define('_AM_SYSTEM_MODULES_ACTION', '操作');
define('_AM_SYSTEM_MODULES_MENU', '選單');
define('_AM_SYSTEM_MODULES_HIDE', '隱藏');
define('_AM_SYSTEM_MODULES_SHOW', '顯示');

define('_AM_SYSTEM_MODULES_DUPEN', '資料庫的模組表中有重複資料！');
define('_AM_SYSTEM_MODULES_DEACTED', '選定的模組已被停用，現在您可以安全地反安裝此模組。');
define('_AM_SYSTEM_MODULES_ACTED', '	選定的模組已啟用！');
define('_AM_SYSTEM_MODULES_UPDTED', '選定的模組已更新！');
define('_AM_SYSTEM_MODULES_SYSNO', '系統模組不能停用。');
define('_AM_SYSTEM_MODULES_STRTNO', '此模組已設定為預設的首頁，請設定適合您的首頁。');

define('_AM_SYSTEM_MODULES_ORDER', '順序');
define('_AM_SYSTEM_MODULES_ORDER0', '（0 = 隱藏）');
define('_AM_SYSTEM_MODULES_ACTIVE', '啟用');
define('_AM_SYSTEM_MODULES_INACTIVE', '未啟用');
define('_AM_SYSTEM_MODULES_NOTINSTALLED', '沒有安裝');
define('_AM_SYSTEM_MODULES_NOCHANGE', '無變化');
define('_AM_SYSTEM_MODULES_SUBMIT', '送出');
define('_AM_SYSTEM_MODULES_CANCEL', '取消');
define('_AM_SYSTEM_MODULES_DBUPDATE', _AM_SYSTEM_DBUPDATED);
define('_AM_SYSTEM_MODULES_LISTUPBLKS', '以下區塊將一起更新。<br>選擇要更新的區塊內容（格式）將一起更新。<br>');
define('_AM_SYSTEM_MODULES_NEWBLKS', '新區塊');
define('_AM_SYSTEM_MODULES_DEPREBLKS', '不更新區塊');

// Logger
define('_AM_SYSTEM_MODULES_TABLE_RESERVED', '%s 是一個預留資料表！');
define('_AM_SYSTEM_MODULES_CREATE_TABLES', '正在新建資料表…');
define('_AM_SYSTEM_MODULES_TABLE_CREATED', ' %s 新建資料表成功 ');
define('_AM_SYSTEM_MODULES_INSERT_DATA', '&nbsp;&nbsp; 資料已插入到資料表中 %s');
define('_AM_SYSTEM_MODULES_INSERT_DATA_FAILD', ' %s 未能插入到資料庫中');
define('_AM_SYSTEM_MODULES_INSERT_DATA_DONE', '模組資料新增成功 ');
define('_AM_SYSTEM_MODULES_MODULEID', ' 模組 ID：%s');
define('_AM_SYSTEM_MODULES_SQL_FOUND', '在 %s 中發現 SQL 文件');
define('_AM_SYSTEM_MODULES_SQL_NOT_FOUND', '在 %s 中沒有發現 SQL 文件');
define('_AM_SYSTEM_MODULES_SQL_NOT_CREATE', '出錯：未能新建 %s');
define('_AM_SYSTEM_MODULES_SQL_NOT_VALID', '%s 不是可用的 SQL！');
define('_AM_SYSTEM_MODULES_GROUP_ID', ' 群組 ID：%s ');
define('_AM_SYSTEM_MODULES_NAME', '名稱：');
define('_AM_SYSTEM_MODULES_VALUE', ' 值：');

// Templates
define('_AM_SYSTEM_MODULES_TEMPLATES_ADD', '正在新增樣板…');
define('_AM_SYSTEM_MODULES_TEMPLATES_DELETE', '正在刪除樣板…');
define('_AM_SYSTEM_MODULES_TEMPLATES_UPDATE', '正在更新…');
define('_AM_SYSTEM_MODULES_TEMPLATE_ID', '樣板 ID：%s ');
define('_AM_SYSTEM_MODULES_TEMPLATE_ADD_DATA', '樣板 %s 已新增到資料庫');
define('_AM_SYSTEM_MODULES_TEMPLATE_ADD_ERROR', '錯誤：樣板 %s 沒有新增到資料庫中');
define('_AM_SYSTEM_MODULES_TEMPLATE_COMPILED', '樣板 %s 編譯成功 ');
define('_AM_SYSTEM_MODULES_TEMPLATE_COMPILED_FAILED', '錯誤：樣板 %s 沒有編譯成功 ');
define('_AM_SYSTEM_MODULES_TEMPLATE_DELETE_DATA', '樣板 %s 已從資料庫中刪除');
define('_AM_SYSTEM_MODULES_TEMPLATE_DELETE_DATA_FAILD', '錯誤：樣板 %s 沒有從資料庫中刪除');
define('_AM_SYSTEM_MODULES_TEMPLATE_INSERT_DATA', '樣板 %s 已新增到資料庫中');
define('_AM_SYSTEM_MODULES_TEMPLATE_RECOMPILE', '樣板 %s 重新編譯');
define('_AM_SYSTEM_MODULES_TEMPLATE_RECOMPILE_FAILD', '錯誤：樣板 %s 重新編譯失敗');
define('_AM_SYSTEM_MODULES_TEMPLATE_RECOMPILE_ERROR', '錯誤：不能重新編譯樣板 %s');
define('_AM_SYSTEM_MODULES_TEMPLATE_DELETE_OLD_ERROR', '錯誤：沒有刪除舊的樣板 %s，已放棄更新此文件');
define('_AM_SYSTEM_MODULES_TEMPLATE_UPDATE', '樣板 %s 更新成功 ');
define('_AM_SYSTEM_MODULES_TEMPLATE_UPDATE_ERROR', '錯誤：沒有更新 %s 樣板');

// Blocks
define('_AM_SYSTEM_MODULES_BLOCKS_ADD', '正在新增區塊…');
define('_AM_SYSTEM_MODULES_BLOCKS_DELETE', '正在刪除區塊…');
define('_AM_SYSTEM_MODULES_BLOCKS_REBUILD', '正在重建區塊…');
define('_AM_SYSTEM_MODULES_BLOCK_ID', ' 區塊 ID：%s ');

define('_AM_SYSTEM_MODULES_BLOCK_ACCESS', '新增區塊權限');
define('_AM_SYSTEM_MODULES_BLOCK_ACCESS_ERROR', '錯誤：未能新增區塊權限');
define('_AM_SYSTEM_MODULES_BLOCK_ADD', '區塊 %s 已新增');
define('_AM_SYSTEM_MODULES_BLOCK_ADD_ERROR', '錯誤：未能新增區塊 %s 到資料庫中！');
define('_AM_SYSTEM_MODULES_BLOCK_ADD_ERROR_DATABASE', '資料庫錯誤：%s');
define('_AM_SYSTEM_MODULES_BLOCK_CREATED', '區塊 %s 已新建');
define('_AM_SYSTEM_MODULES_BLOCK_DELETE', '區塊 %s 已刪除');
define('_AM_SYSTEM_MODULES_BLOCK_DELETE_DATA', '區塊樣板 %s 已從資料庫中刪除。');
define('_AM_SYSTEM_MODULES_BLOCK_DELETE_ERROR', '錯誤：未能刪除區塊  %s');
define('_AM_SYSTEM_MODULES_BLOCK_DELETE_TEMPLATE_ERROR', '錯誤：未能從資料庫中刪除區塊 %s。');
define('_AM_SYSTEM_MODULES_BLOCK_DEPRECATED', '區塊樣板 %s deprecated ');
define('_AM_SYSTEM_MODULES_BLOCK_DEPRECATED_ERROR', '錯誤：Could not remove deprecated block template.');
define('_AM_SYSTEM_MODULES_BLOCK_UPDATE', '區塊 %s 更新成功！');

// Configs
define('_AM_SYSTEM_MODULES_GONFIG_ID', '偏好設定編號： %s');
define('_AM_SYSTEM_MODULES_MODULE_DATA_ADD', '正在加入模組設定資料…');
define('_AM_SYSTEM_MODULES_MODULE_DATA_DELETE', '正在刪除模組設定資料…');
define('_AM_SYSTEM_MODULES_MODULE_DATA_UPDATE', '模組資料更新成功 ');
define('_AM_SYSTEM_MODULES_CONFIG_ADD', ' 設定項目已新增');
define('_AM_SYSTEM_MODULES_CONFIG_DATA_ADD', '偏好設定「%s」已新增到資料庫');
define('_AM_SYSTEM_MODULES_CONFIG_DATA_ADD_ERROR', '錯誤：無法新增偏好設定「%s」到資料庫。');
define('_AM_SYSTEM_MODULES_GONFIG_DATA_DELETE', '偏好設定資料已從資料庫刪除。');
define('_AM_SYSTEM_MODULES_CONFIG_DATA_DELETE_ERROR', '錯誤：偏好設定資料無法從資料庫刪除');

// Access
define('_AM_SYSTEM_MODULES_GROUP_SETTINGS_ADD', '正在設定群組權限…');
define('_AM_SYSTEM_MODULES_GROUP_PERMS_DELETE_ERROR', '錯誤：無法刪除群組權限');
define('_AM_SYSTEM_MODULES_GROUP_PERMS_DELETED', '群組權限已刪除');
define('_AM_SYSTEM_MODULES_ACCESS_ADMIN_ADD', '新增模組管理權限給編號 %s 的群組');
define('_AM_SYSTEM_MODULES_ACCESS_ADMIN_ADD_ERROR', '錯誤：無法新增模組管理權限給編號 %s 的群組');
define('_AM_SYSTEM_MODULES_ACCESS_USER_ADD_ERROR', '新增模組使用權限給編號 %s 的群組');
define('_AM_SYSTEM_MODULES_ACCESS_USER_ADD_ERROR_ERROR', '錯誤：無法新增模組使用權限給編號 %s 的群組');

// execute module specific install script if any
define('_AM_SYSTEM_MODULES_FAILED_EXECUTE', '執行 %s 失敗');
define('_AM_SYSTEM_MODULES_FAILED_SUCESS', '%s 執行成功！');
define('_AM_SYSTEM_MODULES_DELETE_ERROR', '錯誤：無法刪除 %s');
define('_AM_SYSTEM_MODULES_UPDATE_ERROR', '錯誤：無法更新 %s');
define('_AM_SYSTEM_MODULES_DELETE_MOD_TABLES', '刪除模組資料表...');
define('_AM_SYSTEM_MODULES_COMMENTS_DELETE', '刪除評論...');
define('_AM_SYSTEM_MODULES_COMMENTS_DELETE_ERROR', '錯誤：無法刪除評論');
define('_AM_SYSTEM_MODULES_COMMENTS_DELETED', '評論已刪除');
define('_AM_SYSTEM_MODULES_NOTIFICATIONS_DELETE', '刪除通知訊息中...');
define('_AM_SYSTEM_MODULES_NOTIFICATIONS_DELETE_ERROR', '錯誤：無法刪除通知訊息');
define('_AM_SYSTEM_MODULES_NOTIFICATIONS_DELETED', '通知訊息已刪除');
define('_AM_SYSTEM_MODULES_TABLE_DROPPED', '資料表 %s 刪除成功！');
define('_AM_SYSTEM_MODULES_TABLE_DROPPED_ERROR', '錯誤：不能刪除資料表 %s');
define('_AM_SYSTEM_MODULES_TABLE_DROPPED_FAILDED', '錯誤：不允許刪除 %s 資料表！');

// Tips
define('_AM_SYSTEM_MODULES_TIPS',
    '<ul>
<li>安裝新模組之後，記得設定一下模組的偏好設定、區塊以及群組權限！</li>
<li>若不想讓模組出現在主選單中，請將「順序」設為 0 即可。</li>
<li>沒有用到的模組反安裝後，就請從主機刪除掉實體檔案，以保持網站的安全性。</li>
<li>要調整模組順序（會影響呈現在主選單的順序），您只需要直接拖曳模組到您想要的位置即可。</li>
</ul>');
define('_AM_SYSTEM_MODULES_CONFIRM_TIPS',
    '<ul>
<li>檢查所有變更，使之生效</li>
</ul>');
// 2.5.8
define('_AM_SYSTEM_MODULES_INSTALL_MORE', '安裝更多模組');
