<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsClassNameEdit_SEO.aspx.cs"
    Inherits="Manager_NewsClassNameEdit_SEO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <%=strColumnName %>
        _SEO优化</title>
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkNull()
        {
//            if (document.getElementById("txtTitle").value == "") { alert("网站标题为必填项！"); document.getElementById("txtTitle").focus(); return false; }
//            if (document.getElementById("txtDescription").value == "") { alert("网站描述为必填项！"); document.getElementById("txtDescription").focus(); return false; }
//            if (document.getElementById("txtKeywords").value == "") { alert("网站关键词为必填项！"); document.getElementById("txtKeywords").focus(); return false; }
            document.getElementById("divShow").style.visibility = "hidden";
            document.getElementById("divHidden").style.visibility = "visible";
            return true;
        }
        //判断字符长度开始
        function testMesLen(mes, maxlen, objID)
        {
            document.getElementById(objID).value = maxlen - mes.value.length;
            if (document.getElementById(objID).value < 0)
            {
                alert("最多输入" + maxlen + "个字符！");
                mes.value = mes.value.substring(0, maxlen);
                document.getElementById(objID).value = maxlen - mes.value.length;
            }
        }
        //判断字符长度结束
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="17" valign="top" background="images/admin_images/mail_leftbg.gif">
                <img src="images/admin_images/left-top-right.gif" width="17" height="29" />
            </td>
            <td valign="top" background="images/admin_images/content-bg.gif">
                <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg">
                    <tr>
                        <td height="31">
                            <div class="titlebt">
                                栏目优化
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="16" valign="top" background="images/admin_images/mail_rightbg.gif">
                <img src="images/admin_images/nav-right-bg.gif" width="16" height="29" />
            </td>
        </tr>
        <tr>
            <td valign="middle" background="images/admin_images/mail_leftbg.gif">
                &nbsp;
            </td>
            <td valign="top" bgcolor="#F7F8F9">
                <!--内容开始-->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="left_txt" height="30" colspan="2">
                            "<span class="red">*</span>" 为必填信息
                        </td>
                    </tr>
                    <tr>
                        <td width="22%" height="30" align="left" bgcolor="#f2f2f2" class="left_txt2">
                            栏目标题title：<font color='red'>*</font>
                        </td>
                        <td width="78%" bgcolor="#f2f2f2" align="left">
                            <asp:TextBox ID="txtTitle" runat="server" Width="500" onKeyPress="testMesLen(this,33,'mesLenTitle')"
                                onKeyUp="testMesLen(this,33,'mesLenTitle')"></asp:TextBox>
                            <font color="#999999">剩余<input name="mesLenTitle" id="mesLenTitle" value="33" style="background-color: #FFF0F0;
                                font-size: 12px; color: #999999; border: 0; text-align: right" size="3" readonly="readonly" />字</font>
                            <script type="text/javascript">
                                document.getElementById("mesLenTitle").value = 33 - document.getElementById("txtTitle").value.length;
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td width="22%" height="70" align="left" class="left_txt2">
                            栏目描述description：<font color='red'>*</font>
                        </td>
                        <td width="78%" align="left" height="70">
                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Width="500"
                                Height="60" onKeyPress="testMesLen(this,100,'mesLenDescription')" onKeyUp="testMesLen(this,100,'mesLenDescription')"></asp:TextBox>
                            <font color="#999999">剩余<input name="mesLenDescription" id="mesLenDescription" value="100"
                                style="background-color: #FFF0F0; font-size: 12px; color: #999999; border: 0;
                                text-align: right" size="3" readonly="readonly" />字</font>
                            <script type="text/javascript">
                                document.getElementById("mesLenDescription").value = 100 - document.getElementById("txtDescription").value.length;
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td width="22%" height="70" align="left" bgcolor="#f2f2f2" class="left_txt2">
                            栏目关键词keywords：<font color='red'>*</font>
                        </td>
                        <td width="78%" bgcolor="#f2f2f2" align="left" height="70">
                            <asp:TextBox ID="txtKeywords" TextMode="MultiLine" runat="server" Width="500" Height="60"
                                onKeyPress="testMesLen(this,100,'mesLenKeywords')" onKeyUp="testMesLen(this,100,'mesLenKeywords')"></asp:TextBox>
                            <font color="#999999">剩余<input name="mesLenKeywords" id="mesLenKeywords" value="100"
                                style="background-color: #FFF0F0; font-size: 12px; color: #999999; border: 0;
                                text-align: right" size="3" readonly="readonly" />字</font>
                            <script type="text/javascript">
                                document.getElementById("mesLenKeywords").value = 100 - document.getElementById("txtKeywords").value.length;
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div id="divHidden" style="visibility: hidden; height: 10px;">
                                <img src="images/admin_images/loading.gif" /><br />
                                <span style="color: #666; padding-top: 5px; display: block;">正在保存</span></div>
                            <div id="divShow">
                                <asp:Button ID="btnSave" Text="保 存 内 容" runat="server" OnClick="btnSaveClick" /></div>
                        </td>
                    </tr>
                </table>
                <!--内容结束-->
            </td>
            <td background="images/admin_images/mail_rightbg.gif">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="bottom" background="images/admin_images/mail_leftbg.gif">
                <img src="images/admin_images/buttom_left2.gif" width="17" height="17" />
            </td>
            <td background="images/admin_images/buttom_bgs.gif">
                <img src="images/admin_images/buttom_bgs.gif" width="17" height="17">
            </td>
            <td valign="bottom" background="images/admin_images/mail_rightbg.gif">
                <img src="images/admin_images/buttom_right2.gif" width="16" height="17" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

