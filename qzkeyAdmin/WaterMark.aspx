<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WaterMark.aspx.cs" Inherits="Manager_WaterMark" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>图片水印</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <!--Import javascript file start -->
    <script src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb23112"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>
    <script src="/js/Validator-2.0.1.js" type="text/javascript"></script>
    <script src="/js/simpleAlert.js" type="text/javascript"></script>
    <link href="/js/simpleAlert.css" rel="stylesheet" type="text/css" />
    <!--Import javascript file end -->
     <script type="text/javascript">
        function checkNull()
        {
            var watermarkimgquality = document.getElementById("watermarkimgquality").value;
            if (watermarkimgquality < 0 || watermarkimgquality > 100) {
                TYalter("请输入0-100!");
                return false;
            }
            var watermarktransparency = document.getElementById("watermarktransparency").value;
            if (watermarktransparency < 0 || watermarktransparency > 10) {
                TYalter("请输入0-10!");
                return false;
            }
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
                                图片水印
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
                            图片水印类型：
                        </td>
                        <td class="td_right">
                            <asp:RadioButtonList ID="watermarktype" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                                <asp:ListItem Value="0" Selected="True">关闭水印 </asp:ListItem>
                                <asp:ListItem Value="1">文字水印 </asp:ListItem>
                                <asp:ListItem Value="2">图片水印 </asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            图片水印位置：
                        </td>
                        <td class="td_right_color">
                            <asp:RadioButtonList ID="watermarkposition" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                                <asp:ListItem Value="1">左上 </asp:ListItem>
                                <asp:ListItem Value="2">中上 </asp:ListItem>
                                <asp:ListItem Value="3">右上 </asp:ListItem>
                                <asp:ListItem Value="4">左中 </asp:ListItem>
                                <asp:ListItem Value="5">居中 </asp:ListItem>
                                <asp:ListItem Value="6">右中 </asp:ListItem>
                                <asp:ListItem Value="7">左下 </asp:ListItem>
                                <asp:ListItem Value="8">中下 </asp:ListItem>
                                <asp:ListItem Value="9" Selected="True">右下 </asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            图片生成质量：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="watermarkimgquality" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" runat="server" CssClass="txtInput small required digits"
                                MaxLength="3" ></asp:TextBox><label>*取值范围 0-100, 0质量最低, 100质量最高, 默认80</label>
                        </td>
                    </tr>



                    <%if (strImg != null && strImg != "")
                          {
                        %>
                        <tr style="height: 50px;">
                            <td style="text-align: left; padding-left: 50px;">
                                水印缩略图：
                            </td>
                            <td class="News2">
                                <%=chkPic(strImg)%>
                            </td>
                        </tr>
                        <%} %>

                         <tr>
                            <td class="td_left">
                                上传水印图：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                            <asp:TextBox ID="watermarkpic" value="" runat="server" style="width:250px" CssClass="txtInput normal left" MaxLength="255"></asp:TextBox>
                            <a href="javascript:;" class="files">
                                <input type="file" id="FileUpload" name="FileUpload" onchange="Upload('WaterMFile', 'watermarkpic', 'FileUpload');" /></a>[水印图片".jpg", ".png", ".gif"]
                        </td>
                        </tr>




                    <tr>
                        <td class="td_left">
                            水印透明度：
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="watermarktransparency" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" runat="server" CssClass="txtInput small required digits"
                                MaxLength="2" >5</asp:TextBox><label>*取值范围1--10 (10为不透明)，默认5</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            水印文字：
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox ID="watermarktext" runat="server" CssClass="txtInput normal required"
                                MaxLength="100"></asp:TextBox><label>*文字水印的内容，默认腾云网</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            文字字体：
                        </td>
                        <td class="td_right">
                            <asp:DropDownList ID="watermarkfont" runat="server" CssClass="txtInput">
                                <asp:ListItem Value="Arial">Arial</asp:ListItem>
                                <asp:ListItem Value="Arial Black">Arial Black</asp:ListItem>
                                <asp:ListItem Value="Batang">Batang</asp:ListItem>
                                <asp:ListItem Value="BatangChe">BatangChe</asp:ListItem>
                                <asp:ListItem Value="Comic Sans MS">Comic Sans MS</asp:ListItem>
                                <asp:ListItem Value="Courier New">Courier New</asp:ListItem>
                                <asp:ListItem Value="Dotum">Dotum</asp:ListItem>
                                <asp:ListItem Value="DotumChe">DotumChe</asp:ListItem>
                                <asp:ListItem Value="Estrangelo Edessa">Estrangelo Edessa</asp:ListItem>
                                <asp:ListItem Value="Franklin Gothic Medium">Franklin Gothic Medium</asp:ListItem>
                                <asp:ListItem Value="Gautami">Gautami</asp:ListItem>
                                <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                                <asp:ListItem Value="Gulim">Gulim</asp:ListItem>
                                <asp:ListItem Value="GulimChe">GulimChe</asp:ListItem>
                                <asp:ListItem Value="Gungsuh">Gungsuh</asp:ListItem>
                                <asp:ListItem Value="GungsuhChe">GungsuhChe</asp:ListItem>
                                <asp:ListItem Value="Impact">Impact</asp:ListItem>
                                <asp:ListItem Value="Latha">Latha</asp:ListItem>
                                <asp:ListItem Value="Lucida Console">Lucida Console</asp:ListItem>
                                <asp:ListItem Value="Lucida Sans Unicode">Lucida Sans Unicode</asp:ListItem>
                                <asp:ListItem Value="Mangal">Mangal</asp:ListItem>
                                <asp:ListItem Value="Marlett">Marlett</asp:ListItem>
                                <asp:ListItem Value="Microsoft Sans Serif">Microsoft Sans Serif</asp:ListItem>
                                <asp:ListItem Value="MingLiU">MingLiU</asp:ListItem>
                                <asp:ListItem Value="MS Gothic">MS Gothic</asp:ListItem>
                                <asp:ListItem Value="MS Mincho">MS Mincho</asp:ListItem>
                                <asp:ListItem Value="MS PGothic">MS PGothic</asp:ListItem>
                                <asp:ListItem Value="MS PMincho">MS PMincho</asp:ListItem>
                                <asp:ListItem Value="MS UI Gothic">MS UI Gothic</asp:ListItem>
                                <asp:ListItem Value="MV Boli">MV Boli</asp:ListItem>
                                <asp:ListItem Value="Palatino Linotype">Palatino Linotype</asp:ListItem>
                                <asp:ListItem Value="PMingLiU">PMingLiU</asp:ListItem>
                                <asp:ListItem Value="Raavi">Raavi</asp:ListItem>
                                <asp:ListItem Value="Shruti">Shruti</asp:ListItem>
                                <asp:ListItem Value="Sylfaen">Sylfaen</asp:ListItem>
                                <asp:ListItem Value="Symbol">Symbol</asp:ListItem>
                                <asp:ListItem Value="Tahoma" Selected="selected">Tahoma</asp:ListItem>
                                <asp:ListItem Value="Times New Roman">Times New Roman</asp:ListItem>
                                <asp:ListItem Value="Trebuchet MS">Trebuchet MS</asp:ListItem>
                                <asp:ListItem Value="Tunga">Tunga</asp:ListItem>
                                <asp:ListItem Value="Verdana">Verdana</asp:ListItem>
                                <asp:ListItem Value="Webdings">Webdings</asp:ListItem>
                                <asp:ListItem Value="Wingdings">Wingdings</asp:ListItem>
                                <asp:ListItem Value="仿宋_GB2312">仿宋_GB2312</asp:ListItem>
                                <asp:ListItem Value="宋体">宋体</asp:ListItem>
                                <asp:ListItem Value="新宋体">新宋体</asp:ListItem>
                                <asp:ListItem Value="楷体_GB2312">楷体_GB2312</asp:ListItem>
                                <asp:ListItem Value="黑体">黑体</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="watermarkfontsize" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" runat="server" CssClass="txtInput small2 required digits"
                                MaxLength="10">12</asp:TextBox>px
                            <label>
                                *文字水印的字体和大小（默认12）</label>
                        </td>
                    </tr>

                 





                    <tr>
                        <td class="td_left_color">
                        </td>
                        <td class="td_right_color" style="padding-top: 5px;">
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
