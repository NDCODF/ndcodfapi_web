<h3><{$smarty.const._REPO_USER_TRANSFER_OWNERSHIP}></h3>

<form name="form_user" id="form_user" method="post" class="form-inline"
      enctype="multipart/form-data"
      action="<{$origuri}>">
    <div class="row">
	<div class="col-sm-4">
	    <h4><{$smarty.const._REPO_USER_DEPARTMENT}></h4>
	</div>
	<div class="col-sm-4">
	    <h4><{$smarty.const._REPO_USER_CURRENT_OWNER}></h4>
	</div>
	<div class="col-sm-4">
	    <h4><{$smarty.const._REPO_USER_NEW_OWNER}></h4>
	</div>
    </div>
    <div class="row">
	<div class="col-sm-4">
	    <select name="mygid" class="form-control"
		    multiple size="25" style="width: 100%; height: 400px;">
		<{html_options options=$groupopt}>
	    </select>
	</div>
	<div class="col-sm-4">
	    <select name="olduser" class="form-control userlist"
		    multiple size="25" style="width: 100%; height: 400px;"></select>
	</div>
	<div class="col-sm-4">
	    <select name="newuser" class="form-control userlist"
		    multiple size="25" style="width: 100%; height: 400px;"></select>
	</div>
    </div>
    <div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4"></div>
	<div class="col-sm-4 right">
	    <input type="submit" class="btn btn-info btn-lg" value="<{$smarty.const._REPO_USER_UPDATE}>">
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
	$('.userlist').empty();
        $.ajax({
            url: '<{$origuri}>',
	    data: {updateList: 'dummy', gid: gid},
	    dataType: 'json',
            type: 'POST',
            success: function(data){
		for (var idx in data)
		{
		    var uname = data[idx].name;
		    var uid = data[idx].uid;
		    $('.userlist').append($('<option></option>')
                                  .val(uid).text(uname));
		}
	    }
	});
    });

    $('#form_user').submit(function(){
	var a = $('select[name=olduser]').val();
	var b = $('select[name=newuser]').val();
	if (a == '' || b == '')
	{
	    alert('<{$smarty.const._REPO_USER_WARN_NO_SELECT}>');
	    return false;
	}
	if (a - b == 0)
	{
	    alert('<{$smarty.const._REPO_USER_WARN_CONFLICT}>');
	    return false;
	}
	return true;
    });

    <{* 預設列表 *}>
    <{if isset($smarty.get.gid)}>
    $('select[name=mygid]').val(<{$smarty.get.gid}>).trigger('change');
    <{/if}>
});
</script>
