<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Mianban.aspx.cs" Inherits="Manager_Mianban" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站配置</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1-7-2.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
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
                                网站配置
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
                        <style>
                            .td_left ul { width: 460px; }
                            .td_left li { width: 200px; background: #f2f2f2; margin: 5px; text-align: center; text-decoration: none; border: 0; list-style: none; float: left; }
                        </style>
                        <td class="td_left">
                            <ul>
                                <li>
                                    <a href="TimeLimit.aspx" target="frmright" title="配置信息">配置信息</a></li>
                                <li>
                                    <a href="AdminManage.aspx" target="frmright" title="账户管理">账户管理</a></li>
                                <li>
                                    <a href="Support.aspx" target="frmright" title="技术支持">技术支持</a></li>
                                <li>
                                    <a href="ChuShihua.aspx" target="frmright" title="初始信息">初始信息</a></li>
                                <li>
                                    <a href="LeiXing.aspx" target="frmright" title="上传限制">上传限制</a></li>
                                 <li>
                                    <a href="Control.aspx" target="frmright" title="功能控制">功能控制</a></li>
                                <li>
                                    <a href="WaterMark.aspx" target="frmright" title="图片水印">图片水印</a></li>

                            </ul>
                            <div style="margin: 0; padding: 0; font-size: 0; clear: both;">
                            </div>
                            <ul>
                                <li>
                                    <a href="SeoDo.aspx" target="frmright" title="栏目优化">栏目优化</a></li>
                                <li>
                                    <a href="LogManage.aspx" target="frmright" title="操作日志">操作日志</a></li>
                                <li>
                                    <a href="SubmitList.aspx" target="frmright" title="在线表单">在线表单</a></li>
                                <li>
                                    <a href="Query.aspx" target="frmright" title="证书查询">证书查询</a></li>
                                <li>
                                    <input id="btnsjbf" type="button" onclick="shujubeifen()" value="数据备份" style="border: none; background: none; cursor: pointer; outline: none;" />
                                </li>
                                <li>
                                    <a href="SubmitForm.aspx" target="frmright" title="创建表单">创建表单</a></li>
                                <%-- <li>
                                    <a href="PayMentInterface.aspx" target="frmright" title="支付接口">支付接口</a></li>--%>
                                <li>
                                    <input id="btnymbf" type="button" onclick="ymbf()" value="源码备份" style="border: none; background: none; cursor: pointer; outline: none;" />
                                </li>
                                <li>
                                    <input id="btnsxtz" type="button" onclick="sxtz()" value="上线通知" style="border: none; background: none; cursor: pointer; outline: none;" />
                                </li>
                            </ul>
                            <script type="text/javascript">
                                //数据库备份
                                function shujubeifen()
                                {
                                    $("#btnsjbf").unbind();
                                    $("#btnsjbf").attr("disabled", "disabled"); //不可用
                                    $("#btnsjbf").val("正在备份");
                                    $.ajax({
                                        type: "get",
                                        async: true,
                                        url: "shujukubeifen.aspx?spm" + GetCode(9),
                                        datatype: "json",
                                        success: function (msg)
                                        {
                                            if (msg == "1")
                                            {
                                                $("#btnsjbf").css("color", "blue");
                                                $("#btnsjbf").val("备份成功");
                                            }
                                            else
                                            {
                                                $("#btnsjbf").css("color", "red");
                                                $("#btnsjbf").val("备份失败");
                                            }
                                        }
                                    });
                                }

                                function ymbf()
                                {
                                    $("#btnymbf").unbind();
                                    $("#btnymbf").attr("disabled", "disabled"); //不可用
                                    $("#btnymbf").val("正在备份");
                                    $.ajax({
                                        type: "get",
                                        async: true,
                                        url: "YuanmaBeifen.aspx?key=39x3f39x2hjsfhsdfs2x3f8gs&spm=" + GetCode(9),
                                        datatype: "json",
                                        success: function (msg)
                                        {
                                            if (msg == "1")
                                            {
                                                $("#btnymbf").css("color", "blue");
                                                $("#btnymbf").val("操作成功");
                                            }
                                            else
                                            {
                                                $("#btnymbf").css("color", "red");
                                                $("#btnymbf").val("操作失败");
                                            }
                                        }
                                    });
                                }

                                function sxtz()
                                {
                                    $("#btnsxtz").unbind();
                                    $("#btnsxtz").attr("disabled", "disabled"); //不可用
                                    $("#btnsxtz").val("正在处理");
                                    $.ajax({
                                        type: "get",
                                        async: true,  // 设置同步方式  ********
                                        url: "ashx/shangxiantongzhi.aspx?action=tongzhi",
                                        datatype: "json",
                                        success: function (msg)
                                        {
                                            if (msg == "1")
                                            {
                                                $("#btnsxtz").css("color", "blue");
                                                $("#btnsxtz").val("操作成功");
                                            }
                                            else
                                            {
                                                $("#btnsxtz").css("color", "red");
                                                $("#btnsxtz").val("操作失败");
                                            }
                                        }
                                    });
                                }                                                              
                            </script>
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
</html>
