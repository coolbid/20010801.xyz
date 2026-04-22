<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimeLimit.aspx.cs" Inherits="Manager_TimeLimit" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>配置信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var qz = function (id)
        {
            return "string" == typeof id ? document.getElementById(id) : id;
        };
        function checkNull()
        {
            var reg = new RegExp(/^\d*\.?\d{0,2}$/);
            if (qz("txtNumber").value.trim() == "") { alert("请输入设计编号"); qz("txtNumber").focus(); return false; }
            if (qz("txtBeginTime").value.trim() == "") { alert("请输入注册日期"); qz("txtBeginTime").focus(); return false; }
            else if (isDate(qz("txtBeginTime").value.trim()) == false) { qz("txtBeginTime").select(); return false; }
            if (qz("txtEndTime").value.trim() == "") { alert("请输入到期日期"); qz("txtEndTime").focus(); return false; }
            else if (isDate(qz("txtEndTime").value.trim()) == false) { qz("txtEndTime").select(); return false; }
            if (qz("txtPrice").value.trim() == "") { alert("请输入购买价"); qz("txtPrice").focus(); return false; }
            else if (!reg.test(document.getElementById("txtPrice").value))
            {
                alert("金额格式不正确");
                qz("txtPrice").focus(); return false;
            }
            //  if(qz("txtMobile").value.trim()==""){alert("请输入管理员手机"); qz("txtMobile").focus(); return false;}
            //  else if(!(/^13\d{9}$/g.test(qz("txtMobile").value.trim()))&&!(/^15\d{9}$/g.test(qz("txtMobile").value.trim()))&&!(/^18\d{9}$/g.test(qz("txtMobile").value.trim())))
            //  {alert("手机号码格式不对"); qz("txtMobile").focus(); return false;}
            if (qz("txtQQ").value.trim() == "") { alert("请输入管理员QQ号"); qz("txtQQ").focus(); return false; }
            else if (!(/^\d{5,12}$/.test(qz("txtQQ").value.trim())))
            { alert("QQ号码格式不对"); qz("txtQQ").focus(); return false; }
            if (qz("txtEmail").value.trim() == "") { alert("请输入网站管理员邮箱"); qz("txtEmail").focus(); return false; }
            else if (qz("txtEmail").value.trim() != "")
            {
                if (!/^[\w-]+(\.[\w-]+)*@[\w-]+(\.(\w)+)*(\.(\w){2,3})$/.test(qz("txtEmail").value.trim()))
                {
                    alert("请输入正确的邮箱地址！"); qz("txtEmail").focus(); return false;
                }
            }
            //  if(qz("txtSMSToMobile").value.trim()==""){alert("请输入接收短信手机"); qz("txtSMSToMobile").focus(); return false;}
            //  else if(!(/^13\d{9}$/g.test(qz("txtSMSToMobile").value.trim()))&&!(/^15\d{9}$/g.test(qz("txtSMSToMobile").value.trim()))&&!(/^18\d{9}$/g.test(qz("txtSMSToMobile").value.trim())))
            //  {alert("手机号码格式不对"); qz("txtSMSToMobile").focus(); return false;}
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
        //去除字符串首尾空格
        String.prototype.trim = function ()
        {
            return this.replace(/(^\s*)|(\s*$)/g, "");
        }
        //验证是否为日期
        //function validator(){  
        //    if(isDate(document.all.demo1.value.trim())==false){
        //     document.all.demo1.select(); 
        //     return false;
        //    }
        //    
        //}
        /**   
        判断输入框中输入的日期格式是否为 yyyy-mm-dd   或yyyy-m-d
        */
        function isDate(dateString)
        {
            if (dateString.trim() == "") return true;
            //年月日正则表达式
            var r = dateString.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
            if (r == null)
            {
                alert("请输入格式正确的日期\n\r日期格式：yyyy-mm-dd\n\r例    如：2008-08-08\n\r");
                return false;
            }
            var d = new Date(r[1], r[3] - 1, r[4]);
            var num = (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4]);
            if (num == 0)
            {
                alert("请输入格式正确的日期\n\r日期格式：yyyy-mm-dd\n\r例    如：2008-08-08\n\r");
            }
            return (num != 0);
        }
    </script>
    <!--Import javascript file start -->
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb23112"></script>
    <!--Import javascript file end -->
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
                                配置信息
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
                        <td class="left_txt" height="30" colspan="2">
                            带 "<span class="red">*</span>" 的为必填信息
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="td_left_color">
                            网站类型：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:DropDownList ID="dropType" runat="server">
                                <asp:ListItem Text="---请选择---" Value="0"></asp:ListItem>
                                <asp:ListItem Text="入门型"></asp:ListItem>
                                <asp:ListItem Text="标准型"></asp:ListItem>
                                <asp:ListItem Text="旗舰型"></asp:ListItem>
                                <asp:ListItem Text="豪华型"></asp:ListItem>
                                <asp:ListItem Text="定制型"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="td_left">
                            设计编号：<font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtNumber" runat="server" Text="BianHao" Width="160"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            注册日期：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="txtBeginTime" runat="server" Width="160" onclick="WdatePicker()" onfocus="WdatePicker()"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            到期日期：<font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtEndTime" runat="server" Width="160" onclick="WdatePicker()" onfocus="WdatePicker()"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="td_left_color">
                            购买价：<font color='red'>*</font>
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="txtPrice" runat="server" Width="160" Text="1"></asp:TextBox>
                            元
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            售后一对一QQ：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtPhone" runat="server" Width="160"></asp:TextBox>
                        </td>
                    </tr>
                    <%--<tr>
                        <td colspan="2" align="left" class="left_txt2">
                            <strong>联系方式：</strong>
                        </td>
                    </tr>--%>
                    <tr style="display: none;">
                        <td class="td_left_color">
                            手机：
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="txtMobile" runat="server" Width="160" Text="15996581973"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="td_left">
                            QQ：<font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtQQ" runat="server" Width="160" Text="97028861"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            邮箱：<font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtEmail" runat="server" Width="160"></asp:TextBox>
                            忘记密码时，用于找回密码
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td colspan="2" align="left" class="left_txt2" bgcolor="#f2f2f2">
                            <strong>短信状态：</strong>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="td_left">
                            接收短信手机：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtSMSToMobile" runat="server" Width="160"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="td_left">
                            生成静态：<font color='red'>*</font>
                        </td>
                        <td class="td_right">
                            <asp:RadioButtonList ID="radlSMSState" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="关闭" Value="0" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="开启" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            备注信息：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtBeizhu" runat="server" Width="365px" Height="85px" TextMode="MultiLine"></asp:TextBox>
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
