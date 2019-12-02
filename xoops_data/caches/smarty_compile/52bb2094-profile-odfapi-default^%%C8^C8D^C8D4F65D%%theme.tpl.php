<?php /* Smarty version 2.6.30, created on 2018-12-16 06:57:53
         compiled from /var/www/html/odfapi/themes/odfapi/theme.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'default', '/var/www/html/odfapi/themes/odfapi/theme.tpl', 42, false),)), $this); ?>
<!doctype html>
<html lang="<?php echo $this->_tpl_vars['xoops_langcode']; ?>
">
<head>
<?php $this->assign('theme_name', $this->_tpl_vars['xoTheme']->folderName); ?>
    <meta charset="<?php echo $this->_tpl_vars['xoops_charset']; ?>
">
    <meta name="keywords" content="<?php echo $this->_tpl_vars['xoops_meta_keywords']; ?>
">
    <meta name="description" content="<?php echo $this->_tpl_vars['xoops_meta_description']; ?>
">
    <meta name="robots" content="<?php echo $this->_tpl_vars['xoops_meta_robots']; ?>
">
    <meta name="rating" content="<?php echo $this->_tpl_vars['xoops_meta_rating']; ?>
">
    <meta name="author" content="<?php echo $this->_tpl_vars['xoops_meta_author']; ?>
">
    <meta name="generator" content="XOOPS">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <!-- Owl Carousel Assets -->
    <link href="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>js/owl/assets/owl.carousel.css" rel="stylesheet">
    <link href="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>js/owl/assets/owl.theme.default.css" rel="stylesheet">

    <link href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>css/reset.css">
    <link rel="stylesheet" type="text/css" href="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>css/xoops.css">
    <link rel="stylesheet" type="text/css" href="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>css/cookieconsent.css">
    <script src="<?php echo $this->_tpl_vars['xoops_url']; ?>
/browse.php?Frameworks/jquery/jquery.js"></script>
    <script src="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>js/bootstrap.min.js"></script>
    <script src="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>js/masonry.pkgd.min.js"></script>
    <script src="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>js/imagesloaded.pkgd.min.js"></script>
    <script src="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>js/js.js"></script>
    <!-- Begin Cookie Consent plugin by Silktide - https://silktide.com/tools/cookie-consent/docs/installation/ -->
    <script type="text/javascript">
        window.cookieconsent_options = {
            message: '<?php echo @THEME_COOKIE_MESSAGE; ?>
',
            dismiss: '<?php echo @THEME_COOKIE_DISMISS; ?>
',
            learnMore: '<?php echo @THEME_COOKIE_LEARNMORE; ?>
',
            link: null,
            container: null,
            theme: false,
        };
    </script>
    <script src="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>js/cookieconsent.min.js"></script>
    <!-- End Cookie Consent plugin -->
    <?php if (((is_array($_tmp=@$this->_tpl_vars['xoops_isadmin'])) ? $this->_run_mod_handler('default', true, $_tmp, false) : smarty_modifier_default($_tmp, false))): ?>
    <script src="<?php 
echo 'http://122.116.99.182:8888/odfapi/themes/odfapi/'; ?>js/js.cookie.min.js"></script>
    <?php endif; ?>
    <link rel="alternate" type="application/rss+xml" title="" href="<?php echo 'http://122.116.99.182:8888/odfapi/backend.php'; ?>">

    <title><?php if ($this->_tpl_vars['xoops_dirname'] == 'system'): ?><?php echo $this->_tpl_vars['xoops_sitename']; ?>
<?php if ($this->_tpl_vars['xoops_pagetitle'] != ''): ?> - <?php echo $this->_tpl_vars['xoops_pagetitle']; ?>
<?php endif; ?><?php else: ?><?php if ($this->_tpl_vars['xoops_pagetitle'] != ''): ?><?php echo $this->_tpl_vars['xoops_pagetitle']; ?>
 - <?php echo $this->_tpl_vars['xoops_sitename']; ?>
<?php endif; ?><?php endif; ?></title>

<?php echo $this->_tpl_vars['xoops_module_header']; ?>

    <link rel="stylesheet" type="text/css" media="all" href="<?php echo $this->_tpl_vars['xoops_themecss']; ?>
">
</head>

<body id="<?php echo $this->_tpl_vars['xoops_dirname']; ?>
">

<?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/nav-menu.tpl", 'smarty_include_vars' => array()));
 ?>

<div class="container maincontainer">

<div class="row">
    <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/leftBlock.tpl", 'smarty_include_vars' => array()));
 ?>

    <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/content-zone.tpl", 'smarty_include_vars' => array()));
 ?>

    <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/rightBlock.tpl", 'smarty_include_vars' => array()));
 ?>
</div>

</div><!-- .maincontainer -->

<?php if ($this->_tpl_vars['xoBlocks']['page_bottomcenter'] || $this->_tpl_vars['xoBlocks']['page_bottomright'] || $this->_tpl_vars['xoBlocks']['page_bottomleft']): ?>
    <div class="bottom-blocks">
        <div class="container">
            <?php if ($this->_tpl_vars['xoBlocks']['page_bottomcenter']): ?>
            <div class="row">
                <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/centerBottom.tpl", 'smarty_include_vars' => array()));
 ?>
            </div>
            <?php endif; ?>
            <?php if ($this->_tpl_vars['xoBlocks']['page_bottomright'] || $this->_tpl_vars['xoBlocks']['page_bottomleft']): ?>
            <div class="row">
                <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/leftBottom.tpl", 'smarty_include_vars' => array()));
 ?>

                <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/rightBottom.tpl", 'smarty_include_vars' => array()));
 ?>
            </div>
        </div>
        <?php endif; ?>
    </div><!-- .bottom-blocks -->
<?php endif; ?>

<?php if ($this->_tpl_vars['xoBlocks']['footer_center'] || $this->_tpl_vars['xoBlocks']['footer_right'] || $this->_tpl_vars['xoBlocks']['footer_left']): ?>
    <div class="footer-blocks">
        <div class="container">
            <div class="row">
                <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/leftFooter.tpl", 'smarty_include_vars' => array()));
 ?>

                <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/centerFooter.tpl", 'smarty_include_vars' => array()));
 ?>

                <?php $this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['theme_name'])."/tpl/rightFooter.tpl", 'smarty_include_vars' => array()));
 ?>
            </div>
        </div>
    </div><!-- .footer-blocks -->
<?php endif; ?>
<?php if (strlen ( $this->_tpl_vars['xoops_footer'] ) > 0): ?>
    <footer class="footer">
	<h3><?php echo $this->_tpl_vars['xoops_footer']; ?>
</h3>
    </footer>
<?php endif; ?>
</body>
</html>