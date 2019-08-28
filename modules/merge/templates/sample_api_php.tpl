<h3>API - PHP 範例</h3>
<pre>
// api 呼叫位置
$url = 'http://192.168.3.147:9980/lool/merge-to/9aff17b8-90a4-11e8-8366-0242ac110002';

// 欄位資料
$data = array(
    "數字" => "2.15",
    "百分比" => "0.9",
    "貨幣" => "100000",
    "日期" => "2018-07-25",
    "時間" => "PT09H25M00S",
    "日期及時間" => "2018-07-25T09:25:00",
    "科學" => "123.45",
    "分數" => "0.5",
    "布林值" => "true",
    "姓名" => "王大明",
    "手機號碼" => "0918123456",
    "地址" => "中山北路一段7號",
    // 以下為群組列表
    "詳細資料" => array(  // 群組列表
        array(  // 第一列
            "姓名" => "陽大為",
            "生日" => "19250302",
            "地址" => "中山北路一段7號",
            "家裡電話" => "02123456",
            "手機號碼" => "0911123456",
            "備註" => "家住東京"
        ),
        array(  // 第二列
            "姓名" => "王阿予",
            "生日" => "19250302",
            "地址" => "中山北路一段8號",
            "家裡電話" => "02123457",
            "手機號碼" => "0911123457",
            "備註" => "家住美國"
        ),
        array(  // 第三列
            "姓名" => "陸無雙",
            "生日" => "19250302",
            "地址" => "中山北路一段10號",
            "家裡電話" => "02123457",
            "手機號碼" => "0911123457",
            "備註" => "家住紐約"
        )
    )
);

// 將上列資料轉成 uri?parm1=data1&parm2=data2
$data = http_build_query($data, null, '&');

// prepare for curl to post data using json
$curl = curl_init($url);
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_POSTFIELDS, $data);

// 呼叫 api 產生報表並將報表回傳
$response = curl_exec($curl);

// 若要網頁下載，則 header 需要擷取 content type
$content_type = curl_getinfo($curl, CURLINFO_CONTENT_TYPE);

curl_close($curl);

// 網頁下載
header('Content-Description: File Transfer');
header("Content-Type: $content_type");
header('Content-Disposition: attachment; filename=downloaded.odf');
header('Content-Transfer-Encoding: binary');
header('Connection: Keep-Alive');
header('Expires: 0');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Pragma: public');
header('Content-Length: ' . strlen($response));

echo $response;
exit;
</pre>
