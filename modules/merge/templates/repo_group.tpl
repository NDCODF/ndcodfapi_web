<h3><{$smarty.const._REPO_GROUP_DEPART_ASSIGN}></h3>

<form name="form_user" id="form_user" method="post" class="form-inline"
      enctype="multipart/form-data"
      action="<{$origuri}>">
    <div class="row">
	<div class="col-sm-4">
	    <h4>部門</h4>
	</div>
	<div class="col-sm-4">
	    <h4><span id="subtitle"></span><{$smarty.const._REPO_GROUP_DEPART}></h4>
	</div>
    </div>
    <div class="row">
	<div class="col-sm-4">
	    <select name="mygid" class="form-control"
		    multiple size="25" style="width: 100%">
		<{html_options options=$groupopt}>
	    </select>
	</div>
	<div class="col-sm-4" style="border:grey 1px solid;">
	    <{html_checkboxes name="selGid" options=$selGroupOpt separator="<br />"}>
	</div>
    </div>
    <div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4 right">
	    <input type="submit" class="btn btn-info btn-lg" value="<{$smarty.const._REPO_GROUP_UPDATE}>">
	</div>
    </div>
</form>
<script>
$(document).ready(function(){
    /*
     * 點部門 -> 列分享的部門列表
     * checkbox=true: 有設分享的部門
     * 分享的部門與目前選的部門相同設為 checked 且 disabled
     */
    $('select[name=mygid]').change(function(){
	var gid = $(this).val();
	var subtitle = '';
	if ($(this).find(':selected').val() != 0)
	    subtitle = $(this).find(':selected').text();
	$('#subtitle').html(subtitle);  // ??可看到的部門列表

        $.ajax({
            url: '<{$origuri}>',
	    data: {updateList: 'dummy', gid: gid},
	    dataType: 'json',
            type: 'POST',
            success: function(data){
		var tag = "input[name='selGid[]']";
		$(tag).attr('checked', false).removeAttr('disabled');
		for (var idx in data)
		{
		    $(tag + "[value='" + data[idx]+"']")
				.attr('checked', true);
		}

		// 分享的部門與目前選的部門相同
		$(tag + "[value='" + gid + "']")
				.attr('checked', true)
				.attr('disabled', 'disabled');
	    }
	});
    });

    <{* 預設列表 *}>
    <{if isset($smarty.get.gid)}>
    $('select[name=mygid]').val(<{$smarty.get.gid}>).trigger('change');
    <{/if}>
});
</script>
