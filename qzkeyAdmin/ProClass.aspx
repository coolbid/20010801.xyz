<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProClass.aspx.cs" Inherits="Manager_ProClass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>商品管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1-7-2.js"></script>
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtPaixu").value == "") { alert("排序为必填项！"); document.getElementById("txtPaixu").focus(); return false; }
            if (document.getElementById("txtContext").value == "") { alert("分类名称为必填项！"); document.getElementById("txtContext").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
        function winconfirm()
        {
            if (confirm("警告：\n\n删除这个分类，该分类下的产品将被一起删除！\n\n点“确定“执行本次操作，点”取消“结束本次操作")) { return true; }
            else { return false; }
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
                    url: "ashx/delete.aspx?tb=ProClass&id=" + strID,
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
                                商品管理
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
                <asp:Panel ID="pnlAdd" runat="server">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="left_txt" colspan="2" bgcolor="#f2f2f2" align="left">
                                <a href="javascript:history.go(-1);">返回上一页</a> (带 "<span class="red">*</span>" 的为必填信息)
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                        <tr>
                            <td class="td_left">
                                排序：<font color="red">*</font>
                            </td>
                            <td class="td_right">
                                <asp:TextBox ID="txtPaixu" runat="server" Width="60" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')"
                                    Text="0"></asp:TextBox>
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
                                <asp:TextBox runat="server" ID="txtContext"></asp:TextBox>
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
                                    <asp:Button ID="btnSave" runat="server" Text="保 存 内 容" OnClick="btnSaveClick" class="button" /></div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlList" runat="server">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="left_txt" colspan="2" bgcolor="#f2f2f2" align="left">
                                <a href="ProClass.aspx">商品分类</a> | <a href="ProClass.aspx?Action=Add" id="A4">→添加分类</a>
                                | | <a href="Product.aspx">商品列表</a> | <a href="Product.aspx?Action=Add" id="A1">→添加商品</a>
                                | <a href="ProAddset.aspx">批量添加</a>
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="2" cellspacing="1" border="0" width="100%" align="center" style="margin-top:5px;">
                        <tr>
                            <td style="width: 40px; padding-left:10px;">
                                <input onclick="checkFormAll(checked)" type="checkbox" id="chk_1" name="chk_1" value="-1">
                            </td>
                            <td>
                                <b>编号</b>
                            </td>
                            <td>
                                <b>商品分类</b>
                            </td>
                            <td>
                                <b>商品管理</b>
                            </td>
                            <td>
                                <b>排序</b>
                            </td>
                            <td>
                                <b>操作</b>
                            </td>
                        </tr>
                        <asp:Literal runat="server" ID="litlist"></asp:Literal>
                    </table>
                    <%if (intCount > 0)
                      { 
                    %>
                    <div style="text-align: left; padding-top:5px;">
                        <span id="divbutton" style="padding-left: 15px;">
                            <input type="button" name="buttonPaixu" id="buttonPaixu" value="批量删除" onclick="buttonPaixu_Delete()"
                                style="cursor: pointer;" />
                        </span><span id="loading" style="display: none;">
                            <img src="../images/loading_small.gif" />
                            <span style="color: #666;">正在删除...</span></span>
                    </div>
                    <%
                        } %>
                </asp:Panel>
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

