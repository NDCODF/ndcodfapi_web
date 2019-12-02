<?php /* Smarty version 2.6.30, created on 2018-12-16 06:57:53
         compiled from odfapi/tpl/nav-menu.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'default', 'odfapi/tpl/nav-menu.tpl', 21, false),)), $this); ?>
    <div class="navbar navbar-inverse global-nav navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button data-target="#main-navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
" class="navbar-brand xlogo" title="<?php echo $this->_tpl_vars['xoops_sitename']; ?>
">
		    <?php $this->assign('logo_url', ($this->_tpl_vars['xoops_url'])."/uploads/ndcodfapi.png"); ?>
		    <?php $this->assign('logo_path', (@XOOPS_UPLOAD_PATH)."/ndcodfapi.png"); ?>
		    <?php if (file_exists ( $this->_tpl_vars['logo_path'] )): ?>
                    <img src="<?php echo $this->_tpl_vars['logo_url']; ?>
" alt="<?php echo $this->_tpl_vars['xoops_sitename']; ?>
" style="height:42px;">
		    <?php else: ?>
		    <span class="h3" style="color:#FFFFFF;font-weight:bold;"><?php echo $this->_tpl_vars['xoops_sitename']; ?>
</span>
		    <?php endif; ?>
		    <p style="font-weight:bold;font-size:14px;text-align:center;"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "/usr/share/loolwsd/version.txt", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></p>
                </a>
            </div>
            <div class="navbar-collapse collapse"  id="main-navbar-collapse">
		<?php if (((is_array($_tmp=@$this->_tpl_vars['xoops_isuser'])) ? $this->_run_mod_handler('default', true, $_tmp, false) : smarty_modifier_default($_tmp, false))): ?>
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="javascript:;">報表管理<b class="caret"></b></a>
                        <ul id="xswatch-account-menu" class="dropdown-menu">
			    <?php if (((is_array($_tmp=@$this->_tpl_vars['xoops_isadmin'])) ? $this->_run_mod_handler('default', true, $_tmp, false) : smarty_modifier_default($_tmp, false))): ?>
                            <li><a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/merge/index.php?op=operate&subop=cate">類別管理</a></li>
                            <li><a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/merge/index.php?op=operate&subop=group">跨部門報表閱覽權限</a></li>
                            <li><a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/merge/index.php?op=operate&subop=user">報表轉移</a></li>
			    <?php endif; ?>
                            <li><a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/merge/index.php?op=operate&subop=upload">新增範本</a></li>
                            <li><a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/merge/index.php?op=operate&subop=list">我的報表</a></li>
                        </ul>
                    </li>
		    <!-- 我的資料 -->
                    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="javascript:;"><span class="glyphicon glyphicon-user"></span>我的資料<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/profile/userinfo.php"><span class="glyphicon glyphicon-pencil"></span> 管理個人資料</a></li>
                            <li><a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/user.php?op=logout"><span class="glyphicon glyphicon-log-out"></span> 登出</a></li>
                        </ul>
                    </li>
		    <?php if (((is_array($_tmp=@$this->_tpl_vars['xoops_isadmin'])) ? $this->_run_mod_handler('default', true, $_tmp, false) : smarty_modifier_default($_tmp, false))): ?>
		    <li><a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/admin.php" title="後臺管理"><span class="glyphicon glyphicon-wrench"></span> 後臺管理</a></li>
		    <?php endif; ?>
                    <!-- end custom menus -->
                </ul>
                <?php if (((is_array($_tmp=@$this->_tpl_vars['xoops_search'])) ? $this->_run_mod_handler('default', true, $_tmp, false) : smarty_modifier_default($_tmp, false))): ?>
                <form class="navbar-form navbar-right" role="search" action="<?php echo 'http://122.116.99.182:8888/odfapi/search.php'; ?>" method="get">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="搜尋報表" name="query">
                        <span class="input-group-btn"><button type="submit" class="btn btn-default" aria-label="<?php echo @THEME_SEARCH_TEXT; ?>
">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button></span>
                    </div>
                    <input type="hidden" name="action" value="results">
                </form>
                <?php endif; ?>
                <?php endif; ?>
            </div>
        </div>
    </div>