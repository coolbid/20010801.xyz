<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebSiteSet.aspx.cs" Inherits="Manager_WebSiteSet" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
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
            <td width="17" valign="top" background="images/admin_images/mail_leftbg.gif">
                <img src="images/admin_images/left-top-right.gif" width="17" height="29" />
            </td>
            <td valign="top" background="images/admin_images/content-bg.gif">
                <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg">
                    <tr>
                        <td height="31">
                            <div class="titlebt">
                                网站信息
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
                        <td class="left_txt" colspan="2">
                            带 "<span class="red">*</span>" 的为必填信息
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#f2f2f2" class="left_txt2">
                            单位名称：<font color='red'>*</font>
                        </td>
                        <td width="85%" bgcolor="#f2f2f2">
                            <asp:TextBox ID="txtCompanyName" runat="server" Width="400"></asp:TextBox>
                            <div style="display:none">
                            <asp:CheckBox ID="chkNameState" runat="server" />
                            该名称同时显示为公司LOGO
                            <a href="PicManage.aspx">【或可以点这里上传图片LOGO】</a>
                                </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="left_txt2">
                            单位地址：
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#f2f2f2" class="left_txt2">
                            联系电话：
                        </td>
                        <td bgcolor="#f2f2f2">
                            <asp:TextBox ID="txtPhone" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="left_txt2">
                            手机：
                        </td>
                        <td>
                            <asp:TextBox ID="txtMobile" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#f2f2f2" class="left_txt2">
                            邮箱：
                        </td>
                        <td bgcolor="#f2f2f2">
                            <asp:TextBox ID="txtEmail" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="left_txt2">
                            传真：
                        </td>
                        <td>
                            <asp:TextBox ID="txtFax" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#f2f2f2" class="left_txt2">
                            联系人：
                        </td>
                        <td bgcolor="#f2f2f2">
                            <asp:TextBox ID="txtContact" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="left_txt2">
                            业务QQ：
                        </td>
                        <td>
                            <asp:TextBox ID="txtQQ" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#f2f2f2" class="left_txt2">
                            微信号：
                        </td>
                        <td bgcolor="#f2f2f2">
                            <asp:TextBox ID="txtWeChat" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                   
                    <tr>
                        <td class="left_txt2">
                            邮编：
                        </td>
                        <td>
                            <asp:TextBox ID="txtZip" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#f2f2f2" class="left_txt2">
                            网站备案号：
                        </td>
                        <td bgcolor="#f2f2f2">
                            <asp:TextBox ID="txtICP" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="left_txt2">
                            网站网址：
                        </td>
                        <td>
                            <asp:TextBox ID="txtWebUrl" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>

                     <tr>
                        <td bgcolor="#f2f2f2" class="left_txt2">
                            微信Openid：
                        </td>
                        <td bgcolor="#f2f2f2">
                            <asp:TextBox ID="txtopenid" runat="server" Width="400"></asp:TextBox>说明：用于产品在线询盘微信信息推送提示功能。 <a style="color:blue" href="erweima.aspx">点击获取</a>
                        </td>
                    </tr>


                    <tr>
                        <td class="left_txt2" bgcolor="#f2f2f2">
                            网站地图：
                        </td>
                        <td bgcolor="#f2f2f2">
                            <textarea id="content" rows="8" cols="8" runat="server" style="height: 270px; width: 900px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="left_txt2">
                        </td>
                        <td>
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
                                <asp:Button ID="btnSave" Text="保 存 内 容" runat="server" OnClick="btnSaveClick"  CssClass="button"/></div>
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

