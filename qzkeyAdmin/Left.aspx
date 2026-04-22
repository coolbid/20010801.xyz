<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left.aspx.cs" Inherits="Manager_Left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>功能模块</title>
    <style type="text/css">
        body, div, table, tr, td, ul, li, a, h1, h2, h3, h4, h5, h6, p, form, input, option, select, dl, dt, dd { margin: 0; padding: 0; }
        ul, li { list-style: none; }
        body { font: "宋体"; font-size: 12px; color: #2b2b2b; background: #f0f3f5; }
        img { border: 0; list-style: none; }
        a { color: #2b2b2b; font: "宋体"; font-size: 12px; text-decoration: none; outline: none; /*firefax*/ behavior: url(../js/xuxian.htc); }
        .a2 { font-size: 12px; font-weight: normal; color: #292929; }
        .a2:hover { color: #CC0000; }
        a:hover { color: #900; display: inline; }
        .wrapper { width: 960px; margin: 0 auto; }
        .clear { clear: both; font-size: 0px; margin: 0px; padding: 0px; }
        input { vertical-align: middle; }
        body, table { margin: 0; padding: 0; }
        dl { width: 182px; }
        dl dd a { width: 182px; height: 26px; display: block; line-height: 26px; text-align: center; color: #333333; float: left; background: url(images/admin_images/menu_bg1.gif); }
        dl dd a:hover { background: url(images/admin_images/menu_bg2.gif); color: #006600; font-weight: bold; }
        dl dt { background: url(images/admin_images/menu_bgs.gif); height: 30px; line-height: 30px; text-align: center; color: #000; font-weight: bold; }
    </style>
    <script type="text/javascript">
        function disp(n)
        {
            for (var i = 1; i < 7; i++)
            {
                if (!document.getElementById("left" + i)) return;
                document.getElementById("left" + i).style.display = "none";
            }
            document.getElementById("left" + n).style.display = "";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="left1">
        <dl>
            <dt>功能模块</dt>
            <dd>
                <a href="WebSiteSet.aspx" target="frmright" title="网站信息">网站信息</a></dd>
            <dd>
                <a href="PicManage.aspx" target="frmright" title="图片管理">图片管理</a></dd>
            <dd>
                <a href="WenJianManage.aspx" target="frmright" title="文件管理">文件管理</a></dd>
            <dd>
                <a href="NewsClass.aspx" target="frmright" title="导航菜单">导航栏目</a></dd>
            <dd>
                <a href="ProClass.aspx" target="frmright" title="商品管理">商品管理</a></dd>
            <dd>
                <a href="Message.aspx" target="frmright" title="客户留言">客户留言</a></dd>
            <dd>
                <a href="IM.aspx" target="frmright" title="在线客服">在线客服</a></dd>
            <dd>
                <a href="Links.aspx" target="frmright" title="友情链接">友情链接</a></dd>
            <%--      <dd>
                <a href="MusicSet.aspx" target="frmright" title="背景音乐">背景音乐</a></dd>--%>
            <dd>
                <a href="SetupCode.aspx" target="frmright" title="嵌入代码">嵌入代码</a></dd>
            <dd>
                <a href="ChaPaiming.aspx" target="frmright" title="优化排名">优化排名</a></dd>
             <dd>
                <a href="SubmitList.aspx" target="frmright" title="在线表单">在线表单</a></dd>
            <%if(strvip=="1"){ %>
            <dd>
                <a href="order.aspx" target="frmright" title="订单系统">订单系统</a></dd>
              <dd>
                <a href="UserManage.aspx" target="frmright" title="账号管理">账号管理</a></dd>
            <%} %>
        </dl>
    </div>
    <div id="left2" style="display: none">
    </div>
    <div id="left3" style="display: none">
    </div>
    <div id="left4" style="display: none">
    </div>
    <div id="left5" style="display: none">
    </div>
    <div id="left6" style="display: none">
    </div>
    </form>
</body>
</html>
