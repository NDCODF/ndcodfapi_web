<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ import Namespace="System.IO" %>
<%@ import Namespace="System.Net" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<script runat="server" language="c#">

    const long BUF_SIZE = 1024000;  // 1M
                                    // 傳送 Json 資料到 API 主機
    bool SendToAPI(string sApiURL, string sJson)
    {
        HttpWebRequest oWebRequest;
        HttpWebResponse oWebResponse;
        byte[] sByteString;
        byte[] byteBuffer = new byte[BUF_SIZE];
        long nRead;

        sByteString = Encoding.UTF8.GetBytes(sJson);    // 轉成 UTF-8 字串

        // 送出資料
        oWebRequest = (HttpWebRequest)WebRequest.Create(sApiURL);
        oWebRequest.KeepAlive = true;
        oWebRequest.Method = "POST";
        oWebRequest.Timeout = 100000;    // 100 秒
        oWebRequest.ContentType = "application/json";
        oWebRequest.ContentLength = sByteString.Length;
        oWebRequest.GetRequestStream().Write(sByteString, 0, sByteString.Length);
        oWebRequest.GetRequestStream().Close();

        // 接收資料
        try
        {
            oWebResponse = (HttpWebResponse)oWebRequest.GetResponse();
        }
        catch (WebException exp)
        {
            Response.Write("傳送錯誤");
            return false;
            throw;
        }

        // 成功的話，下載檔案
        if (oWebResponse.StatusCode == HttpStatusCode.OK)
        {
            Response.Clear();

            Response.AddHeader("Content-Disposition", oWebResponse.GetResponseHeader("Content-Disposition"));
            Response.ContentType = oWebResponse.ContentType;

            nRead = -1;
            while (nRead != 0)
            {
                nRead = oWebResponse.GetResponseStream().Read(byteBuffer, 0, byteBuffer.Length);
                if (nRead > 0)
                {
                    Response.OutputStream.Write(byteBuffer, 0, (int)nRead);
                }
            }
            Response.End();
            oWebResponse.Close();
            oWebResponse.Dispose();
        }
        return true;
    }

    string Dictionary2Json(Dictionary<string, object> oDictionary, long nLevel = 1)
    {
        StringBuilder sJson = new StringBuilder();
        long nCnt = 0;

        sJson.Append('\t', repeatCount: (int)nLevel - 1).Append("{").AppendLine();

        foreach(KeyValuePair<String, Object> oItem in oDictionary)
        {
            nCnt++;
            sJson.Append(JsonElement(oItem.Key, oItem.Value, nLevel));
            if (nCnt < oDictionary.Count())
            {
                sJson.Append(",");
            }
            sJson.AppendLine();
        }
        sJson.Append('\t', repeatCount: (int)nLevel - 1).Append("}");
        return sJson.ToString();
    }

    string Array2Json(object[] oArray, long nLevel = 1)
    {
        StringBuilder sJson = new StringBuilder();
        long nCnt = 0;

        sJson.Append('\t', repeatCount: (int)nLevel - 1).Append("[").AppendLine();
        foreach (object oValue in oArray)
        {
            nCnt++;
            sJson.Append(JsonElement("", oValue, nLevel));
            if (nCnt < oArray.Length)
            {
                sJson.Append(",");
            }
            sJson.AppendLine();
        }
        sJson.Append('\t', repeatCount: (int)nLevel - 1).Append("]");
        return sJson.ToString();
    }

    string JsonElement(string sKey, object xValue, long nLevel = 0)
    {
        StringBuilder sJson = new StringBuilder();
        string sTypeName;

        sJson.Append('\t', repeatCount: (int)nLevel);
        if (sKey.Length > 0)
            sJson.Append("\"").Append(sKey).Append("\"").Append(":");

        if (xValue == null)
            sJson.Append("null");
        else if (xValue.GetType().IsArray)
            sJson.AppendLine().Append(Array2Json((object[])xValue, nLevel + 1));
        else if (xValue is Dictionary<string, object>)
            sJson.AppendLine().Append(Dictionary2Json((Dictionary<string, object>)xValue, nLevel + 1));
        else
        {
            sTypeName = xValue.GetType().Name;
            switch (sTypeName)
            {
                case "String":
                case "Date":
                case "DateTime":
                    sJson.Append('\"').Append(JsonEscapeCahr(xValue.ToString())).Append('\"');
                    break;
                default:
                    sJson.Append(xValue.ToString().ToLower());
                    break;
            }

        }
        return sJson.ToString();
    }
    string JsonEscapeCahr(string sValue)
    {
        return sValue.Replace("\\", "\\\\")
                        .Replace("/", "\\" + "/")
                        .Replace("\"", "\\\"")
                        .Replace("\t", "\\" + "t")
                        .Replace("\r", "\\" + "r")
                        .Replace("\n", "\\" + "n")
                        .Replace("\f", "\\" + "f")
                        .Replace("\b", "\\" + "b");
    }

</script>
<%
    Dictionary<string, object> oDict = new Dictionary<string, object>();
    object[] aData = { };
    Dictionary<string, object> oRecord;
    string sJson;
    string sApiUrl;
    int grpRows;
    string field;
    string realField;

    if (Request.Form.Count > 0)
    {
        Response.Write(Request.Form.GetValues("製表人")[0]);
        oDict.Add("製作日期", Request.Form.GetValues("製作日期")[0]);
        oDict.Add("製表人", Request.Form.GetValues("製表人")[0]);

        // 取列數
        if (Request.Form.GetValues("姓名[]") == null || Request.Form.GetValues("姓名[]").Length == 0)
            grpRows = 0;
        else
            grpRows = Request.Form.GetValues("姓名[]").Count();

        // 依序取出每列
        for (int row=0; row<grpRows; row++)
        {
            Array.Resize(ref aData, aData.Length + 1);  // 陣列增加新儲存區
            oRecord = new Dictionary<string, object>();  // 存放每個欄位

            // 依序取出每個欄位
            for (int idx = 0; idx < Request.Form.Count; idx ++)
            {
                field = Request.Form.GetKey(idx);
                if(field.EndsWith("[]") )
                {
                    if (Request.Form.GetValues(field) != null && Request.Form.GetValues(field).Length > 0)
                    {
                        realField = field.Substring(0, field.Length - 2);
                        oRecord.Add(realField, Request.Form.GetValues(field)[row]);
                    }
                }
            }
            aData[aData.Length - 1] = oRecord;
        }
        oDict.Add("詳細資料", aData);
        oDict.Add("總筆數", aData.Length);

        sJson = Dictionary2Json(oDict);
        //Response.Write(sJson);

        sApiUrl = "";
        if (Request.Form.GetValues("doctype")[0] == "writer")
            sApiUrl = Request.Form.GetValues("Writer_API")[0];
        else if (Request.Form.GetValues("doctype")[0] == "calc")
            sApiUrl = Request.Form.GetValues("Calc_API")[0];

        SendToAPI(sApiUrl, sJson);
    }
%>
    <form id = "form1" runat="server">
        <input type = "radio" name="doctype" value="writer" checked/>Writer&nbsp;
        API<input type="text" name="Writer_API" value="https://ndcodf.ossii.com.tw:443/lool/merge-to/de53db22-ac2f-11e8-95bd-005056913633" size="100"/>
        <br />
        <input type = "radio" name="doctype" value="calc" />Calc&nbsp;&nbsp;&nbsp;
        API<input type="text" name="Calc_API" value="https://ndcodf.ossii.com.tw:443/lool/merge-to/ec02d688-ac2f-11e8-95bd-005056913633" size="100"/>
        <br />
        製作日期<input type="date" name="製作日期"/><br />
        製表人<input type="text" name="製表人" /><br />
        詳細資料: <br />
        <table border = "1" >
            <tr>
                <th>姓名</th><th>電子郵件</th><th>電話</th><th>地址</th><th>生日</th><th>備註</th>
                <th><button type="button" id="plus">+</button><button type="button" id="minus">-</button></th>
            </tr>
    <tr>
    <td>
    <input type = "text" name="姓名[]" />
                </td>
                <td>
    <input type = "text" name="電子郵件[]" />
                </td>
                <td>
    <input type = "text" name="電話[]" />
                </td>
                <td>
    <input type = "text" name="地址[]" />
                </td>
                <td>
    <input type = "text" name="生日[]" />
                </td>
                <td>
    <input type = "text" name="備註[]" />
                </td>
                <td></td>
            </tr>
        </table>
        <button type = "submit" > 送出</button>
    </form>
    <script>
        /*
        * 按 + 新增一列
        */
        document.getElementById('plus').onclick = function () {
            var tbody = this.parentNode  // th
                .parentNode  // tr
                .parentNode;  // thead
            var tr = tbody.rows[1].cloneNode(true);
            tbody.appendChild(tr);  // new line
        };

        /*
        * 按 - 移除最末列
        */
        document.getElementById('minus').onclick = function () {
            var tbody = this.parentNode  // th
                .parentNode  // tr
                .parentNode;  // thead
            var tr = tbody.lastChild;
            tbody.removeChild(tr);
        };
    </script>
</body>
</html>
