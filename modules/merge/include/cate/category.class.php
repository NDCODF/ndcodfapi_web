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
require_once('include/database_base.class.php');
include_once(XOOPS_ROOT_PATH . '/class/xoopstree.php');


/*
 * 處理單筆分類的物件
 * usage:
 * 
 * $cate = new Category;
 * echo $cate->title();
 * echo $cate->cid();
 * 
 * [add new record]
 * $cate = new Category;
 * $cate->set('pid', 5);
 * $cate->set('title', 'edu_level');
 * $cate->set('created');  // default set to NOW()
 * $cate->update();  // insert
 *
 * [modify one record]
 * $cate = new Category($cid);
 * $cate->set('title', 'edu_level');
 * $cate->set('created');  // default set to NOW()
 * $cate->update();  // modify
 * 
 * [delete a record]
 * $cate = new Category($cid);
 * $cate->delete();  // force delete
 * $cate->delete(false);  // only set delete to 'Y'
 */
class Category extends BaseDataBaseDataManipulation
{
    /**
     * Constructor
     *
     * @param cid int main key of table
     */
    public function __construct($cid=null)
    {
        $this->fields = array(  // 欄位列表: 給 update() 列欄位用
            'pid' => null,
            'title' => null,
            'created' => null,
            'deleted' => null,
            'uid' => null,
            'ordinal' => null
        );
        parent::__construct($cid, 'cid');
    }

    /**
     * A shortcut to table of category
     * 
     * @return string
     */
    protected function tbl()
    {
        global $xoopsDB;
        return $xoopsDB->prefix("merge_category");
    }


    /**
     * 取得分類 cid
     * 
     * @return int
     */
    public function cid()
    {
        return $this->id;
    }


    /**
     * 取得分類名稱
     * 
     * @return str
     */
    public function title()
    {
        //return getSpecificColumn($this->tbl(), 'title', 'cid', $this->id);
        global $xoopsDB;

        $sql = "SELECT title FROM {$this->tbl()} WHERE cid={$this->id}";
        $rs = $xoopsDB->queryF($sql);
        if (!$rs)
            return '';
        $row = $xoopsDB->fetchArray($rs);
        return $row['title'];
    }


    /**
     * sql: delete record
     * force=false: 資料庫更新 deleted='Y', 不直接刪除
     * force=true: 直接刪除
     * 
     * @param force bool
     */
    public function delete($force=true)
    {
        if(is_null($this->id))
            return;
        if($force)
        {
            //commonDeleteSql($this->tbl(), 'cid', $this->id);
            $sql = "DELETE FROM {$this->tbl()} WHERE cid='{$this->id}'";
        }
        else
        {
            $sql = "UPDATE {$this->tbl()} SET deleted='Y'
                    WHERE cid='{$this->id}'";
        }
        global $xoopsDB;
        $xoopsDB->queryF($sql) or error_log($xoopsDB->error());
    }
}
?>
