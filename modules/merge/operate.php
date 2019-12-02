<?php
    if (!empty($subop) && file_exists($subopFile))
    {
        switch($subop)
	{
	    case 'upload':
	    case 'list':
	    case 'setsta':
	    case 'perm':
	    case 'sample':
	    case 'cate':
	    case 'group':
	    case 'user':
        case 'landing':
	    case 'repo_upload':
	    case 'repo_list':
	    case 'repo_cate':
	    case 'repo_group':
	    case 'repo_user':
	    case 'repo_setsta':
		include_once($subopFile);
            	break;
            default:
        }
    }
?>
