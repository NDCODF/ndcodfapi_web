<?php
/**
 * =======================================================================
 * Name:
 * a. 下載某筆文件檔
 * b. 下載 VB & C# 範例檔
 * c. 下載 api/json/yaml
 * d. 下載API資訊: zip file
 *
 * Author:
 * Wind Yan <yc.yan@ossii.com.tw>
 * =======================================================================
 */

include_once ("../../mainfile.php");
include_once (XOOPS_ROOT_PATH . '/class/downloader.php');
include_once (XOOPS_ROOT_PATH . '/class/template.php');
include_once ('include/repo_documents.class.php');

if(!$xoopsUser)
{
    exit();
}
if (!isset($_GET['id']) && !isset($_GET['wid']) &&
    !isset($_GET['endpt']) && !isset($_GET['getendpt']))
{
    exit();
}


/*
 * A Well-Open ZipArchive open method,
 * usage:
 * $za = new ZA($sFile);
 */
class ZA extends ZipArchive
{
    public $bOk = False;

    /**
     * Constructor:
     * flag ZIPARCHIVE::CREATE added for default
     *
     * @param string $sFile
     */
    public function __construct($sFile)
    {
        $this->bOk = $this->open($sFile, ZIPARCHIVE::CREATE);
    }
}


class OdfDownloader extends XoopsDownloader
{
    /**
     * Constructor
     *
     * @param string $mimyType
     * @return XoopsZipDownloader
     */
    function OdfDownloader($mimyType =
                           'application/vnd.oasis.opendocument.text')
    {
        $this->mimetype = trim($mimyType);
    }

    /**
     * Download Data as a Zip file
     *
     * @param string $contentFile
     * @param string $downloadName
     */
    function download($contentFile, $downloadName)
    {
        $this->_header($downloadName);
        ob_clean();
        flush();
        readfile($contentFile);
    }
}

/*
 * a shortcut call for tempnam: making of .odt file
 */
function getTempNam()
{
    return tempnam(XOOPS_UPLOAD_PATH, 'Merge_');
}


// 下載文件檔
if (isset($_GET['id']) && !isset($_GET['endpt']))
{
    $id = intval($_GET['id']);

    $doc = new Documents($id);
    $docfile = $doc->getDocFile();
    $down = new OdfDownloader();
    if ('ots' == $doc->get('extname'))
        $down = new OdfDownloader(
                    'application/vnd.oasis.opendocument.spreadsheet');
    $downName = sprintf("%s.%s", $doc->get('docname'), $doc->get('extname'));
    $down->download($docfile, $downName);
}
// VB C# 範例檔下載
if (isset($_GET['wid']))
{
    $id = intval($_GET['wid']);
    $downfiles = array(array('CS 範例', 'jsonApiExample_CS-20180902.zip'),
                      array('CS 範例', 'jsonApiExample_CS-20180902.exe'),
                      array('VB 範例', 'JsonApiExample_VB-20180902.zip'),
                      array('VB 範例', 'JsonApiExample_VB-20180902.exe'),
                      array('ASP.NET 範例 - VB.NET',
                            'jsonApiExample_ASP_NET-20180904.aspx'),
                      array('ASP.NET 範例 - C#',
                            'jsonApiExample_ASP_NET_C#-20180911.aspx'));
    $down = new OdfDownloader();
    if ($id == 0 || $id == 2)
        $down = new OdfDownloader('application/zip');
    if ($id == 1 || $id == 3)
        $down = new OdfDownloader(
            'application/vnd.microsoft.portable-executable');
    if ($id == 4 || $id == 5)
        $down = new OdfDownloader('text/html');
    $realfile = dirname(__FILE__) . "/data/{$downfiles[$id][1]}";
    $down->download($realfile, $downfiles[$id][1]);
}
// 下載 api/json/yaml: 由原本的 ajax 改為 php 呼叫
// 透過 curl 可略過 ssl 驗證
if (isset($_GET['getendpt']))
{
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_HEADER, false);
    curl_setopt($curl, CURLOPT_URL, $_GET['getendpt']);
    $response = curl_exec($curl);
    $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    if ($httpCode != 200)
    {
        if (0 == $httpCode)
            $httpCode = 500;
        curl_close($curl);
        http_response_code($httpCode);
        exit();
    }

    $content_type = curl_getinfo($curl, CURLINFO_CONTENT_TYPE);

    $tfile = getTempNam();
    file_put_contents($tfile, $response);
    $down = new OdfDownloader($content_type);
    $down->download($tfile, 'api/json/yaml');
    @unlink($tfile);
    curl_close($curl);
}
// 下載API資訊: zip file
// zip 包含 1) 報表 ott/ots 2) api/yaml/json 範例 (組成一個 odt)
if (isset($_GET['id']) && isset($_GET['endpt']))
{
    $api = $_GET['endpt'];
    $contents = array();
    // 將 api/yaml/json範例寫入 odt
    foreach (array("{$api}/yaml", "{$api}/api", "{$api}/json")
                as $idx => $uri)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_URL, $uri);
        $response = curl_exec($curl);

        if ($idx == 1)  // api
        {
            $response = json_encode(json_decode($response),
                                        JSON_PRETTY_PRINT |
                                        JSON_UNESCAPED_UNICODE);
        }
        if ($idx == 2)  // json sample
        {
            $start = strpos($response, '{');
            $json = substr($response, $start);
            $json = str_replace("<br />", '', $json);
            $json = str_replace("\r\n", '', $json);
            $json = str_replace("\n", '', $json);
            $json = str_replace("&nbsp;", '', $json);
            $json = json_encode(json_decode($json),
                                    JSON_PRETTY_PRINT |
                                    JSON_UNESCAPED_UNICODE |
                                    JSON_UNESCAPED_SLASHES);
            $head = substr($response, 0, $start - 24);
            $head = str_replace("<br />", "\n", $head);
            $response = $head . $json;
        }

        $response = str_replace(" ", '<text:s/>', $response);
        $response = str_replace("\n", '<text:line-break/>', $response);
        $response = html_entity_decode($response);
        $contents[] = $response;
        curl_close($curl);
    }
    $basefile = XOOPS_ROOT_PATH . "/modules/merge/package.odt";
    $tfile = getTempNam();
    @copy($basefile, $tfile);

    $za = new ZA($tfile);
    if ($za->bOk !== TRUE)
    {
        @unlink($tfile);
        echo 'zip error: ';
        exit;
    }

    $id = intval($_GET['id']);
    $doc = new Documents($id);

    // odt: smarty 置換
    $tpl = new XoopsTpl;
    $tpl->left_delimiter =  '{';
    $tpl->right_delimiter = '}';
    $tpl->assign('yaml', $contents[0]);
    $tpl->assign('api', $contents[1]);
    $tpl->assign('json', $contents[2]);
    $tpl->assign('docname', $doc->get('docname'));
    $tpl->assign('endpt', $api);

    $entryFile = 'content.xml';
    $buffer = $za->getFromName($entryFile);
    $content = $tpl->fetchFromData($buffer);
    $za->deleteName($entryFile);
    $za->addFromString($entryFile, $content);
    $za->close();

    // 將報表檔(ott/ots)加進 zip 檔
/*    $docfile = $doc->getDocFile();
    $docname = sprintf("%s.%s",
                        $doc->get('docname'), $doc->get('extname'));

    $downfile = getTempNam();
    $za = new ZA($downfile);
    if ($za->bOk !== TRUE)
    {
        @unlink($tfile);
        @unlink($downfile);
        echo 'zip error: ';
        exit;
    }

    $za->addFile($tfile, "API 範例(YAML+JSON 範例).odt");
    $za->addFile($docfile, $docname);
    $za->close();*/
    $down = new OdfDownloader;
    $down->download($tfile,
                    $doc->get('title') . '的 API 範例及範本檔壓縮包.odt');
    @unlink($tfile);
    //@unlink($downfile);
}
exit();
?>
