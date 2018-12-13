<?php
/**
 * @copyright       (c) 2000-2016 XOOPS Project (www.xoops.org)
 * @license             GNU GPL 2 (http://www.gnu.org/licenses/gpl-2.0.html)
 * _LANGCODE    zh-TW
 * _CHARSET     UTF-8
 */
// dont change
define('_AM_DBUPDATED', _AM_SYSTEM_DBUPDATED);

//Nav
define('_AM_SYSTEM_PREFERENCES_NAV_MAIN', '偏好設定');

//Tips
define('_AM_SYSTEM_PREFERENCES_NAV_TIPS', '<ul><li>管理所有網站的設定</li></ul>');

define('_MD_AM_SITEPREF', '網站參數設定');
define('_MD_AM_SITENAME', '網站名稱');
define('_MD_AM_SITENAMEDSC', '');
define('_MD_AM_SLOGAN', '網站標語');
define('_MD_AM_SLOGANDSC', '');
define('_MD_AM_ADMINML', '管理員電子郵件');
define('_MD_AM_ADMINMLDSC', '');
define('_MD_AM_LANGUAGE', '網站預設語系');
define('_MD_AM_LANGUAGEDSC', '');
define('_MD_AM_STARTPAGE', '網站首頁所用模組');
define('_MD_AM_STARTPAGEDSC', '');
define('_MD_AM_NONE', '無');
define('_MD_AM_SERVERTZ', '伺服器時區');
define('_MD_AM_SERVERTZDSC', '');
define('_MD_AM_DEFAULTTZ', '網站預設時區');
define('_MD_AM_DEFAULTTZDSC', '');
define('_MD_AM_DTHEME', '預設佈景（theme）');
define('_MD_AM_DTHEMEDSC', '');
define('_MD_AM_THEMESET', '樣板佈景');
define('_MD_AM_CUSTOM_REDIRECT', '使用 jGrowl 動態轉向');
define('_MD_AM_CUSTOM_REDIRECT_DESC', '以 jquery 的方式取代原有的頁面轉向效果<br>jGrowl 是一個 jQuery 用來進行 XOOPS 訊息提示的外掛');
define('_MD_AM_ANONNAME', '匿名使用者名稱');
define('_MD_AM_ANONNAMEDSC', '');
define('_MD_AM_MINPASS', '密碼最小長度');
define('_MD_AM_MINPASSDSC', '');
define('_MD_AM_NEWUNOTIFY', '有新會員註冊時傳送電子郵件通知？');
define('_MD_AM_NEWUNOTIFYDSC', '');
define('_MD_AM_SELFDELETE', '允許會員刪除自己的帳號？');
define('_MD_AM_SELFDELETEDSC', '');
define('_MD_AM_USEGZIP', '使用 gzip 壓縮？');
define('_MD_AM_USEGZIPDSC', '');
define('_MD_AM_UNAMELVL', '會員帳號的允許類型');
define('_MD_AM_UNAMELVLDSC', '');
define('_MD_AM_STRICT', '嚴格 （只允許字母和數字）');
define('_MD_AM_MEDIUM', '中等');
define('_MD_AM_LIGHT', '寬鬆（可使用中文字）');
define('_MD_AM_USERCOOKIE', '設定會員帳號的 cookies 名稱，可以讓會員不用每次都輸入使用者名稱');
define('_MD_AM_USERCOOKIEDSC', '使用此 cookie 儲存會員帳號一年（如果會員願意），如果有此 cookie，登入框將自動顯示會員帳號。');
define('_MD_AM_USEMYSESS', '使用自訂 session');
define('_MD_AM_USEMYSESSDSC', '是否使用自訂 session。');
define('_MD_AM_SESSNAME', 'Session 名稱');
define('_MD_AM_SESSNAMEDSC', 'Session名稱（啟用自訂session才有作用）。');
define('_MD_AM_SESSEXPIRE', 'Session 有效時間');
define('_MD_AM_SESSEXPIREDSC', '最大 sesssion 有效時間[以分鐘計]（只有當啟用自訂 seesion 時才有效）。');
define('_MD_AM_BANNERS', '啟用廣告？');
define('_MD_AM_BANNERSDSC', '');
define('_MD_AM_MYIP', '您的 IP 位址');
define('_MD_AM_MYIPDSC', '來自此 IP 的展示不計入廣告的展示統計。');
define('_MD_AM_ALWDHTML', '允許使用的 HTML 標籤');
define('_MD_AM_INVLDMINPASS', '密碼最小長度');
define('_MD_AM_INVLDUCOOK', '不正確的帳號 cookies 名稱');
define('_MD_AM_INVLDSCOOK', '不正確的 session cookies 名稱');
define('_MD_AM_INVLDSEXP', '不正確的 session 時間');
define('_MD_AM_ADMNOTSET', '管理員電子郵件地址未設定');
define('_MD_AM_YES', '是');
define('_MD_AM_NO', '否');
define('_MD_AM_DONTCHNG', '請勿修改！');
define('_MD_AM_REMEMBER', '為了讓系統能正常操作該檔案，請將該檔案的屬性設為644');
define('_MD_AM_IFUCANT', '如果無法修改屬性，請手動修改檔案');

define('_MD_AM_COMMODE', '預設的評論顯示模式');
define('_MD_AM_COMMODEDSC', '');
define('_MD_AM_COMORDER', '預設的評論排序方式');
define('_MD_AM_COMORDERDSC', '');
define('_MD_AM_ALLOWHTML', '允許在評論中使用 HTML');
define('_MD_AM_DEBUGMODE', '開啟錯誤檢查模式');
define('_MD_AM_DEBUGMODEDSC', '開啟後將會顯示錯誤資訊，網站正式執行後請關閉此功能。');
define('_MD_AM_AVATARALLOW', '允許上傳頭像');
define('_MD_AM_AVATARALWDSC', '');
define('_MD_AM_AVATARMP', '最少發佈文章數');
define('_MD_AM_AVATARMPDSC', '只有發表超過該數目的會員才可以上傳頭像。');
define('_MD_AM_AVATARW', '頭像最大寬度（像素）');
define('_MD_AM_AVATARWDSC', '');
define('_MD_AM_AVATARH', '頭像最大高度（像素）');
define('_MD_AM_AVATARHDSC', '');
define('_MD_AM_AVATARMAX', '頭像檔案大小（位元組）');
define('_MD_AM_AVATARMAXDSC', '');
define('_MD_AM_AVATARCONF', '自訂頭像設定');
define('_MD_AM_CHNGUTHEME', '修改所有會員的佈景');
define('_MD_AM_NOTIFYTO', '會員註冊時通知群組');
define('_MD_AM_NOTIFYTODSC', '');
define('_MD_AM_ALLOWTHEME', '允許會員選擇佈景');
define('_MD_AM_ALLOWIMAGE', '允許會員在發表的文章中顯示圖片');

define('_MD_AM_USERACTV', '需要經由電子郵件啟動帳號');
define('_MD_AM_AUTOACTV', '註冊後自動啟動');
define('_MD_AM_ADMINACTV', '由管理員手動啟動');
define('_MD_AM_ACTVTYPE', '選擇會員註冊的啟動方式');
define('_MD_AM_ACTVTYPEDSC', '');
define('_MD_AM_ACTVGROUP', '選擇啟動郵件要附送的群組');
define('_MD_AM_ACTVGROUPDSC', '只有選用「由管理員啟動」才有效。');
define('_MD_AM_USESSL', '使用 SSL 加密方式登入？');
define('_MD_AM_USESSLDSC', '');
define('_MD_AM_SSLPOST', 'SSL Post 變數名稱');
define('_MD_AM_SSLPOSTDSC', '經由 POST 傳送 Session 值時所用的變數名稱，如果您不瞭解此變數，請選一個不容易猜到的名稱。');
define('_MD_AM_DEBUGMODE0', '關閉');
define('_MD_AM_DEBUGMODE1', 'PHP 錯誤檢查');
define('_MD_AM_DEBUGMODE2', 'MySQL/Blocks 錯誤檢查');
define('_MD_AM_DEBUGMODE3', 'Smarty 樣板錯誤檢查');
define('_MD_AM_MINUNAME', '帳號最小長度');
define('_MD_AM_MINUNAMEDSC', '');
define('_MD_AM_MAXUNAME', '帳號最大長度');
define('_MD_AM_MAXUNAMEDSC', '');
define('_MD_AM_GENERAL', '一般設定');
define('_MD_AM_USERSETTINGS', '註冊會員設定');
define('_MD_AM_ALLWCHGMAIL', '允許會員修改電子郵件地址');
define('_MD_AM_ALLWCHGMAILDSC', '');
define('_MD_AM_IPBAN', '被禁止的 IP');
define('_MD_AM_BADEMAILS', '使用者註冊時不可使用的電子郵件');
define('_MD_AM_BADEMAILSDSC', '請用 <strong>|</strong> 分隔關鍵詞，不區分大小寫，可使用 regex。');
define('_MD_AM_BADUNAMES', '禁用的帳號名稱');
define('_MD_AM_BADUNAMESDSC', '請用 <strong>|</strong> 分隔關鍵詞，不區分大小寫，可使用 regex。');
define('_MD_AM_DOBADIPS', '啟用 IP 被禁止功能');
define('_MD_AM_DOBADIPSDSC', '使用此 IP 位址的使用者將無法瀏覽您的網站。');
define('_MD_AM_BADIPS', '輸入要被禁止的 IP 位址。<br>請用 <strong>|</strong> 分隔關鍵詞，不區分大小寫，可使用正規表達式（所以點「.」代表「任何字元」而「\.」才是代表「.」）。');
define('_MD_AM_BADIPSDSC', '^aaa\.bbb\.ccc 將拒絕以 aaa.bbb.ccc 開頭的 IP 位址的存取。<br>aaa\.bbb\.ccc$ 將拒絕以 aaa.bbb.ccc 結尾的 IP 位址的存取。 <br>aaa\.bbb\.ccc 將拒絕含有 aaa.bbb.ccc 的 IP 位址的存取。');
define('_MD_AM_PREFMAIN', '系統參數設定');
define('_MD_AM_METAKEY', 'Meta 關鍵字');
define('_MD_AM_METAKEYDSC', '關鍵字標示用於代表站台的主要內容，通常由多個關鍵詞組成，填入多個關鍵詞請用半形逗號（,）隔開（如 XOOP, PHP, mySQL, portal system）');
define('_MD_AM_METARATING', 'Meta 等級');
define('_MD_AM_METARATINGDSC', '等級標示用來定義站台的適合年齡及內容的等級。');
define('_MD_AM_METAOGEN', '一般');
define('_MD_AM_METAO14YRS', '14 歲');
define('_MD_AM_METAOREST', '限制');
define('_MD_AM_METAOMAT', '成人');
define('_MD_AM_METAROBOTS', 'Meta 機器人');
define('_MD_AM_METAROBOTSDSC', '機器人標示用來告知搜尋引擎什麼樣的內容可供其索引。');
define('_MD_AM_INDEXFOLLOW', 'Index, Follow');
define('_MD_AM_NOINDEXFOLLOW', 'No Index, Follow');
define('_MD_AM_INDEXNOFOLLOW', 'Index, No Follow');
define('_MD_AM_NOINDEXNOFOLLOW', 'No Index, No Follow');
define('_MD_AM_METAAUTHOR', 'Meta 作者');
define('_MD_AM_METAAUTHORDSC', '作者名稱、電子郵件地址及網址。');
define('_MD_AM_METACOPYR', 'Meta 版權');
define('_MD_AM_METACOPYRDSC', '版權標示用來定義網站頁面檔案所遵循的版權說明。');
define('_MD_AM_METADESC', 'Meta 描述');
define('_MD_AM_METADESCDSC', '描述標示相當於網站的摘要，通常用一小段文字來表達。');
define('_MD_AM_METAFOOTER', 'Meta 及頁尾');
define('_MD_AM_FOOTER', '頁尾註腳');
define('_MD_AM_FOOTERDSC', '確定使用完整網址，否則連結到模組頁面將不能正常工作。');
define('_MD_AM_CENSOR', '敏感詞語檢查');
define('_MD_AM_DOCENSOR', '啟用敏感詞語檢查');
define('_MD_AM_DOCENSORDSC', '若此選項開啟，將會篩選文章中的敏感詞語，若為了提升網站速度，建議關閉此選項。');
define('_MD_AM_CENSORWRD', '敏感詞語');
define('_MD_AM_CENSORWRDDSC', '輸入要禁用的敏感詞語。<br>使用 <strong>|</strong> 分開，不區分大小寫。');
define('_MD_AM_CENSORRPLC', '敏感詞語將被取代為：');
define('_MD_AM_CENSORRPLCDSC', '敏感詞語將會被取代成您所輸入的字元。');

define('_MD_AM_SEARCH', '搜尋選項');
define('_MD_AM_DOSEARCH', '啟用全站搜尋');
define('_MD_AM_DOSEARCHDSC', '允許搜尋全站範圍的內容。');
define('_MD_AM_MINSEARCH', '關鍵字最小長度');
define('_MD_AM_MINSEARCHDSC', '搜尋時須輸入最少的字數。');
define('_MD_AM_MODCONFIG', '系統基本設定選項');
define('_MD_AM_DSPDSCLMR', '顯示註冊條款聲明');
define('_MD_AM_DSPDSCLMRDSC', '選擇是，將在註冊頁面顯示條款聲明。');
define('_MD_AM_REGDSCLMR', '註冊條款聲明');
define('_MD_AM_REGDSCLMRDSC', '會員註冊時顯示的條款。');
define('_MD_AM_ALLOWREG', '允許新會員註冊');
define('_MD_AM_ALLOWREGDSC', '如果不再接受新會員，就選「否」。');
define('_MD_AM_THEMEFILE', '自動編譯您修改的樣板檔？');
define('_MD_AM_THEMEFILEDSC', '若為「是」，當您修改完樣板會自動編譯成新樣板。若網站已經穩定運作不會再修改樣板，那麼建議您關閉之。');
define('_MD_AM_CLOSESITE', '關閉網站');
define('_MD_AM_CLOSESITEDSC', '網站關閉後，只允許被授權的群組會員進入。');
define('_MD_AM_CLOSESITEOK', '選擇網站關閉後，有權進入的會員群組');
define('_MD_AM_CLOSESITEOKDSC', '網站最高管理權者不受限制。');
define('_MD_AM_CLOSESITETXT', '網站關閉原因');
define('_MD_AM_CLOSESITETXTDSC', '網站關閉時，該段內容自動顯示在首頁。');
define('_MD_AM_SITECACHE', '網站快取');
define('_MD_AM_SITECACHEDSC', '快取儲存網站的內容，如模組、區塊…等。');
define('_MD_AM_MODCACHE', '模組快取');
define('_MD_AM_MODCACHEDSC', '快取模組資料。');
define('_MD_AM_NOMODULE', '沒有模組使用快取');
define('_MD_AM_DTPLSET', '預設樣板群組');
define('_MD_AM_DTPLSETDSC', '');
define('_MD_AM_SSLLINK', 'SSL 登入頁面的 URL');
define('_MD_AM_SSLLINKDSC', '');

// added for mailer
define('_MD_AM_MAILER', '電子郵件設定');
define('_MD_AM_MAILER_MAIL', '電子郵件');
define('_MD_AM_MAILER_SENDMAIL', '傳送電子郵件');
define('_MD_AM_MAILER_', '');
define('_MD_AM_MAILFROM', '寄件人電子郵件地址');
define('_MD_AM_MAILFROMDESC', '');
define('_MD_AM_MAILFROMNAME', '寄件人姓名');
define('_MD_AM_MAILFROMNAMEDESC', '');
// RMV-NOTIFY
define('_MD_AM_MAILFROMUID', '來自');
define('_MD_AM_MAILFROMUIDDESC', '當系統傳送一則私人訊息，顯示的寄件人姓名。');
define('_MD_AM_MAILERMETHOD', '電子郵件分發方式');
define('_MD_AM_MAILERMETHODDESC', '用於分發電子郵件的方式，預設為「mail」，除非這種方式無法正常工作，否則不要用其它方式。');
define('_MD_AM_SMTPHOST', 'SMTP 伺服器');
define('_MD_AM_SMTPHOSTDESC', '嘗試連接的 SMTP 伺服器清單。');
define('_MD_AM_SMTPUSER', 'SMTPAuth 的使用者名稱');
define('_MD_AM_SMTPUSERDESC', '很多 SMTP 伺服器都啟用了驗證功能，請輸入您的會員帳號。');
define('_MD_AM_SMTPPASS', 'SMTPAuth 的密碼');
define('_MD_AM_SMTPPASSDESC', '輸入您在 SMTP 伺服器的會員密碼。');
define('_MD_AM_SENDMAILPATH', 'sendmail 路徑');
define('_MD_AM_SENDMAILPATHDESC', '請輸入您 Web 伺服器上的 Sendmail 程式（或者其它郵件伺服器程式）的路徑。');
define('_MD_AM_THEMEOK', '使用者可選擇的佈景');
define('_MD_AM_THEMEOKDSC', '可供使用者選擇的佈景。');

// SOAP Clauses
define('_MD_AM_SOAP_CLIENT', 'SOAP - SOAP API');
define('_MD_AM_SOAP_CLIENTDESC', '此為 soap 伺服器位置');
define('_MD_AM_SOAP_PROVISION', 'SOAP - Provision');
define('_MD_AM_SOAP_PROVISIONDESC', 'If you want the new user provisioned, say "是"');
define('_MD_AM_SOAP_PROVISIONGROUP', 'SOAP - Rank to Provision');
define('_MD_AM_SOAP_PROVISIONGROUPDESC', 'This is the ranks a new user from the soap server is put in.');

define('_MD_AM_SOAP_WSDL', 'SOAP - SOAP WSDL');
define('_MD_AM_SOAP_WSDLDESC', '若是您需要 wdsl soap 服務，請啟動此選項。');
define('_MD_AM_SOAP_USERNAME', 'SOAP - SOAP 帳號');
define('_MD_AM_SOAP_USERNAMEDESC', 'soap 伺服器上的帳號.');
define('_MD_AM_SOAP_PASSWORD', 'SOAP - SOAP 密碼');
define('_MD_AM_SOAP_PASSWORDDESC', '若您的 soap service 需要密碼請在此輸入。');
define('_MD_AM_SOAP_KEEPCLIENT', 'SOAP - Client Alive');
define('_MD_AM_SOAP_KEEPCLIENTDESC', '保持 Soap 客戶端連線狀態');
define('_MD_AM_SOAP_FILTERPERSON', 'SOAP - 特殊帳號');
define('_MD_AM_SOAP_FILTERPERSONDESC', '用來進行 Xoops 驗證的特殊帳號。');
define('_MD_AM_SOAP_CLIENTPROXYHOST', 'SOAP - Proxy 主機位址');
define('_MD_AM_SOAP_CLIENTPROXYHOSTDESC', 'SOAP 伺服器之 Proxy 伺服器');
define('_MD_AM_SOAP_CLIENTPROXYPORT', 'SOAP - Proxy 埠號');
define('_MD_AM_SOAP_CLIENTPROXYPORTDESC', 'SOAP 伺服器之 Proxy 伺服器的埠號<br>例如：0 - 65535');
define('_MD_AM_SOAP_CLIENTPROXYUSERNAME', 'SOAP - Proxy 帳號');
define('_MD_AM_SOAP_CLIENTPROXYUSERNAMEDESC', 'SOAP 伺服器之 Proxy 伺服器帳號');
define('_MD_AM_SOAP_CLIENTPROXYPASSWORD', 'SOAP - Proxy 密碼');
define('_MD_AM_SOAP_CLIENTPROXYPASSWORDDESC', 'SOAP 伺服器之 Proxy 伺服器密碼');
define('_MD_AM_SOAP_SOAP_TIMEOUT', 'SOAP - SOAP 逾期時限');
define('_MD_AM_SOAP_SOAP_TIMEOUTDESC', '保持 Soap 請求之有效性 <strong>xx</strong> 秒。');
define('_MD_AM_SOAP_SOAP_RESPONSETIMEOUT', 'SOAP - SOAP 執行時限');
define('_MD_AM_SOAP_SOAP_RESPONSETIMEOUTDESC', '保持 Soap 請求 <strong>xx</strong> 秒。');
define('_MD_AM_SOAP_FIELDMAPPING', 'Xoops驗證伺服器欄位對應');
define('_MD_AM_SOAP_FIELDMAPPINGDESC', '在此輸入XOOPS資料庫欄位與LDAP驗證系統欄位的對應。' .
    '<br><br>格式 [Xoops 資料庫欄位]=[LDAP 屬性]' .
    '<br>例如： email=mail' .
    '<br>用 | 作為分隔符號' .
    '<br><br>！！僅適用進階使用者！！');

// Xoops Authentication constants
define('_MD_AM_AUTH_CONFOPTION_XOOPS', 'XOOPS 資料庫');
define('_MD_AM_AUTH_CONFOPTION_LDAP', '標準 LDAP 目錄');
define('_MD_AM_AUTH_CONFOPTION_AD', '微軟 Active Directory &copy');
define('_MD_AM_AUTH_CONFOPTION_SOAP', 'Xoops Soap Authentication');
define('_MD_AM_AUTHENTICATION', '認證方式管理');
define('_MD_AM_AUTHMETHOD', '認證方法');
define('_MD_AM_AUTHMETHODDESC', '選擇對會員身份進行認證的方法。');
define('_MD_AM_LDAP_MAIL_ATTR', 'LDAP - 郵件網域名稱');
define('_MD_AM_LDAP_MAIL_ATTR_DESC', 'LDAP 樹狀目錄中郵件的網域名稱。');
define('_MD_AM_LDAP_NAME_ATTR', 'LDAP - 通用名稱（CN）的網域名稱');
define('_MD_AM_LDAP_NAME_ATTR_DESC', 'LDAP 目錄中通用名稱（Common Name）的網域名稱。');
define('_MD_AM_LDAP_SURNAME_ATTR', 'LDAP - 姓的網域名稱');
define('_MD_AM_LDAP_SURNAME_ATTR_DESC', 'LDAP 目錄中姓（Surname）的網域名稱。');
define('_MD_AM_LDAP_GIVENNAME_ATTR', 'LDAP - 名的網域名稱');
define('_MD_AM_LDAP_GIVENNAME_ATTR_DSC', 'LDAP 目錄中名（Given Name）的網域名稱。');
define('_MD_AM_LDAP_BASE_DN', 'LDAP - 基本識別名');
define('_MD_AM_LDAP_BASE_DN_DESC', 'LDAP 樹狀目錄的基本識別名（Distinguished Name）。');
define('_MD_AM_LDAP_PORT', 'LDAP - 連接埠號。');
define('_MD_AM_LDAP_PORT_DESC', '登入 LDAP 目錄伺服器的連接埠號。');
define('_MD_AM_LDAP_SERVER', 'LDAP - 伺服器名');
define('_MD_AM_LDAP_SERVER_DESC', 'LDAP 目錄伺服器的名稱。');

define('_MD_AM_LDAP_MANAGER_DN', 'LDAP 管理員識別名');
define('_MD_AM_LDAP_MANAGER_DN_DESC', '允許搜尋的人員識別名。');
define('_MD_AM_LDAP_MANAGER_PASS', 'LDAP 管理員的密碼');
define('_MD_AM_LDAP_MANAGER_PASS_DESC', '允許搜尋的人員密碼。');
define('_MD_AM_LDAP_VERSION', 'LDAP 版本協定');
define('_MD_AM_LDAP_VERSION_DESC', 'LDAP 版本協定：2或3。');
define('_MD_AM_LDAP_USERS_BYPASS', '使用者可以繞過 LDAP 驗證');
define('_MD_AM_LDAP_USERS_BYPASS_DESC', '使用者以 XOOPS 方式驗證。');

define('_MD_AM_LDAP_USETLS', ' 使用 TLS 連結');
define('_MD_AM_LDAP_USETLS_DESC', '使用 TLS（Transport Layer Security-傳輸層安全）連接，TLS 使用標準的 389 連接埠<BR>並且 LDAP 的版本為3。');

define('_MD_AM_LDAP_LOGINLDAP_ATTR', '用於搜尋會員的 LDAP 屬性');
define('_MD_AM_LDAP_LOGINLDAP_ATTR_D', '當在識別名（DN）選項中設定登入名為「是」時，必須與 XOOPS 中的登入名一致。');
define('_MD_AM_LDAP_LOGINNAME_ASDN', '在識別名中使用的登入名');
define('_MD_AM_LDAP_LOGINNAME_ASDN_D', 'LDAP 的識別名（DN）中使用的 XOOPS 登入名（如：uid=<loginname>,dc=xoops,dc=org）<br>該執行緒不用搜尋，而是直接在目錄伺服器中讀取。');

define('_MD_AM_LDAP_FILTER_PERSON', 'LDAP 查詢使用者的搜尋篩選器');
define('_MD_AM_LDAP_FILTER_PERSON_DESC', '使用者搜尋會員的特殊 LDAP 過期器，@@loginname@@ 被取代成為使用者的登入名，如果你不清楚，請務必留空！' . '<br>例如：(&(objectclass=person)(samaccountname=@@loginname@@)) for AD' . '<br>例如：(&(objectclass=inetOrgPerson)(uid=@@loginname@@)) for LDAP');

define('_MD_AM_LDAP_DOMAIN_NAME', '域名');
define('_MD_AM_LDAP_DOMAIN_NAME_DESC', 'Windows 域名（只有活動目錄伺服器（ADS）和NT伺服器）。');

define('_MD_AM_LDAP_PROVIS', '自動建立會員帳號');
define('_MD_AM_LDAP_PROVIS_DESC', '如果沒有 XOOPS 使用者資料庫，那麼將自動建立。');

define('_MD_AM_LDAP_PROVIS_GROUP', '預設新會員群組');
define('_MD_AM_LDAP_PROVIS_GROUP_DSC', '新會員將會被設定為該群組。');

define('_MD_AM_LDAP_FIELD_MAPPING_ATTR', 'XOOPS認證伺服器欄位對應');
define('_MD_AM_LDAP_FIELD_MAPPING_DESC', '在此輸入XOOPS資料庫欄位與LDAP驗證系統欄位的對應。' .
    '<br><br>格式 [Xoops 資料庫欄位]=[LDAP 屬性]' .
    '<br>例如： email=mail' .
    '<br>用 | 作為分隔符號' .
    '<br><br>！！僅適用進階使用者！！');

define('_MD_AM_LDAP_PROVIS_UPD', '從驗證伺服器來維護XOOPS會員帳號');
define('_MD_AM_LDAP_PROVIS_UPD_DESC', 'XOOPS會員帳號總是與驗證伺服器進行同步');

define('_MD_AM_CPANEL', '控制台介面（Control Panel GUI）');
define('_MD_AM_CPANELDSC', '後台');

define('_MD_AM_WELCOMETYPE', '傳送歡迎資訊');
define('_MD_AM_WELCOMETYPE_DESC', '選擇一種方式，在使用者成功註冊以後傳送歡迎資訊。');
define('_MD_AM_WELCOMETYPE_EMAIL', '電子郵件');
define('_MD_AM_WELCOMETYPE_PM', '私人訊息');
define('_MD_AM_WELCOMETYPE_BOTH', '電子郵件和私人訊息');

define('_MD_AM_MODULEPREF', '模組偏好設定');

// Preference module system

define('_AM_SYSTEM_PREFERENCES_SETTINGS', '系統基本設定');
