<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Manager_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <title>网站管理系统</title>
    <style type="text/css">
        body, div, table, tr, td, ul, li, a, h1, h2, h3, h4, h5, h6, p, form, input, option, select, dl, dt, dd { margin: 0; padding: 0; }
        ul, li { list-style: none; }
        body { font: "宋体"; font-size: 12px; color: #2b2b2b; }
        img { border: 0; list-style: none; }
        a { color: #2b2b2b; font: "宋体"; font-size: 12px; text-decoration: none; outline: none; /*firefax*/ behavior: url(js/xuxian.htc); }
        .a2 { font-size: 12px; font-weight: normal; color: #292929; }
        .a2:hover { color: #CC0000; }
        a:hover { color: #900; display: inline; }
        .wrapper { width: 960px; margin: 0 auto; }
        .clear { clear: both; font-size: 0px; margin: 0px; padding: 0px; }
        input { vertical-align: middle; }
        h2 { color: #3476d9; font-size: 14px; background: url(images/dfNews.gif) repeat-x; border-bottom: #e6e6e6 solid 1px; font-size: 14px; line-height: 23px; height: 23px; }
        #login { width: 530px; margin: 0 auto; margin-top: 100px; position: relative; }
        #login_bg1 { background: url(images/admin_images/login_bg1.gif?v=4.0.3); height: 96px; width: 530px; overflow: hidden; }
        #login_bg1 a { float: right; margin-top: 33px; margin-right: 18px; color: #5d7cb3; }
        #login_bg1 a:hover { color: #900; }
        
        #login_bg2 { background: url(images/admin_images/login_bg2.gif?v=4.0.3); height: 169px; width: 530px; overflow: hidden; }
        #login_content ul { padding-left: 240px; }
        #login_content ul li { height: 40px; line-height: 40px; color: #536492; }
        #login_content ul li input { border: #bec5d5 solid 1px; height: 18px; line-height: 18px; width: 130px; }
        #login_button { padding-left: 288px; margin-top: 10px; _margin-top: 0px; }
        #login_button ul li { float: left; }
        #login_bg2 p { color: #3c5a91; margin-left: 280px; margin-top: 10px; }
        
        
        #login_bg3 { background: url(images/admin_images/login_bg3.gif); height: 92px; width: 530px; overflow: hidden; font-family: Arial, Helvetica, sans-serif; }
        #login_bg3 p { text-align: right; padding-right: 2px; margin-top: 35px; color: #676767; }
        
        .email { position: absolute; top: 170px; left: 288px; width: 300px; border: #ccd3dc solid 1px; background: #fff; display: none; color: #536492; }
        .email h2 { line-height: 28px; height: 28px; padding: 0 10px; background: url(images/admin_images/inside_02.gif?v=4.0.3) repeat-x; border-bottom: #ddd solid 1px; color: #536492; }
        .email h2 strong { float: left; font-size: 12px; }
        .email h2 span { float: right; font-weight: normal; cursor: pointer; }
        .email h2 span b { font-family: Arial, Helvetica, sans-serif; font-size: 20px; font-weight: normal; }
        .email input { border: #bec5d5 solid 1px; height: 18px; line-height: 18px; width: 130px; }
    </style>
    <script type="text/javascript" src="js/jquery-1-7-2.js"></script>
    <script src="js/login.js?v=4.0.3" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript">
        //JS回车键执行按钮开始
        document.onkeydown = function (event)
        {
            e = event ? event : (window.event ? window.event : null);

            if (e.keyCode == 13)
            {
                document.getElementById("btnLogin").click();
                return false;
            }
        }
        //结束
    </script>
    <script type="text/javascript">
        function CheckEmail()
        {
            if (document.getElementById("Email").value == "")
            {
                alert("请输入邮箱地址！"); document.getElementById("Email").focus();
                return false;
            }
            else if (document.getElementById('Email').value != "")
            {
                if (!/^[\w-]+(\.[\w-]+)*@[\w-]+(\.(\w)+)*(\.(\w){2,3})$/.test(document.getElementById("Email").value))
                { alert("请输入正确的邮箱地址！"); document.getElementById("Email").focus(); return false; }
            }
            document.getElementById('divbutton2').style.display = 'none';
            document.getElementById('loading2').style.display = 'block';
            setMessage(); return false;
        }
        function setMessage()
        {
            var img = "<img src='images/admin_images/loading_small.gif'/>";
            var xmlObj = null;
            if (window.XMLHttpRequest)
            {
                xmlObj = new XMLHttpRequest();
            } else if (window.ActiveXObject)
            {
                xmlObj = new ActiveXObject("Microsoft.XMLHTTP");
            } else
            {
                return;
            }
            xmlObj.onreadystatechange = function ()
            {
                if (xmlObj.readyState == 0)
                { document.getElementById('loading2').innerHTML = img + " 正在发送..."; }
                if (xmlObj.readyState == 1)
                { document.getElementById('loading2').innerHTML = img + " 正在发送..."; }
                if (xmlObj.readyState == 2)
                { document.getElementById('loading2').innerHTML = img + " 正在发送..."; }
                if (xmlObj.readyState == 3)
                { document.getElementById('loading2').innerHTML = img + " 正在发送..."; }
                if (xmlObj.readyState == 4)
                {
                    document.getElementById('loading2').innerHTML = img + " 正在发送...";
                    if (xmlObj.status == 200)
                    { updateObj(xmlObj.responseText); }
                }
            }
            xmlObj.open('Post', 'SendToEmail.aspx?Email=' + document.getElementById("Email").value, true);
            xmlObj.send('');
        }
        function updateObj(data)
        {
            if (data == "True") { document.getElementById('divbutton2').style.display = 'block'; document.getElementById('loading2').style.display = 'none'; document.getElementById('sendEmail').style.display = 'none'; document.getElementById('Email').value = ''; alert("密码已经发送至邮箱，请注意查收！"); }
            else if (data == "False") { document.getElementById('divbutton2').style.display = 'block'; document.getElementById('loading2').style.display = 'none'; alert("发送失败！"); }
            else if (data == "Error") { document.getElementById('divbutton2').style.display = 'block'; document.getElementById('loading2').style.display = 'none'; alert("邮箱不存在！"); }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="login">
        <div id="login_bg1">
        </div>
        <div id="login_bg2">
            <div id="login_content">
                <ul>
                    <li>用户名：<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <span style="font-family: '宋体';">密<font style="visibility: hidden">的</font>码</span>：<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <span class="SendToMobile" style="cursor: pointer;">忘记密码？</span>
                    </li>
                    <li>验证码：<asp:TextBox ID="tbxRegisterVerifier" runat="server" Width="35"></asp:TextBox>
                        <asp:Image ID="Image1" runat="server" ImageUrl="Code.aspx" Style="cursor: pointer; width: 92px; height: 20px; border: 0px;" align="absmiddle" onclick="this.src='Code.aspx?' + Math.random()" alt="点击刷新" />
                        <a href="javascript:imgchange('Image1');" title="看不清？换一张">看不清？换一张</a></li>
                </ul>
            </div>
            <div id="login_button">
                <ul>
                    <li style="height: 30px;">
                        <span id='divbutton'>
                            <asp:Button ID="btnLogin" runat="server" Style="background-image: url('images/admin_images/login_button1.gif?v=4.0.3'); width: 64px; height: 22px; border: 0px; cursor: pointer;" /></span><span id='loading' style="display: none;"><img src='images/admin_images/loading_small.gif' alt="" />
                                登录中...</span>
                    </li>
                    <li style="padding-left: 10px;">
                        <span id="CommonMessage"></span>
                    </li>
                </ul>
                <div class="clear">
                </div>
            </div>
            <div class="email" id="sendEmail">
                <h2>
                    <strong>找回密码</strong><span><b>×</b></span></h2>
                <table width="100%" border="0" cellspacing="5" cellpadding="0" style="line-height: 30px;">
                    <tr>
                        <td width="40%" align="right">
                            输入预留邮箱地址：
                        </td>
                        <td width="60%">
                            <input type="text" style="width: 140px;" name="Email" id="Email" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <span id='divbutton2'>
                                <input type="button" value="" style="background: url(images/admin_images/testdrive_button5_10.gif?v=4.0.3) no-repeat; width: 86px; height: 32px; margin: 0; padding: 0; border: 0; cursor: pointer;" onclick="CheckEmail()" /></span><span id='loading2'></span>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="login_bg3">
            <p>
                Copyright &copy; 2008-<script type="text/javascript">                                          var myDate = new Date(); document.write(myDate.getFullYear());</script>
                All Rights Reserved
                <%=Basic.Keys.Banben %></p>
        </div>
    </div>
    </form>
</body>
</html>
