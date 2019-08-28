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
 * 報表/範本記錄管理
 *
 * usage:
 *
 * [add new record]
 * $doc = new Documents;
 * $doc->set('title', 'title');
 * $doc->update();
 *
 * [modify one record]
 * $doc = new Documents($id);
 * $doc->set('title', 'title');
 * $doc->update();
 *
 * echo $qinfo->get('extname');
 * echo $qinfo->get('endpt');
 */
class Documents extends BaseDataBaseDataManipulation
{
    /**
     * Constructor
     *
     * @param cid int main key of table
     */
    public function __construct($cid=null)
    {
        $this->fields = array(  // 欄位列表: 給 update() 列欄位用
                'uid' => null,
                'cid' => null,
                'title' => null,
                'desc' => null,
                'endpt' => null,
                'docname' => null,
                'extname' => null,
                'upcount' => null,
                'callcount' => null,
                'hide' => null
            );
        parent::__construct($cid, 'rec_id');
        if(!$this->isNew)
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
        return $xoopsDB->prefix('merge_user_templates');
    }


    /**
     * 載入所需資料
     */
    private function loadVars()
    {
        global $xoopsDB;

        $sql = "SELECT * FROM {$this->tbl()} WHERE rec_id={$this->id}";
        $rs = $xoopsDB->queryF($sql) or die($xoopsDB->error());
        $row = $xoopsDB->fetchArray($rs);

        $data = $row;
        $this->set('title', $data['title']);
        $this->set('docname', $data['docname']);
        $this->set('extname', $data['extname']);
        $this->set('endpt', $data['endpt']);
        $this->set('upcount', $data['upcount']);
        $this->set('callcount', $data['callcount']);
        $this->set('hide', $data['hide']);
    }


    /**
     * get('docfile')
     */
    public function getDocFile()
    {
        global $xoopsModuleConfig;
        return sprintf("%s/%s.%s",
                    $xoopsModuleConfig['doctemplatedir'],
                    $this->get('endpt'), $this->get('extname'));
    }
}
?>
