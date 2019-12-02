<ul class="nav nav-pills nav-stacked">
    <li class="<{if !$block.nothome}>active<{/if}>"><a href="<{xoAppUrl }>" title="<{$block.lang_home}>"><span
                    class="glyphicon glyphicon-home"></span> <{$block.lang_home}></a></li>
<{if $xoops_isadmin|default:false}>
    <li class="<{if !$block.nothome}>active<{/if}>"><a href="<{$xoops_url}>/admin.php" title="系統管理"><span
                    class="glyphicon glyphicon-wrench"></span> 系統管理</a></li>
<{/if}>
    <li class="<{if !$block.nothome}>active<{/if}>"><a href="<{$xoops_url}>/user.php?op=logout" title="登出"><span
                    class="glyphicon glyphicon-log-out"></span> 登出</a></li>
    <!-- start module menu loop -->
    <{foreach item=module from=$block.modules}>
        <li class="<{if $module.highlight}>active<{/if}>">
            <a href="<{$xoops_url}>/modules/<{$module.directory}>/" title="<{$module.name}>"><span class="glyphicon glyphicon-ok"></span>
                <{$module.name}>
            </a>
            <ul>
                <{foreach item=sublink from=$module.sublinks}>
                    <li>
                        <a class="dropdown" href="<{$sublink.url}>" title="<{$sublink.name}>"><{$sublink.name}></a>
                    </li>
                <{/foreach}>
            </ul>
        </li>
    <{/foreach}>
    <!-- end module menu loop -->
</ul>
