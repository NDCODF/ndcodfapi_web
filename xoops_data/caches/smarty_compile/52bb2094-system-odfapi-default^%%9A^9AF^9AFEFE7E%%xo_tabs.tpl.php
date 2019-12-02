<?php /* Smarty version 2.6.30, created on 2018-12-16 07:15:53
         compiled from /var/www/html/odfapi/modules/system/themes/transition/xotpl/xo_tabs.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'block', '/var/www/html/odfapi/modules/system/themes/transition/xotpl/xo_tabs.tpl', 4, false),)), $this); ?>
<!-- the tabs -->
<ul class="tabs">
    <li><a class="tooltip" href="#" title="<?php echo @_AM_SYSTEM_HELP; ?>
"><img src='<?php echo ($this->_tpl_vars['theme_icons'])."/help.png"; ?>
'/></a></li>
    <li><a class="tooltip" href="#" title="<?php echo smarty_function_block(array('id' => 4,'display' => 'title'), $this);?>
"><img src='<?php echo ($this->_tpl_vars['theme_icons'])."/waiting.png"; ?>
'/></a></li>
    <li><a class="tooltip" href="#" title="<?php echo smarty_function_block(array('id' => 9,'display' => 'title'), $this);?>
"><img src='<?php echo ($this->_tpl_vars['theme_icons'])."/edituser.png"; ?>
'/></a></li>
    <li><a class="tooltip" href="#" title="<?php echo smarty_function_block(array('id' => 8,'display' => 'title'), $this);?>
"><img src='<?php echo ($this->_tpl_vars['theme_icons'])."/newuser.png"; ?>
'/></a></li>
    <li><a class="tooltip" href="#" title="<?php echo smarty_function_block(array('id' => 10,'display' => 'title'), $this);?>
"><img src='<?php echo ($this->_tpl_vars['theme_icons'])."/comments.png"; ?>
'/></a></li>
</ul>

<!-- tab "panes" -->
<div class="panes">
    <div>
        <div class="help">
            <a href=""><?php echo @_OXYGEN_HELP_1; ?>
</a>

            <p><?php echo @_OXYGEN_HELP_DESC_1; ?>
</P>
        </div>
        <div class="help">
            <a href=""><?php echo @_OXYGEN_HELP_2; ?>
</a>

            <p><?php echo @_OXYGEN_HELP_DESC_2; ?>
</P>
        </div>
        <div class="help">
            <a href=""><?php echo @_OXYGEN_HELP_3; ?>
</a>

            <p><?php echo @_OXYGEN_HELP_DESC_3; ?>
</P>
        </div>
    </div>
    <div><?php echo smarty_function_block(array('id' => 4), $this);?>
</div>
    <div><?php echo smarty_function_block(array('id' => 9), $this);?>
</div>
    <div><?php echo smarty_function_block(array('id' => 8), $this);?>
</div>
    <div><?php echo smarty_function_block(array('id' => 10), $this);?>
</div>
</div>

<script type="text/javascript">
    // perform JavaScript after the document is scriptable.
    $(function () {
        // setup ul.tabs to work as tabs for each div directly under div.panes
        $("ul.tabs").tabs("div.panes > div");
    });
</script>