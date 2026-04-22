<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Show_Success.aspx.cs" Inherits="Manager_Show_Success" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>成功提示</title>
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
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
                                成功提示
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
            <td valign="top" bgcolor="#F7F8F9" align="center">
                <!--内容开始-->
                <table cellpadding="0" cellspacing="0" align="center" width="100%">
                    <tr>
                        <td align="right" width="40%">
                            <img src="images/admin_images/tishi.png" />
                        </td>
                        <td align="left" width="60%">
                            <table cellpadding="0" cellspacing="10" align="center" width="100%">
                                <tr align="left">
                                    <td width="100%" colspan="2">
                                        <%=strMessage%>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="redirectionMsg" align="left">
                                        如果您不做出选择，将在 <span id="spanSeconds">1</span> 秒后跳转到第一个链接地址。
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" colspan="2" style="text-align: left;">
                                        <a href="<%=strUrl%>" title="返回上一页">返回上一页</a>
                                    </td>
                                </tr>
                            </table>
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
    <script type="text/javascript">
<!--
        var seconds = 1;
        var defaultUrl = "<%=strUrl %>";


        onload = function ()
        {
            if (defaultUrl == 'javascript:history.go(-1)' && window.history.length == 0)
            {
                document.getElementById('redirectionMsg').innerHTML = '';
                return;
            }

            window.setInterval(redirection, 1000);
        }
        function redirection()
        {
            if (seconds <= 0)
            {
                window.clearInterval();
                return;
            }

            seconds--;
            document.getElementById('spanSeconds').innerHTML = seconds;

            if (seconds == 0)
            {
                window.clearInterval();
                location.href = defaultUrl;
            }
        }
//-->
    </script>
    </form>
</body>
</html>

