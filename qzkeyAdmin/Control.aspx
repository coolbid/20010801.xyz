<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Control.aspx.cs" Inherits="Manager_Control" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>功能控制</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <!--Import javascript file start -->
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb23112"></script>
    <!--Import javascript file end -->
    <style>
        .td_left {
            width: 28% !important;
        }
    </style>
     <script type="text/javascript">
        function checkNull()
        {
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
            <td width="17" valign="top" style="background: url('images/admin_images/mail_leftbg.gif');">
                <img src="images/admin_images/left-top-right.gif" width="17" height="29" alt="" />
            </td>
            <td valign="top" style="background: url('images/admin_images/content-bg.gif');">
                <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg">
                    <tr>
                        <td height="31">
                            <div class="titlebt">
                                功能控制
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="16" valign="top" style="background: url('images/admin_images/mail_rightbg.gif');">
                <img src="images/admin_images/nav-right-bg.gif" width="16" height="29" alt="" />
            </td>
        </tr>
        <tr>
            <td valign="middle" style="background: url('images/admin_images/mail_leftbg.gif');">
                &nbsp;
            </td>
            <td valign="top" bgcolor="#F7F8F9">
                <!--内容开始-->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   
                  




                    <tr>
                        <td class="td_left">
                            会员功能：<font style="color:red">（包含登录/注册功能）</font>
                        </td>
                        <td class="td_right">
                            <asp:RadioButtonList ID="VIPControl" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Text="关闭" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="开启"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">
                            购买功能：<font style="color:red">（包含购物车、提交订单、支付等功能）</font>
                        </td>
                        <td class="td_right">
                            <asp:RadioButtonList ID="BUYControl" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Text="关闭" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="开启"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">
                            评论/点赞功能：
                        </td>
                        <td class="td_right">
                            <asp:RadioButtonList ID="PLControl" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Text="关闭" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="开启"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                      
                    </tr>

                     <tr>
                        <td class="td_left">
                            产品详情加强版：
                        </td>
                        <td class="td_right">
                            <asp:RadioButtonList ID="ProControl" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Text="关闭" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="开启"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                      
                    </tr>

                    <tr>
                        <td class="td_left">
                            浏览统计：
                        </td>
                        <td class="td_right">
                            <asp:RadioButtonList ID="LiuliangControl" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Text="关闭" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="开启"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                      
                    </tr>


                    <tr>
                        <td class="td_left">
                            域名白名单：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtbaiming" runat="server" Width="565px"></asp:TextBox>
                            说明：不填则无限制,所有域名均可访问。多个域名可用英文逗号“,”隔开；
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left" style="color:red">
                            支付宝支付配置
                        </td>
                        <td class="td_right">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            支付宝签约账号：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtpartner" runat="server" Width="265px"></asp:TextBox>
                            说明：合作身份者ID，签约账号，以2088开头由16位纯数字组成的字符串，查看地址：https://b.alipay.com/order/pidAndKey.htm；
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            支付宝MD5密钥：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtkey" runat="server" Width="265px"></asp:TextBox>
                            说明：MD5密钥，安全检验码，由数字和字母组成的32位字符串，查看地址：https://b.alipay.com/order/pidAndKey.htm；
                        </td>
                    </tr>

                 
                    <tr>
                        <td class="td_left" style="color:red">
                            微信支付配置
                        </td>
                        <td class="td_right">
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">
                            公众号appid：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtWxAppid" runat="server" Width="265px"></asp:TextBox>
                            说明：公众号appid，查看页面：https://mp.weixin.qq.com/ --开发配置
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            公众号appsecret：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtWxAppsecret" runat="server" Width="265px"></asp:TextBox>
                            说明：公众号appsecret，查看页面：https://mp.weixin.qq.com/ --开发配置
                        </td>
                    </tr><tr>
                        <td class="td_left">
                            商户号：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtWxMchid" runat="server" Width="265px"></asp:TextBox>
                            说明：微信支付分配的商户号(mch_id)，查看页面：https://pay.weixin.qq.com/ --商户信息
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            商户支付密钥：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtWxKey" runat="server" Width="265px"></asp:TextBox>
                            说明：商户平台的api密钥，设置页面：https://pay.weixin.qq.com/ --API安全
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left" style="color:red">
                            PayPal支付配置
                        </td>
                        <td class="td_right">
                        </td>
                    </tr>
                     <tr>
                        <td class="td_left">
                            PayPal商家账号：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtPayPal" runat="server" Width="265px"></asp:TextBox>
                            说明：paypal账户名（paypal商家账号的账户名，格式为邮箱）
                        </td>
                    </tr>
                     <tr>
                        <td class="td_left">
                            PayPal的汇率：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtHuiLv" runat="server" Width="265px"></asp:TextBox>
                            说明：paypal支付钱将订单金额从人民币换算为美元，所用汇率
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                        </td>
                        <td class="td_right" style="padding-top: 5px;">
                            <div id="divHidden" style="display: none;">
                                <img src="images/admin_images/loading.gif" alt="" />
                                <span style="color: #666;">正在保存...</span></div>
                            <div id="divShow">
                                <asp:Button ID="btnSave" Text="保 存 内 容" runat="server" OnClick="btnSaveClick" />
                            </div>
                        </td>
                    </tr>


                    <tr style="display:none">
                        <td class="td_left">
                            
                        </td>
                        <td class="td_right">
                              <asp:Button ID="Button1" Text="伪静态按钮" runat="server" OnClick="btnSaveClick1" />
                            <font style="color:red">本功能将会修改页面中的链接。请谨慎使用</font>
                        </td>
                    </tr>
                </table>
                <!--内容结束-->
            </td>
            <td style="background: url('images/admin_images/mail_rightbg.gif');">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="bottom" style="background: url('images/admin_images/mail_leftbg.gif');">
                <img src="images/admin_images/buttom_left2.gif" width="17" height="17" alt="" />
            </td>
            <td style="background: url('images/admin_images/buttom_bgs.gif');">
                <img src="images/admin_images/buttom_bgs.gif" width="17" height="17" alt="" />
            </td>
            <td valign="bottom" style="background: url('images/admin_images/mail_rightbg.gif');">
                <img src="images/admin_images/buttom_right2.gif" width="16" height="17" alt="" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
