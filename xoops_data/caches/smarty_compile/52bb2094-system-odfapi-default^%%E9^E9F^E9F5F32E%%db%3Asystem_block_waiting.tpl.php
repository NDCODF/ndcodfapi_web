<?php /* Smarty version 2.6.30, created on 2018-12-16 07:15:53
         compiled from db:system_block_waiting.tpl */ ?>
<ul>
    <?php $_from = $this->_tpl_vars['block']['modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['module']):
?>
        <li><a href="<?php echo $this->_tpl_vars['module']['adminlink']; ?>
" title="<?php echo $this->_tpl_vars['module']['lang_linkname']; ?>
"><?php echo $this->_tpl_vars['module']['lang_linkname']; ?>
</a>: <?php echo $this->_tpl_vars['module']['pendingnum']; ?>
</li>
    <?php endforeach; endif; unset($_from); ?>
</ul>