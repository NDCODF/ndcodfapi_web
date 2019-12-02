<?php /* Smarty version 2.6.30, created on 2018-12-19 05:53:34
         compiled from db:list.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_options', 'db:list.tpl', 193, false),array('function', 'cycle', 'db:list.tpl', 221, false),array('modifier', 'date_format', 'db:list.tpl', 235, false),array('modifier', 'nl2br', 'db:list.tpl', 260, false),array('modifier', 'default', 'db:list.tpl', 260, false),)), $this); ?>
<link rel="stylesheet" type="text/css" media="all"
      title="Style sheet" href="css/common.css" />
<script>
/* 執行 bootstrap 某些函式像 .modal('show') 時
 * 因 js 載入順序要 jquery -> boost
 * 模駔會在最後載入 jquery-1.7.1 導致弄亂順序
 * 這裡再從 <script> 把 boost 的 src 撈出來重新載入
 *
 * @param calbak func
 */
run_bootstrap = function(calbak)
{
    $('script').each(function(){
	var src = $(this).attr('src');
	if(!src)
	    return;
	if(src.search(/bootstrap.min.js/) > -1)
	    $.getScript(src).done(calbak);
    });
}

$(document).ready(function(){
    try
    {
	// xoops js load 的作用，popover 有時會消失而失敗
	//$('.copylink').popover({trigger: 'manual'});
    }
    catch(err){}

    /*
    * 按下刪除後的提示視窗
    */
    $('.deletelink').on('click', function(e) {
	var delurl = this.href;
	e.preventDefault();

        run_bootstrap(function(){
	    $('#deleteWin').modal({
	        backdrop: 'static',
	        keyboard: false
	    })
            .one('click', '#delete', function(e) {
	        location.href = delurl;
            });
        });
    });

    /*
    * 顯示修改視窗
    */
    $('.modify').click(function(event){
	event.preventDefault();

	var id = $(this).attr('rec_id');
	var cid = $(this).attr('cid');
	// 透過 get.php 將值帶進視窗內的表格內
        $.ajax({
            url: 'get.php',
	    data: {id: id},
	    dataType: 'json',
            type: 'POST',
            success: function(data){
		// 將值代進來
		var dlgWin = $('#editWin');

		dlgWin.find('input[type=file]').val('');
		dlgWin.find('input[name=title]').val(data.title);
		dlgWin.find('textarea[name=desc]').val(data.desc);
		dlgWin.find('input[name=id]').val(id);
		dlgWin.find('select[name=cid]').val(cid);
		var idx = data.hide == '0' ? 0 : 1;
		dlgWin.find('input[name=hide]').get(idx).checked = true;

		run_bootstrap(function(){dlgWin.modal('show');});
	    }
	});

        return false;
    });

    /*
    * 點了 api or json
    */
    $('.merge-uri').click(function(event){
	event.preventDefault();
        var that = this;
	var ctype = $(that).attr('ctype');

        $.ajax({
	    url: this.href,
            type: 'GET',
	    timeout: 5000,
	    error: function(data){
		alert($(that).attr('docname') + '列表失敗');
	    },
            success: function(data){
		var toJson = ctype == 'json';
		var toApi = ctype == 'api';
		var dlgWin;
		if (toApi)
		    dlgWin = $('#apiWin');
		if (toJson)
		    dlgWin = $('#jsonWin');

		// 文件名
		dlgWin.find('.docname').val($(that).attr('docname'));
                // tab label
                $('#endpointTab').html($(that).text());

                // api/json content
		if (toJson)
		{
		    var jheader = data.substr(0, data.indexOf('{')-27);
		    $('#jsonheader').html(jheader);

		    data = data.substr(data.indexOf('{'));
		    data = data.replace(/<br \/>/g, '');
		    data = data.replace(/\r\n/g, '');
		    data = data.replace(/&nbsp;/g, '');
		    data = JSON.parse(data);
		}
		data = JSON.stringify(data, null, 4);
		$('.jsoncontent').text(data);

                // REST 位置
                dlgWin.find('.oxoolurl').val($(that).attr('endpt'));

		if (that.hasAttribute('yaml'))
		{
		    $('.yamlcontent').load($(that).attr('yaml'));
		}

		run_bootstrap(function(){dlgWin.modal('show');});
            }
        });
        return false;
    });

    /*
    * 分享給..
    */
    $('.assign-perm').click(function(event){
	event.preventDefault();
	var dlgWin = $('#permWin');
	dlgWin.find('input[name=id]').val($(this).attr('rec_id'));

	dlgWin.find('option').attr('selected', false);
	var selusers = JSON.parse($(this).attr('selusers'));
	for (var uid in selusers)
	{  // 已選的使用者設為 selected
	    // http://kevintsengtw.blogspot.com/2011/09/jquery-dropdownlist-1.html
	    dlgWin.find('option[value='+ selusers[uid] +']')
		  .attr('selected', true);
	}
	run_bootstrap(function(){dlgWin.modal('show');});
        return false;
    });

    $('select[name=grpid]').change(function(){
	url = '<?php echo $this->_tpl_vars['origuri']; ?>
&grpid=' + $(this).val();
	location.href = url;
    });
    /*
    * 複製 -> ctrl+c
    */
    $('.copylink').click(function(){
	var that = this;
	$(this).parent().prev().select();
        document.execCommand('copy');
	run_bootstrap(function(){$(that).popover('show');});
	setTimeout(function(){
	    run_bootstrap(function(){$(that).popover('hide');});
	},1000);
    });
});
</script>

<!-- *************************************** Start of 抬頭 & 分頁(top) -->
<?php if (! isset ( $_GET['search'] )): ?>
<h3>
<!--<button type="button" class="btn btn-lg title-btn" style="width: 100%">-->
<?php if (isset ( $_GET['grpid'] ) && $_GET['grpid'] > 0): ?>
    目前部門所在的報表
<?php else: ?>
    全部的報表
<?php endif; ?>
<span class="badge"><?php echo $this->_tpl_vars['total']; ?>
</span>
</h3>
<h5>
部門類別：
<select class="form-control_dummy" name="grpid">
<?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['grpopt'],'selected' => $_GET['grpid']), $this);?>

</select>
<!-- *************************************** Start of groupby -->
請點選排序方式：
<?php $_from = $this->_tpl_vars['orderopt']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['ord'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['ord']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['orderby']):
        $this->_foreach['ord']['iteration']++;
?>
<a href="<?php echo $this->_tpl_vars['origuri']; ?>
&grpid=<?php echo $_GET['grpid']; ?>
&orderby=<?php echo ($this->_foreach['ord']['iteration']-1); ?>
&acce=<?php if ($this->_tpl_vars['acce'] == 'asc'): ?>desc<?php else: ?>asc<?php endif; ?>">
    <?php echo $this->_tpl_vars['orderby']; ?>

</a>
<?php if (isset ( $_GET['orderby'] ) && ($this->_foreach['ord']['iteration']-1) == $_GET['orderby']): ?>
<a href="<?php echo $this->_tpl_vars['origuri']; ?>
&grpid=<?php echo $_GET['grpid']; ?>
&orderby=<?php echo ($this->_foreach['ord']['iteration']-1); ?>
&acce=<?php if ($this->_tpl_vars['acce'] == 'asc'): ?>desc<?php else: ?>asc<?php endif; ?>">
    <?php if ($this->_tpl_vars['acce'] == 'asc'): ?>
	<span class="glyphicon glyphicon-chevron-down"></span>
    <?php else: ?>
	<span class="glyphicon glyphicon-chevron-up"></span>
    <?php endif; ?>
</a>
<?php endif; ?>
|
<?php endforeach; endif; unset($_from); ?>
<!-- *************************************** End of groupby -->
<!--</button>-->
</h5>
<div style="display: inline-block;"><?php echo $this->_tpl_vars['navPath']; ?>
</div>
<?php endif; ?>

<!-- *************************************** End of 抬頭 & 分頁(top) -->
<!-- ************************************************ Start of 列表 -->
<?php $_from = $this->_tpl_vars['datas']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['ddata'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['ddata']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['data']):
        $this->_foreach['ddata']['iteration']++;
?>
<div class="row" style="background: <?php echo smarty_function_cycle(array('values' => "#F4F4F4, white"), $this);?>
; padding-top: 8px;">
    <div class="col-sm-2 center text-nowrap">
	<?php if ($this->_tpl_vars['data']['extname'] == 'ott'): ?>
	    <img src="images/libreoffice-writer-icon-48.png"
                 alt="Text 報表" />
	<?php endif; ?>
	<?php if ($this->_tpl_vars['data']['extname'] == 'ots'): ?>
	    <img src="images/libreoffice-calc-icon-48.png"
                 alt="Spreadsheet 報表" />
	<?php endif; ?>
	<h6>
	    呼叫次數: <?php echo $this->_tpl_vars['data']['accesscount']; ?>
<br />
	    更新次數: <?php echo $this->_tpl_vars['data']['upcount']; ?>
<br />
	    最後更新時間<br />
	    <?php echo ((is_array($_tmp=$this->_tpl_vars['data']['uptime'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%Y-%m-%d %H:%M") : smarty_modifier_date_format($_tmp, "%Y-%m-%d %H:%M")); ?>

	</h6>
    </div>
    <div class="left"
	 style="display: flex; flex-direction: column;
		justify-content: justify; align-items: horizontally">
	<h4>
	    <strong>
		<p style="color: #1a4e87;">
                    <small>
                        <span
			  class="label label-default"><?php echo $this->_tpl_vars['data']['cate']; ?>
</span>
			<?php if ($this->_tpl_vars['data']['show_grpname']): ?>
			<span
			  class="label label-info"><?php echo $this->_tpl_vars['data']['groupname']; ?>
</span>
			<?php endif; ?>
			<?php if (! $this->_tpl_vars['data']['no_perm']): ?>
                        <span
			  class="label label-primary"><?php echo $this->_tpl_vars['data']['hide_text']; ?>
</span>
			<?php endif; ?>
                    </small>&nbsp;<?php echo $this->_tpl_vars['data']['title']; ?>

		</p>
	    </strong>
	</h4>
	<h5 class="textcolor">
	    <?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['data']['desc'])) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "<br />") : smarty_modifier_default($_tmp, "<br />")); ?>

	</h5>
    	<h5 class="textcolor">
	    <span class="text-success">
		<a class="commonlink merge-uri"
		   href="file.php?getendpt=<?php echo $this->_tpl_vars['oxoolurl']; ?>
/lool/merge-to/<?php echo $this->_tpl_vars['data']['endpt']; ?>
/json&ctype=json"
		   endpt="<?php echo $this->_tpl_vars['oxoolurl']; ?>
/lool/merge-to/<?php echo $this->_tpl_vars['data']['endpt']; ?>
"
		   docname="<?php echo $this->_tpl_vars['data']['title']; ?>
" ctype="json"
		   title="{傳送 JSON 範例說明}">
			{傳送JSON 範例說明}
		</a>
	    </span>&nbsp;
	    <span class="text-success">
		<a class="commonlink merge-uri"
		   href="file.php?getendpt=<?php echo $this->_tpl_vars['oxoolurl']; ?>
/lool/merge-to/<?php echo $this->_tpl_vars['data']['endpt']; ?>
/api&ctype=api"
                   yaml="file.php?getendpt=<?php echo $this->_tpl_vars['oxoolurl']; ?>
/lool/merge-to/<?php echo $this->_tpl_vars['data']['endpt']; ?>
/yaml&ctype=yaml"
                   endpt="<?php echo $this->_tpl_vars['oxoolurl']; ?>
/lool/merge-to/<?php echo $this->_tpl_vars['data']['endpt']; ?>
"
                   docname="<?php echo $this->_tpl_vars['data']['title']; ?>
" ctype="api"
                   title="&lt;YAML 格式說明&gt;">
                        &lt;YAML 格式說明&gt;
		</a>
	    </span>&nbsp;
	    <span class="text-success">
		<a class="commonlink downfile" title="下載範本"
                   href="file.php?id=<?php echo $this->_tpl_vars['data']['rec_id']; ?>
">
			<span class="glyphicon glyphicon-download-alt">
			</span>
		        下載範本
		</a>
	    </span>&nbsp;
	    <span class="text-success">
		<a class="commonlink downfile" title="下載 API 資訊"
                   href="file.php?id=<?php echo $this->_tpl_vars['data']['rec_id']; ?>
&endpt=<?php echo $this->_tpl_vars['oxoolurl']; ?>
/lool/merge-to/<?php echo $this->_tpl_vars['data']['endpt']; ?>
">
			<span class="glyphicon glyphicon-download-alt">
			</span>
		        下載 API 資訊
		</a>
	    </span>&nbsp;
	    <?php if (! $this->_tpl_vars['data']['no_perm'] || ( $this->_tpl_vars['data']['no_perm'] && $this->_tpl_vars['data']['for_admin'] )): ?>
	    <span class="text-success">
		<a class="commonlink modify" title="修改" href=""
		   rec_id="<?php echo $this->_tpl_vars['data']['rec_id']; ?>
" cid="<?php echo $this->_tpl_vars['data']['cid']; ?>
">
			<span class="glyphicon glyphicon-pencil"></span>
                        修改
		</a>
	    </span>&nbsp;
	    <span style="font-color: black; a:color: black;">
		<a class="deletelink" title="刪除"
		   href="<?php echo $this->_tpl_vars['acturi']; ?>
&id=<?php echo $this->_tpl_vars['data']['rec_id']; ?>
&sta=4">
			<span class="glyphicon glyphicon-trash"></span>
		        刪除
		</a>
	    </span>&nbsp;
	    <?php endif; ?>
	    	    <?php if (false): ?>
	    <span class="otherlink text-success">
		<a class="otherlink assign-perm" href=""
		   selusers="<?php echo $this->_tpl_vars['data']['selusers']; ?>
"
		   rec_id="<?php echo $this->_tpl_vars['data']['rec_id']; ?>
"
		   title="分享給...">
		        <span class="glyphicon glyphicon-share"></span>
			分享給...
		</a>
	    </span>&nbsp;
	    <?php endif; ?>
	    <?php if (! $this->_tpl_vars['data']['no_perm']): ?>
	    <span class="text-success">
		<a class="otherlink" title="查看留言"
		   href="<?php echo $this->_tpl_vars['origuri']; ?>
&wo=<?php echo $this->_tpl_vars['wo']; ?>
&id=<?php echo $this->_tpl_vars['data']['rec_id']; ?>
&start=<?php echo $this->_tpl_vars['start']; ?>
"
		   >
		        <span class="otherlink glyphicon glyphicon-eye-open">
			</span>
			查看留言
		</a>
	    </span>
	    <?php endif; ?>
	    <?php if ($this->_tpl_vars['data']['no_perm'] || ( $this->_tpl_vars['data']['no_perm'] && $this->_tpl_vars['data']['for_admin'] )): ?>
	    <span class="text-success">
		<a class="otherlink" title="我要留言"
		   href="<?php echo $this->_tpl_vars['origuri']; ?>
&wo=<?php echo $this->_tpl_vars['wo']; ?>
&id=<?php echo $this->_tpl_vars['data']['rec_id']; ?>
"
		   >
                        <span class="glyphicon glyphicon-eye-open"></span>
			我要留言
		</a>
	    </span>&nbsp;
	    <span>
		<span class="glyphicon glyphicon-user"></span>
                <?php if ($this->_tpl_vars['data']['for_admin']): ?>
		<?php echo $this->_tpl_vars['data']['uname']; ?>
的報表
		<?php else: ?>
                <?php echo $this->_tpl_vars['data']['uname']; ?>
分享給我
		<?php endif; ?>
	    </span>
	    <?php endif; ?>
	</h5>
        </div>
</div>

<!--<hr style="margin-top: 0px; margin-bottom: 15px; border-top: 1px solid #E5E5E5;" />-->
<?php endforeach; endif; unset($_from); ?>
<!-- *************************************************** End of 列表 -->

<!-- ****************************************** Start of 分頁(bottom) -->
<div style="display: inline-block;"><?php echo $this->_tpl_vars['navPath']; ?>
</div>
<!-- ****************************************** End of 分頁(bottom) -->

<!-- ********************************************** Start of comment -->
<div style="margin: 3px; padding: 3px;">
    <!-- start comments loop -->
    <?php if ($this->_tpl_vars['comment_mode'] == 'flat'): ?>
      <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "db:system_comments_flat.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <?php elseif ($this->_tpl_vars['comment_mode'] == 'thread'): ?>
      <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "db:system_comments_thread.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <?php elseif ($this->_tpl_vars['comment_mode'] == 'nest'): ?>
      <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "db:system_comments_nest.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <?php endif; ?>
    <!-- end comments loop -->
</div>
<!-- ********************************************** End of comment -->

<?php $this->_smarty_include(array('smarty_include_tpl_file' => "db:dialogs.tpl", 'smarty_include_vars' => array()));
 ?>