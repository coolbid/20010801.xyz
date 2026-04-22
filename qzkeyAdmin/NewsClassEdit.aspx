<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsClassEdit.aspx.cs" Inherits="Manager_NewsClassNameEdit" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>栏目设置</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/flash.js"></script>
    <script src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>
    <script type="text/javascript">
        function checkNull()
        {
            var objdropColumnType = document.all("dropColumnType");
            if (objdropColumnType.options[objdropColumnType.selectedIndex].value == "--选择栏目类别--")
            {
                alert("请选择栏目类别！"); objdropColumnType.focus(); return false;
            }
            if (document.getElementById("txtColumnName").value == "")
            {
                alert("栏目名称为必填项！"); document.getElementById("txtColumnName").focus(); return false;
            }
            else
            {
                document.getElementById("divShow").style.display = "none";
                document.getElementById("divHidden").style.display = "block";
                return true;
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
                                栏目修改
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
                            <a href="NewsClass.aspx">栏目管理</a>
                            |
                            <a href="NewsClassEdit.aspx?Action=Add" id="A4">→添加栏目</a>
                            (带 "<span class="red">*</span>" 的为必填信息)
                        </td>
                    </tr>
                </table>
                <!--内容开始-->
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                    <tr>
                        <td class="td_left">
                            父级：
                        </td>
                        <td class="td_right">
                            <asp:DropDownList runat="server" ID="dropParentId">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            栏目类别：
                        </td>
                        <td class="td_right_color">
                            <asp:DropDownList ID="dropColumnType" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            栏目名称：<font color="red">*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtColumnName" runat="server" Width="300"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            链接地址：
                        </td>
                        <td class="td_right_color">
                            <asp:TextBox runat="server" ID="txtColumnUrlClient" Width="300"></asp:TextBox>提示：自动生成，请勿改动，否则前台页面会出错。
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            副标题：
                        </td>
                        <td class="td_right">
                            <asp:TextBox runat="server" ID="txtColumnSubName" Width="300"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="22%" height="30" align="left" bgcolor="#f2f2f2" class="left_txt2">
                            SEO-标题：
                        </td>
                        <td width="78%" bgcolor="#f2f2f2" align="left">
                            <asp:TextBox ID="txtTitle" runat="server" Width="500"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="22%" height="70" align="left" class="left_txt2">
                            SEO-描述：
                        </td>
                        <td width="78%" align="left" height="70">
                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Width="500" Height="55"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="22%" height="70" align="left" bgcolor="#f2f2f2" class="left_txt2">
                            SEO-关键词：
                        </td>
                        <td width="78%" align="left" height="70" bgcolor="#f2f2f2">
                            <asp:TextBox ID="txtKeyWords" TextMode="MultiLine" runat="server" Width="500" Height="55"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            备注：
                        </td>
                        <td class="td_right">
                            <asp:TextBox runat="server" ID="txtRemarks" TextMode="MultiLine" Width="500" Height="55"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            尺寸(宽×高)：
                        </td>
                        <td class="td_right_color">
                            <input type="text" id="txtWidth" runat="server" style="width: 40px;" value="0" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" />
                            PX ×
                            <input type="text" id="txtLength" runat="server" style="width: 40px;" value="0" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" />
                            PX
                        </td>
                    </tr>
                    <%if (strImg != null && strImg != "")
                      {
                    %>
                    <tr>
                        <td style="text-align: left; padding-left: 50px;">
                            缩略图
                        </td>
                        <td class="News2">
                            <%=newsclass.change(strImg.Substring(strImg.Length-3, 3),strImg)%>
                        </td>
                    </tr>
                    <%} %>
                    <tr>
                        <td class="td_left">
                            上传缩略图：
                        </td>
                        <td class="td_right">
                           <asp:TextBox ID="txt_path" value="" runat="server" style="width:250px" CssClass="txtInput normal left" MaxLength="255"></asp:TextBox>
                            <a href="javascript:;" class="files">
                                <input type="file" id="FileUpload" name="FileUpload" onchange="Upload('NewsClassMFile', 'txt_path', 'FileUpload');" /></a>
                            [说明：支持".jpg", ".png", ".gif",".bmp",".swf"]
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            排序：
                        </td>
                        <td class="td_right_color">
                            <input type="text" id="txtColumnNo" runat="server" style="width: 40px;" value="1" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            网站栏目：
                        </td>
                        <td class="td_right">
                            <asp:RadioButtonList ID="radlIndexStatus" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Text="是" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="否"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr <%if (strRole != "1"){%> style="display: none;" <%} %>>
                        <td class="td_left_color">
                            权限等级：
                        </td>
                        <td class="td_right_color">
                            <asp:RadioButtonList ID="radlRole" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Value="0" Text="管理员" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="超级管理员"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            &nbsp;
                        </td>
                        <td class="td_right">
                            <div id="divHidden" style="display: none;">
                                <img src="images/admin_images/loading.gif" alt="" />
                                <span style="color: #666;">正在保存...</span></div>
                            <div id="divShow">
                                <asp:Button ID="btnSave" runat="server" Text="保 存 内 容" OnClick="btnSaveClick" class="button" /></div>
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
