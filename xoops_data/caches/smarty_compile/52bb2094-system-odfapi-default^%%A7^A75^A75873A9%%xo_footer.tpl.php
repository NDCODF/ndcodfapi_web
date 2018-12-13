<?php /* Smarty version 2.6.30, created on 2018-12-13 03:49:57
         compiled from /var/www/html/odfapi/modules/system/themes/transition/xotpl/xo_footer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', '/var/www/html/odfapi/modules/system/themes/transition/xotpl/xo_footer.tpl', 4, false),)), $this); ?>
<!--{xo-logger-output}-->

<div id='xo-footer'>
    <div id="xo-footer-body">Powered by <a class="tooltip" rel="external" href="http://xoops.org" title="Xoops Project"><?php echo $this->_tpl_vars['xoops_version']; ?>
</a> &copy; 2001-<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, "%Y") : smarty_modifier_date_format($_tmp, "%Y")); ?>
</div>
    <div id="xo-footer-rss"><a class="tooltip" rel="external" href="<?php echo 'http://122.116.99.182:8888/odfapi/backend.php'; ?>" title="<?php echo @_OXYGEN_RSS; ?>
"><img src="<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/themes/transition/images/feed.png'; ?>"/></a></div>
    <div><?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_tpl'])."/xo_uptop.tpl", 'smarty_include_vars' => array()));
 ?></div>
</div>