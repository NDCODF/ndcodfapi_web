<?php /* Smarty version 2.6.30, created on 2018-12-16 07:15:53
         compiled from db:system_block_newusers.tpl */ ?>
<?php $_from = $this->_tpl_vars['block']['users']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['user']):
?>
    <ul class="userblock list-unstyled">
        <?php if ($this->_tpl_vars['user']['avatar'] != ""): ?>
            <li class="avatar-image"><img src="<?php echo $this->_tpl_vars['user']['avatar']; ?>
" alt="<?php echo $this->_tpl_vars['user']['name']; ?>
" class="img-rounded"></li>
        <?php else: ?>
            <li class="avatar-image"><img src="<?php echo $this->_tpl_vars['xoops_imageurl']; ?>
images/blank.gif" alt="<?php echo $this->_tpl_vars['user']['name']; ?>
" class="img-rounded"></li>
        <?php endif; ?>

        <li class="user-name"><a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/userinfo.php?uid=<?php echo $this->_tpl_vars['user']['id']; ?>
" title="<?php echo $this->_tpl_vars['user']['name']; ?>
"><?php echo $this->_tpl_vars['user']['name']; ?>
</a></li>

        <li class="join-date text-right hidden-sm join-date"><?php echo $this->_tpl_vars['user']['joindate']; ?>
</li>
    </ul>
<?php endforeach; endif; unset($_from); ?>