<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SEO.aspx.cs" Inherits="Manager_SEO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站优化</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtTitle").value == "") { alert("网站标题为必填项！"); document.getElementById("txtTitle").focus(); return false; }
            if (document.getElementById("txtDescription").value == "") { alert("网站描述为必填项！"); document.getElementById("txtDescription").focus(); return false; }
            if (document.getElementById("txtKeywords").value == "") { alert("网站关键词为必填项！"); document.getElementById("txtKeywords").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
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
                                网站优化
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
                            带 "<span class="red">*</span>" 的为必填信息
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            网站标题：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="txtTitle" runat="server" Width="500"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 80px;">
                        <td class="td_left">
                            网站描述：<font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Width="500" Height="60"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            网站关键词：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="txtKeywords" TextMode="MultiLine" runat="server" Width="500" Height="60"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                        </td>
                        <td class="td_right">
                            <div id="divHidden" style="display: none;">
                                <table>
                                    <tr>
                                        <td>
                                            <img src="images/admin_images/loading.gif" />
                                        </td>
                                        <td>
                                            <span style="color: #666; padding-left: 5px;">正在保存...</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="divShow">
                                <asp:Button ID="btnSave" Text="保 存 内 容" runat="server" OnClick="btnSaveClick" CssClass="button" /></div>
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

