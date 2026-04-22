<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebSiteControl.aspx.cs" Inherits="Manager_WebSiteControl" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站开关</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtTishi").value == "") { alert("请填写关闭提示！"); document.getElementById("txtTishi").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
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
                                网站开关
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
                            运行状态：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:RadioButtonList ID="radlState" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="正常运行" Value="0" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="关闭网站" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            关闭时的提示信息：<font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtTishi" runat="server" TextMode="MultiLine" Width="360" Height="100" Text="网站维护中...请稍候访问"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                        </td>
                        <td class="td_right_color">
                            <div id="divHidden" style="display: none;">
                                <img src="images/admin_images/loading.gif" alt="" />
                                <span style="color: #666;">正在保存...</span></div>
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

