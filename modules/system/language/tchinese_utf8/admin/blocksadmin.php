<?php
/**
 * @copyright       (c) 2000-2016 XOOPS Project (www.xoops.org)
 * @license             GNU GPL 2 (http://www.gnu.org/licenses/gpl-2.0.html)
 * _LANGCODE    zh-TW
 * _CHARSET     UTF-8
 */

// Navigation
define('_AM_SYSTEM_BLOCKS_ADMIN', '區塊管理');
define('_AM_SYSTEM_BLOCKS_MANAGMENT', '管理');
define('_AM_SYSTEM_BLOCKS_ADDBLOCK', '新增區塊');
define('_AM_SYSTEM_BLOCKS_EDITBLOCK', '編輯區塊');
define('_AM_SYSTEM_BLOCKS_CLONEBLOCK', '複製區塊');

// Forms
define('_AM_SYSTEM_BLOCKS_CUSTOM', '自訂區塊');
define('_AM_SYSTEM_BLOCKS_TYPES', '所有類型');
define('_AM_SYSTEM_BLOCKS_GENERATOR', '區塊所屬模組：');
define('_AM_SYSTEM_BLOCKS_GROUP', '群組');
define('_AM_SYSTEM_BLOCKS_SVISIBLEIN', '顯示於');
define('_AM_SYSTEM_BLOCKS_DISPLAY', '顯示區塊');
define('_AM_SYSTEM_BLOCKS_HIDE', '隱藏區塊 ');
define('_AM_SYSTEM_BLOCKS_CLONE', '複製');
define('_AM_SYSTEM_BLOCKS_SIDELEFT', '左');
define('_AM_SYSTEM_BLOCKS_SIDETOPLEFT', '上左');
define('_AM_SYSTEM_BLOCKS_SIDETOPCENTER', '上中');
define('_AM_SYSTEM_BLOCKS_SIDETOPRIGHT', '上右');
define('_AM_SYSTEM_BLOCKS_SIDERIGHT', '右');
define('_AM_SYSTEM_BLOCKS_SIDEBOTTOMLEFT', '下左');
define('_AM_SYSTEM_BLOCKS_SIDEBOTTOMCENTER', '下中');
define('_AM_SYSTEM_BLOCKS_SIDEBOTTOMRIGHT', '下右');
define('_AM_SYSTEM_BLOCKS_SIDEFOOTERLEFT', '頁尾左');
define('_AM_SYSTEM_BLOCKS_SIDEFOOTERCENTER', '頁尾中');
define('_AM_SYSTEM_BLOCKS_SIDEFOOTERRIGHT', '頁尾右');
define('_AM_SYSTEM_BLOCKS_ADD', '新增區塊');
define('_AM_SYSTEM_BLOCKS_MANAGE', '管理區塊');
define('_AM_SYSTEM_BLOCKS_NAME', '名稱');
define('_AM_SYSTEM_BLOCKS_TYPE', '區塊類型');
define('_AM_SYSTEM_BLOCKS_SBLEFT', '邊緣區塊 - 左邊');
define('_AM_SYSTEM_BLOCKS_SBRIGHT', '邊緣區塊 - 右邊');
define('_AM_SYSTEM_BLOCKS_CBLEFT', '中央區塊 - 左');
define('_AM_SYSTEM_BLOCKS_CBRIGHT', '中央區塊 - 右');
define('_AM_SYSTEM_BLOCKS_CBCENTER', '中央區塊 - 中');
define('_AM_SYSTEM_BLOCKS_CBBOTTOMLEFT', '中央區塊 - 底左');
define('_AM_SYSTEM_BLOCKS_CBBOTTOMRIGHT', '中央區塊 - 底右');
define('_AM_SYSTEM_BLOCKS_CBFOOTERLEFT', '頁尾區塊 - 左');
define('_AM_SYSTEM_BLOCKS_CBFOOTERCENTER', '頁尾區塊 - 中');
define('_AM_SYSTEM_BLOCKS_CBFOOTERRIGHT', '頁尾區塊 - 右');
define('_AM_SYSTEM_BLOCKS_CBBOTTOM', '中央區塊 - 底部');
define('_AM_SYSTEM_BLOCKS_WEIGHT', '順序');
define('_AM_SYSTEM_BLOCKS_VISIBLE', '啟用');
define('_AM_SYSTEM_BLOCKS_VISIBLEIN', '顯示於');
define('_AM_SYSTEM_BLOCKS_TOPPAGE', '首頁');
define('_AM_SYSTEM_BLOCKS_ALLPAGES', '全部頁面');
define('_AM_SYSTEM_BLOCKS_UNASSIGNED', '未指定');
define('_AM_SYSTEM_BLOCKS_TITLE', '標題');
define('_AM_SYSTEM_BLOCKS_CONTENT', '內容');
define('_AM_SYSTEM_BLOCKS_USEFULTAGS', '可用標籤：');
define('_AM_SYSTEM_BLOCKS_BLOCKTAG1', '%s 將會列印出 %s');
define('_AM_SYSTEM_BLOCKS_CTYPE', '內容類型');
define('_AM_SYSTEM_BLOCKS_HTML', 'HTML');
define('_AM_SYSTEM_BLOCKS_PHP', 'PHP腳本');
define('_AM_SYSTEM_BLOCKS_AFWSMILE', '自動格式（啟用表情圖）');
define('_AM_SYSTEM_BLOCKS_AFNOSMILE', '自動格式（關閉表情圖）');
define('_AM_SYSTEM_BLOCKS_BCACHETIME', '快取時間');
define('_AM_SYSTEM_BLOCKS_CUSTOMHTML', '自訂區塊（HTML）');
define('_AM_SYSTEM_BLOCKS_CUSTOMPHP', '自訂區塊（PHP）');
define('_AM_SYSTEM_BLOCKS_CUSTOMSMILE', '自訂區塊（自動格式 + 表情圖）');
define('_AM_SYSTEM_BLOCKS_CUSTOMNOSMILE', '自訂區塊（自動格式）');
define('_AM_SYSTEM_BLOCKS_EDITTPL', '編輯樣板');
define('_AM_SYSTEM_BLOCKS_OPTIONS', '選項');
define('_AM_SYSTEM_BLOCKS_DRAG', '拉動或排序區塊');

// Messages
define('_AM_SYSTEM_BLOCKS_DBUPDATED', _AM_SYSTEM_DBUPDATED);
define('_AM_SYSTEM_BLOCKS_RUSUREDEL', '您確定要刪除區塊 <div class="bold">%s</div> 嗎？');
define('_AM_SYSTEM_BLOCKS_SYSTEMCANT', '不能刪除系統區塊！');
define('_AM_SYSTEM_BLOCKS_MODULECANT', '這個區塊不能直接刪除！若您不想要這個區塊，請先關閉相關模組。');

// Tips
define('_AM_SYSTEM_BLOCKS_TIPS',
    '<ul>
<li>只要點選 <img class="tooltip" src="%s" alt="' . _AM_SYSTEM_BLOCKS_DRAG . '" title="' . _AM_SYSTEM_BLOCKS_DRAG . '" /> 即可透過拖拉的方式輕鬆的變換區塊位置以及進行區塊管理。</li>
<li>可新增自訂區塊，輸入任何您想秀在網站上的內容。</li>
<li>透過點擊 <img class="tooltip" width="16" src="%s" alt="' . _AM_SYSTEM_BLOCKS_DISPLAY . '" title="' . _AM_SYSTEM_BLOCKS_DISPLAY . '"/> 或 <img class="tooltip" width="16" src="%s" alt="' . _AM_SYSTEM_BLOCKS_HIDE . '" title="' . _AM_SYSTEM_BLOCKS_HIDE . '" /> 即可設定區塊是否顯示。</li>
</ul>');

define('_AM_SYSTEM_BLOCKS_FOOTER_LEFT', '頁尾左');
define('_AM_SYSTEM_BLOCKS_FOOTER_CENTER', '頁尾中');
define('_AM_SYSTEM_BLOCKS_FOOTER_RIGHT', '頁尾右');
