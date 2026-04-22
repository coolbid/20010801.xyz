<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeiXing.aspx.cs" Inherits="Manager_LeiXing" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>配置信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <style>
        .td_right
        {
            width:35%!important;
        }
    </style>
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
                <font style="color:red">说明：以下为各个文件上传的格式限制和大小限制。（文件大小只允许填正整数）</font>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   

                     



                    <tr>
                        <th class="td_left" style="text-align: left;">
                            处理对象：
                        </th>
                        <th class="td_right">
                            文件类型<font style="color:red">(请用英文逗号','隔开)</font>：
                        </th>
                        <th class="td_right">
                            文件大小：
                        </th>
                    </tr>




                    <tr>
                        <td class="td_left">
                            <font style="color:red">下载中心(附件)</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="DownloadFile" runat="server" Width="365px"></asp:TextBox>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="DownloadFileLength" runat="server" Width="365px"></asp:TextBox><font style="color:red">(单位:M)</font>
                        </td>
                    </tr>


                     <tr>
                        <td class="td_left">
                            <font style="color:red">图片管理</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="PicManageFile" runat="server" Width="365px"></asp:TextBox>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="PicManageFileLength" runat="server" Width="365px"></asp:TextBox><font style="color:red">(单位:KB)</font>
                        </td>
                    </tr>


                     <tr>
                        <td class="td_left">
                            <font style="color:red">网站背景</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="BackGroundFile" runat="server" Width="365px"></asp:TextBox>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="BackGroundFileLength" runat="server" Width="365px"></asp:TextBox><font style="color:red">(单位:KB)</font>
                        </td>
                    </tr>

                     <tr>
                        <td class="td_left">
                            <font style="color:red">栏目</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="NewsClassFile" runat="server" Width="365px"></asp:TextBox>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="NewsClassFileLength" runat="server" Width="365px"></asp:TextBox><font style="color:red">(单位:KB)</font>
                        </td>
                    </tr>

                     <tr>
                        <td class="td_left">
                            <font style="color:red">新闻图片</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="NewsFile" runat="server" Width="365px"></asp:TextBox>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="NewsFileLength" runat="server" Width="365px"></asp:TextBox><font style="color:red">(单位:KB)</font>
                        </td>
                    </tr>

                     <tr>
                        <td class="td_left">
                            <font style="color:red">产品分类</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="ProClassFile" runat="server" Width="365px"></asp:TextBox>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="ProClassFileLength" runat="server" Width="365px"></asp:TextBox><font style="color:red">(单位:KB)</font>
                        </td>
                    </tr>

                     <tr>
                        <td class="td_left">
                            <font style="color:red">产品详情</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="ProductFile" runat="server" Width="365px"></asp:TextBox>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="ProductFileLength" runat="server" Width="365px"></asp:TextBox><font style="color:red">(单位:KB)</font>
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
