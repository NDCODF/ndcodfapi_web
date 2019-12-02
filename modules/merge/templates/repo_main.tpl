<{if !$modify}><h3><{$smarty.const._REPO_MAIN_TITLE}></h3><{/if}>
<{* modify: call from list.tpl *}>
<script>
$(document).ready(function(){
    $(document).on('click','#submitBtn', function(){
	var msg = new Array();
	var uploadFile = $('#uploadFile').val();
	uploadFile = uploadFile.replace(/^\s*/, '')   // lstrip
			       .replace(/\s*$/, '');  // rstrip

	<{if !$modify}>
	if (typeof(uploadFile)=='undefined' || uploadFile == '')
	    msg.push('<{$smarty.const._REPO_MAIN_FILE_WARN}>');
	<{/if}>

    <{if $modify}>
    <{* 修改紀錄：有選擇檔案才檢查檔案格式 *}>
	if (uploadFile != ''){
    <{/if}>
        if (!uploadFile.match(/\.ott|\.otp|\.ots$/i))
	{
	    msg.push("<{$smarty.const._REPO_MAIN_TYPE_WARN}>");
	}
    <{if $modify}>
	}
    <{/if}>

	if ($('select[name=cid]').find(":selected").val() == 0)
	    msg.push('<{$smarty.const._REPO_MAIN_CATEGORY_WARN}>');
	if ($('input[name=title]').val() == '')
	    msg.push('<{$smarty.const._REPO_MAIN_NAME_WARN}>');

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
      action="index.php?op=operate&subop=repo_upload">
    <table class="table table-bordered">
	<tr>
	    <th class="active">
		<{$smarty.const._REPO_MAIN_API_NAME}>
		<{if !$modify}><em>*</em><{/if}>
	    </th>
	    <td class="input-column">
		<input class="form-control" type="text" name="title" />
	    </td>
	</tr>
	<tr>
	    <th class="active">
		<{$smarty.const._REPO_MAIN_API_DESC}>
	    </th>
	    <td class="input-column">
		<textarea class="form-control" type="textarea"
	                  name="desc" ></textarea>
	    </td>
	</tr>
	<tr>
	    <th class="active">
	    <{$smarty.const._REPO_MAIN_CATEGORY}>
		*
	    </th>
	    <td class="input-column">
		<select name="cid">
		    <{html_options options=$cateopt}>
		</select>
	    </td>
	</tr>
	<{if $modify}>
	<tr>
	    <th class="active">
		<{$smarty.const._REPO_MAIN_SHOW_CHECK}>
		*
	    </th>
	    <td class="input-column">
		<input type="radio" name="hide" value="0" checked="checked" /><{$smarty.const._REPO_MAIN_SHOW}>
		<input type="radio" name="hide" value="1" /><{$smarty.const._REPO_MAIN_HIDE}>
	    </td>
	</tr>
	<{/if}>
	<tr>
	    <th class="active">
		<{if !$modify}>
		<{$smarty.const._REPO_MAIN_UPLOAD}>
		<{else}>
		<{$smarty.const._REPO_MAIN_UPDATE}>
		<{/if}>
		<{if !$modify}><em>*</em><{/if}>
	    </th>
	    <td class="input-column">
		<input class="input-file-style" type="file"
		       id="uploadFile" name="uploadFile"
		       accept=".ott,.ots,.otp" />
		<input type="hidden" name="wo" value="upload" />
		<input type="hidden" name="id" value="" />
	    </td>
	</tr>
	<tr>
	    <td colspan="2" class="right">
		<input class="btn btn-info" type="submit"
		       name="submitBtn" id="submitBtn" value="送出" />
		<{if $modify}>
		<button type="button" class="btn btn-info"
			data-dismiss="modal">
			<{$smarty.const._REPO_MAIN_CLOSE}>
		</button>
		<{/if}>
	    </td>
	</tr>
    </table>
</form>
