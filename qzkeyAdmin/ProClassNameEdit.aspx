<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProClassNameEdit.aspx.cs" Inherits="Manager_ProClassNameEdit" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <%=strContext %>_商品分类修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtpaixu").value == "") { alert("排序为必填项！"); document.getElementById("txtpaixu").focus(); return false; }
            if (document.getElementById("txtConText").value == "") { alert("分类名称为必填项！"); document.getElementById("txtConText").focus(); return false; }
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
                                分类修改
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
                            <a href="ProClass.aspx">返回商品系统</a>
                            (带 "<span class="red">*</span>" 的为必填信息)
                        </td>
                    </tr>
                </table>
                <!--内容开始-->
                <table cellpadding="2" cellspacing="1" border="0" width="100%" align="center">
                    <tr>
                        <td class="td_left">
                            排列顺序：<font color="red">*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtpaixu" runat="server" Width="60" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            父级：
                        </td>
                        <td class="td_right_color">
                            <asp:DropDownList runat="server" ID="dropParentId">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            分类名称：<font color="red">*</font>
                        </td>
                        <td class="td_right">
                            <asp:TextBox ID="txtConText" runat="server"></asp:TextBox>
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
                            分类状态：
                        </td>
                        <td class="td_right">
                            <asp:RadioButtonList ID="rblstate" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="默认显示" Value="0" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="不显示" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr style="display:none">
                        <td class="td_left_color">
                            有无索引图片：
                        </td>
                        <td class="td_right_color">
                            <asp:RadioButtonList ID="rblpic" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="有"></asp:ListItem>
                                <asp:ListItem Text="没有"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                      <%if (strImg != null && strImg != "")
                          {
                        %>
                        <tr style="height: 50px;">
                            <td style="text-align: left; padding-left: 50px;">
                                缩略图：
                            </td>
                            <td class="News2">
                                <%=chkPic(strImg)%>
                            </td>
                        </tr>
                        <%} %>
                    <tr>
                        <td class="td_left">
                            上传索引图片：
                        </td>
                        <td class="td_right">
                             <asp:TextBox ID="txt_path" value="" runat="server" style="width:220px" CssClass="txtInput normal left" MaxLength="255"></asp:TextBox>
                            <a href="javascript:;" class="files">
                                <input type="file" id="FileUpload" name="FileUpload" onchange="Upload('ProClassMFile', 'txt_path', 'FileUpload');" /></a>
                                   [图片".jpg", ".png", ".gif"]
                            <span class="uploading">正在上传，请稍候...</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                            分类介绍：
                        </td>
                        <td class="td_right_color">
                            <textarea id="content" rows="8" cols="8" runat="server" style="height: 270px; width: 840px;"></textarea>
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
<%--加载编辑器--%>
<script type="text/javascript" charset="utf-8" src="../qz_ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../qz_ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="../qz_ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var edit = new baidu.editor.ui.Editor();
    edit.render("content");
</script>
</html>
