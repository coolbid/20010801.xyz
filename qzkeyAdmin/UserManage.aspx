<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManage.aspx.cs" Inherits="Manager_UserManage" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>会员系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function BackWait()
        {
            var re = /^(\d)*$/g;
            if (!re.test(document.getElementById("txtUserAccount").value) || document.getElementById("txtUserAccount").value == "") { alert("账户余额不正确！"); document.getElementById("txtUserAccount").value = ""; document.getElementById("txtUserAccount").focus(); return false; }
            if (document.getElementById("txtUserName").value == "") { alert("会员名不能为空！"); document.getElementById("txtUserName").focus(); return false; }
            if (document.getElementById("txtUserPassword").value == "") { alert("密码不能为空！"); document.getElementById("txtUserPassword").focus(); return false; }
            if (document.getElementById("txtUserPassword").value.length < 6 || document.getElementById("txtUserPassword").value.length > 16)
            { alert("密码长度6～16位！"); document.getElementById("txtUserPassword").focus(); return false; }
            if (document.getElementById("txtUserPassword2").value == "") { alert("请再次输入密码！"); document.getElementById("txtUserPassword2").focus(); return false; }
            else if (document.getElementById("txtUserPassword").value != document.getElementById("txtUserPassword2").value) { alert("两次输入的密码不一致！"); document.getElementById("txtUserPassword2").focus(); return false; }
            if (document.getElementById("txtUserEmail").value == "") { alert("邮箱不能为空！"); document.getElementById("txtUserEmail").focus(); return false; }
            else { if (!/^[\w-]+(\.[\w-]+)*@[\w-]+(\.(\w)+)*(\.(\w){2,3})$/.test(document.getElementById("txtUserEmail").value)) { alert("请输入正确的Email地址！"); document.getElementById("txtUserEmail").focus(); return false; } }
            if (document.getElementById("txtUserQQ").value == "") { alert("QQ不能为空！"); document.getElementById("txtUserQQ").focus(); return false; }
            else if (!(/^\d{5,10}$/.test(document.getElementById("txtUserQQ").value)))
            { alert("QQ号码格式不对！"); return false; }
            var strPhone = document.getElementById("txtUserPhone").value;
            if (strPhone == "") { alert("手机不能为空！"); document.getElementById("txtUserPhone").focus(); return false; }
            else if (!(/^13\d{9}$/g.test(strPhone)) && !(/^15\d{9}$/g.test(strPhone)) && !(/^18\d{9}$/g.test(strPhone))) { alert("手机号码格式不对！"); document.getElementById("txtUserPhone").focus(); return false; }
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
                                会员系统
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
                <asp:Panel ID="pnlList" runat="server" HorizontalAlign="Center" Width="100%">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="left_txt" colspan="2" bgcolor="#f2f2f2" align="left">
                                <a href="UserManage.aspx?Action=Add">注册会员</a>
                                |
                                <a href="UserManage.aspx">会员列表</a>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="gvList" DataKeyNames="UserID" runat="server" Width="100%" BorderWidth="0" CellSpacing="1" CellPadding="1" OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind" AllowPaging="True" PageSize="10" GridLines="None" AutoGenerateColumns="False" EmptyDataText="暂无数据">
                        <Columns>
                            <asp:TemplateField HeaderText="会员名">
                                <HeaderStyle Width="80px" HorizontalAlign="left" />
                                <ItemStyle Width="80px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("UserName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="邮箱">
                                <HeaderStyle Width="120px" HorizontalAlign="left" />
                                <ItemStyle Width="120px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("UserEmail")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="QQ">
                                <HeaderStyle Width="80px" HorizontalAlign="left" />
                                <ItemStyle Width="80px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("UserQQ")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="手机号">
                                <HeaderStyle Width="100px" HorizontalAlign="left" />
                                <ItemStyle Width="100px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("UserPhone")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="姓名">
                                <HeaderStyle Width="60px" HorizontalAlign="left" />
                                <ItemStyle Width="60px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("UserRealName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="地址">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("UserAddress")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="单位名称">
                                <HeaderStyle Width="200px" HorizontalAlign="left" />
                                <ItemStyle Width="200px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("UserCompany")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="状态">
                                <HeaderStyle Width="40px" HorizontalAlign="left" />
                                <ItemStyle Width="40px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#showUserState(Eval("UserState","{0}"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="注册日期">
                                <HeaderStyle Width="80px" HorizontalAlign="left" />
                                <ItemStyle Width="80px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Convert.ToDateTime(Eval("Putdate")).ToString("yyyy-MM-dd")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle Width="80px" HorizontalAlign="left" />
                                <ItemStyle Width="80px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <a href='?Action=Add&ID=<%# Eval("UserID") %>'>编辑</a>
                                    |
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="return confirm('删除后无法恢复！您确定要删除吗？')"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerTemplate>
                            <div id="main" style="width: 100%; padding-top: 10px; text-align: center;">
                                &nbsp;&nbsp;页次：<asp:Label ID="lblPageCurrent" runat="server" Text="1" CssClass="txtInfo"></asp:Label>
                                /<asp:Label ID="lblPageCount" runat="server" Text="1"></asp:Label>&nbsp;&nbsp; 共&nbsp;<asp:Label ID="lblPageRow" runat="server" Text="1" CssClass="txtInfo"></asp:Label>&nbsp;条记录
                                <asp:LinkButton ID="btnFirst" runat="server" CssClass="link" CommandName="Pager" CommandArgument="First" OnCommand="NavigateToPage">[首页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnPrev" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Prev" OnCommand="NavigateToPage">[前一页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnNext" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Next" OnCommand="NavigateToPage">[下一页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnLast" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Last" OnCommand="NavigateToPage">[尾页]</asp:LinkButton>&nbsp;
                            </div>
                        </PagerTemplate>
                        <RowStyle BackColor="#F9F9F9" />
                        <HeaderStyle BackColor="#EDF7E7" Font-Bold="true" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="pnlEdit" runat="server" Width="100%">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="left_txt" colspan="2" bgcolor="#f2f2f2" align="left">
                                <a href="javascript:history.go(-1);">返回上一页</a>
                                (带 "<span class="red">*</span>" 的为必填信息)
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="2" cellspacing="1" border="0" width="100%" align="center">
                        <tr>
                            <td class="td_left">
                                账户余额：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtUserAccount" runat="server" Width="60" Text="0" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                会员名：<font color="red">*</font>
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="txtUserName" runat="server" Width="210"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                密码：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtUserPassword" runat="server" Width="210"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                再输一次密码：<font color="red">*</font>
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="txtUserPassword2" runat="server" Width="210"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                邮箱：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtUserEmail" runat="server" Width="210"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                QQ：<font color="red">*</font>
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="txtUserQQ" runat="server" Width="210"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                手机号：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtUserPhone" runat="server" Width="210"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                姓名：
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="txtUserRealName" runat="server" Width="210"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                联系地址：
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtUserAddress" runat="server" Width="210"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                单位名称：
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="txtUserCompany" runat="server" Width="210"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                状态：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:RadioButtonList ID="radlUserState" runat="server" RepeatDirection="horizontal" RepeatColumns="2">
                                    <asp:ListItem Text="正常" Selected="True" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="禁止" Value="1"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                &nbsp;
                            </td>
                            <td class="td_right_color">
                                <div id="divHidden" style="display: none;">
                                    <img src="images/admin_images/loading.gif" alt="" />
                                    <span style="color: #666;">正在保存...</span></div>
                                <div id="divShow">
                                    <asp:Button ID="btnSave" runat="server" Text="保 存 内 容" OnClick="btnSaveClick" CssClass="button" /></div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlShow" runat="server" Visible="false" align="center">
                    目前没有任何会员信息</asp:Panel>
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

