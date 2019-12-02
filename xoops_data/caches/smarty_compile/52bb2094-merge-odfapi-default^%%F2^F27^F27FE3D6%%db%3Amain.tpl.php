<?php /* Smarty version 2.6.30, created on 2018-12-16 05:40:10
         compiled from db:main.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_options', 'db:main.tpl', 71, false),)), $this); ?>
<?php if (! $this->_tpl_vars['modify']): ?><h3>新增範本</h3><?php endif; ?>
<script>
$(document).ready(function(){
    $(document).on('click','#submitBtn', function(){
	var msg = new Array();
	var uploadFile = $('#uploadFile').val();
	uploadFile = uploadFile.replace(/^\s*/, '')   // lstrip
			       .replace(/\s*$/, '');  // rstrip

	<?php if (! $this->_tpl_vars['modify']): ?>
	if (typeof(uploadFile)=='undefined' || uploadFile == '')
	    msg.push('未上傳檔案');
	<?php endif; ?>

    <?php if ($this->_tpl_vars['modify']): ?>
    	if (uploadFile != ''){
    <?php endif; ?>
        if (!uploadFile.match(/\.ott|\.ots$/i))
	{
	    msg.push('上傳檔案類型不是 .ott 或 .ots');
	}
    <?php if ($this->_tpl_vars['modify']): ?>
	}
    <?php endif; ?>

	if ($('select[name=cid]').find(":selected").val() == 0)
	    msg.push('未選分類');
	if ($('input[name=title]').val() == '')
	    msg.push('未填抬頭');

	if (msg.length > 0)
	{
	    alert(msg.join('\n'));
	    return false;
	}
	return true;
    });
});
</script>
<form name="form_user" id="form_user" method="post"
      enctype="multipart/form-data"
      action="index.php?op=operate&subop=upload">
    <table class="table table-bordered">
	<tr>
	    <th class="active">
		範本 API 名稱
		<?php if (! $this->_tpl_vars['modify']): ?><em>*</em><?php endif; ?>
	    </th>
	    <td class="input-column">
		<input class="form-control" type="text" name="title" />
	    </td>
	</tr>
	<tr>
	    <th class="active">
		API 範本說明 
	    </th>
	    <td class="input-column">
		<textarea class="form-control" type="textarea"
	                  name="desc" ></textarea>
	    </td>
	</tr>
	<tr>
	    <th class="active">
		分類
		*
	    </th>
	    <td class="input-column">
		<select name="cid">
		    <?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['cateopt']), $this);?>

		</select>
	    </td>
	</tr>
	<?php if ($this->_tpl_vars['modify']): ?>
	<tr>
	    <th class="active">
		顯示
		*
	    </th>
	    <td class="input-column">
		<input type="radio" name="hide" value="0" checked="checked">顯示
		<input type="radio" name="hide" value="1">隱藏
	    </td>
	</tr>
	<?php endif; ?>
	<tr>
	    <th class="active">
		<?php if (! $this->_tpl_vars['modify']): ?>
		上傳
		<?php else: ?>
		更新範本檔
		<?php endif; ?>
		<?php if (! $this->_tpl_vars['modify']): ?><em>*</em><?php endif; ?>
	    </th>
	    <td class="input-column">
		<input class="input-file-style" type="file"
		       id="uploadFile" name="uploadFile"
		       accept=".ott,.ots" />
		<input type="hidden" name="wo" value="upload" />
		<input type="hidden" name="id" value="" />
	    </td>
	</tr>
	<tr>
	    <td colspan="2" class="right">
		<input class="btn btn-info" type="submit"
		       name="submitBtn" id="submitBtn" value="送出" />
		<?php if ($this->_tpl_vars['modify']): ?>
		<button type="button" class="btn btn-info"
			data-dismiss="modal">
			關閉
		</button>
		<?php endif; ?>
	    </td>
	</tr>
    </table>
</form>