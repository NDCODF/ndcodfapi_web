<?php /* Smarty version 2.6.30, created on 2018-12-16 05:40:10
         compiled from odfapi/tpl/centerBlock.tpl */ ?>
<?php if ($this->_tpl_vars['xoBlocks']['page_topcenter']): ?>
    <div class="col-sm-12 col-md-12">
        <?php $_from = $this->_tpl_vars['xoBlocks']['page_topcenter']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['block']):
?>
            <div class="xoops-blocks">
                <?php if ($this->_tpl_vars['block']['title']): ?><h4><?php echo $this->_tpl_vars['block']['title']; ?>
</h4><?php endif; ?>
                <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/blockContent.tpl", 'smarty_include_vars' => array()));
 ?>
            </div>
        <?php endforeach; endif; unset($_from); ?>
    </div>
<?php endif; ?>