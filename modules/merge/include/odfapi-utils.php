
<?php
/*
 * Generate JSON for file information exchange
 */
function generateTemplateInfo2JSON()
{
    global $xoopsDB;

    $sql_template = "SELECT endpt,docname,extname,uptime,cid,hide from ndcodfapi.ndc_repo_user_templates";
    $sql_category = "SELECT cid,title from ndcodfapi.ndc_repo_category";
    $rs_template  = $xoopsDB->queryF($sql_template);
    $rs_category  = $xoopsDB->queryF($sql_category);
    $cid_category = Array();
    while($currentData = $xoopsDB->fetchArray($rs_category))
    {
        $cid_category[$currentData["cid"]] = $currentData["title"];
    };
    $i   = 0;
    $obj = Array();
    $obj->x =1;
    while($rows = $xoopsDB->fetchArray($rs_template))
    {
        if($rows['hide'] == 0)
        {
            $cate = $cid_category[$rows["cid"]];
            $obj[$cate][]=$rows;
        }
    };
    file_put_contents('/usr/share/NDCODFAPI/ODFReport/templates/repo/myfile.json', json_encode($obj));
}
function checkFileNotExist(){
    if (file_exists("/usr/share/NDCODFAPI/ODFReport/templates/repo/myfile.json") == False)
        return True;
    else
        return False;
}

?>
