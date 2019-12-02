<?php
/**
 * =======================================================================
 * Name: 分類相關物件
 * 
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */
defined('XOOPS_ROOT_PATH') or die('Restricted access');
include_once(XOOPS_ROOT_PATH . '/class/xoopstree.php');


/*
 * category manager
 * usage:
 * 
 * $cadmin = new CateAdmin('edu_level');
 * $sql = $cadmin->sql();
 * queryData($sql);
 * $sql = $cadmin->sql('', 10, 10, 1, 'Y');
 * queryData($sql);
 * 
 * $cadmin = new CateAdmin('edu_level');
 * 
 * // level=2: subcode = version
 * $data = $cadmin->getList(2, $pid, 'version');
 * 
 * // get pid by code
 * $cadmin = new CateAdmin('volume');
 * $pid = $cadmin->pid();
 *
 * // get cid by map_cid and code
 * $cid = $cadmin->cid($map_cid);
 * 
 * // get map_cid by cid
 * $map_cid = CateAdmin::map_cid($cid);
 * 
 * // sorted list
 * print($cadmin->getSortedListByCid($cid);
 */
class CateAdmin
{
    private $code;

    /**
     * Constructor
     * 
     * @param code string
     */
    public function __construct($code)
    {
        $this->code = $code;
    }

    /**
     * A shortcut to table of category
     * 
     * @return string
     */
    private function tbl()
    {
        global $xoopsDB;
        return $xoopsDB->prefix("repo_category");
    }

    /**
     * get XoopsTree object
     * 
     * @return tree object
     */
    protected function tree()
    {
        $tree = new XoopsTree($this->tbl(), 'cid', 'pid');
        return $tree;
    }

    /*
     * 依主 code 查詢所屬第 n 層的資料
     * ex: 教育程度就是查詢國中, 高中...
     * 
     * @param search_title string 查詢的分類名稱
     * @param start int used for limit
     * @param limit int used for limit
     * @param level int 指定第 n 層
     * @param deleted string Y/N
     * @return string sql statement
     */
    public function sql($search_title='', $start=0, $limit=0,
                                            $level=1, $deleted='N')
    {
        // 鎖定範圍為該分類的 cid
        $pid = $this->pid();
        $cids = array(0);
        foreach($this->tree()->getChildTreeArray($pid) as $child)
            if(strlen($child['prefix']) == $level)  // 判斷層數
                $cids[] = $child['cid'];
        $cids4Search = implode(",", $cids);
        
        $query = '';
        if(!empty($search_title))
            $query = "AND title='{$search_title}'";

        $SQL = "SELECT * FROM {$this->tbl()} 
                WHERE cid in ({$cids4Search}) /*AND pid>0*/
                    AND `deleted`='{$deleted}' {$query}";

        if($start > 0 || $limit > 0)
            $SQL .= " limit {$start},{$limit}";

        return $SQL;
    }

    /**
     * 排序指定的 cids 列表: 排序依照分類表內的排序欄位
     * 
     * @param $ids array
     * @return array
     */
    static public function getSortedListByCid($ids)
    {
        global $xoopsDB;

        $sql = sprintf("SELECT cid FROM %s WHERE cid IN (%s)
                        ORDER BY ordinal",
                        $xoopsDB->prefix('repo_category'),
                        implode(',', $ids));
        $rs = $xoopsDB->queryF($sql);
        $data = array();
        if(!$rs || 0 == $xoopsDB->getRowsNum($rs))
            return $data;

        while(list($cid) = $xoopsDB->fetchRow($rs))
            $data[] = $cid;
        return $data;
    }
}
?>
