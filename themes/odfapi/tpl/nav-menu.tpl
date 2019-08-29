    <div class="navbar navbar-inverse global-nav navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button data-target="#main-navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="<{$xoops_url}>" class="navbar-brand xlogo" title="<{$xoops_sitename}>">
		    <{assign var="logo_url" value="`$xoops_url`/uploads/ndcodfapi.png"}>
		    <{assign var="logo_path" value="`$smarty.const.XOOPS_UPLOAD_PATH`/ndcodfapi.png"}>
		    <{if file_exists($logo_path)}>
                    <img src="<{$logo_url}>" alt="<{$xoops_sitename}>" style="height:42px;">
		    <{else}>
		    <span class="h3" style="color:#FFFFFF;font-weight:bold;"><{$xoops_sitename}></span>
		    <{/if}>
		    <p style="font-weight:bold;font-size:14px;text-align:center;"><{include file="/usr/share/loolwsd/version.txt"}></p>
                </a>
            </div>
            <div class="navbar-collapse collapse"  id="main-navbar-collapse">
		<{if $xoops_isuser|default:false}>
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="javascript:;"><{$smarty.const._THEME_MERGE_MI_MANAGE}><b class="caret"></b></a>
                        <ul id="xswatch-account-menu" class="dropdown-menu">
			    <{if $xoops_isadmin|default:false}>
                            <li><a href="<{$xoops_url}>/modules/merge/index.php?op=operate&subop=cate"><{$smarty.const._THEME_MERGE_MI_ADDNEWCATE}></a></li>
                            <li><a href="<{$xoops_url}>/modules/merge/index.php?op=operate&subop=group"><{$smarty.const._THEME_MERGE_MI_CATE}></a></li>
                            <li><a href="<{$xoops_url}>/modules/merge/index.php?op=operate&subop=user"><{$smarty.const._THEME_MERGE_MI_GROUP}></a></li>
			    <{/if}>
                            <li><a href="<{$xoops_url}>/modules/merge/index.php?op=operate&subop=upload"><{$smarty.const._THEME_MERGE_MI_UPLOAD}></a></li>
                            <li><a href="<{$xoops_url}>/modules/merge/index.php?op=operate&subop=list"><{$smarty.const._THEME_MERGE_MI_LIST}></a></li>
                        </ul>
                    </li>
		    <!-- 我的資料 -->
                    <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="javascript:;"><span class="glyphicon glyphicon-user"></span><{$smarty.const._THEME_MERGE_MI_MYPROFILE}><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<{$xoops_url}>/modules/profile/userinfo.php"><span class="glyphicon glyphicon-pencil"></span> <{$smarty.const._THEME_MERGE_MI_EDIT_PROFILE}></a></li>
                            <li><a href="<{$xoops_url}>/user.php?op=logout"><span class="glyphicon glyphicon-log-out"></span> <{$smarty.const._THEME_MERGE_MI_LOGOUT}></a></li>
                        </ul>
                    </li>
		    <{if $xoops_isadmin|default:false}>
		    <li><a href="<{$xoops_url}>/admin.php" title="<{$smarty.const._THEME_MERGE_MI_GOTO_BACKEND}>"><span class="glyphicon glyphicon-wrench"></span> <{$smarty.const._THEME_MERGE_MI_GOTO_BACKEND}></a></li>
		    <{/if}>
                    <!-- end custom menus -->
                </ul>
                <{if $xoops_search|default:false}>
                <form class="navbar-form navbar-right" role="search" action="<{xoAppUrl search.php}>" method="get">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="<{$smarty.const._THEME_MERGE_MI_SEARCH_HINT}>" name="query">
                        <span class="input-group-btn"><button type="submit" class="btn btn-default" aria-label="<{$smarty.const.THEME_SEARCH_TEXT}>">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button></span>
                    </div>
                    <input type="hidden" name="action" value="results">
                </form>
                <{/if}>
                <{/if}>
            </div>
        </div>
    </div>
