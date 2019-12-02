<?php /* Smarty version 2.6.30, created on 2018-12-16 06:57:53
         compiled from odfapi/tpl/leftBlock.tpl */ ?>
<?php if ($this->_tpl_vars['xoBlocks']['canvas_left']): ?>
    <div class="col-sm-3 col-md-3 xoops-side-blocks">
        <?php $_from = $this->_tpl_vars['xoBlocks']['canvas_left']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['block']):
?>
            <aside>
                <?php if ($this->_tpl_vars['block']['title']): ?><h4 class="block-title"><?php echo $this->_tpl_vars['block']['title']; ?>
</h4><?php endif; ?>
                <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/blockContent.tpl", 'smarty_include_vars' => array()));
 ?>
            </aside>
        <?php endforeach; endif; unset($_from); ?>
    </div>
<?php endif; ?>