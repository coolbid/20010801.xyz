<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminManage.aspx.cs" Inherits="Manager_AdminManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>账户管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtAdminName") != null)
            {
                if (document.getElementById("txtAdminName").value == "") { alert("帐号为必填项！"); document.getElementById("txtAdminName").focus(); return false; }
            }
            if (document.getElementById("txtAdminPassword").value == "") { alert("密码为必填项！"); document.getElementById("txtAdminPassword").focus(); return false; }
            if (document.getElementById("txtAdminPassword").value.length < 6) { alert("密码长度至少为6位！"); document.getElementById("txtAdminPassword").focus(); return false; }
            if (document.getElementById("txtAdminPassword2").value == "") { alert("请重复再输一次密码！"); document.getElementById("txtAdminPassword2").focus(); return false; }
            if (document.getElementById("txtAdminPassword2").value.length < 6) { alert("密码长度至少为6位！"); document.getElementById("txtAdminPassword2").focus(); return false; }
            if (document.getElementById("txtAdminPassword").value != document.getElementById("txtAdminPassword2").value) { alert("两次输入的密码不一致！"); return false; }
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
                                账户管理
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
                <asp:Panel ID="pnlList" runat="server">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="left_txt" colspan="2" bgcolor="#f2f2f2" align="left">
                                <a href="AdminManage.aspx">帐号列表</a>
                                |
                                <a href="AdminManage.aspx?Action=View" id="A4">→添加帐号</a>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="gvList" DataKeyNames="id" runat="server" Width="100%" BorderWidth="0" CellSpacing="1" CellPadding="1" OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind" AllowPaging="True" PageSize="10" GridLines="None" AutoGenerateColumns="False" EmptyDataText="暂无数据">
                        <Columns>
                            <asp:TemplateField HeaderText="帐号">
                                <HeaderStyle Width="100px" HorizontalAlign="left" />
                                <ItemStyle Width="100px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("AdminName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="密码">
                                <HeaderStyle Width="400px" HorizontalAlign="left" />
                                <ItemStyle Width="400px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("AdminPassword")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="角色">
                                <HeaderStyle Width="400px" HorizontalAlign="left" />
                                <ItemStyle Width="400px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#ChangeRole(Eval("Role","{0}"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle Width="100px" HorizontalAlign="left" />
                                <ItemStyle Width="100px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <a href='?Action=View&ID=<%# Eval("ID") %>'>修改密码</a>
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
                            </div>
                        </PagerTemplate>
                        <RowStyle BackColor="#F9F9F9" />
                        <HeaderStyle BackColor="#EDF7E7" Font-Bold="true" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="pnlEdit" runat="server">
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
                                帐号：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtAdminName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                密码：<font color="red">*</font>
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="txtAdminPassword" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                重复密码：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtAdminPassword2" runat="server"></asp:TextBox>
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
                    目前没有任何数据
                    <a href="AdminManage.aspx?Action=View">立即设置</a></asp:Panel>
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
