<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProAddset.aspx.cs" Inherits="Manager_ProAdd"
    ValidateRequest="false" EnableEventValidation="false" %>

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

            var ckeckk = $("#ckname").attr("checked");

            //拓展分类开始
            var str = document.getElementsByName("box");
            var objarray = str.length;
            var chestr = ",";
            for (i = 0; i < objarray; i++)
            {
                if (str[i].checked == true)
                {
                    chestr += str[i].value + ",";
                }
            }
            if (chestr == ",") { alert("请选择商品分类"); return false; }
            //商品名称
            var ProName = $("#txtProName").val();


            if (ckeckk != "checked")
            {
                if (ProName == "" || ProName == null)
                {
                    alert("请填写商品名称");
                    $("#txtProName").focus(); //escape
                    return false;
                }
            }
            window.open("ProAdd.aspx?Fenlei=" + escape(chestr) + "&ProName=" + escape(ProName) + "&Check=" + escape(ckeckk), '_self');
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
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="left_txt" colspan="2" bgcolor="#f2f2f2" align="left" height="30">
                            <a href="ProClass.aspx">商品分类</a> | <a href="Product.aspx">商品列表</a> | <a href="Product.aspx?Action=Add">
                                添加商品</a> | <a href="ProAddset.aspx">批量添加</a> (带 "<span class="red">*</span>"
                            的为必填信息)
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
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
                            商品分类：<font color="red">*</font>
                        </td>
                        <td class="td_right_color">
                            <div style="height: 100px; width: 400px; overflow: auto;">
                                <%=strList %>
                                <input type="hidden" id="fenlei" runat="server" />
                                <script type="text/javascript">
                                    var objClassIdList = "<%=strClassID2 %>";
                                    var objClassId = "<%=intClassID%>";
                                    objClassIdList = objClassIdList.split(',');
                                    var str = document.getElementsByName("box");
                                    var objarray = str.length;
                                    for (i = 0; i < objarray; i++)
                                    {
                                        for (j = 0; j < objClassIdList.length; j++)
                                        {
                                            if (str[i].value == objClassIdList[j] || str[i].value == objClassId)
                                            {
                                                str[i].checked = true;
                                            }
                                        }
                                    }
                                </script>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            名称：<font color="red">*</font>
                        </td>
                        <td class="td_right">
                            <input type="text" id="txtProName" style="white-space: 415px;" />
                            <input type="checkbox" id="ckname" />使用图片名称作为标题
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left_color">
                        </td>
                        <td class="td_right_color" style="line-height: 50px; padding: 10px 0;">
                            <input type="button" value="设置好了，去添加图片" style="cursor: pointer;" onclick="checkNull()" />
                        </td>
                    </tr>
                </table>
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

