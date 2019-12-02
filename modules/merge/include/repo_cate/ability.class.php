<?php
/**
 * =======================================================================
 * Name: 指標(分類)物件
 *
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */
defined('XOOPS_ROOT_PATH') or die('Restricted access');
require_once('include/cate/admin.class.php');
include_once(XOOPS_ROOT_PATH . '/class/xoopstree.php');


/**
 * 指標操作物件
 * usage:
 * 
 * $abi = new CateAbility;
 * 
 * // 取得某科目下的第三層指標的 cid
 * echo $abi->cid($subj_mapcid, $map_cid, 3);
 * 
 * // 指標在第幾層
 * echo $abi->level(88);
 * 
 * // '1-2' 有沒有在 pid=88 下面那一層重複?
 * $abi->exists(88, '1-2') ? true : false;
 * 
 * // 科目id = 2 底下全部的指標
 * print_R($cate->getAllAbi(2));
 * 
 * // 某個指標底下的樹狀列表
 * print_R($cate->getAbiTree(90));
 * 
 * print_R($cate->getSortedListByCid(90));
 * 
 * // 某個指標底下是否還有指標?
 * $cate->hasChild(89);
 * 
 * // 89/91/23
 * // 排除 類別/教育程度
 * echo $cate->getIdPathFromId(89);
 */
class CateAbility extends CateAdmin
{
    private $tmpcid = 0;  // used for temp. see pid()

    /**
     * Constructor
     */
    public function __construct()
    {
        parent::__construct('subject');
    }

    /**
     * 依照 tmpcid 取得 pid
     * 
     * 用來 overload parent::pid()
     * 
     * parent::sql() 會呼叫 pid()
     * 
     * cid() 透過 parent::sql() 才能正確定位到某一層
     * 
     * @return int
     */
    public function pid()
    {
        $idtree = explode('/', $this->getIdPathFromId($this->tmpcid));
        return $idtree[1];
    }


    /**
     * 由 map_cid 及科目取得某一層的 cid
     * 
     * @param $subj_mapcid int
     * @param $map_cid int
     * @param $level int
     * @return int/-1 -1: not found
     */
    public function cid($subj_mapcid, $map_cid, $level)
    {
        $csubj = new CateSubject;

        // tmpcid: ugly but work well.
        $this->tmpcid = $csubj->cid($subj_mapcid);
        $sql = $this->sql('', 0, 0, $level + 1);
        $sql .= " AND map_cid='{$map_cid}'";

        $data = queryData($sql);
        if(count($data) > 0)
            return $data[0]['cid'];
        return -1;
    }


    /**
     * 還有底下層嗎？
     * 
     * @param $id int
     * @return bool
     */
    public function hasChild($id)
    {
        $childs = $this->tree()->getAllChildId($id);
        return count($childs) > 0;
    }


    /**
     * 傳回指標的層數
     *
     * @param $cid int
     * @return int
     */
    public function level($cid)
    {
        //echo $this->tree()->getIdPathFromId($cid).'<br>';
        return count(explode('/', $this->tree()->getIdPathFromId($cid)));
            - 2;
             //- 4 - 1;
    }


    /**
     * 檢查同一層指標名稱有沒有重複
     * 
     * @param $pid int
     * @param $title str
     * @return bool
     */
    public function exists($pid, $title)
    {
        global $xoopsDB;
        // 鎖定科目： see pid()
        $this->tmpcid = $pid;  // tmpcid: ugly but work well.
        // level: 從頭算起
        $sql = $this->sql($title, 0, 0, $this->level($pid)/* + 2*/);
        $sql .= " AND pid={$pid}";

        $rs = $xoopsDB->queryF($sql);
        if(!$rs)
            return false;

        return $xoopsDB->getRowsNum($rs) > 0;
    }


    /**
     * 與 xoopstree.getIdPathFromId() 一樣，排除前面兩層
     * 
     * @param $id
     * @return string 12/34/56/...
     */
    public function getIdPathFromId($id)
    {
        $idpath = $this->tree()->getIdPathFromId($id);
        $idpath = explode('/', $idpath);
        array_shift($idpath);  // 類別
        return implode('/', $idpath);
    }


    /*
     * 傳回每一個指標的底下所有層 cid array (不重複)
     * 
     * @param $subj_cid int
     * @return array ['11', '22', '33', ... ]
     */
    public function getAllAbi($subj_cid)
    {
        $ids = array();

        foreach($this->tree()->getChildTreeArray($subj_cid) as $abi)
        {  // 依照科目列出所有層指標
            if($this->hasChild($abi['cid']) && $this->level($abi['cid']) > 0)
                continue;  // 本層指標還有下一層: 不加入
            $ids[] = "'" . $abi['cid'] . "'";
        }
        return $ids;
    }


    /*
     * 遞迴處理：取得指定的 id 底下(包括自己)全部的指標 (樹狀列表+排序)
     * 
     * @param $cid int
     * @return array [cid, pid, hasChildren, child, title]
     */
    public function getAbiTree($cid)
    {
        $cate = new Category($cid);
        $hasChild = $this->hasChild($cid);

        $child = array();
        if($hasChild)
            foreach($this->tree()->getFirstChild($cid, 'ordinal')
                    as $subchild)
                $child[] = $this->getAbiTree($subchild['cid']);

        return array('cid' => $cid,
                       'pid' => $abi['pid'],
                       'hasChildren' => $hasChild,
                       'child' => $child,
                       'title' => $cate->title());
    }
}
?>
