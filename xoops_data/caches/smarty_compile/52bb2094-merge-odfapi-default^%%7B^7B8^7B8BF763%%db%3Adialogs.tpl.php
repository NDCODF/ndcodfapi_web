<?php /* Smarty version 2.6.30, created on 2018-12-16 05:40:10
         compiled from db:dialogs.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_options', 'db:dialogs.tpl', 159, false),)), $this); ?>
<!-- confirm for delete window -->
<div class="modal fade" id="deleteWin" tabindex="-1" role="dialog" >
  <div class="modal-dialog modal-xs" style="width: 20%;">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body" style="padding: 0px;">
	<h6>
        確認刪除？
	</h6>
      </div>
      <div class="modal-footer">
	<button type="button" data-dismiss="modal"
		class="btn btn-primary btn-xs" id="delete">
	    確認
	</button>
	<button type="button" data-dismiss="modal" class="btn btn-xs">
	    取消
	</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- api/yaml window -->
<div class="modal fade" id="apiWin" tabindex="-1" role="dialog" >
  <div class="modal-dialog modal-lg" style="width: 80%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	</button>
        <h4 class="modal-title">&nbsp;</h4>
      </div>
      <div class="modal-body" style="padding: 0px;">

      <div class="input-group">
	<span class="input-group-addon">API 名稱</span>
	<input class="form-control docname" type="text" readonly
	       placeholder="由列表選擇 api 或 json 以顯示文件名" />
      </div>
      <div class="input-group">
	<span class="input-group-addon">API 位置</span>
	<input class="form-control oxoolurl" type="text" readonly
	       placeholder="由列表選擇 api 或 json 以顯示 REST 位置" />
	<span class="input-group-addon">
	    <a href="#" class="glyphicon glyphicon-copy copylink"
	       data-placement="auto top" data-toggle="popover"
	       title="已複製"></a>
	</span>
      </div>
      <br />

      <div style="display: flex">
	<div style="width: 50%;">
	    <span class="badge">YAML 格式說明</span>
	    <div class="input-group">
		<textarea class="form-control yamlcontent" rows="20">
		</textarea>
		<span class="input-group-addon">
		    <a href="#" title="已複製"
		       class="glyphicon glyphicon-copy copylink"
		       data-placement="auto top"
		       data-toggle="popover"></a>
		</span>
	    </div>
	</div>
	<div style="width: 50%;">
	    <span class="badge">Json 格式說明</span>
	    <div class="input-group">
		<textarea class="form-control jsoncontent" rows="20">
		</textarea>
		<span class="input-group-addon">
		    <a href="#" title="已複製"
		       class="glyphicon glyphicon-copy copylink"
		       data-placement="auto top" data-toggle="popover">
		    </a>
		</span>
	    </div>
	</div>
      </div>

    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">
	    關閉
	</button>
    </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- json sample window -->
<div class="modal fade" id="jsonWin" tabindex="-1" role="dialog" >
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	</button>
        <h4 class="modal-title">&nbsp;</h4>
      </div>
      <div class="modal-body" style="padding: 0px;">

      <div class="input-group">
	<span class="input-group-addon">API 名稱</span>
	<input class="form-control docname" type="text"
	       placeholder="由列表選擇 api 或 json 以顯示文件名" readonly />
      </div>
      <div class="input-group">
	<span class="input-group-addon">API 位置</span>
	<input class="form-control oxoolurl" type="text" readonly
	       placeholder="由列表選擇 api 或 json 以顯示 REST 位置" />
	<span class="input-group-addon">
	    <a href="#" class="glyphicon glyphicon-copy copylink"
	       data-placement="auto top" data-toggle="popover"
	       title="已複製"></a>
	</span>
      </div>
      <br />

      <div id="jsonheader" class="alert alert-info"></div>
      <div style="width: 100%">
	<span class="badge">Json 範例</span>
	<div class="input-group">
	    <textarea class="form-control jsoncontent" rows="15">
	    </textarea>
	    <span class="input-group-addon">
		<a href="#" class="glyphicon glyphicon-copy copylink"
		   data-placement="auto top" data-toggle="popover"
		   title="已複製"></a>
	    </span>
	</div>
      </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">
	    關閉
	</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- permission window -->
<div class="modal fade" id="permWin" tabindex="-1" role="dialog" >
  <div class="modal-dialog modal-lg" style="width: 20%">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">&nbsp;分享給...</h4>
      </div>
      <div class="modal-body" style="padding: 0px;">
	  <form method="post" action="index.php?op=operate&subop=perm">
	    <select class="form-control" name="uids[]"
		    size="10" multiple="multiple">
		<?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['userlist']), $this);?>

	    </select>
	    <input type="hidden" name="id" value="" />
	    <input type="hidden" name="wo" value="update" />
	    <input class="form-control" type="submit"
                   name="" value="更新" />
	  </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">
	    關閉
	</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- modify window -->
<div class="modal fade" id="editWin" tabindex="-1" role="dialog" >
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">&nbsp;修改資料</h4>
      </div>
      <div class="modal-body" style="padding: 0px;">
      <?php $this->_smarty_include(array('smarty_include_tpl_file' => "db:main.tpl", 'smarty_include_vars' => array('modify' => true)));
 ?>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->