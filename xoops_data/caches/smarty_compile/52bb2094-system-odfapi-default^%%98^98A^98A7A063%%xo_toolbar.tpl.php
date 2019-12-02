<?php /* Smarty version 2.6.30, created on 2018-12-16 05:40:08
         compiled from /var/www/html/odfapi/modules/system/themes/transition/xotpl/xo_toolbar.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'default', '/var/www/html/odfapi/modules/system/themes/transition/xotpl/xo_toolbar.tpl', 9, false),)), $this); ?>
<div id="xo-nav-options">
    <div id="xo-modname">
        <?php echo $this->_tpl_vars['modname']; ?>

    </div>
    <ul id="xo-toolbar">
        <?php $_from = $this->_tpl_vars['mod_options']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['op']):
?>
        <li>
            <a class="tooltip" href="<?php echo $this->_tpl_vars['op']['link']; ?>
" title="<?php echo $this->_tpl_vars['op']['title']; ?>
">
                <img src='<?php echo ((is_array($_tmp=@$this->_tpl_vars['op']['icon'])) ? $this->_run_mod_handler('default', true, $_tmp, ($this->_tpl_vars['theme_icons'])."/icon_options.png") : smarty_modifier_default($_tmp, ($this->_tpl_vars['theme_icons'])."/icon_options.png")); ?>
' alt="<?php echo $this->_tpl_vars['op']['title']; ?>
"/>
            </a>
        </li>
        <?php endforeach; endif; unset($_from); ?>

        <?php if ($this->_tpl_vars['moddir'] != 'system' && $this->_tpl_vars['mod_options']): ?>
        <li>
            <a class="tooltip" href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/system/admin.php?fct=preferences&amp;op=showmod&amp;mod=<?php echo $this->_tpl_vars['modid']; ?>
" title="<?php echo @_OXYGEN_SITEPREF; ?>
">
                <img src="<?php echo $this->_tpl_vars['theme_icons']; ?>
/prefs.png" alt="<?php echo @_OXYGEN_SITEPREF; ?>
"/>
            </a>
        </li>
        <?php endif; ?>
        <li>
        <a class="tooltip" href="<?php echo 'http://122.116.99.182:8888/odfapi/modules/system/help.php'; ?>" title="<?php echo @_AM_SYSTEM_HELP; ?>
">
            <img src='<?php echo ($this->_tpl_vars['theme_icons'])."/help.png"; ?>
'/>
        </a>
        </li>
    </ul>
</div>