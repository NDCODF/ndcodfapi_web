<?php
/**
 * =======================================================================
 * Name: see below
 *
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */
defined('XOOPS_ROOT_PATH') or die('Restricted access');

require_once('database_base.class.php');


/*
 * 群組指派
 *
 * usage:
 *
 * [modify/add one record]
 * $grp = new Group($id);

 * // 指派 B,D,E 群組給 A 群組
 * $grp->set('permit_gid', array(1,2,3));
 * $grp->update();
 *
 * echo $qinfo->get('permit_gid');
 */
class Group extends BaseDataBaseDataManipulation
{
    /**
     * Constructor
     *
     * @param cid int main key of table
     */
    public function __construct($cid)
    {
        $this->fields = array(  // 欄位列表: 給 update() 列欄位用
                'group_id' => null,
                'permit_gid' => null,
            );
        parent::__construct($cid, 'group_id');
        $this->loadVars();
    }


    /**
     * A shortcut to table of category
     *
     * @return string
     */
    protected function tbl()
    {
        global $xoopsDB;
        return $xoopsDB->prefix('merge_group_permit');
    }


    /**
     * get value of field.
     *
     * @param field str
     */
    public function get($field)
    {
        $ret = array();
        foreach (explode(',', parent::get($field)) as $value)
        {
            if (!empty($value))
            {
                $ret[] = $value;
            }
        }
        return $ret;
    }

    /**
     * get value of field.
     *
     * @param field str
     */
    public function set($field, $value)
    {
        if (is_array($value))
            parent::set($field, implode(',', $value));
        else
            parent::set($field, $value);
        return false;
    }

    /**
     * 載入所需資料
     */
    private function loadVars()
    {
        global $xoopsDB;

        $sql = "SELECT * FROM {$this->tbl()} WHERE group_id={$this->id}";
        $rs = $xoopsDB->queryF($sql) or die($xoopsDB->error());
        $row = $xoopsDB->fetchArray($rs);

        $this->set('permit_gid', $row['permit_gid']);
    }

    /**
     * 更新資料：新增或更新
     */
    public function update()
    {
        global $xoopsDB;

        $sql = "DELETE FROM {$this->tbl()} WHERE group_id={$this->id}";
        $xoopsDB->queryF($sql) or die($xoopsDB->error());
        $this->set('group_id', $this->id);
        return parent::insert();
    }
}
?>
