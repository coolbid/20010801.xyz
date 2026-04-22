<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SeoDo.aspx.cs" Inherits="Manager_SeoDo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>栏目优化</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtBiaoti").value == "") { alert("请填写标题！"); document.getElementById("txtBiaoti").focus(); return false; }
            if (document.getElementById("txtMiaoshu").value == "") { alert("请填写描述！"); document.getElementById("txtMiaoshu").focus(); return false; }
            if (document.getElementById("txtGuanjianci").value == "") { alert("请填写关键词！"); document.getElementById("txtGuanjianci").focus(); return false; }
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
                    <tr style="height: 50px;">
                        <td class="td_left">
                            栏目标题：<font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtBiaoti" runat="server" TextMode="MultiLine" Width="500" Height="30" placeholder="天镇顺通驾校"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 80px;">
                        <td class="td_left_color">
                            栏目描述：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="txtMiaoshu" runat="server" TextMode="MultiLine" Width="500" Height="60" placeholder="天镇顺通驾校，训练场靠市场实行全封闭管理，一流的硬件设施、训练场地、师资队伍，全新的捷达训练车，教练员有吃、拿、卡、要等不正当行为，辞退教练员并奖励举报者1000元。"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 70px;">
                        <td class="td_left">
                            栏目关键词：<font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtGuanjianci" runat="server" TextMode="MultiLine" Width="500" Height="50" placeholder="天镇顺通驾校,天镇驾校,顺通驾校"></asp:TextBox>
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

