<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Links.aspx.cs" Inherits="Manager_Links" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>友情链接</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="js/jquery-1-7-2.js"></script>
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function BackWait()
        {
            var objdropTitle = document.all("dropTitle");
            if (objdropTitle.options[objdropTitle.selectedIndex].value == "-1") { alert("请选择分类！"); objdropTitle.focus(); return false; }
            if (document.getElementById("txtTitle").value == "") { alert("请输入网站名称！"); document.getElementById("txtTitle").focus(); return false; }
            else if (document.getElementById("txtUrl").value == "") { alert("请输入连接网址！"); document.getElementById("txtUrl").focus(); return false; }
            else
            {
                document.getElementById("divShow").style.display = "none";
                document.getElementById("divHidden").style.display = "block";
                return true;
            }
        }
    </script>
    <script type="text/javascript">
        function checkFormAll(chk)
        {
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++)
            {
                if (form.elements[i].type == "checkbox")
                {
                    form.elements[i].checked = chk;
                }
            }
        }
        function buttonPaixu_Delete()
        {
            var strID = "";
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++)
            {
                if (form.elements[i].type == "checkbox")
                {
                    if (form.elements[i].checked == true && form.elements[i].value != "-1")
                    {
                        strID = strID + "," + form.elements[i].value;
                    }
                }
            }
            if (strID != "")
            {
                document.getElementById("divbutton").style.display = "none";
                document.getElementById("loading").style.display = "block";
                //提交信息开始
                $.ajax({
                    type: "get",
                    url: "ashx/delete.aspx?tb=Links&id=" + strID,
                    success: function (msg)
                    {
                        if (msg == "success")
                        {
                            document.getElementById("divbutton").style.display = "block";
                            document.getElementById("loading").style.display = "none";
                            alert("操作成功！");
                            window.location.reload();
                        }
                        else
                        {
                            document.getElementById("divbutton").style.display = "block";
                            document.getElementById("loading").style.display = "none";
                            alert("操作失败！");
                            window.location.reload();
                        }
                    }
                });
                //提交信息结束
            }
            else
            {
                alert("请勾选需要删除的项目！");
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
                                友情链接
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
                        <td class="left_txt" colspan="2" bgcolor="#f2f2f2" align="left">
                            <a href="LinksType.aspx">分类列表</a>
                            |
                            <a href="LinksType.aspx?Action=Add">添加分类</a>
                            |
                            <a href="Links.aspx">友链列表</a>
                            |
                            <a href="Links.aspx?Action=Add">发布友链</a>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="pnlList" runat="server" HorizontalAlign="Center" Width="100%">
                    <asp:GridView ID="gvList" DataKeyNames="id" runat="server" Width="100%" BorderWidth="0" CellSpacing="1" CellPadding="1" OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind" AllowPaging="True" PageSize="20" GridLines="None" AutoGenerateColumns="False" EmptyDataText="暂无数据">
                        <Columns>
                            <asp:TemplateField HeaderText="<input onclick='checkFormAll(checked)' type='checkbox' id='chk_1' name='chk_1' value='1' />">
                                <HeaderStyle Width="40px" HorizontalAlign="center" />
                                <ItemStyle Width="40px" HorizontalAlign="center" />
                                <ItemTemplate>
                                    <input type='checkbox' id='chk_<%#Eval("id")%>' name='chk_<%#Eval("id")%>' value='<%#Eval("id")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="分类名称">
                                <HeaderStyle Width="160px" HorizontalAlign="left" />
                                <ItemStyle Width="160px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("TypeTitle") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="网站名称">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <a href='?Action=Add&Id=<%# Eval("id") %>'>
                                        <%#Eval("Title") %>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="链接地址">
                                <HeaderStyle Width="260px" HorizontalAlign="left" />
                                <ItemStyle Width="260px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("Url")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="发布时间">
                                <HeaderStyle Width="120px" HorizontalAlign="left" />
                                <ItemStyle Width="120px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Convert.ToDateTime(Eval("putdate")).ToString("yyyy-MM-dd") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle Width="100px" HorizontalAlign="left" />
                                <ItemStyle Width="100px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <a href='?Action=Add&Id=<%# Eval("id") %>'>编辑</a>
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
                    <%if (rowCount > 0)
                      { 
                    %>
                    <div style="text-align: left;">
                        <span id="divbutton" style="padding-left: 15px;">
                            <input type="button" name="buttonPaixu" id="buttonPaixu" value="批量删除" onclick="buttonPaixu_Delete()" style="cursor: pointer;" />
                        </span>
                        <span id="loading" style="display: none;">
                            <img src="../images/loading_small.gif" />
                            <span style="color: #666;">正在删除...</span></span>
                    </div>
                    <%
                      } %>
                </asp:Panel>
                <asp:Panel ID="pnlEdit" runat="server" Width="100%">
                    <table cellpadding="2" cellspacing="1" border="0" width="100%" align="center">
                        <tr>
                            <td class="td_left">
                                分类名称：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:DropDownList runat="server" ID="dropTitle">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                网站名称：<font color="red">*</font>
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="txtTitle" runat="server" Width="210"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                链接网址：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtUrl" runat="server" Width="210" Text="http://"></asp:TextBox>
                                如：http://www.baidu.com
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
                    目前没有任何数据</asp:Panel>
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
