<?php /* Smarty version 2.6.30, created on 2018-12-16 07:18:19
         compiled from db:profile_userinfo.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'securityToken', 'db:profile_userinfo.tpl', 54, false),)), $this); ?>
<?php $this->_smarty_include(array('smarty_include_tpl_file' => "db:profile_breadcrumbs.tpl", 'smarty_include_vars' => array()));
 ?>
<div class="row">
    <div class="col-xs-6 col-md-6 aligncenter">
        <?php if ($this->_tpl_vars['avatar']): ?>
            <img src="<?php echo $this->_tpl_vars['avatar']; ?>
" alt="<?php echo $this->_tpl_vars['uname']; ?>
" class="img-responsive img-rounded img-thumbnail">
        <?php endif; ?>
        <div class="aligncenter">
            <ul class="list-unstyled">
                <li><span class="label label-info"><?php echo $this->_tpl_vars['uname']; ?>
</span></li>
                <?php if ($this->_tpl_vars['email']): ?>
                    <li><span class="label label-info"><?php echo $this->_tpl_vars['email']; ?>
</span></li>
                <?php endif; ?>
            </ul>
        </div><!-- .aligncenter -->
    </div><!-- .col-md-6 .aligncenter -->

    <div class="col-xs-6 col-md-6">
        <?php if (! $this->_tpl_vars['user_ownpage'] && $this->_tpl_vars['xoops_isuser'] == true): ?>
            <form name="usernav" action="user.php" method="post">
                <input class="btn btn-success btn-xs btn-block" type="button" value="<?php echo @_PROFILE_MA_SENDPM; ?>
"
                       onclick="openWithSelfMain('<?php echo $this->_tpl_vars['xoops_url']; ?>
/pmlite.php?send2=1&amp;to_userid=<?php echo $this->_tpl_vars['user_uid']; ?>
', 'pmlite', 565, 500);">
            </form>
        <?php endif; ?>

        <?php if ($this->_tpl_vars['user_ownpage'] == true): ?>
            <form name="usernav" action="user.php" method="post">
                <input class="btn btn-success btn-xs btn-block" type="button" value="<?php echo $this->_tpl_vars['lang_editprofile']; ?>
"
                       onclick="location='<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/<?php echo $this->_tpl_vars['xoops_dirname']; ?>
/edituser.php'">
                <input class="btn btn-success btn-xs btn-block" type="button" value="<?php echo $this->_tpl_vars['lang_changepassword']; ?>
"
                       onclick="location='<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/<?php echo $this->_tpl_vars['xoops_dirname']; ?>
/changepass.php'">
                <?php if ($this->_tpl_vars['user_changeemail']): ?>
                    <input class="btn btn-success btn-xs btn-block" type="button" value="<?php echo @_PROFILE_MA_CHANGEMAIL; ?>
"
                           onclick="location='<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/<?php echo $this->_tpl_vars['xoops_dirname']; ?>
/changemail.php'">
                <?php endif; ?>

                <?php if ($this->_tpl_vars['user_candelete'] == true): ?>
                    <form method="post" action="<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/<?php echo $this->_tpl_vars['xoops_dirname']; ?>
/user.php">
                        <input type="hidden" name="op" value="delete">
                        <input type="hidden" name="uid" value="<?php echo $this->_tpl_vars['user_uid']; ?>
">
                        <input class="btn btn-success btn-xs btn-block" type="button" value="<?php echo $this->_tpl_vars['lang_deleteaccount']; ?>
" onclick="submit();">
                    </form>
                <?php endif; ?>

                <input class="btn btn-success btn-xs btn-block" type="button" value="<?php echo $this->_tpl_vars['lang_avatar']; ?>
" onclick="location='edituser.php?op=avatarform'">
                <input class="btn btn-success btn-xs btn-block" type="button" value="<?php echo $this->_tpl_vars['lang_inbox']; ?>
" onclick="location='<?php echo $this->_tpl_vars['xoops_url']; ?>
/viewpmsg.php'">
                <input class="btn btn-success btn-xs btn-block" type="button" value="<?php echo $this->_tpl_vars['lang_logout']; ?>
"
                       onclick="location='<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/<?php echo $this->_tpl_vars['xoops_dirname']; ?>
/user.php?op=logout'">
            </form>
        <?php elseif ($this->_tpl_vars['xoops_isadmin'] != false): ?>
            <form method="post" action="<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/<?php echo $this->_tpl_vars['xoops_dirname']; ?>
/admin/deactivate.php">
                <input class="btn btn-info btn-xs btn-block" type="button" value="<?php echo $this->_tpl_vars['lang_editprofile']; ?>
"
                       onclick="location='<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/<?php echo $this->_tpl_vars['xoops_dirname']; ?>
/admin/user.php?op=edit&amp;id=<?php echo $this->_tpl_vars['user_uid']; ?>
'">
                <input type="hidden" name="uid" value="<?php echo $this->_tpl_vars['user_uid']; ?>
">
                <?php echo smarty_function_securityToken(array(), $this);?>

                <?php if ($this->_tpl_vars['userlevel'] == 1): ?>
                    <input type="hidden" name="level" value="0">
                    <input class="btn btn-info btn-xs btn-block" type="button" value="<?php echo @_PROFILE_MA_DEACTIVATE; ?>
" onclick="submit();">
                <?php else: ?>
                    <input type="hidden" name="level" value="1">
                    <input class="btn btn-info btn-xs btn-block" type="button" value="<?php echo @_PROFILE_MA_ACTIVATE; ?>
" onclick="submit();">
                <?php endif; ?>
            </form>
        <?php endif; ?>
    </div><!-- .col-md-6 -->
</div><!-- .row -->

<?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['category']):
?>
    <?php if (isset ( $this->_tpl_vars['category']['fields'] )): ?>
        <ul id="profile-category-<?php echo $this->_tpl_vars['category']['cat_id']; ?>
" class="profile-values list-unstyled">
            <li class="profile-category-title"><?php echo $this->_tpl_vars['category']['cat_title']; ?>
</li>
            <?php $_from = $this->_tpl_vars['category']['fields']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['field']):
?>
                <li><strong><?php echo $this->_tpl_vars['field']['title']; ?>
:</strong> <?php echo $this->_tpl_vars['field']['value']; ?>
</li>
            <?php endforeach; endif; unset($_from); ?>
        </ul>
    <?php endif; ?>
<?php endforeach; endif; unset($_from); ?>

<?php if ($this->_tpl_vars['modules']): ?>
    <ul class="profile-values list-unstyled">
        <li class="profile-category-title"><?php echo $this->_tpl_vars['recent_activity']; ?>
</li>
        <?php $_from = $this->_tpl_vars['modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['module']):
?>
            <li><strong><?php echo $this->_tpl_vars['module']['name']; ?>
</strong></li>
            <?php $_from = $this->_tpl_vars['module']['results']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['result']):
?>
                <li><img src="<?php echo $this->_tpl_vars['result']['image']; ?>
" alt="<?php echo $this->_tpl_vars['module']['name']; ?>
"> <a href="<?php echo $this->_tpl_vars['result']['link']; ?>
"><?php echo $this->_tpl_vars['result']['title']; ?>
</a> (<?php echo $this->_tpl_vars['result']['time']; ?>
)</li>
            <?php endforeach; endif; unset($_from); ?>
            <?php echo $this->_tpl_vars['module']['showall_link']; ?>

        <?php endforeach; endif; unset($_from); ?>
    </ul>
<?php endif; ?>