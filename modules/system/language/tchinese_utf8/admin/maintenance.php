<?php
/**
 * @copyright       (c) 2000-2016 XOOPS Project (www.xoops.org)
 * @license             GNU GPL 2 (http://www.gnu.org/licenses/gpl-2.0.html)
 * _LANGCODE    zh-TW
 * _CHARSET     UTF-8
 */
//Nav
define('_AM_SYSTEM_MAINTENANCE_NAV_MANAGER', '維護');
define('_AM_SYSTEM_MAINTENANCE_NAV_LIST', '所有維護');
define('_AM_SYSTEM_MAINTENANCE_NAV_DUMP', '匯出');

define('_AM_SYSTEM_MAINTENANCE_SESSION', '清空 sessions 資料表');
define('_AM_SYSTEM_MAINTENANCE_SESSION_OK', 'Session 維護：完成');
define('_AM_SYSTEM_MAINTENANCE_SESSION_NOTOK', 'Session 維護：失敗');
define('_AM_SYSTEM_MAINTENANCE_CACHE', '清空快取目錄');
define('_AM_SYSTEM_MAINTENANCE_CACHE_OK', '快取維護：完成');
define('_AM_SYSTEM_MAINTENANCE_CACHE_NOTOK', '快取維護：失敗');
define('_AM_SYSTEM_MAINTENANCE_AVATAR', '清除未使用的自定義頭像');
define('_AM_SYSTEM_MAINTENANCE_TABLES', '資料表維護');
define('_AM_SYSTEM_MAINTENANCE_TABLES_OK', '資料表維護：完成');
define('_AM_SYSTEM_MAINTENANCE_TABLES_NOTOK', '資料表維護：失敗');
define('_AM_SYSTEM_MAINTENANCE_QUERY_DESC', '最佳化、檢查、修復及分析您的資料表');
define('_AM_SYSTEM_MAINTENANCE_QUERY_OK', '資料庫維護：完成');
define('_AM_SYSTEM_MAINTENANCE_QUERY_NOTOK', '資料庫維護：失敗');
define('_AM_SYSTEM_MAINTENANCE_CHOICE1', '最佳化資料表');
define('_AM_SYSTEM_MAINTENANCE_CHOICE2', '檢查資料表');
define('_AM_SYSTEM_MAINTENANCE_CHOICE3', '修復資料表');
define('_AM_SYSTEM_MAINTENANCE_CHOICE4', '分析資料表');
define('_AM_SYSTEM_MAINTENANCE_TABLES_DESC',
    '「分析資料表」會對資料表進行分析以及索引的重整，進行分析時，此資料表會暫時被鎖住無法讀取。<br>
「檢查資料表」用來檢查資料表有無錯誤。<br>
「最佳化資料表」 會重新清除表中沒用到的空間，並將資料進行重整讓讀取更有效率。<br>
「修復資料表」用來修復毀損的資料表。');

define('_AM_SYSTEM_MAINTENANCE_RESULT', '結果');
define('_AM_SYSTEM_MAINTENANCE_RESULT_NO_RESULT', '無結果');
define('_AM_SYSTEM_MAINTENANCE_RESULT_CACHE', '清除快取任務');
define('_AM_SYSTEM_MAINTENANCE_RESULT_SESSION', '清除session資料表任務');
define('_AM_SYSTEM_MAINTENANCE_RESULT_QUERY', '資料庫維護任務');
define('_AM_SYSTEM_MAINTENANCE_ERROR_MAINTENANCE', '沒有選擇欲維護的資料表');

define('_AM_SYSTEM_MAINTENANCE_TABLES1', '資料表');
define('_AM_SYSTEM_MAINTENANCE_TABLES_OPTIMIZE', '最佳化');
define('_AM_SYSTEM_MAINTENANCE_TABLES_CHECK', '檢查');
define('_AM_SYSTEM_MAINTENANCE_TABLES_REPAIR', '修復');
define('_AM_SYSTEM_MAINTENANCE_TABLES_ANALYZE', '分析');

//Dump
define('_AM_SYSTEM_MAINTENANCE_DUMP', '匯出');
define('_AM_SYSTEM_MAINTENANCE_DUMP_TABLES_OR_MODULES', '選擇資料表或模組');
define('_AM_SYSTEM_MAINTENANCE_DUMP_DROP', '加入刪除資料表語法到匯出檔中');
define('_AM_SYSTEM_MAINTENANCE_DUMP_OR', '或');
define('_AM_SYSTEM_MAINTENANCE_DUMP_AND', '及');
define('_AM_SYSTEM_MAINTENANCE_DUMP_ERROR_TABLES_OR_MODULES', '您必須選擇資料表或模組');
define('_AM_SYSTEM_MAINTENANCE_DUMP_NO_TABLES', '無資料表');
define('_AM_SYSTEM_MAINTENANCE_DUMP_TABLES', '資料表');
define('_AM_SYSTEM_MAINTENANCE_DUMP_STRUCTURES', '資料表結構');
define('_AM_SYSTEM_MAINTENANCE_DUMP_NB_RECORDS', '紀錄數量');
define('_AM_SYSTEM_MAINTENANCE_DUMP_FILE_CREATED', '檔案已建立');
define('_AM_SYSTEM_MAINTENANCE_DUMP_RESULT', '結果');
define('_AM_SYSTEM_MAINTENANCE_DUMP_RECORDS', '紀錄');

// Tips
define('_AM_SYSTEM_MAINTENANCE_TIPS',
    '<ul>
<li>您可以在此進行簡單的維護動作，包括清除XOOPS快取以及session資料表，或者對於XOOPS的資料表進行修復、檢查的基本維護。</li>
</ul>');
