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
		alert($(that).attr('docname') + '<{$smarty.const._MERGE_LIST_FAIL_LIST}>');
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
	url = '<{$origuri}>&grpid=' + $(this).val();
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
<{if !isset($smarty.get.search)}>
<h3>
<!--<button type="button" class="btn btn-lg title-btn" style="width: 100%">-->
<{*if isset($smarty.get.wo) && $smarty.get.wo == 'share'*}>
<{if isset($smarty.get.grpid) && $smarty.get.grpid > 0}>
    <{$smarty.const._MERGE_LIST_TPL_TITLE_DEPARTMENT}>
<{else}>
    <{$smarty.const._MERGE_LIST_TPL_TITLE_ALL}>
<{/if}>
<span class="badge"><{$total}></span>
</h3>
<h5>
<{$smarty.const._MERGE_LIST_TPL_DEPARTMENT}>：
<select class="form-control_dummy" name="grpid">
<{html_options options=$grpopt selected=$smarty.get.grpid}>
</select>
<!-- *************************************** Start of groupby -->
<{$smarty.const._MERGE_LIST_TPL_ORDER_BY}>：
<{foreach from=$orderopt item=orderby name=ord}>
<a href="<{$origuri}>&grpid=<{$smarty.get.grpid}>&orderby=<{$smarty.foreach.ord.index}>&acce=<{if $acce == 'asc'}>desc<{else}>asc<{/if}>">
    <{$orderby}>
</a>
<{if isset($smarty.get.orderby) && $smarty.foreach.ord.index == $smarty.get.orderby}>
<a href="<{$origuri}>&grpid=<{$smarty.get.grpid}>&orderby=<{$smarty.foreach.ord.index}>&acce=<{if $acce == 'asc'}>desc<{else}>asc<{/if}>">
    <{if $acce == 'asc'}>
	<span class="glyphicon glyphicon-chevron-down"></span>
    <{else}>
	<span class="glyphicon glyphicon-chevron-up"></span>
    <{/if}>
</a>
<{/if}>
|
<{/foreach}>
<!-- *************************************** End of groupby -->
<!--</button>-->
</h5>
<div style="display: inline-block;"><{$navPath}></div>
<{/if}>

<!-- *************************************** End of 抬頭 & 分頁(top) -->
<!-- ************************************************ Start of 列表 -->
<{foreach from=$datas item=data name=ddata}>
<div class="row" style="background: <{cycle values="#F4F4F4, white"}>; padding-top: 8px;">
    <div class="col-sm-2 center text-nowrap">
	<{if $data.extname == 'ott'}>
	    <img src="images/libreoffice-writer-icon-48.png"
                 alt="Text 報表" />
	<{/if}>
	<{if $data.extname == 'ots'}>
	    <img src="images/libreoffice-calc-icon-48.png"
                 alt="Spreadsheet 報表" />
	<{/if}>
	<h6>
	    <{$smarty.const._MERGE_LIST_CALLED}>: <{$data.accesscount}><br />
	    <{$smarty.const._MERGE_LIST_UPDATETIMES}>: <{$data.upcount}><br />
	    <{$smarty.const._MERGE_LIST_LAST_UPDATE}><br />
	    <{$data.uptime|date_format:"%Y-%m-%d %H:%M"}>
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
			  class="label label-default"><{$data.cate}></span>
			<{if $data.show_grpname}>
			<span
			  class="label label-info"><{$data.groupname}></span>
			<{/if}>
			<{if !$data.no_perm}>
                        <span
			  class="label label-primary"><{$data.hide_text}></span>
			<{/if}>
                    </small>&nbsp;<{$data.title}>
		</p>
	    </strong>
	</h4>
	<h5 class="textcolor">
	    <{$data.desc|nl2br|default:"<br />"}>
	</h5>
    <{*if !isset($smarty.get.id)*}>
	<h5 class="textcolor">
	    <span class="text-success">
		<a class="commonlink merge-uri"
		   href="file.php?getendpt=<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>/json&ctype=json"
		   endpt="<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>"
		   docname="<{$data.title}>" ctype="json"
		   title="{<{$smarty.const._MERGE_LIST_JSON_EXAMPLE}>}">
			{<{$smarty.const._MERGE_LIST_JSON_EXAMPLE}>}
		</a>
	    </span>&nbsp;
	    <span class="text-success">
		<a class="commonlink merge-uri"
		   href="file.php?getendpt=<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>/api&ctype=api"
                   yaml="file.php?getendpt=<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>/yaml&ctype=yaml"
                   endpt="<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>"
                   docname="<{$data.title}>" ctype="api"
                   title="&lt;<{$smarty.const._MERGE_LIST_YAML_EXAMPLE}>&gt;">
                        &lt;<{$smarty.const._MERGE_LIST_YAML_EXAMPLE}>&gt;
		</a>
	    </span>&nbsp;
	    <span class="text-success">
		<a class="commonlink downfile" title="<{$smarty.const._MERGE_LIST_DOWNLOAD_TEMP}>"
                   href="file.php?id=<{$data.rec_id}>">
			<span class="glyphicon glyphicon-download-alt">
			</span>
		        <{$smarty.const._MERGE_LIST_DOWNLOAD_TEMP}>
		</a>
	    </span>&nbsp;
	    <span class="text-success">
		<a class="commonlink downfile" title="<{$smarty.const._MERGE_LIST_DOWNLOAD_APIINFO}>"
                   href="file.php?id=<{$data.rec_id}>&endpt=<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>">
			<span class="glyphicon glyphicon-download-alt">
			</span>
		        <{$smarty.const._MERGE_LIST_DOWNLOAD_APIINFO}>
		</a>
	    </span>&nbsp;
	    <{if !$data.no_perm || ($data.no_perm && $data.for_admin)}>
	    <span class="text-success">
		<a class="commonlink modify" title="<{$smarty.const._MERGE_LIST_MODIFY}>" href=""
		   rec_id="<{$data.rec_id}>" cid="<{$data.cid}>">
			<span class="glyphicon glyphicon-pencil"></span>
                        <{$smarty.const._MERGE_LIST_MODIFY}>
		</a>
	    </span>&nbsp;
	    <span style="font-color: black; a:color: black;">
		<a class="deletelink" title="<{$smarty.const._MERGE_LIST_DELETE}>"
		   href="<{$acturi}>&id=<{$data.rec_id}>&sta=4">
			<span class="glyphicon glyphicon-trash"></span>
		        <{$smarty.const._MERGE_LIST_DELETE}>
		</a>
	    </span>&nbsp;
	    <{/if}>
	    <{*if $data.for_admin*}>
	    <{if false}>
	    <span class="otherlink text-success">
		<a class="otherlink assign-perm" href=""
		   selusers="<{$data.selusers}>"
		   rec_id="<{$data.rec_id}>"
		   title="<{$smarty.const._MERGE_LIST_SHARE}>">
		        <span class="glyphicon glyphicon-share"></span>
			<{$smarty.const._MERGE_LIST_SHARE}>
		</a>
	    </span>&nbsp;
	    <{/if}>
	    <{if !$data.no_perm}>
	    <span class="text-success">
		<a class="otherlink" title="<{$smarty.const._MERGE_LIST_CHECK_MESSAGE}>"
		   href="<{$origuri}>&wo=<{$wo}>&id=<{$data.rec_id}>&start=<{$start}>"
		   >
		        <span class="otherlink glyphicon glyphicon-eye-open">
			</span>
			<{$smarty.const._MERGE_LIST_CHECK_MESSAGE}>
		</a>
	    </span>
	    <{/if}>
	    <{if $data.no_perm || ($data.no_perm && $data.for_admin)}>
	    <span class="text-success">
		<a class="otherlink" title="<{$smarty.const._MERGE_LIST_LEAVE_MESSAGE}>"
		   href="<{$origuri}>&wo=<{$wo}>&id=<{$data.rec_id}>"
		   >
                        <span class="glyphicon glyphicon-eye-open"></span>
			<{$smarty.const._MERGE_LIST_LEAVE_MESSAGE}>
		</a>
	    </span>&nbsp;
	    <span>
		<span class="glyphicon glyphicon-user"></span>
                <{if $data.for_admin}>
		<{$data.uname}><{$smarty.const._MERGE_LIST_CREATE_BY}>
		<{else}>
                <{$data.uname}><{$smarty.const._MERGE_LIST_CREATE_BY}>
		<{/if}>
	    </span>
	    <{/if}>
	</h5>
    <{*/if*}>
    </div>
</div>

<!--<hr style="margin-top: 0px; margin-bottom: 15px; border-top: 1px solid #E5E5E5;" />-->
<{/foreach}>
<!-- *************************************************** End of 列表 -->

<!-- ****************************************** Start of 分頁(bottom) -->
<div style="display: inline-block;"><{$navPath}></div>
<!-- ****************************************** End of 分頁(bottom) -->

<!-- ********************************************** Start of comment -->
<div style="margin: 3px; padding: 3px;">
    <!-- start comments loop -->
    <{if $comment_mode == "flat"}>
      <{include file="db:system_comments_flat.html"}>
    <{elseif $comment_mode == "thread"}>
      <{include file="db:system_comments_thread.html"}>
    <{elseif $comment_mode == "nest"}>
      <{include file="db:system_comments_nest.html"}>
    <{/if}>
    <!-- end comments loop -->
</div>
<!-- ********************************************** End of comment -->

<{includeq file="db:dialogs.tpl"}>
