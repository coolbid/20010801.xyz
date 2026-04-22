<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsClass.aspx.cs" Inherits="Manager_NewsClass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>导航菜单</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1-7-2.js"></script>
    <script type="text/javascript">
        function showSelected()
        {
            var form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++)
            {
                if (form.elements[i].type == "checkbox" && form.elements[i].value != "-1")
                {
                    var obj = document.getElementById("select_" + form.elements[i].value);
                    for (var j = 0; j < obj.options.length; j++)
                    {
                        if (obj.options[j].value == document.getElementById("hidden_" + form.elements[i].value).value)
                        {
                            obj.options[j].selected = true;
                            break;
                        }
                    }
                }
            }
        }
        function checkNull()
        {
            var objdropColumnType = document.all("dropColumnType");
            if (objdropColumnType.options[objdropColumnType.selectedIndex].value == "--选择栏目类别--") { alert("请选择栏目类别！"); objdropColumnType.focus(); return false; }
            if (document.getElementById("txtColumnName").value == "") { alert("请输入栏目名称！"); document.getElementById("txtColumnName").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
        function winconfirm()
        {
            if (confirm("删除后无法恢复！您确定要删除吗？")) { return true; }
            else { return false; }
        }
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
        function buttonPaixu_Save()
        {
            var xuhao = "";
            var paixu = "";
            var columnValue = "";
            var ColumnType = "";
            var ColumnUrl = "";
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++)
            {
                if (form.elements[i].type == "checkbox")
                {
                    if (form.elements[i].checked == true && form.elements[i].value != "-1")
                    {
                        xuhao = xuhao + "," + form.elements[i].value;
                        paixu = paixu + "," + document.getElementById("paixu_" + form.elements[i].value).value;
                        columnValue = columnValue + "," + document.getElementById("txt_" + form.elements[i].value).value;
                        ColumnUrl = ColumnUrl + "," + document.getElementById("txturl_" + form.elements[i].value).value;
                        var obj = document.getElementById("select_" + form.elements[i].value);
                        if (obj.options[obj.options.selectedIndex].value != "--选择栏目类别--")
                        {
                            ColumnType = ColumnType + "," + obj.options[obj.options.selectedIndex].value;
                        }
                        else
                        {
                            alert("请选择栏目类别"); obj.focus(); return false;
                        }
                    }
                }
            }
            if (xuhao != "")
            {
                document.getElementById("divbutton").style.display = "none";
                document.getElementById("loading").style.display = "block";
                //提交信息开始
                $.ajax({
                    type: "get",
                    url: "ashx/Paixu.ashx?xuhao=" + xuhao + "&paixu=" + paixu + "&columnValue=" + escape(columnValue) + "&ColumnType=" + escape(ColumnType) + "&ColumnUrl=" + escape(ColumnUrl),
                    success: function (msg)
                    {
                        if (msg == "success")
                        {
                            document.getElementById("divbutton").style.display = "block";
                            document.getElementById("loading").style.display = "none";
                            alert("保存成功！");
                            window.location.reload();
                        }
                        else if (msg == "failure")
                        {
                            document.getElementById("divbutton").style.display = "block";
                            document.getElementById("loading").style.display = "none";
                            alert("含非法字符,操作失败！");
                            window.location.reload();
                        }
                        else
                        {
                            document.getElementById("divbutton").style.display = "block";
                            document.getElementById("loading").style.display = "none";
                            alert("登录超时,请重新登录");
                            parent.window.location = "login.aspx";
                        }
                    }
                });
                //提交信息结束
            }
            else
            {
                alert("请勾选需要修改的项目！");
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
                                导航菜单
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
                            <a href="NewsClassEdit.aspx?Action=Add" id="A1">→添加栏目</a>
                        </td>
                    </tr>
                </table>
                <table cellpadding="2" cellspacing="1" border="0" width="100%" align="center">
                    <tr style="background-color: #EDF7E7; font-weight: bold; height: 26px;">
                        <td>
                            <b>
                                <input onclick="checkFormAll(this.checked)" type="checkbox" value="-1" /></b>
                        </td>
                        <td>
                            <b>编号</b>
                        </td>
                        <td>
                            <b>权限等级</b>
                        </td>
                        <td>
                            <b>栏目</b>
                        </td>
                        <td>
                            <b>图片</b>
                        </td>
                        <td>
                            <b>排序</b>
                        </td>
                        <td>
                            <b>内容管理</b>
                        </td>
                        <td>
                            <b>栏目类别</b>
                        </td>
                        <td>
                            <b>栏目名称</b>
                        </td>
                        <td>
                            <b>链接地址</b>
                        </td>
                        <td>
                            <b>操作</b>
                        </td>
                    </tr>
                    <asp:Literal runat="server" ID="litlist"></asp:Literal>
                    <tr>
                        <td colspan="11" bgcolor="#f2f2f2" height="36">
                            <span id="divbutton" style="padding-left: 0px;">
                                <input type="button" name="buttonPaixu" id="buttonPaixu" value="保存更新" onclick="buttonPaixu_Save()" class="btnUpdate2018" />
                            </span>
                            <span id="loading" style="display: none;">
                                <img src="../images/loading_small.gif" alt="" />
                                <span style="color: #666;">正在保存...</span></span>
                        </td>
                    </tr>
                </table>
                <script type="text/javascript">                    showSelected();</script>
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
