<h3><{$smarty.const._REPO_CATE_TITLE}></h3>
<div class="modal" id="editWin" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title" id="modalLabel"><{$smarty.const._REPO_CATE_CHANGEPAGE_TITLE}></h5>
      </div>
      <div class="modal-body">
        <input class="form-control" type="text" value="" cid="" origtitle="">
      </div>
      <div class="modal-footer">
        <button type="button" class="editabi btn btn-default btn-sm"><{$smarty.const._REPO_CATE_RENAME}></button>
        <button type="button" class="closewin btn btn-default btn-sm" data-dismiss="modal"><{$smarty.const._REPO_CATE_CLOSE}></button>
      </div>
    </div>
  </div>
</div>

<div class="row">
    <div class="text-nowrap">

    <table class="table" cellpadding="0" cellspacing="0">
        <!--<tr class="active">
			<th>新增類別</th>
			<th></th>
        </tr>-->
        <tr class="nowrap">
            <td>
                <input class="form-control" type="text" value="">
                <input type="hidden" name="cid" value="" cid="0" pid="0">
            </td>
            <td>
                <div class="input-group-btn">
                    <button class="updateabi btn btn-default"><span class="glyphicon glyphicon-plus"></span></button>
                </div>                
            </td>
        </tr>
    </table>

    <!-- *************************************** Start of 抬頭 & 分頁(top) -->
    <div style="display: inline-block;"><{$navPath}></div>
    <!-- *************************************** End of 抬頭 & 分頁(top) -->

    <table id="abilist" class="table table-striped" cellpadding="0" cellspacing="0">
        <tr class="active">
			<th style="width: 150px"><{$smarty.const._REPO_CATE_MAIN_CATE}></th>
			<th style="width: 100px"><{$smarty.const._REPO_CATE_OPERATE}></th>
        </tr>
        <{foreach from=$abis item=abi}>
        <tr class="nowrap">
            <{foreach from=$abi item=abicell name=abic}>
            <td>
                <div class="input-group input-group-sm">
                <{if $abicell.cid > 0}>
                    <span><{$abicell.title}></span>
                <{else}>
                    <span></span>
                    <input class="form-control" type="text" value="<{$abicell.title}>">
                <{/if}>
                    <input type="hidden" name="cid" value="<{$abicell.title}>" cid="<{$abicell.cid}>" pid="<{$abicell.pid}>">
                    <div class="input-group-btn">
                    </div>
                </div>
            </td>
            <{/foreach}>
            <td class="nowrap">
                <div class="btn-group btn-group-sm" role="group">
                    <button class="popupedit btn btn-default"><span class="glyphicon glyphicon-pencil"></span></button>
                    <button class="deleteabi btn btn-default"><span class="glyphicon glyphicon-trash"></span></button>
                </div>
            </td>
        </tr>
        <{/foreach}>
    </table>
    </div>

    <!-- *************************************** Start of 抬頭 & 分頁(top) -->
    <div style="display: inline-block;"><{$navPath}></div>
    <!-- *************************************** End of 抬頭 & 分頁(top) -->

</div>

<script>
var origuri = '<{$origuri}>';
var inputid = 'input[type=text]';
var hidevarsid = 'input[type=hidden]';
var table = $('#abilist');

// default defines for ajax
$.ajaxSetup({type: 'POST', async: false, dataType: 'json'});


/*
 * Quick ref. to http://url/.../...&wo=op
 *
 * @param op str
 * @return str
 */
function parseUri(op)
{
    return origuri + '&wo=' + op;
}


/*
 * 傳回該列最後一層有類別的 cid
 *
 * @param tr jquery tr
 * @return int
 */
function rowLastCid(tr)
{
    var cid;

    // 若 row 為 header (裡面沒有 input) 則 cid 沒處理過 = undefined
    tr.find(hidevarsid).each(function(){
        var id = $(this).attr('cid');
        if(id > -1)  cid = id;  // 該列最後一個 cid > -1 才是最後一個
    });
    return cid;
}


/*
 * 將表格內的（每一列最後一層類別） cid 傳給 php 做排序
 *
 * via ajax
 *
 * @param table jquery table
 */
function sortAbis(table)
{
    var cids = [];
    table.find('tr').each(function(){  // 找每一列每一格的 cid > -1
        var cid = rowLastCid($(this));
        if(typeof cid != 'undefined')  // 若該列全都沒有 cid, 該列就是 header
            cids.push(cid);
    });
    //console.log(cids);
    $.ajax({url: parseUri('sortabi'), data: {'cids': cids}});
}


/*
 * 收集要更新的類別： 從右到左（第一層到最後層）開始
 *
 * @param row_inputs jquery input
 */
function collect_inputabis(row_inputs)
{
    var list = [], err = false, emptycount = 0;

    row_inputs.each(function(idx){
        var hidevars = $(this).parent()  // div
			      .find(hidevarsid);
        var cid = hidevars.attr('cid');
        var pid = hidevars.attr('pid');
        var title = $.trim($(this).val());
        var prevtitle = $.trim(row_inputs.eq(idx - 1).val());

        if(idx > 0 && -1 == pid && title != '' && '' == prevtitle)
        {  // 新增資料要檢查前一個是否也沒資料
            alert('<{$smarty.const._REPO_CATE_WARN_PARENT}>');
            err = true;
            return;
        }
        if(title == '')
            emptycount ++;  // 全部類別都沒填就不更新
        else
            list.push({'cid': cid, 'pid': pid, 'title': title});
    });
    if(err || 0 == list.length || emptycount == row_inputs.length)
        return [];
    return list;
}


/*
 * 更新（新增）類別 via ajax
 */
//$('.updateabi').live('click', function(){
$(document).on('click', '.updateabi', function(){
    console.log("$('.updateabi').click");
    var tr = $(this).parent()  // div
		    .parent()  //td
		    .parent();
    var row_inputs = tr.find(inputid);
    var title = row_inputs.val();
    if(0 == title.length)
        return;

    $.ajax({
        url: parseUri('updateabi'),
        data: {'title': title},
        success:function(data){
            if(!data.status)
            {
                alert('<{$smarty.const._REPO_CATE_WARN_FAIL_UPDATE}>');
                alert(data.ret);
                return;
            }
            location.reload();
        }
    });
});


/*
 * 類別是否有報表? via ajax
 *
 * @param cid int
 * @return bool
 */
function abiHasQuestion(cid)
{
    var exist = false;

    $.ajax({
        url: parseUri('abihasquestion'),
        data: {'cid': cid},
        success:function(hasquestion){
            if(hasquestion)  exist = true;
        }
    });
    return exist;
}


/*
 * 刪除類別 via ajax
 */
//$('.deleteabi').live('click', function(){
$(document).on('click', '.deleteabi', function(){
    console.log("$('.deleteabi').click");
    if(!confirm("<{$smarty.const._REPO_CATE_WARN_DELETE}>"))  return;

    var cid = rowLastCid($(this).parent()  // div
				.parent()  // td
				.parent());
    if(abiHasQuestion(cid))
    {
        alert('<{$smarty.const._REPO_CATE_WARN_CHILD}>');
        return;
    }
    var hidevars = $(hidevarsid + '[cid=' + cid + ']');

    $.ajax({
        url: parseUri('deleteabi'),
        data: {'cid': cid},
        success:function(data){
            if(!data.status)
            {
                alert("<{$smarty.const._REPO_CATE_WARN_DB_ERROR}>");
                return;
            }
            var td = hidevars.parent()  // div
			     .parent();
            if(data.delete)
            {  // 可以刪除整列：該列類別與其他類別重複了
                td.parent().remove();
                sortAbis(table);
                return;
            }
            window.location.replace(location.href);
        }
    });
});



/*
 * 類別更名(按了浮動視窗的更名) via ajax
 */
$('.editabi').click(function(){
    var input = $(this).parent()  // div
		       .parent()  // div
		       .find('input');
    var cid = input.attr('cid');
    var title = $.trim(input.val());
    if(title == $.trim(input.attr('origtitle')))
    {  // 原名字沒變更則關閉
        $('.closewin').trigger('click');
        return;
    }
    console.log(cid);
    console.log(title);

    $.ajax({
        url: parseUri('editabi'),
        data: {'cid': cid, 'title': title},
        success:function(data){
            console.log(data);
            if(!data['status'])
            {
                alert('<{$smarty.const._REPO_CATE_WARN_DUPLICATED}>');
                return;
            }
            $('input[cid=' + cid + ']')  // 更名後，全部一樣 cid 的都要更新
                .val(title)  // 更新隱藏欄位
                .each(function(){  // 更新顯示的
                    $(this).parent().find('span').eq(0).text(title);
                });
        }
    });
    $('.closewin').trigger('click');
});


/*
 * 顯示更名浮動視窗
 */
//$('.popupedit').live('click', function(event){
$(document).on('click', '.popupedit', function(event){
    console.log("$('.popupedit').live('click')");

    var hidevars = $(this).parent()  // div
			  .parent()  // div
			  .parent()  // td
			  .find(hidevarsid);
    var cid = hidevars.attr('cid');
    var title = hidevars.val();

    if(-1 == cid)  return;

    var div = $('.editabi').parent()  // div
			   .parent();
    // 帶入 title, cid
    div.find('input').val(title).attr('origtitle', title).attr('cid', cid);
    $('#editWin').modal('show');
});


</script>
