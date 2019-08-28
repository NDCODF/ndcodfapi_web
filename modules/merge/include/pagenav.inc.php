<?php
defined('XOOPS_ROOT_PATH') || exit('Restricted access');

include_once(XOOPS_ROOT_PATH . "/class/pagenav.php");

/**
 * Page Nav Class for making bootstrap css
 */
class MergePageNav extends XoopsPageNav
{
    public function __construct($total_items, $items_perpage,
                                $current_start, $start_name = 'start',
                                $extra_arg = '')
    {
        parent::__construct($total_items, $items_perpage,
                            $current_start, $start_name, $extra_arg);
    }

    /**
     * Create text navigation for bootstrap css
     *
     * @param  integer $offset
     * @return string
     */
    public function renderNav($offset = 4)
    {
        $ret = '';
        if ($this->total <= $this->perpage)
            return $ret;

        if (($this->total != 0) && ($this->perpage != 0))
        {
            $total_pages = ceil($this->total / $this->perpage);
            if ($total_pages > 1)
            {
                $ret .= '<ul class="pagination pagination-s" style="height_: 8px;">';

                $prev = $this->current - $this->perpage;

                if ($prev >=0)
                {
                    $ret .= '<li><a href="' . $this->url . 0 .
                            $this->extra . '" title="第一頁"><u>&laquo;</u></a></li> ';
                    $ret .= '<li '. $disabled .'><a href="' . $this->url . $prev .
                            $this->extra . '" title="前一頁"><u>&lsaquo;</u></a></li> ';
                }
                else
                {
                    $ret .= '<li class="disabled"><a href="#" title="第一頁"><u>&laquo;</u></a></li> ';
                    $ret .= '<li class="disabled"><a href="#" title="前一頁"><u>&lsaquo;</u></a></li> ';
                }
                $counter      = 1;
                $current_page = (int)floor(($this->current +
                                    $this->perpage) / $this->perpage);
                while ($counter <= $total_pages)
                {
                    if ($counter == $current_page)
                    {
                        $ret .= '<li class="active" ><a href="#">第' .
                                $counter . '頁</a></li> ';
                    }
                    elseif (($counter > $current_page - $offset &&
                             $counter < $current_page + $offset) ||
                             $counter == 1 || $counter == $total_pages)
                    {
                        if ($counter == $total_pages &&
                            $current_page < $total_pages - $offset)
                        {
                            $ret .= '<li class="disabled"><a href="#">...</a></li>';
                        }
                        $ret .= '<li><a href="' . $this->url .
                                (($counter - 1) * $this->perpage) .
                                $this->extra . '">第' .
                                $counter . '頁</a></li> ';
                        if ($counter == 1 && $current_page > 1 + $offset)
                        {
                            $ret .= '<li class="disabled"><a href="#">...</a></li>';
                        }
                    }
                    ++$counter;
                }
                $next = $this->current + $this->perpage;
                if ($this->total > $next)
                    $ret .= '<li><a href="' . $this->url . $next .
                            $this->extra . '" title="後一頁"><u>&rsaquo;</u></a></li> ';
                else
                    $ret .= '<li class="disabled"><a href="#" title="後一頁"><u>&rsaquo;</u></a></li> ';

                $counter = 1;
                while ($counter < $total_pages)
                    $counter ++;

                if ($this->total > $next)
                    $ret .= '<li><a href="' . $this->url .
                            (($counter - 1) * $this->perpage) .
                            $this->extra . '" title="最後頁"><u>&raquo;</u></a></li> ';
                else
                    $ret .= '<li class="disabled"><a href="#" title="最後頁"><u>&raquo;</u>' .
                            '</a></li> ';
                $ret .= '</ul> ';
            }
        }

        return $ret;
    }

}
?>
