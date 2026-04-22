<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewsSet.aspx.cs" Inherits="Manager_AddNewsSet" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>批量上传</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1-7-2.js"></script>
    <script type="text/javascript">
        function checkNull()
        {
            var ckeckk = $("#ckname").attr("checked");
            var ProName = $("#txtProName").val();
            if (ckeckk != "checked")
            {
                if (ProName == "" || ProName == null)
                {
                    alert("请填写名称");
                    $("#txtProName").focus(); //escape
                    return false;
                }
            }
            window.open("AddNews.aspx?ClassId=" + escape($("#txtClassID").val()) + "&Title=" + escape(ProName) + "&Check=" + escape(ckeckk), '_self');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input runat="server" type="hidden" id="txtClassID" value="" />
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
                                批量上传
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
                        <td class="left_txt" bgcolor="#f2f2f2" align="left">
                            <a href="NewsClass.aspx">返回导航菜单</a>
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                    <tr>
                        <td class="td_left">
                            名称：<font color="red">*</font>
                        </td>
                        <td class="td_right">
                            <input type="text" id="txtProName" style="white-space: 415px;" />
                            <input type="checkbox" id="ckname" />使用图片名称作为标题
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                        </td>
                        <td class="td_right_color" style="line-height: 50px; padding: 10px 0;">
                            <input type="button" value="设置好了，去添加图片" style="cursor: pointer;" onclick="checkNull()" />
                        </td>
                    </tr>
                </table>
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
