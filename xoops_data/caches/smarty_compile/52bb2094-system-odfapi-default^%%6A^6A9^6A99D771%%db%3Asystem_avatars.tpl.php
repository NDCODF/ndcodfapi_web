<?php /* Smarty version 2.6.30, created on 2018-12-21 08:24:08
         compiled from db:system_avatars.tpl */ ?>
<!-- Header -->
<?php $this->_smarty_include(array('smarty_include_tpl_file' => "db:system_header.tpl", 'smarty_include_vars' => array()));
 ?>
<script type="text/javascript">
    IMG_ON = '<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/success.png'; ?>';
    IMG_OFF = '<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/cancel.png'; ?>';
</script>
<!-- Buttons -->
<?php if ($this->_tpl_vars['type'] == 's'): ?>
    <div style="height: 30px;">
        <div class="floatright">
            <div class="xo-buttons" >
                <button id="xo-addavatar-btn" class="ui-corner-all tooltip" onclick='location="admin.php?fct=avatars&amp;op=multiupload"'
                        title="<?php echo @_AM_SYSTEM_AVATAR_MULTIUPLOAD; ?>
">
                    <img src="<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/add.png'; ?>" alt="<?php echo @_AM_SYSTEM_AVATAR_MULTIUPLOAD; ?>
"/>
                    <?php echo @_AM_SYSTEM_AVATAR_MULTIUPLOAD; ?>

                </button>
            </div>
        </div>
    </div>   
<?php endif; ?>
<?php if ($this->_tpl_vars['view_cat']): ?>
    <!-- Display Avatar header for switch between system & custom category -->
    <table class="outer" cellspacing="1">
        <thead>
        <tr>
            <th class="txtcenter"><?php echo @_AM_SYSTEM_AVATAR_SYSTEM; ?>
</th>
            <th class="txtcenter"><?php echo @_AM_SYSTEM_AVATAR_CUSTOM; ?>
</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
            <td class="txtcenter">
                <a class="tooltip" href="admin.php?fct=avatars&amp;op=listavt&amp;type=s" title="<?php echo @_AM_SYSTEM_AVATAR_SYSTEM; ?>
">
                    <img src="<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/avatar_system.png'; ?>" alt="<?php echo @_AM_SYSTEM_AVATAR_SYSTEM; ?>
"/>
                </a>

                <div class="spacer"><?php echo @_AM_SYSTEM_AVATAR_SYSTEM; ?>
&nbsp;:&nbsp;<strong><?php echo $this->_tpl_vars['count_system']; ?>
</strong></div>
            </td>
            <td class="txtcenter">
                <a class="tooltip" href="admin.php?fct=avatars&amp;op=listavt&amp;type=c" title="<?php echo @_AM_SYSTEM_AVATAR_CUSTOM; ?>
">
                    <img src="<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/avatar_custom.png'; ?>" alt="<?php echo @_AM_SYSTEM_AVATAR_CUSTOM; ?>
"/>
                </a>

                <div class="spacer"><?php echo @_AM_SYSTEM_AVATAR_CUSTOM; ?>
&nbsp;:&nbsp;<strong><?php echo $this->_tpl_vars['count_custom']; ?>
</strong></div>
            </td>
        </tr>
        </tbody>
    </table>
    <br>
<?php endif; ?>
<!-- Display Avatar list for each category -->
<?php if ($this->_tpl_vars['avatars_list']): ?>
    <?php $_from = $this->_tpl_vars['avatars_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['avatar']):
?>
        <div class="floatleft">
            <div class="ui-corner-all xo-thumb txtcenter">
                <div class="xo-thumbimg">
                    <img class="tooltip" src="<?php echo $this->_tpl_vars['xoops_url']; ?>
/uploads/<?php echo $this->_tpl_vars['avatar']['avatar_file']; ?>
"
                         alt="<?php echo $this->_tpl_vars['avatar']['avatar_name']; ?>
" title="<?php echo $this->_tpl_vars['avatar']['avatar_name']; ?>
"/>
                </div>
                <div class="xo-actions txtcenter">
                    <div class="spacer bold"><?php echo $this->_tpl_vars['avatar']['avatar_name']; ?>
</div>
                    <img id="loading_avt<?php echo $this->_tpl_vars['avatar']['avatar_id']; ?>
" src="images/spinner.gif" style="display:none;" title="<?php echo @_AM_SYSTEM_LOADING; ?>
"
                         alt="<?php echo @_AM_SYSTEM_LOADING; ?>
"/><img class="tooltip" id="avt<?php echo $this->_tpl_vars['avatar']['avatar_id']; ?>
"
                                                                          onclick="system_setStatus( { fct: 'avatars', op: 'display', avatar_id: <?php echo $this->_tpl_vars['avatar']['avatar_id']; ?>
 }, 'avt<?php echo $this->_tpl_vars['avatar']['avatar_id']; ?>
', 'admin.php' )"
                                                                          src="<?php if ($this->_tpl_vars['avatar']['avatar_display']): ?><?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/success.png'; ?><?php else: ?><?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/cancel.png'; ?><?php endif; ?>"
                                                                          alt="<?php echo @_IMGDISPLAY; ?>
" title="<?php echo @_IMGDISPLAY; ?>
"/>
                    <?php if ($this->_tpl_vars['avatar']['type'] == 'c'): ?>
                        <a href="<?php echo $this->_tpl_vars['xoops_url']; ?>
/modules/profile/userinfo.php?uid=<?php echo $this->_tpl_vars['avatar']['user']; ?>
" title="<?php echo @_AM_SYSTEM_AVATAR_USERS; ?>
">
                            <img src="<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/edit.png'; ?>" alt="<?php echo @_AM_SYSTEM_AVATAR_USERS; ?>
"/>
                        </a>
                    <?php else: ?>
                        <img class="cursorhelp tooltip" src="<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/forum.png'; ?>" alt="<?php echo $this->_tpl_vars['avatar']['count']; ?>
 <?php echo @_AM_SYSTEM_AVATAR_USERS; ?>
"
                             title="<?php echo $this->_tpl_vars['avatar']['count']; ?>
 <?php echo @_AM_SYSTEM_AVATAR_USERS; ?>
"/>
                    <?php endif; ?>
                    <a class="tooltip" href="admin.php?fct=avatars&amp;op=edit&amp;avatar_id=<?php echo $this->_tpl_vars['avatar']['avatar_id']; ?>
" title="<?php echo @_EDIT; ?>
">
                        <img src="<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/edit.png'; ?>" alt="<?php echo @_EDIT; ?>
"/>
                    </a>
                    <a class="tooltip" href="admin.php?fct=avatars&amp;op=delfile&amp;avatar_id=<?php echo $this->_tpl_vars['avatar']['avatar_id']; ?>
" title="<?php echo @_DELETE; ?>
">
                        <img src="<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/delete.png'; ?>" alt="<?php echo @_DELETE; ?>
"/>
                    </a>
                </div>
            </div>
        </div>
    <?php endforeach; endif; unset($_from); ?>
    <!-- Display Avatars navigation -->
    <div class="clear">&nbsp;</div>
    <?php if ($this->_tpl_vars['nav_menu']): ?>
        <div class="xo-pagenav floatright"><?php echo $this->_tpl_vars['nav_menu']; ?>
</div>
        <div class="clear spacer"></div>
    <?php endif; ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['multiupload']): ?>
    <div class="floatright">
        <div class="xo-buttons">
            <button id="xo-addavatar-btn" class="ui-corner-all tooltip" onclick='location="admin.php?fct=avatars&amp;op=listavt&amp;type=s"'
                    title="<?php echo @_AM_SYSTEM_AVATAR_SYSTEM; ?>
">
                <img src="<?php 
echo 'http://122.116.99.182:8888/odfapi/modules/system/images/icons/transition/view.png'; ?>" alt="<?php echo @_AM_SYSTEM_AVATAR_SYSTEM; ?>
"/>
                <?php echo @_AM_SYSTEM_AVATAR_SYSTEM; ?>

            </button>
        </div>
    </div>
    <div class="clear">&nbsp;</div>
    <?php $this->_smarty_include(array('smarty_include_tpl_file' => "db:system_trigger_uploads.tpl", 'smarty_include_vars' => array()));
 ?>
    <h2><?php echo @_AM_SYSTEM_AVATAR_SYSTEM; ?>
</h2>
    <div id="fine-uploader-manual-trigger"></div>
    <div><?php echo @_IMGMAXSIZE; ?>
 <?php echo $this->_tpl_vars['imgcat_maxsize']; ?>
</div>
    <div><?php echo @_IMGMAXWIDTH; ?>
 <?php echo $this->_tpl_vars['imgcat_maxwidth']; ?>
</div>
    <div><?php echo @_IMGMAXHEIGHT; ?>
 <?php echo $this->_tpl_vars['imgcat_maxheight']; ?>
</div>
    <!-- Your code to create an instance of Fine Uploader and bind to the DOM/template
    ====================================================================== -->
    <script>
        var manualUploader = new qq.FineUploader({
            element: document.getElementById('fine-uploader-manual-trigger'),
            template: 'qq-template-manual-trigger',
            request: {
                endpoint: '<?php echo $this->_tpl_vars['xoops_url']; ?>
/ajaxfineupload.php',
                customHeaders: {
                    "Authorization": "Basic <?php echo $this->_tpl_vars['jwt']; ?>
"
                }
            },
            text: {
                formatProgress: "<?php echo @_FORMATPROGRESS; ?>
",
                failUpload: "<?php echo @_FAILUPLOAD; ?>
",
                waitingForResponse: "<?php echo @_WAITINGFORRESPONSE; ?>
",
                paused: "<?php echo @_PAUSED; ?>
"
            },
            messages: {
                typeError: "<?php echo @_TYPEERROR; ?>
",
                sizeError: "<?php echo @_SIZEERROR; ?>
",
                minSizeError: "<?php echo @_MINSIZEERROR; ?>
",
                emptyError: "<?php echo @_EMPTYERROR; ?>
",
                noFilesError: "<?php echo @_NOFILESERROR; ?>
",
                tooManyItemsError: "<?php echo @_TOOMANYITEMSERROR; ?>
",
                maxHeightImageError: "<?php echo @_MAXHEIGHTIMAGEERROR; ?>
",
                maxWidthImageError: "<?php echo @_MAXWIDTHIMAGEERROR; ?>
",
                minHeightImageError: "<?php echo @_MINHEIGHTIMAGEERROR; ?>
",
                minWidthImageError: "<?php echo @__MINWIDTHIMAGEERROR; ?>
",
                retryFailTooManyItems: "<?php echo @_RETRYFAILTOOMANYITEMS; ?>
",
                onLeave: "<?php echo @_ONLEAVE; ?>
",
                unsupportedBrowserIos8Safari: "<?php echo @_UNSUPPORTEDBROWSERIOS8SAFARI; ?>
"
            },
            thumbnails: {
                placeholders: {
                    waitingPath: '<?php echo $this->_tpl_vars['xoops_url']; ?>
/media/fine-uploader/placeholders/waiting-generic.png',
                    notAvailablePath: '<?php echo $this->_tpl_vars['xoops_url']; ?>
/media/fine-uploader/placeholders/not_available-generic.png'
                }
            },
            validation: {
                acceptFiles: ['image/jpeg', 'image/gif', 'image/png'],
                allowedExtensions: ['jpeg', 'jpg', 'png', 'gif'],
                image: {
                    maxHeight: <?php echo $this->_tpl_vars['imgcat_maxheight']; ?>
,
                    maxWidth: <?php echo $this->_tpl_vars['imgcat_maxwidth']; ?>

                },
                sizeLimit: <?php echo $this->_tpl_vars['imgcat_maxsize']; ?>

            },
            autoUpload: false,
            callbacks: {
            onError: function(id, name, errorReason, xhrOrXdr) {
                 console.log(qq.format("Error uploading {}.  Reason: {}", name, errorReason));
             }
         },
        debug: <?php echo $this->_tpl_vars['fineup_debug']; ?>

        });

        qq(document.getElementById("trigger-upload")).attach("click", function() {
            manualUploader.uploadStoredFiles();
        });
    </script>
<?php endif; ?>

<!-- Display Avatar form (add,edit) -->
<?php if ($this->_tpl_vars['form']): ?>
    <div class="spacer"><?php echo $this->_tpl_vars['form']; ?>
</div>
<?php endif; ?>
<!-- Display Avatar images on edit page -->