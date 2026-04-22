<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Manager_About" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <%=strColumnName%>_编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkNull() {
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
                            <div class="title_left">
                            </div>
                            <div class="titlebt2">
                                <%=strColumnName%>
                            </div>
                            <div class="title_right">
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
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="left_txt" colspan="2" bgcolor="#f2f2f2" align="left">
                            <a href="NewsClass.aspx">返回导航菜单</a>
                        </td>
                    </tr>
                </table>
                <!--内容开始-->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td colspan="2" style="padding-top: 10px;">
                            <textarea id="content" rows="8" cols="8" runat="server" style="height: 350px; width: 900px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="background-color: #f2f2f2; height: 30px;">
                            <div id="divHidden" style="display: none;">
                                <img src="images/admin_images/loading.gif" alt="" />
                                <span style="color: #666;">正在保存...</span></div>
                            <div id="divShow">
                                <asp:Button ID="btnSave" runat="server" Text="保 存 内 容" OnClick="btnSaveCick" class="button" /></div>
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
<%--加载编辑器--%>
<script type="text/javascript" charset="utf-8" src="../qz_ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../qz_ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="../qz_ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var edit = new baidu.editor.ui.Editor();
    edit.render("content");
</script>
</html>

