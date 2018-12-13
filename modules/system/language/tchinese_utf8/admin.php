<?php
/**
 * @copyright   The XOOPS Project http://sourceforge.net/projects/xoops/
 * @license     http://www.fsf.org/copyleft/gpl.html GNU public license
 * _LANGCODE    tw
 * _CHARSET     UTF-8
 * @version     $Id: admin.php 4251 2010-01-31 16:54:19Z forxoops $
 * @translator    點兩下電腦工作室 http://ck2tw.net/
 */

// Main
define('_AM_SYSTEM_CONFIG', '功能調整');
define('_AM_SYSTEM_CPANEL', '控制台');
define('_AM_SYSTEM_UPDATE', '更新');
define('_AM_SYSTEM_GOTOMODULE', '切換到模組');
define('_AM_SYSTEM_HELP', '協助');
define('_AM_SYSTEM_HELP_VIEW', '顯示協助');
define('_AM_SYSTEM_HELP_HIDE', '隱藏協助');
define('_AM_SYSTEM_TIPS', '小技巧');
define('_AM_SYSTEM_SECTION', '區域');
define('_AM_SYSTEM_DESC', '描述');
define('_AM_SYSTEM_GO', '進入設定');
define('_AM_SYSTEM_STATUS', '啟用');
define('_AM_SYSTEM_LOADING', '載入中');
define('_AM_SYSTEM_ALL', '全部');

define('_AM_SYSTEM_TIPS_MAIN', '<ul><li>啟用或關閉系統模組區域或只是讀取之。</li></ul>');
define('_AM_SYSTEM_AVATAR_INFO', '<ul><li>有 <span class="bold red">%s</span> 個頭像</li></ul>');
define('_AM_SYSTEM_BANNER_INFO', '<ul><li>有 <span class="bold red">%s</span> 個看板</li></ul>');
define('_AM_SYSTEM_COMMENT_INFO', '<ul><li>有 <span class="bold red">%s</span> 則評論。</li></ul>');
define('_AM_SYSTEM_GROUP_INFO', '<ul><li>有 <span class="bold red">%s</span> 個群組。</li></ul>');
define('_AM_SYSTEM_IMG_INFO', '<ul><li>有 <span class="bold red">%s</span> 個圖片。</li></ul>');
define('_AM_SYSTEM_SMILIES_INFO', '<ul><li>有 <span class="bold red">%s</span> 個表情圖。</li></ul>');
define('_AM_SYSTEM_RANKS_INFO', '<ul><li>有 <span class="bold red">%s</span> 個使用者等級。</li></ul>');
define('_AM_SYSTEM_USERS_INFO', '<ul><li>有 <span class="bold red">%s</span> 個使用者。</li></ul>');

// Admin Module Names and description
define('_AM_SYSTEM_ADGS', '群組');
define('_AM_SYSTEM_ADGS_DESC', '可新增群組並管理每個群組的權限');
define('_AM_SYSTEM_BANS', '看板');
define('_AM_SYSTEM_BANS_DESC', '管理網站看板');
define('_AM_SYSTEM_BLOCKS', '區塊');
define('_AM_SYSTEM_BLOCKS_DESC', '網站區塊管理');
define('_AM_SYSTEM_MODULES', '模組');
define('_AM_SYSTEM_MODULES_DESC', '安裝、移除、更新網站模組');
define('_AM_SYSTEM_SMLS', '表情圖');
define('_AM_SYSTEM_SMLS_DESC', '表情圖可在文章、訊息、評論...中使用');
define('_AM_SYSTEM_RANK', '會員等級');
define('_AM_SYSTEM_RANK_DESC', '可為會員區分各種等級');
define('_AM_SYSTEM_USER', '會員');
define('_AM_SYSTEM_USER_DESC', '可新增會員或編輯會員資訊，亦可變更會員群組等各種會員管理功能。');
define('_AM_SYSTEM_PREF', '偏好設定');
define('_AM_SYSTEM_PREF_DESC', '網站及各種模組的設定選項');
define('_AM_SYSTEM_MLUS', '寄信給會員');
define('_AM_SYSTEM_MLUS_DESC', '可寄信給網站會員');
define('_AM_SYSTEM_IMAGES', '圖片管理');
define('_AM_SYSTEM_IMAGES_DESC', '可上傳圖片或新增圖片分類');
define('_AM_SYSTEM_AVATARS', '頭像');
define('_AM_SYSTEM_AVATARS_DESC', '新增頭像以供會員選用之');
define('_AM_SYSTEM_TPLSETS', '樣板');
define('_AM_SYSTEM_TPLSETS_DESC', '可讓您用瀏覽器來自行修改模組外觀');
define('_AM_SYSTEM_COMMENTS', '評論');
define('_AM_SYSTEM_COMMENTS_DESC', '用來管理使用者所發表的評論');
define('_AM_SYSTEM_FILEMANAGER', '檔案管理');
define('_AM_SYSTEM_FILEMANAGER_DESC', '可新增或修改網站中的所有檔案');
define('_AM_SYSTEM_MAINTENANCE', '維護');
define('_AM_SYSTEM_MAINTENANCE_DESC', '資料庫的維護工具，可清除 快取資料夾及session資料表');

// Messages
define('_AM_SYSTEM_DBUPDATED', '資料庫更新成功！');
define('_AM_SYSTEM_DBERROR', '因有部份錯誤導致資料庫無法完成更新');
define('_AM_SYSTEM_NOTACTIVE', '這部份尚未啟動');

// Group permission phrases
define('_MD_AM_PERMADDNG', '無法加入群組權限（權限：%s　群組：%s）');
define('_MD_AM_PERMADDOK', '群組權限新增成功（權限：%s　群組：%s）');
define('_MD_AM_PERMRESETNG', '無法重置[%s]模組的群組權限');
define('_MD_AM_PERMADDNGP', '必須選取所有上一級項目。');

define('_AM_SYSTEM_UNINSTALL', '反安裝');

//2.5.7
define('_AM_SYSTEM_USAGE', '使用');
define('_AM_SYSTEM_ACTIVE', '啟動');
