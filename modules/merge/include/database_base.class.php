<?php
/**
 * =======================================================================
 * Name: See description of class BaseDataBaseDataManipulation
 *
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */
defined('XOOPS_ROOT_PATH') or die('Restricted access');


/*
 * Base Class for SQL insert/modify/get/set
 */
class BaseDataBaseDataManipulation
{
    protected $id = null;  // 主 key
    protected $idfield = null;  // 主 key 欄位名稱
    protected $isNew = true;  // 是否為新紀錄
    protected $fields = array();


    /**
     * Constructor
     *
     * @param id int
     * @param idfield str
     */
    public function __construct($id, $idfield)
    {
        $this->id = $id;
        $this->idfield = $idfield;
        $this->isNew = is_null($id);
    }


    /**
     * A shortcut to table
     *
     * @return string
     */
    protected function tbl()
    {
        return 'dummy_table';
    }


    /**
     * get value of field.
     *
     * @param field str
     */
    public function get($field)
    {
        if(!array_key_exists($field, $this->fields))
            return null;

        if(array_key_exists($field, $this->fields))
            return $this->fields[$field];
    }


    /**
     * set value of field.
     * 欄位若是 created, 則值可不設定: 內建預設為 NOW()
     *
     * @param field string
     * @param value any
     */
    public function set($field, $value=null)
    {
        if(!array_key_exists($field, $this->fields))
            return;

        if('created' == $field && is_null($value))
            $value = 'NOW()';
        $this->fields[$field] = $value;
    }


    /**
     * sql: insert record
     *
     * 只 insert set() 有指定過的欄位
     *
     * insert 成功後，id 會紀錄
     *
     * @return bool
     */
    protected function insert()
    {
        global $xoopsDB;
        $field_title = array();
        $field_value = array();

        foreach($this->fields as $field => $value)
        {
            if(is_null($value))
                continue;

            $field_title[] = "`$field`";

            if('created' == $field && 'NOW()' == $value)
                $field_value[] = $value;
            else
                $field_value[] = "'{$value}'";
        }
        if(0 == count($field_title))
            return;

        $query_title = implode(",", $field_title);
        $query_value = implode(",", $field_value);
        $sql = "INSERT INTO {$this->tbl()}
                    ({$query_title}) VALUES ({$query_value})";
        $rs = $xoopsDB->queryF($sql);
        if($rs)
            $this->id = $xoopsDB->getInsertId();
        return $rs;
    }

    /**
     * sql: update record
     *
     * 只更新 set() 有指定過的欄位
     *
     * @return bool
     */
    protected function modify()
    {
        global $xoopsDB;
        $field_query = array();
        foreach($this->fields as $field => $value)
        {
            if(is_null($value))
                continue;

            if('created' == $field && 'NOW()' == $value)
                $field_query[] = "`{$field}`={$value}";
            else
                $field_query[] = "`{$field}`='{$value}'";
        }
        if(0 == count($field_query))
            return;

        $query = implode(",", $field_query);
        $sql = "UPDATE {$this->tbl()} SET {$query}
                WHERE {$this->idfield}='{$this->id}'";
        $rs = $xoopsDB->queryF($sql) or error_log($xoopsDB->error());
        return $rs;
    }


    /**
     * 更新資料：新增或更新
     */
    public function update()
    {
        if($this->isNew)  // insert for new
            return $this->insert();
        else  // modify
            return $this->modify();
    }
}
?>
