<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="Manager_News" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <%=strColumnName%>
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtTitle").value == "") { alert("请输入文章标题！"); document.getElementById("txtTitle").focus(); return false; }
            if (document.getElementById("txtPutdate").value == "") { alert("请选择发表日期！"); document.getElementById("txtPutdate").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
    </script>
    <!--Import javascript file start -->
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb23112"></script>
    <!--Import javascript file end -->
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

        function CheckPage() {
            var num = document.getElementById("num").value;
            if (num == "" || num == null) { alert("请输入页码！"); document.getElementById("num").focus(); return false; }
            else if (num > <%=Pages%>) { alert("请输入正确的页码！"); document.getElementById("num").focus(); return false; }
            window.location.href = "News.aspx?ClassId=<%=intClassID%>&ColumnType=<%=strColumnType%>&page=" + escape(num - 1);
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
                    url: "ashx/delete.aspx?tb=News&id=" + strID,
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
                            <div class="title_left">
                            </div>
                            <div class="titlebt2">
                                <%=strColumnName%>
                            </div>
                            <div class="title_right">
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
                        <td class="left_txt" bgcolor="#f2f2f2" align="left">
                            <a href="NewsClass.aspx">返回导航菜单</a>
                            |
                            <a href="News.aspx?Action=Add&ClassId=<%=intClassID%>&ColumnType=<%=strColumnType%>">发布文章</a>
                            |
                            <a href="News.aspx?ClassId=<%=intClassID %>&ColumnType=<%=strColumnType%>">文章列表</a>
                            (带 "<span class="red">*</span>" 的为必填信息)
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="pnlList" runat="server" HorizontalAlign="Center" Width="100%">
                    <asp:GridView ID="gvList" DataKeyNames="id" runat="server" Width="100%" BorderWidth="0" CellSpacing="1" CellPadding="1" OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind" AllowPaging="True" PageSize="15" GridLines="None" AutoGenerateColumns="False" EmptyDataText="暂无数据">
                        <Columns>
                            <asp:TemplateField HeaderText="<input onclick='checkFormAll(checked)' type='checkbox' id='chk_1' name='chk_1' value='1' />">
                                <HeaderStyle Width="40px" HorizontalAlign="center" />
                                <ItemStyle Width="40px" HorizontalAlign="center" />
                                <ItemTemplate>
                                    <input type='checkbox' id='chk_<%#Eval("id")%>' name='chk_<%#Eval("id")%>' value='<%#Eval("id")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编号">
                                <HeaderStyle Width="40px" HorizontalAlign="Center" />
                                <ItemStyle Width="40px" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%#Eval("id") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="状态">
                                <HeaderStyle Width="60px" HorizontalAlign="Center" />
                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%#chkIstop(Eval("Istop", "{0}"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="排序">
                                <HeaderStyle Width="40px" HorizontalAlign="Center" />
                                <ItemStyle Width="40px" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%#Eval("paixu") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="缩略图">
                                <HeaderStyle HorizontalAlign="center" />
                                <ItemStyle HorizontalAlign="center" CssClass="News" />
                                <ItemTemplate>
                                    <%#chkPic(Eval("Path", "{0}"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="&nbsp;标题">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <a href="../<%#changeUrl(strColumnType,Eval("ID", "{0}")) %>" target="_blank">【浏览】</a>
                                    <a href='?Action=Add&Id=<%# Eval("Id") %>&ClassId=<%#Eval("ClassId") %>&ColumnType=<%=strColumnType%>'>
                                        <%#Eval("Title") %></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="点击">
                                <HeaderStyle Width="60px" HorizontalAlign="Center" />
                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%#Eval("hits") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="发布时间">
                                <HeaderStyle Width="100px" HorizontalAlign="Center" />
                                <ItemStyle Width="100px" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%#Convert.ToDateTime(Eval("Putdate")).ToString("yyyy-MM-dd") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle Width="100px" HorizontalAlign="Center" />
                                <ItemStyle Width="100px" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href='?Action=Add&Id=<%# Eval("Id") %>&ClassId=<%#Eval("ClassId") %>&ColumnType=<%=strColumnType%>&page=<%=page%>'>编辑</a>
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
                                            <span style="padding-left: 90px;">跳到 <input style="width: 20px;" id="num" type="text"/> 页</span> <input type="button" onclick="CheckPage()" value="前往"/>
                            </div>
                            </div>
                        </PagerTemplate>
                        <RowStyle BackColor="#F9F9F9" />
                        <HeaderStyle BackColor="#EDF7E7" Font-Bold="true" Height="26" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <%if (rowCount > 0)
                      { 
                    %>
                    <div style="text-align: left; padding-top: 5px;">
                        <span id="divbutton" style="padding-left: 15px;">
                            <input type="button" name="buttonPaixu" id="buttonPaixu" value="批量删除" onclick="buttonPaixu_Delete()" style="cursor: pointer;" />
                            <input type="button" name="buttonPaixu" id="button1" value="批量上传" onclick="javascript:window.open('AddNewsSet.aspx?ClassId=<%=intClassID %>', '_self');" style="cursor: pointer;" />
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
                                显示顺序：
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtPaixu" runat="server" Width="60" Text="0" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox>
                                (从大到小显示，最大的排在最上面)
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                发表日期：<font color="red">*</font>
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="txtPutdate" runat="server" Width="100" onclick="WdatePicker()" onfocus="WdatePicker()"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                文章标题：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtTitle" runat="server" Width="415"></asp:TextBox>
                                <asp:CheckBox ID="ckbIstop" runat="server" />
                                置顶
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                关键词：
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="txtKeywords" runat="server" Width="415"></asp:TextBox>
                                [说明：关键词之间用英文逗号隔开，如：网络制作,网络公司]
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                链接地址：
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtUrl" runat="server" Width="415"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                内容提示：
                            </td>
                            <td class="td_right_color">
                                <asp:TextBox ID="fckKeyContent" runat="server" Width="415" TextMode="MultiLine" Height="45"></asp:TextBox>
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
                                上传缩略图：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                            <asp:TextBox ID="txt_path" value="upload/default.jpg" runat="server" style="width:250px" CssClass="txtInput normal left" MaxLength="255"></asp:TextBox>
                            <a href="javascript:;" class="files">
                                <input type="file" id="FileUpload" name="FileUpload" onchange="Upload('NewsMFile', 'txt_path', 'FileUpload');" /></a>
                                   [图片".jpg", ".png", ".gif"]
                            <span class="uploading">正在上传，请稍候...</span>
                        </td>
                        </tr>
                        <tr <%if (strColumnType != "下载中心") { Response.Write("style=\"display:none;\""); } %>>

                            <td class="td_left">上传缩略图：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txt_path1" value="upload/fujian.jpg" runat="server" Style="width: 250px" CssClass="txtInput normal left" MaxLength="255"></asp:TextBox>
                                <a href="javascript:;" class="files">
                                    <input type="file" id="FileUpload1" name="FileUpload1" onchange="Upload('DownMFile', 'txt_path1', 'FileUpload1');" /></a>         [附件".doc", ".zip", ".rar", ".xls", ".docx", ".txt"]    
                                <%if (!string.IsNullOrEmpty(strFujian) && strFujian != "upload/fujian.jpg")
                                {
                                    %>
                                <a style="color: Blue;" href="../<%=strFujian %>" target="_blank">已上传</a>
                                <%
                                    }
                                    else
                                    {
                                %>
                                <a style="color: Red;">未上传</a>
                                <%
                                    }%>
                                <span class="uploading">正在上传，请稍候...</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left_color">
                                详细内容：<font color="red">*</font>
                            </td>
                            <td class="td_right_color">
                                <textarea id="content" rows="8" cols="8" runat="server" style="height: 350px; width: 900px;"></textarea>
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
                                    <asp:Button ID="btnSave" runat="server" Text="保 存 内 容" OnClick="btnSaveClick" CssClass="button" /></div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlShow" runat="server" Visible="false" align="center">
                    目前没有任何数据
                    <a href="News.aspx?Action=Add&ClassId=<%=intClassID%>&ColumnType=<%=strColumnType%>">立即发布</a></asp:Panel>
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
