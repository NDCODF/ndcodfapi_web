<?php /* Smarty version 2.6.30, created on 2018-12-16 07:20:43
         compiled from db:system_comments_controls.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'default', 'db:system_comments_controls.tpl', 7, false),)), $this); ?>
<div class="text-center">
<div class="form-inline">
    <form method="get" action="<?php echo $this->_tpl_vars['pageName']; ?>
">
    <?php echo $this->_tpl_vars['commentModeSelect']->render(); ?>

    <?php echo $this->_tpl_vars['commentOrderSelect']->render(); ?>

    <?php echo $this->_tpl_vars['commentRefreshButton']->render(); ?>

    <?php if (( ((is_array($_tmp=@$this->_tpl_vars['commentPostButton'])) ? $this->_run_mod_handler('default', true, $_tmp, false) : smarty_modifier_default($_tmp, false)) )): ?>
    <?php echo $this->_tpl_vars['commentPostButton']->render(); ?>

    <?php endif; ?>
    <?php echo $this->_tpl_vars['commentPostHidden']; ?>

    </form>
</div>
</div>