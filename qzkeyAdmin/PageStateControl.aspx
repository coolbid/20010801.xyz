<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageStateControl.aspx.cs" Inherits="Manager_PageStateControl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生成静态</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkNull()
        {
            if (confirm('此操作可能需要花费一些时间！\n\n请谨慎！确定要执行该操作吗？'))
            {
                document.getElementById("divShow").style.display = "none";
                document.getElementById("divHidden").style.display = "block";
                return true;
            }
            else
            {
                return false;
            }
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
                                生成静态
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
                        <td width="15%" bgcolor="#F7F8F9" align="left" style="padding: 20px;">
                            <div>
                                <font>注：本功能可能耗时长，请耐心等待。<br>
                                </font><font style="color: Red;">
                                    <br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;启用生成静态的情况下，网站每次数据有变动都要在这里保存更新一下。<br>
                                </font>
                                <br>
                                <br>
                                <asp:RadioButtonList ID="radState" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1">全站静态</asp:ListItem>
                                    <asp:ListItem Value="2">首页静态</asp:ListItem>
                                    <asp:ListItem Value="0">禁用</asp:ListItem>
                                </asp:RadioButtonList>
                                <br>
                                <div id="divHidden" style="display: none; padding: 5px 0px;">
                                    <table>
                                        <tr>
                                            <td>
                                                <img src="images/admin_images/loading.gif" />
                                            </td>
                                            <td>
                                                <span style="color: #666; padding-left:5px;">正在保存，请耐心等待...</span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="divShow" style="padding-top: 5px;">
                                    <asp:Button ID="btnStaticPage" Text="保存更新" runat="server" OnClick="btnSaveStaticPage" Style="cursor: pointer;" />
                                </div>
                            </div>
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

