<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubmitList.aspx.cs" Inherits="Manager_SubmitList" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>在线表单</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1-7-2.js"></script>
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
                    url: "ashx/delete.aspx?tb=TbFormContent&id=" + strID,
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
                                在线表单
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
                    <asp:GridView ID="gvList" DataKeyNames="id" runat="server" Width="100%" BorderWidth="0" CellSpacing="1" CellPadding="5" OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind" AllowPaging="True" PageSize="10" GridLines="None" AutoGenerateColumns="False" EmptyDataText="暂无数据">
                        <Columns>
                            <asp:TemplateField HeaderText="<input onclick='checkFormAll(checked)' type='checkbox' id='chk_1' name='chk_1' value='1' />">
                                <HeaderStyle Width="40px" HorizontalAlign="center" />
                                <ItemStyle Width="40px" HorizontalAlign="center" />
                                <ItemTemplate>
                                    <input type='checkbox' id='chk_<%#Eval("id")%>' name='chk_<%#Eval("id")%>' value='<%#Eval("id")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="表单内容">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("FormContent")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="提交时间">
                                <HeaderStyle Width="140px" HorizontalAlign="left" />
                                <ItemStyle Width="140px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("Putdate")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle Width="40px" HorizontalAlign="left" />
                                <ItemStyle Width="40px" HorizontalAlign="left" />
                                <ItemTemplate>
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
                    <div style="background: #DBDEDF; text-align: left;">
                        <span id="divbutton" style="padding-left: 0px;">
                            <input type="button" name="buttonPaixu" id="buttonPaixu" value="批量删除" onclick="buttonPaixu_Delete()" />
                        </span>
                        <span id="loading" style="display: none;">
                            <img src="../images/loading_small.gif" />
                            <span style="color: #666;">正在删除...</span></span><asp:Button ID="Button1" runat="server" Text="导出" OnClick="Button1_Click" />
                    </div>
                    <%
                        } %>
                </asp:Panel>
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

