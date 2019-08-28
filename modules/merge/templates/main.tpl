<{if !$modify}><h3>新增範本</h3><{/if}>
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
	    msg.push('未上傳檔案');
	<{/if}>

    <{if $modify}>
    <{* 修改紀錄：有選擇檔案才檢查檔案格式 *}>
	if (uploadFile != ''){
    <{/if}>
        if (!uploadFile.match(/\.ott|\.ots$/i))
	{
	    msg.push('上傳檔案類型不是 .ott 或 .ots');
	}
    <{if $modify}>
	}
    <{/if}>

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
		<{if !$modify}><em>*</em><{/if}>
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
		    <{html_options options=$cateopt}>
		</select>
	    </td>
	</tr>
	<{if $modify}>
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
	<{/if}>
	<tr>
	    <th class="active">
		<{if !$modify}>
		上傳
		<{else}>
		更新範本檔
		<{/if}>
		<{if !$modify}><em>*</em><{/if}>
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
		<{if $modify}>
		<button type="button" class="btn btn-info"
			data-dismiss="modal">
			關閉
		</button>
		<{/if}>
	    </td>
	</tr>
    </table>
</form>
