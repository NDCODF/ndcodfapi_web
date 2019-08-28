<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Import Namespace="System.net" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<script runat="server" language="vb">
    Const BUF_SIZE As Integer = 1024000 ' 1M

    Private Function SendToAPI(sApiURL As String, sJson As String) As Boolean
        Dim oWebequest As HttpWebRequest
        Dim oWebResponse As HttpWebResponse
        Dim sByteString As Byte()
        Dim byteBuffer(BUF_SIZE) As Byte
        Dim nRead As Long

        sByteString = Encoding.UTF8.GetBytes(sJson) ' 轉成 UTF-8 字串

        ' 送出資料
        oWebequest = WebRequest.Create(sApiURL)
        With oWebequest
            .KeepAlive = True
            .Method = "POST"
            .Timeout = 100000 ' 100 秒
            .ContentType = "application/json"
            .ContentLength = sByteString.Length
            With .GetRequestStream()
                .Write(sByteString, 0, sByteString.Length)
                .Close()
            End With
        End With

        ' 讀取
        Try
            oWebResponse = oWebequest.GetResponse()
            Response.Write(oWebResponse.ToString())
        Catch exp As WebException
            'MsgBox(exp.Message, MsgBoxStyle.Critical, "傳送錯誤")
            Return False
        End Try

        With oWebResponse
            ' 成功的話，下載檔案
            If .StatusCode = 200 Then
                Response.Clear()
                Response.AddHeader("Content-Disposition", .GetResponseHeader("Content-Disposition"))
                Response.ContentType = .ContentType

                With .GetResponseStream()
                    nRead = -1
                    While (nRead <> 0)
                        nRead = .Read(byteBuffer, 0, byteBuffer.Length)
                        If (nRead > 0) Then
                            Response.OutputStream.Write(byteBuffer, 0, nRead)
                        End If
                    End While
                    .Close()
                    .Dispose()
                End With
                Response.End()
            End If
            .Close()
            .Dispose()
        End With

        Return True

    End Function

    Private Function Dictionary2Json(oDictionary As Dictionary(Of String, Object), Optional nLevel As Long = 1) As String
        Dim sJson As New StringBuilder
        Dim nCnt As Long = 0
        Dim oItem As KeyValuePair(Of String, Object)

        sJson.Append(vbTab, repeatCount:=nLevel - 1).Append("{").AppendLine()

        For Each oItem In oDictionary

            nCnt += 1

            sJson.Append(JsonElement(oItem.Key, oItem.Value, nLevel))

            If (nCnt < oDictionary.Count) Then
                sJson.Append(",").AppendLine()
            Else
                sJson.AppendLine()
            End If

        Next oItem

        sJson.Append(vbTab, repeatCount:=nLevel - 1).Append("}")

        Return sJson.ToString()

    End Function

    Private Function Array2Json(oArray As Object, Optional nLevel As Long = 1) As String
        Dim sJson As New StringBuilder
        Dim oValue As Object
        Dim nCnt As Long

        sJson.Append(vbTab, repeatCount:=nLevel - 1).Append("[").AppendLine()

        For Each oValue In oArray
            nCnt += 1

            sJson.Append(JsonElement("", oValue, nLevel))

            If (nCnt < oArray.Length) Then
                sJson.Append(",").AppendLine()
            Else
                sJson.AppendLine()
            End If
        Next oValue

        sJson.Append(vbTab, repeatCount:=nLevel - 1).Append("]")

        Return sJson.ToString()

    End Function

    Private Function JsonElement(sKey As String, xValue As Object, Optional nLevel As Long = 0) As String
        Dim sJson As New StringBuilder

        sJson.Append(vbTab, repeatCount:=nLevel)
        If (sKey.Length > 0) Then
            sJson.Append("""" & sKey & """" & ":")
        End If

        If IsNothing(xValue) Then
            sJson.Append("null")
        ElseIf (IsArray(xValue)) Then
            sJson.AppendLine().Append(Array2Json(xValue, nLevel + 1))
        ElseIf (xValue.GetType Is GetType(Dictionary(Of String, Object))) Then
            sJson.AppendLine().Append(Dictionary2Json(xValue, nLevel + 1))
        Else
            Select Case TypeName(xValue)
                Case "String", "Date", "DateTime"
                    sJson.Append("""").Append(JsonEscapeCahr(xValue)).Append("""")
                Case Else
                    sJson.Append(xValue.ToString().ToLower())
            End Select
        End If

        Return sJson.ToString()

    End Function

    Private Function JsonEscapeCahr(sValue As String) As String

        Return sValue.Replace("\", "\\").
                        Replace("/", "\/").
                        Replace("""", "\""").
                        Replace(vbTab, "\t").
                        Replace(vbCr, "\r").
                        Replace(vbNewLine, "\n").
                        Replace(vbLf, "\f").
                        Replace(vbBack, "\b")
    End Function
</script>
<%
    Dim oDict As New Dictionary(Of String, Object)
    Dim aData() = {}
    Dim oRecord As Dictionary(Of String, Object)
    Dim sJson As String
    Dim sApiUrl As String
    Dim grpRows As Integer
    Dim field As String
    Dim realField As String

    If Request.Form.Count() > 0 Then
        oDict.Add("製作日期", Request.Form("製作日期"))
        oDict.Add("製表人", Request.Form("製表人"))

        ' 取列數
        Dim dummy() = Request.Form.GetValues("姓名[]")
        If Not IsNothing(dummy) Then
            grpRows = dummy.Count()
        End If

        ' 依序取出每列
        For row = 0 To grpRows - 1
            Array.Resize(aData, aData.Count + 1)    ' 陣列增加新儲存區
            oRecord = New Dictionary(Of String, Object) ' 存放每個欄位

            ' 依序取出每個欄位
            For idx = 0 To Request.Form.Count() - 1
                field = Request.Form.GetKey(idx)

                If field.EndsWith("[]") Then
                    dummy = Request.Form.GetValues(field)
                    If Not IsNothing(Request.Form.GetValues(field)) Then
                        realField = field.Substring(0, field.Length - 2)
                        oRecord.Add(realField, dummy(row))
                    End If
                End If
            Next
            aData(UBound(aData)) = oRecord  ' 存入陣列
        Next
        oDict.Add("詳細資料", aData)
        oDict.Add("總筆數", aData.Count)

        sJson = Dictionary2Json(oDict)
        'Response.Write(sJson)

        If Request.Form("doctype") = "writer" Then
            sApiUrl = Request.Form("Writer_API")
        ElseIf Request.Form("doctype") = "calc" Then
            sApiUrl = Request.Form("Calc_API")
        End If
        SendToAPI(sApiUrl, sJson)
    End If
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
