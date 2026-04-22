<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Manager_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>网站管理系统</title>
    <script src="images/jquery-1.3.2.min.js" type="text/javascript"></script>
    <style type="text/css">
        body, div, table, tr, td, ul, li, a, h1, h2, h3, h4, h5, h6, p, form, input, option, select, dl, dt, dd { margin: 0; padding: 0; }
        ul, li { list-style: none; }
        body { font: "宋体"; font-size: 12px; color: #2b2b2b; }
        img { border: 0; list-style: none; }
        a { color: #2b2b2b; font: "宋体"; font-size: 12px; text-decoration: none; outline: none; /*firefax*/ behavior: url(../js/xuxian.htc); }
        .a2 { font-size: 12px; font-weight: normal; color: #292929; }
        .a2:hover { color: #CC0000; }
        a:hover { color: #900; display: inline; }
        .wrapper { width: 960px; margin: 0 auto; }
        .clear { clear: both; font-size: 0px; margin: 0px; padding: 0px; }
        input { vertical-align: middle; }
        body, table { margin: 0; padding: 0; }
        #header { height: 94px; width: 100%; background: url(images/admin_images/admin_bg3.gif?v=4.0.3) repeat-x bottom; min-width: 960px; overflow: hidden; }
        #header_a { background: url(images/admin_images/admin_bg1.gif?v=4.0.3) no-repeat; height: 50px; overflow: hidden; }
        #header_a ul { margin-top: 10px; }
        #header_a ul li { float: right; height: 20px; line-height: 20px; padding: 0 10px; color: #0c3e94; text-align: center; }
        #header_a ul li a { color: #0c3e94; }
        #header_a ul li a:hover { color: #1b8cf5; }
        #header_b { background: url(images/admin_images/admin_bg2.gif?v=4.0.3) left top no-repeat; height: 44px; position: relative; }
        #position { position: absolute; bottom: 0; right: 0; }
        #header_b ul { padding-top: 7px; margin-left: 190px; }
        #header_b ul li { float: left; width: 75px; height: 37px; line-height: 37px; text-align: center; background: url(images/admin_images/admin_header_bg.gif?v=4.0.3) no-repeat right; }
        #header_b ul li a { width: 73px; height: 31px; line-height: 31px; text-align: center; color: #000; font-size: 12px; display: block; margin-top: 3px; }
        #header_b ul li a:hover { background: url(images/admin_images/admin_header_hover.gif?v=4.0.3); color: #18508c; }
        #footer { height: 32px; text-align: right; line-height: 32px; background: url(images/admin_images/admin_bg5.gif?v=4.0.3) repeat-x; padding-right: 10px; font-family: Arial, Helvetica, sans-serif; }
        #btnSave { cursor: pointer; }
    </style>
    <script type="text/javascript">
        $().ready(function ()
        {
            $('td#switchPoint').click(function ()
            {
                var self = $(this).find('img');
                if (self.val() == 1)
                {
                    self.val(0); $('td#frmTitle').hide();
                    self.attr('src', 'images/admin_images/right.gif');
                } else
                {
                    self.val(1); $('td#frmTitle').show();
                    self.attr('src', 'images/admin_images/left.gif');
                }
            });
            $('td#frmTitle').attr('height', ($(document).height() - 130) + 'px');
            $('td.pr30').attr('height', ($(document).height() - 130) + 'px');
        });
    </script>
</head>
<body style="background-color: #CDE2F8; margin-left: 0px; margin-top: 0px;">
    <form id="form1" runat="server">
    <div id="header">
        <div id="header_a">
            <ul>
                <li style="background: url(images/admin_images/icon/close.png?v=4.0.3) no-repeat 18px 0px; font-family: Arial;">
                    <a href="#" onclick="if(confirm('你真的要退出吗?')){location='Logout.aspx'}">[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出&nbsp;]</a>
                </li>
                <li style="padding-right: 0px; background: url(images/admin_images/icon/computer_on.png?v=4.0.3) no-repeat 18px 0px; font-family: Arial;">
                    <a href="../" target="_blank" title="浏览网站">[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;浏览网站&nbsp;]</a>&nbsp;&nbsp; [ 欢迎
                    <%if (!string.IsNullOrEmpty(strUserName)) { Response.Write(strUserName); } %>
                    今天是
                    <%=DateTime.Now.ToString("yyyy年MM月dd日") %>
                    <%="星期" + DateTime.Now.ToString("ddd", new System.Globalization.CultureInfo("zh-cn"))%>
                    ] </li>
            </ul>
        </div>
        <div id="header_b">
            <ul>
                <li>
                    <a href="Main.aspx" target="frmright" title="回到桌面">回到桌面</a></li>
                <li>
                    <a href="BackGround.aspx" target="frmright" title="网站背景">网站背景</a></li>
                <li>
                    <a href="SEO.aspx" target="frmright" title="网站优化">网站优化</a></li>
                <li>
                    <a href="UpdatePassword.aspx" target="frmright" title="重设密码">重设密码</a></li>
                <li>
                    <a href="WebSiteControl.aspx" target="frmright" title="网站开关">网站开关</a></li>
                <li>
                    <a href="TimeLimitShow.aspx" target="frmright" title="到期日期">到期日期</a></li>
                <li>
                    <a href="SpaceSize.aspx" target="frmright" title="空间大小">空间大小</a></li>
                <li>
                    <a href="BackupDatabase.aspx" target="frmright" title="数据备份">数据备份</a></li>
                <li>
                    <a href="Help.aspx" target="frmright" title="使用帮助">使用帮助</a></li>
                <%if (strRole == "1")
                  {%>
                <li>
                    <a href="Mianban.aspx" target="frmright" title="网站配置">配置中心</a></li>
                <%} %>
            </ul>
        </div>
    </div>
    <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="#ff0000">
        <tr>
            <td align="center" valign="top" nowrap id="frmTitle">
                <iframe frameborder="0" id="frmleft" name="frmleft" scrolling="auto" src="left.aspx" style="height: 100%; width: 182px; background: #e2eefc; margin-top: 5px;"></iframe>
            </td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" height="100%" bgcolor="#CDE2F8">
                    <tr>
                        <td width="7" style="cursor: pointer;" id="switchPoint" title="打开/关闭左边导航栏">
                            <img id="close" value="1" src="images/admin_images/left.gif" border="0" />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="100%" height="100%" bgcolor="#FFFFFF">
                <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="right" border="0">
                    <tr>
                        <td width="100%" align="left" valign="top" class="pr30" bgcolor="#e2eefc">
                            <iframe id="frmright" name="frmright" style="width: 100%; height: 100%; margin-top: 5px;" src="Main.aspx" frameborder="0"></iframe>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div id="footer">
        Copyright &copy; 2008-<script type="text/javascript">                                  var myDate = new Date(); document.write(myDate.getFullYear());</script>
        All Rights Reserved
        <%=Basic.Keys.Banben %></div>
    <%if (!string.IsNullOrEmpty(strQq))
      { 
    %>
    <div style="text-align: center; width: 140px; height: 151px; position: fixed; left: 30px; bottom: 30px;" class="kefuq">
        <div style="float: left; width: 120px;">
            <a href="tencent://message/?uin=<%=strQq %>&Site=400301.com&Menu=yes">
                <img src="images/kf_kt_bg.png" /></a>
        </div>
        <div style="height: 25px; width: 20px; float: left; padding-top: 5px;">
            <img src="images/del1.png" style="width: 20px; cursor: pointer;" title="隐藏客服" onclick="yinchang()" />
        </div>
    </div>
    <%
      } %>
    <script type="text/javascript">
        function yinchang()
        {
            $(".kefuq").hide();
        }
    </script>
    </form>
</body>
</html>
