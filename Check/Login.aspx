<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>会员登录</title>
    <style type="text/css">
        .login
        {
            border: #ddd solid 1px;
            margin: 0 auto;
            width: 980px;
        }
        .login span
        {
            font-size: 14px;
            font-weight: normal;
            padding-left: 10px;
        }
        .login span b a
        {
            color: #c00;
            font-weight: normal;
        }
        .login table tr td
        {
            height: 45px;
            line-height: 45px;
            font-size: 14px;
            padding-right: 8px;
        }
        .login table tr td strong
        {
            font-weight: normal;
            font-size: 12px;
            color: #999;
        }
        .login table tr td span
        {
            font-size: 12px;
            color: #c00;
        }
        .login span b
        {
            color: #054ba7;
            font-weight: normal;
            font-size: 12px;
        }
        .login a span
        {
            font-size: 12px;
            text-decoration: none;
        }
        #spanUserName b
        {
            color: #054ba7;
            font-weight: normal;
            font-size: 12px;
        }
        .input_on_login
        {
            border: none;
            margin: 0;
            padding: 0 0 0 5px;
            height: 24px;
            line-height: 24px;
            vertical-align: middle;
            border: #f49090 solid 1px;
            width: 180px;
            color: #333;
            font-size: 12px;
        }
        .input_off_login
        {
            border: none;
            margin: 0;
            padding: 0 0 0 5px;
            height: 24px;
            line-height: 24px;
            vertical-align: middle;
            background: #fff;
            border: #ddd solid 1px;
            width: 180px;
            color: #333;
            font-size: 12px;
        }
    </style>
    <script type="text/javascript" charset="gb2312">
        function checkNull() {
            if (document.getElementById("txtUserName").value == "" || document.getElementById("txtUserName").value == "会员名/手机号/邮箱")
            { alert("请输入正确的会员名或手机号、邮箱!"); document.getElementById("txtUserName").focus(); return false; }
            else if (document.getElementById("txtPwd").value == "")
            { alert("请输入密码!"); document.getElementById("txtPwd").focus(); return false; }
            else if (document.getElementById("tbxRegisterVerifier").value == "")
            { alert("请输入验证码!"); document.getElementById("tbxRegisterVerifier").focus(); return false; }
            else {
                document.getElementById("divbutton").style.display = "none";
                document.getElementById("loading").style.display = "block";
                setMessage();
                return false;
            }
        }
        function setMessage() {
            var img = "<img src='images/loading_small.gif'/>";
            var xmlObj = null;
            if (window.XMLHttpRequest) {
                xmlObj = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xmlObj = new ActiveXObject("Microsoft.XMLHTTP");
            } else {
                return;
            }
            xmlObj.onreadystatechange = function () {
                if (xmlObj.readyState == 0)
                { document.getElementById("loading").innerHTML = img + " 验证中,请稍后..."; }
                if (xmlObj.readyState == 1)
                { document.getElementById("loading").innerHTML = img + " 验证中,请稍后..."; }
                if (xmlObj.readyState == 2)
                { document.getElementById("loading").innerHTML = img + " 验证中,请稍后..."; }
                if (xmlObj.readyState == 3)
                { document.getElementById("loading").innerHTML = img + " 验证中,请稍后..."; }
                if (xmlObj.readyState == 4) {
                    document.getElementById('loading').innerHTML = img + " 验证中,请稍后...";
                    if (xmlObj.status == 200)
                    { updateObj(xmlObj.responseText); }
                }
            }
            xmlObj.open('Post', 'Check/CheckUserLogin.aspx?UserName=' + escape(document.getElementById("txtUserName").value) + '&Pwd=' + document.getElementById("txtPwd").value + '&Code=' + document.getElementById("tbxRegisterVerifier").value, true);
            xmlObj.send('');
        }
        function updateObj(data) {
            if (data == "验证码错误!") { alert(data); document.getElementById("divbutton").style.display = "block"; document.getElementById("loading").style.display = "none"; document.getElementById("tbxRegisterVerifier").select(); }
            else if (data == "帐号错误!") { alert(data); document.getElementById("divbutton").style.display = "block"; document.getElementById("loading").style.display = "none"; document.getElementById("txtUserName").select(); }
            else if (data == "密码错误!") { alert(data); document.getElementById("divbutton").style.display = "block"; document.getElementById("loading").style.display = "none"; document.getElementById("txtPwd").select(); }
            else if (data == "成功") {
                if (document.getElementById("URL").value != "") { window.location = document.getElementById("URL").value; }
                else { alert("登录成功"); window.location = "Default.aspx"; }
            }
            else { alert(data); document.getElementById("divbutton").style.display = "block"; document.getElementById("loading").style.display = "none"; }
        }
        //输入框获得焦点开始
        function checkClick(objSpan) {
            if (objSpan == "spanUserName") { document.getElementById(objSpan).innerHTML = "<b>您可用会员名、手机号、邮箱登录</b>"; return false; }
        }
        //结束
        //输入框失去焦点开始
        function checkClick2(objSpan) {
            if (objSpan == "spanUserName") { document.getElementById(objSpan).innerHTML = ""; return false; }
        }
        //结束
        //验证码，看不请，换一张
        function imgchange(imgid) {
            var img = document.getElementById(imgid);
            img.src = img.src + '?' + Math.random();
        }
        //获得焦点
        document.onkeydown = function (event) {
            e = event ? event : (window.event ? window.event : null);

            if (e.keyCode == 13) {
                document.getElementById("button1Log").click();
                return false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <!--Content Start-->
    <div class="login">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="32%" align="right" style="padding-right: 8px;">
                    帐号
                </td>
                <td colspan="3">
                    <input type="text" id="txtUserName" name="txtUserName" class="input_off_login" onfocus="this.className='input_on_login';javascript:if(this.value=='会员名/手机号/邮箱') this.value='';checkClick('spanUserName');"
                        onblur="this.className='input_off_login';javascript:if (this.value=='')this.value='会员名/手机号/邮箱';checkClick2('spanUserName');"
                        value="会员名/手机号/邮箱" />
                    <span id="spanUserName">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td align="right" style="padding-right: 8px;">
                    密码
                </td>
                <td colspan="3">
                    <input type="password" id="txtPwd" name="txtPwd" class="input_off_login" onfocus="this.className='input_on_login'"
                        onblur="this.className='input_off_login'" />
                    <!--<a href="GetPassword.aspx" target="_blank"><span style="color: #c00;">忘记密码？</span></a>-->
                </td>
            </tr>
            <tr>
                <td align="right" style="padding-right: 8px;">
                    验证码
                </td>
                <td align="left" style="width: 60px;">
                    <input type="text" id="tbxRegisterVerifier" name="tbxRegisterVerifier" style="width: 60px;"
                        class="input_off_login" onfocus="this.className='input_on_login'" onblur="this.className='input_off_login'"
                        maxlength="4" />
                </td>
                <td align="left" style="width: 110px;">
                    <img src="Check/Code.aspx" id="Image1" border="0" align="middle" style="cursor: pointer;
                        width: 110px; height: 25px;" onclick="this.src='Check/Code.aspx?' + Math.random()"
                        alt="点击刷新" />
                </td>
                <td align="left">
                    <a href="javascript:imgchange('Image1');" title="看不清？换一张"><span style="color: #c00;">
                        看不清？换一张</span></a>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td colspan="3" align="left">
                    <span id='divbutton' style="padding-left: 0px;">
                        <input type="button" id="button1Log" name="button1Log" value="登 录" style="background: url(images/btn_02.gif) no-repeat;
                            font-size: 14px; font-weight: bold; color: #c00; height: 31px; line-height: 31px;
                            width: 112px; text-align: center; border: none; cursor: pointer;" onclick="return checkNull()" />
                    </span><span id='loading'>&nbsp;</span>
                    <input type="hidden" id="URL" name="URL" value="" />
                </td>
            </tr>
        </table>
    </div>
    <!--Content End-->
    </form>
</body>
</html>
