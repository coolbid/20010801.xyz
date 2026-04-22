<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PicManage.aspx.cs" Inherits="wltx_admin_PicManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>图片管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/flash.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>    <script type="text/javascript">
        function checkNull()
        {
            var objType = document.getElementById("dropType").options[document.getElementById("dropType").selectedIndex].value;
            if (objType == "0") { alert("请选择文件类型！"); document.getElementById("dropType").focus(); return false; }
            var objClassID = document.getElementById("dropClassID").options[document.getElementById("dropClassID").selectedIndex].value;
            if (objClassID == "0") { alert("请选择图片要放置的位置！"); document.getElementById("dropClassID").focus(); return false; }
            if (document.getElementById("txtWidth").value == "") { alert("请输入宽度！"); document.getElementById("txtWidth").focus(); return false; }
            if (document.getElementById("txtLength").value == "") { alert("请输入高度！"); document.getElementById("txtLength").focus(); return false; }
            if (document.getElementById("fileup").value == "" && document.getElementById("pic").value == "upload/default.jpg") { alert("请选择要上传的图片！"); document.getElementById("fileup").focus(); return false; }
            if (document.getElementById("txtBeizhu").value == "") { alert("请填写备注说明！"); document.getElementById("txtBeizhu").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
    </script>
    <style type="text/css">
        .pro td img { max-width: 150px; max-height: 110px; width: expression(this.width >150 && this.height < this.width ? 150: true); height: expression(this.height > 110 ? 110: true); }
    </style>
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
                                图片管理</div>
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
                <asp:Panel ID="pnlList" runat="server" HorizontalAlign="Center" Width="100%">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="left_txt" colspan="2" bgcolor="#f2f2f2" align="left">
                                <a href="PicManage.aspx">图片管理</a>
                                | <a href="PicManage.aspx?Action=Add">上传图片</a>
                            </td>
                        </tr>
                    </table>
                    <asp:DataList ID="gvList" runat="server" ShowFooter="false" ShowHeader="false" RepeatColumns="4" RepeatDirection="horizontal" Width="100%" OnDeleteCommand="gvList_DeleteCommand">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="10" align="center" class="pro">
                                <tr>
                                    <td align="center" style="border: #ddd solid 1px; width: 150px; height: 110px; padding: 0px;">
                                        <%#newsclass.change(Eval("Type", "{0}"), Eval("Path", "{0}"))%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <%#Eval("Beizhu")%>
                                        <br />
                                        <%#ChangeType(Int32.Parse(Eval("ClassID","{0}")))%>
                                        宽
                                        <%#Eval("Width")%>px&nbsp;&nbsp;高
                                        <%#Eval("Length")%>px
                                        <br />
                                        <a href="?Action=Add&ID=<%# Eval("ID") %>">[修改]</a>
                                        |
                                        <asp:LinkButton ID="linkbutton1" runat="server" Text="[删除]" CommandName="Delete" OnClientClick="return confirm('删除后无法恢复！您确定要删除吗？')"></asp:LinkButton>
                                        | <a href="../<%#Eval("Path") %>" title="<%#Eval("Beizhu")%>" target="_blank">[预览]</a>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
                <asp:Panel ID="pnlEdit" runat="server" Width="100%">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="left_txt" colspan="2" bgcolor="#f2f2f2" align="left">
                                <a href="javascript:history.go(-1);"><< 返回上一页</a>
                                (带
                                <span class="red">*</span>
                                的为必填信息)
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="2" cellspacing="1" border="0" width="100%" align="center">
                        <tr>
                            <td class="td_left">
                                显示顺序：
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtPaixu" runat="server" Width="60" Text="0" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox>
                                (从大到小显示，最大的排在最上面)
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="td_left">
                                &nbsp;类型：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:DropDownList ID="dropType" runat="server">
                                    <asp:ListItem Text="---请选择---" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="图片" Value="pic" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Flash" Value="swf"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                &nbsp;位置：<font color="red">*</font>
                            </td>
                            <td class="td_right_color">
                                <asp:DropDownList ID="dropClassID" runat="server" OnSelectedIndexChanged="dropClassID_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Text="---请选择---" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="公司LOGO" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="公司LOGO2" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="通栏图片" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="联系电话" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="内页通栏" Value="5"></asp:ListItem>
<asp:ListItem Text="底部logo" Value="6"></asp:ListItem>
<asp:ListItem Text="二维码" Value="7"></asp:ListItem>
<asp:ListItem Text="关于我们" Value="8"></asp:ListItem>
<asp:ListItem Text="Lasted News" Value="10"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                &nbsp;尺寸(宽×高)：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <input type="text" id="txtWidth" runat="server" style="width: 40px;" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" value="0" />
                                PX ×
                                <input type="text" id="txtLength" runat="server" style="width: 40px;" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" value="0" />
                                PX
                            </td>
                        </tr>
                        <%if (strImg != null && strImg != "")
                          {
                        %>
                        <tr>
                            <td class="td_left_color">
                                &nbsp;缩略图
                            </td>
                            <td class="News2" style="background-color: #f2f2f2;">
                                <%=newsclass.change(strImg.Substring(strImg.Length-3, 3),strImg)%>
                            </td>
                        </tr>
                        <%} %>    
                      <%--  <tr>
                            <td class="td_left">
                                &nbsp;上传图片：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <input id="fileup" type="file" runat="server" style="width: 380px;" class="button" />
                                <input id="pic" type="hidden" runat="server" value="upload/default.jpg" />
                                (支持：".jpg", ".png", ".gif",".swf")
                            </td>
                        </tr>--%>

                          <tr>
                            <td class="td_left">
                                &nbsp;上传图片：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                            <asp:TextBox ID="txt_path" value="upload/default.jpg" runat="server" style="width:220px" CssClass="txtInput normal left" MaxLength="255"></asp:TextBox>
                            <a href="javascript:;" class="files">
                                <input type="file" id="FileUpload" name="FileUpload" onchange="Upload('PicMFile', 'txt_path', 'FileUpload');" /></a>
                            <span class="uploading">正在上传，请稍候...</span>
                        </td>
                        </tr>


                        <tr>
                            <td class="td_left_color">
                                &nbsp;备注说明：<font color="red">*</font>
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="txtBeizhu" runat="server" Width="300"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                &nbsp;链接地址：
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtUrl" runat="server" Width="300"></asp:TextBox>
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
                                    <asp:Button ID="btnSave" runat="server" Text="保 存 内 容" CssClass="button" OnClick="btnSaveClick" /></div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlShow" runat="server" Visible="false" align="center">
                    目前没有任何数据 <a href="PicManage.aspx?Action=Add">立即发布</a></asp:Panel>
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

