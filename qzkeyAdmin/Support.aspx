<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Support.aspx.cs" Inherits="Manager_Support" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>技术支持</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtSupportName").value == "") { alert("技术支持名称不能为空！"); document.getElementById("txtSupportName").focus(); return false; }
            if (document.getElementById("txtWebSite").value == "") { alert("网址不能为空！"); document.getElementById("txtWebSite").focus(); return false; }
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
                                技术支持
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
                        <td class="left_txt" colspan="2">
                            带 "<span class="red">*</span>" 的为必填信息
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            管理入口：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:RadioButtonList ID="radlManage" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="显示" Value="1" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="不显示" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            技术支持： <font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:RadioButtonList ID="radlState" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="显示" Value="1" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="不显示" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            技术支持名称：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="txtSupportName" runat="server" Width="200"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            关键词：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtTitle" runat="server" TextMode="MultiLine" Width="360" Height="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            网址：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="txtWebSite" runat="server" Text="http://" Width="200"></asp:TextBox>
                            网址前加http://
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

