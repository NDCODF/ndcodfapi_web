<?php /* Smarty version 2.6.30, created on 2018-12-16 06:57:53
         compiled from odfapi/tpl/content-zone.tpl */ ?>
<?php if ($this->_tpl_vars['xoBlocks']['canvas_left'] && $this->_tpl_vars['xoBlocks']['canvas_right']): ?>
<div class="col-sm-6 col-md-6">
    <?php elseif ($this->_tpl_vars['xoBlocks']['canvas_left']): ?>
    <div class="col-sm-9 col-md-9">
        <?php elseif ($this->_tpl_vars['xoBlocks']['canvas_right']): ?>
        <div class="col-sm-9 col-md-9">
            <?php else: ?>
            <div class="col-sm-12 col-md-12">
                <?php endif; ?>
                <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/contents.tpl", 'smarty_include_vars' => array()));
 ?>

                <div class="row">
                    <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/centerBlock.tpl", 'smarty_include_vars' => array()));
 ?>
                    <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/centerLeft.tpl", 'smarty_include_vars' => array()));
 ?>
                    <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/centerRight.tpl", 'smarty_include_vars' => array()));
 ?>
                </div>
            </div>