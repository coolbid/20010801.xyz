<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChuShihua.aspx.cs" Inherits="Manager_ChuShihua" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>初始化信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1-7-2.js" type="text/javascript"></script>
    <script type="text/javascript">

        function Checkbtn()
        {
            if (confirm('该操作需谨慎，误操作后果很严重！确定吗?'))
            {
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
                                初始化信息
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
                        <td class="td_left">
                            初始化信息：
                        </td>
                        <td class="td_right">
                            <div id="divHidden" style="display: none;">
                                <img src="images/admin_images/loading.gif" alt="" />
                                <span style="color: #666;">正在备份...</span></div>
                            <div id="divShow" style="float:left" >
                                <asp:Button ID="button1" runat="server" Text="初始化 - 技术支持" CssClass="button" OnClick="button1_click" />
                                <p>
                                </p>
                                <asp:Button ID="button2" runat="server" Text="初始化 - 网站优化" CssClass="button" OnClick="button2_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button3" runat="server" Text="初始化 - 栏目优化" CssClass="button" OnClick="button3_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button4" runat="server" Text="初始化 - 用户管理" CssClass="button" OnClick="button4_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button5" runat="server" Text="初始化 - 嵌入代码" CssClass="button" OnClick="button5_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button6" runat="server" Text="初始化 - 客户留言" CssClass="button" OnClick="button6_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button7" runat="server" Text="初始化 - 在线客服" CssClass="button" OnClick="button7_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button8" runat="server" Text=" 一 键 初 始 化 " CssClass="button" Style="height: 40px; width: 118px;" OnClick="button8_Click" />
                            </div>
                            <div id="divShow1" style="padding-left: 220px;">
                                <asp:Button ID="button9" runat="server" Text="初始化 - 操作日志" CssClass="button" OnClick="button9_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button10" runat="server" Text="初始化 - 会员账号" CssClass="button" OnClick="button10_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button11" runat="server" Text="初始化 - 订单系统" CssClass="button" OnClick="button11_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button12" runat="server" Text="初始化 - 评论系统" CssClass="button" OnClick="button12_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button13" runat="server" Text="初始化 - 在线表单" CssClass="button" OnClick="button13_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button14" runat="server" Text="初始化 - 微信标识" CssClass="button" OnClick="button14_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button15" runat="server" Text="初始化 - 功能控制" CssClass="button" OnClick="button15_Click" />
                                <p>
                                </p>
                                <asp:Button ID="button16" runat="server" Text=" 一 键 初 始 化 " CssClass="button" Style="height: 40px; width: 118px;" OnClick="button16_Click" />
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
