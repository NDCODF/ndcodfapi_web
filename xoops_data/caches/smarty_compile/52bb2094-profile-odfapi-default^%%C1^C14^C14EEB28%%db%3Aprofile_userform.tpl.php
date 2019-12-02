<?php /* Smarty version 2.6.30, created on 2018-12-16 06:57:53
         compiled from db:profile_userform.tpl */ ?>
<div class="container-fluid">
    <div class="row">
    <legend class="bold"><?php echo $this->_tpl_vars['lang_login']; ?>
</legend>

    <form class="form-signin" action="user.php" method="post">
        <label for="profile-uname"><?php echo $this->_tpl_vars['lang_username']; ?>
</label>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input class="form-control" type="text" name="uname" id="profile-uname" value="" placeholder="<?php echo @THEME_LOGIN; ?>
" required autofocus>
        </div>

        <label for="profile-pass"><?php echo $this->_tpl_vars['lang_password']; ?>
</label>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input class="form-control" type="password" name="pass" id="profile-pass" placeholder="<?php echo @THEME_PASS; ?>
" required>
        </div>
        <div class="checkbox">
            <label>
                <?php if (isset ( $this->_tpl_vars['lang_rememberme'] )): ?>
            <input type="checkbox" name="rememberme">
                <?php echo $this->_tpl_vars['lang_rememberme']; ?>

                <?php endif; ?>
            </label>
        </div>

        <input type="hidden" name="op" value="login"/>
        <input type="hidden" name="xoops_redirect" value="<?php echo $this->_tpl_vars['redirect_page']; ?>
"/>
        <button type="submit" class="btn btn-lg btn-primary btn-block"><?php echo $this->_tpl_vars['lang_login']; ?>
</button>
    </form>
</div>

<br>
<div class="row">
    <legend class="bold"><?php echo $this->_tpl_vars['lang_lostpassword']; ?>
</legend>
    <p><?php echo $this->_tpl_vars['lang_noproblem']; ?>
</p>
    <form action="lostpass.php" method="post">
        <label for="profile-lostpass"><?php echo $this->_tpl_vars['lang_password']; ?>
</label>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
            <input class="form-control" type="text" name="email" id="profile-lostpass" placeholder="<?php echo @THEME_EMAIL; ?>
">
        </div>
        <input type="hidden" name="op" value="mailpasswd"/>
        <input type="hidden" name="t"  value="<?php echo $this->_tpl_vars['mailpasswd_token']; ?>
"/>
        <button type="submit" class="btn btn-default"><?php echo $this->_tpl_vars['lang_sendpassword']; ?>
</button>
    </form>
</div>
</div>