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
		include_once($subopFile);
            	break;
            default:
        }
    }
?>
