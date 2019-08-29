<h3><{$smarty.const._MERGE_CATE_TITLE}></h3>
<div class="modal" id="editWin" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title" id="modalLabel"><{$smarty.const._MERGE_CATE_CHANGEPAGE_TITLE}></h5>
      </div>
      <div class="modal-body">
        <input class="form-control" type="text" value="" cid="" origtitle="">
      </div>
      <div class="modal-footer">
        <button type="button" class="editabi btn btn-default btn-sm"><{$smarty.const._MERGE_CATE_RENAME}></button>
        <button type="button" class="closewin btn btn-default btn-sm" data-dismiss="modal"><{$smarty.const._MERGE_CATE_CLOSE}></button>
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
			<th style="width: 150px"><{$smarty.const._MERGE_CATE_MAIN_CATE}></th>
			<th style="width: 100px"><{$smarty.const._MERGE_CATE_OPERATE}></th>
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
                        <!--<button class="clone btn btn-default"><span class="glyphicon glyphicon-plus"></span></button>
                        <button class="popupedit btn btn-default"><span class="glyphicon glyphicon-pencil"></span></button>
                        <button class="deleteabi btn btn-default"><span class="glyphicon glyphicon-trash"></span></button>-->
                    </div>
                </div>
            </td>
            <{/foreach}>
            <td class="nowrap">
                <div class="btn-group btn-group-sm" role="group">
                    <!--<button class="updateabi btn btn-default"><span class="glyphicon glyphicon-pencil"></span></button>-->
                    <button class="popupedit btn btn-default"><span class="glyphicon glyphicon-pencil"></span></button>
                    <button class="deleteabi btn btn-default"><span class="glyphicon glyphicon-trash"></span></button>
                    <!--<button class="sort btn btn-default" dir="up">↑</button>
                    <button class="sort btn btn-default" dir="down">↓</button>-->
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
            alert('<{$smarty.const._MERGE_CATE_WARN_PARENT}>');
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
    var list = collect_inputabis(row_inputs);
    if(0 == list.length)
        return;

    $.ajax({
        url: parseUri('updateabi'),
        data: {'list': list},
        success:function(data){
            if(!data.status)
            {
                alert('<{$smarty.const._MERGE_CATE_WARN_FAIL_UPDATE}>');
                alert(data.ret);
                return;
            }
            location.reload();
            /* @TODO: 暫時沒用到
            data = data.ret;
            for(var idx = 0; idx < data.length; idx++)
            {  // 傳回的類別順序也是從第一層到最後一層, 跟 row_inputs 一樣順序
                var td = row_inputs.eq(idx).parent();
                td.find('span').eq(0).text(data[idx]['title']);  // 更新顯示的 title
                td.find(hidevarsid)  // 更新本層的 cid & pid
                  .attr('cid', data[idx].cid)
                  .attr('pid', data[idx].pid)
                  .val(data[idx]['title']);  // 更新名稱：修改名稱功能帶入用
                row_inputs.eq(idx + 1).parent()  // 也要設定下一層的 pid 
                     .find('input').attr('pid', data[idx].cid);
                row_inputs.eq(idx).remove(); // 最後移除編輯(input)欄位
            }
            sortAbis(table);
            */
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
    if(!confirm("<{$smarty.const._MERGE_CATE_WARN_DELETE}>"))  return;

    var cid = rowLastCid($(this).parent()  // div
				.parent()  // td
				.parent());
    if(abiHasQuestion(cid))
    {
        alert('<{$smarty.const._MERGE_CATE_WARN_CHILD}>');
        return;
    }
    var hidevars = $(hidevarsid + '[cid=' + cid + ']');

    $.ajax({
        url: parseUri('deleteabi'),
        data: {'cid': cid},
        success:function(data){
            if(!data.status)
            {
                alert("<{$smarty.const._MERGE_CATE_WARN_DB_ERROR}>");
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
            /* @TODO: 暫時沒用到
            var inputtext = hidevars.clone();
            inputtext.attr('type', 'text').val('');  // 還原輸入框
            inputtext.addClass('form-control');  // boostrap class

            td.find('span').text('');  // 刪除後清空顯示的類別
            td.find('div').eq(0).prepend(inputtext);  // 放回輸入框
            td.find('input').attr('cid', '-1');
            td.next().find('input').attr('cid', '-1').attr('pid', '-1');
            sortAbis(table);
            */
        }
    });
});


/*
 * 複製一列
 */
//$('.clone').live('click', function(){
$(document).on('click', '.clone', function(){
    var td = $(this).parent()  // div
		    .parent()  // div
		    .parent();
    var tr = td.parent();
    var content = tr.clone();
    var cid = td.find(hidevarsid).attr('cid');

    if(td.find(inputid).length > 0)
    {
        alert('<{$smarty.const._MERGE_CATE_WARN_COPY}>');
        return;
    }

    td = content.find(hidevarsid + '[cid=' + cid + ']')
		.parent()  // div
		.parent();
    for(var cur_td = td, clean = 0; ; )  // 每個 td 依序處理
    {
        if(0 == cur_td.find(hidevarsid).length)
            break;  // td 裡面是 op 按鈕
        if(cur_td.find(hidevarsid).attr('cid') == cid)
        {  // 點到 ＋ 自己所在的 td
            pid = cur_td.find(hidevarsid).attr('pid');
            clean ++;  // 才開始轉成輸入框
        }
        if(!clean)  continue;  // 前面層的都不處理

        pid = clean == 1 ? pid : -1;  // 開始處理的第一個 pid 不清空，之後的清掉

        if(0 == cur_td.find(inputid).length)  // 轉成輸入框
            cur_td.find('div').eq(0)
		  .prepend('<input class="form-control" type="text" cid="" pid="">');

        cur_td.find('span').eq(0).text('');
        cur_td.find('input').attr('cid', -1).attr('pid', pid);

        cur_td = cur_td.next();
        clean ++;
    }
    tr.after(content);
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

    $.ajax({
        url: parseUri('editabi'),
        data: {'cid': cid, 'title': title},
        success:function(data){
            console.log(data);
            if(!data)
            {
                alert('<{$smarty.const._MERGE_CATE_WARN_DUPLICATED}>');
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


/*
 * 排序 - 上下按鈕
 */
//$('.sort').live('click', function(){
$(document).on('click', '.sort', function(){
    console.log("$('.sort').live('click'");
    var op = $(this).attr('dir');
    var buf, target;
    var tr = $(this).parent()  // div
		    .parent()  // td
		    .parent();

    target = 'up' == op ? tr.prev() : tr.next();  // 上或下?

    if(0 == target.find('input').length)
        return;
    buf = target.html();
    target.html(tr.html());
    tr.html(buf);

    sortAbis(table);
});
</script>
