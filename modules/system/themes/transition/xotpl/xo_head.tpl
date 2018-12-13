<div id="xo-logo-head">
    <div id="main-logo">
        <a class="tooltip" href="<{xoAppUrl admin.php}>" title="後臺管理">
            <img src="<{xoImgUrl images/logo.png}>" alt="" id="xoops-logo" style="height:42px;">
        </a>
    </div>
    <ul id="xo-headnav">
        <li>
            <a class="tooltip" href="<{xoAppUrl}>" title="<{$smarty.const._YOURHOME}>">
                <span class="fa fa-home"></span>
                <{$smarty.const._YOURHOME}>
            </a>
        </li>
        <li>
            <a class="tooltip" href="<{xoAppUrl user.php?op=logout}>" title="<{$smarty.const._LOGOUT}>">
                <span class="fa fa-sign-out"></span>
                <{$smarty.const._LOGOUT}>
            </a>
        </li>
    </ul>
</div>
