<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetupCode.aspx.cs" ValidateRequest="false"
    Inherits="Manager_SetupCode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>嵌入代码</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkNull()
        {
            var CodeState = document.getElementsByName("radlState");
            for (var i = 0; i < CodeState.length; i++)
            {
                if (CodeState[i].checked && CodeState[i].value == "1" && document.getElementById("txtContent").value == "")
                {
                    alert("请输入要嵌入的代码！");
                    document.getElementById("txtContent").focus();
                    return false;
                }
            }
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
                                嵌入代码
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
                            状态：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:RadioButtonList ID="radlState" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="关闭" Value="0" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="启用" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            代码内容：<font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="660" Height="400"></asp:TextBox>
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

