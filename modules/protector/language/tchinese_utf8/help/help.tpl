<div id="help-template" class="outer">
    <h1 class="head">協助：<a class="ui-corner-all tooltip" href="<{$xoops_url}>/modules/protector/admin/index.php" title="回Protector 防護模組」管理界面"> Protector 防護模組 <img src="<{xoAdminIcons home.png}>" alt="回Protector 防護模組」管理界面"/></a></h1>
    <!-- -----Help Content ---------- -->
    <h4 class="odd">說明</h4>
    <p class="even">Protector 防護模組是用來協助 XOOPS 抵禦各種不同的攻擊</p>
    <h4 class="odd">安裝/反安裝</h4>
    <p>首先，請在 mainfile.php中定義 XOOPS_TRUST_PATH 的路徑（若沒有該設定的話）。</p>
    <br>
    <p>複製 htdocs/modules/protector 到 XOOPS_ROOT_PATH/modules/</p>
    <p>複製 xoops_trust_path/modules/protector 到 XOOPS_TRUST_PATH/modules/</p>
    <br>
    <p>設定 XOOPS_TRUST_PATH/modules/protector/configs 必須要能寫入</p>
    <h4 class="odd">= 如何自救 =</h4>
    <p class="even">假如您被 Protector 檔在門外，請刪除
    XOOPS_TRUST_PATH/modules/protector/configs/ 下的所有檔案。</p>
    <h4 class="odd">過濾外掛介紹</h4>
    <p class="even">- postcommon_post_deny_by_rbl.php
        <br>
        防垃圾留言外掛
        <br>
        只要是IP來自 RBL 資料庫中的，一律擋掉。
        <br>
        此外掛可能會降低發文效能，尤其是聊天室模組。
    </p>
    <p>- postcommon_post_deny_by_httpbl.php
        <br>
        防垃圾留言外掛
        <br>
        只要是IP來自 http:BL 資料庫中的，一律擋掉。
        <br>
        要使用它之前，請先到 http://www.projecthoneypot.org/ 取得 HTTPBL_KEY，並且將之設定
        加到該過濾檔之中：
        <br>
        define( 'PROTECTOR_HTTPBL_KEY' , '............' ) ;
    </p>
    <p class="even">- postcommon_post_need_multibyte.php
        <br>
        防垃圾留言外掛
        <br>
        文章中若無雙位元文字時，將一律擋掉。
        <br>
        此外掛適用於中日韓等亞洲網站。
    </p>
    <p>- postcommon_post_htmlpurify4guest.php
        <br>
        所有游訪客發布的文章將透過 HTMLPurifier 淨化之。
        <br>
        假如您允許訪客使用網頁語法，那會強烈建議您開啟此選項。
    </p>
    <p class="even">-postcommon_register_insert_js_check.php
        <br>
        此外掛可以避免來自搜尋機器人註冊您的網站。
        <br>
        訪客的瀏覽器必須支援 JavaScript 才行。
    </p>
    <p>- bruteforce_overrun_message.php
        <br>
        設定相關訊息，當使用者輸入錯誤密碼幾次之後。
        <br>
        所有外掛被命名為 *_message.php 以設定禁止存取的訊息。
    </p>
    <p class="even">- precommon_bwlimit_errorlog.php
        <br>
        當頻寬不幸的被限制住了，此外掛將紀錄到 Apache 的 error_log。
    </p>
    <p>所有外掛被命名為 *_errorlog.php 以紀錄訊息到 Apache 的 error_log.</p>
    <h4 class="odd">教學</h4>
    <p class="even">教學內容尚在製作中</p>
    <!-- -----Help Content ---------- -->
</div>