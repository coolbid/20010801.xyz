<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdatePassword.aspx.cs" Inherits="Manager_UpdatePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>重设密码</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtAdminPassword").value == "") { alert("请输入原密码！"); document.getElementById("txtAdminPassword").focus(); return false; }
            else if (document.getElementById("txtAdminPassword2").value == "") { alert("请输入新密码！"); document.getElementById("txtAdminPassword2").focus(); return false; }
            else if (document.getElementById("txtAdminPassword3").value == "") { alert("请再输入一次新密码！"); document.getElementById("txtAdminPassword3").focus(); return false; }
            else if (document.getElementById("txtAdminPassword2").value != document.getElementById("txtAdminPassword3").value) { alert("两次输入的新密码不一致！"); return false; }
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
                                重设密码
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
                            原密码：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            新密码：<font color='red'>*</font>
                        </td>
                        <td class="td_left_right">
                            <asp:TextBox ID="txtAdminPassword2" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            再输入一次新密码：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="txtAdminPassword3" runat="server" TextMode="Password"></asp:TextBox>
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
                <img src="images/admin_images/buttom_bgs.gif" width="17" height="17" />
            </td>
            <td valign="bottom" background="images/admin_images/mail_rightbg.gif">
                <img src="images/admin_images/buttom_right2.gif" width="16" height="17" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

