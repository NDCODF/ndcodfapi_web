<div class="container-fluid">
    <div class="row">
    <legend class="bold"><{$lang_login}></legend>

    <form class="form-signin" action="user.php" method="post">
        <label for="profile-uname"><{$lang_username}></label>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input class="form-control" type="text" name="uname" id="profile-uname" value="" placeholder="<{$smarty.const.THEME_LOGIN}>" required autofocus>
        </div>

        <label for="profile-pass"><{$lang_password}></label>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input class="form-control" type="password" name="pass" id="profile-pass" placeholder="<{$smarty.const.THEME_PASS}>" required>
        </div>
        <div class="checkbox">
            <label>
                <{if isset($lang_rememberme)}>
            <input type="checkbox" name="rememberme">
                <{$lang_rememberme}>
                <{/if}>
            </label>
        </div>

        <input type="hidden" name="op" value="login"/>
        <input type="hidden" name="xoops_redirect" value="<{$redirect_page}>"/>
        <button type="submit" class="btn btn-lg btn-primary btn-block"><{$lang_login}></button>
    </form>
</div>

<br>
<div class="row">
    <legend class="bold"><{$lang_lostpassword}></legend>
    <p><{$lang_noproblem}></p>
    <form action="lostpass.php" method="post">
        <label for="profile-lostpass"><{$lang_password}></label>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
            <input class="form-control" type="text" name="email" id="profile-lostpass" placeholder="<{$smarty.const.THEME_EMAIL}>">
        </div>
        <input type="hidden" name="op" value="mailpasswd"/>
        <input type="hidden" name="t"  value="<{$mailpasswd_token}>"/>
        <button type="submit" class="btn btn-default"><{$lang_sendpassword}></button>
    </form>
</div>
</div>
