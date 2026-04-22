<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="Reg" %>

<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>注册会员</title>
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
        .input_on
        {
            margin: 0;
            padding: 0;
            height: 24px;
            line-height: 24px;
            vertical-align: middle;
            border: #f49090 solid 1px;
            width: 180px;
        }
        .input_off
        {
            margin: 0;
            padding: 0;
            height: 24px;
            line-height: 24px;
            vertical-align: middle;
            background: #FFF;
            border: #ddd solid 1px;
            width: 180px;
        }
    </style>
    <script type="text/javascript">
        ///其他失去焦点
        function checkOther(objID, objSpan) {
            if (objSpan == "spanUserPassword") {
                if (document.getElementById(objID).value == "")
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 密码不可以为空!"; return false; }
                else if (document.getElementById(objID).value.length<6 || document.getElementById(objID).value.length>16)
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 密码长度6～16位!"; return false; }
                else
                { document.getElementById(objSpan).innerHTML = "<img src='images/Correct.gif' alt=''> <strong>密码正确!</strong>"; }
            }

            if (objSpan == "spanUserPassword2") {
                if (document.getElementById(objID).value == "")
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 请再输入一遍密码!"; return false; }
                else if (document.getElementById(objID).value.length<6 || document.getElementById(objID).value.length>16)
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 密码长度6～16位!"; return false; }
                else if (document.getElementById("txtUserPassword").value != document.getElementById("txtUserPassword2").value)
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 两次设定的密码不一致!"; return false; }
                else
                { document.getElementById(objSpan).innerHTML = "<img src='images/Correct.gif' alt=''> <strong>密码正确!</strong>"; }
            }

            if (objSpan == "spanUserRealName") {
                if (document.getElementById(objID).value == "")
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 真实姓名不可以为空!"; return false; }
                else
                { document.getElementById(objSpan).innerHTML = "<img src='images/Correct.gif' alt=''> <strong>正确!</strong>"; }
            }

            if (objSpan == "spanUserAddress") {
                if (document.getElementById(objID).value == "")
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 联系地址不可以为空!"; return false; }
                else
                { document.getElementById(objSpan).innerHTML = "<img src='images/Correct.gif' alt=''> <strong>正确!</strong>"; }
            }

            else if (objSpan == "spanUserCompany") {
                if (document.getElementById(objID).value == "")
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 单位名称不可以为空!"; return false; }
                else
                { document.getElementById(objSpan).innerHTML = "<img src='images/Correct.gif' alt=''> <strong>正确!</strong>"; }
            }
        }
        ///结束
        ///会员名/手机/邮箱/QQ失去焦点_同时要判断是否已存在
        function checkUserName(objID, objSpan) {
            if (objSpan == "spanUserName") {
                if (document.getElementById(objID).value == "")
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 会员名不可以为空!"; return false; }
            }
            else if (objSpan == "spanUserPhone") {
                if (document.getElementById(objID).value == "")
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 手机号码不可以为空!"; return false; }
                else if (!(/^13\d{9}$/g.test(document.getElementById(objID).value)) && !(/^15\d{9}$/g.test(document.getElementById(objID).value)) && !(/^18\d{9}$/g.test(document.getElementById(objID).value)))
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 手机号码格式不对!"; return false; }
            }
            else if (objSpan == "spanUserEmail") {
                if (document.getElementById(objID).value == "")
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> Email地址不可以为空!"; return false; }
                else if (document.getElementById(objID).value != "") {
                    if (!/^[\w-]+(\.[\w-]+)*@[\w-]+(\.(\w)+)*(\.(\w){2,3})$/.test(document.getElementById(objID).value))
                    { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> 请输入正确的Email地址!"; return false; }
                }
            }
            else if (objSpan == "spanUserQQ") {
                if (document.getElementById(objID).value == "")
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> QQ号不可以为空!"; return false; }
                else if (!(/^\d{5,10}$/.test(document.getElementById(objID).value)))
                { document.getElementById(objSpan).innerHTML = "<img src='images/Error.gif' alt=''> QQ号码格式不对!"; return false; }
            }
            setMessage2(objID, objSpan); //判断会员名/手机/邮箱/QQ是否有存在
        }
        ///判断会员名/手机/邮箱/QQ是否有存在
        function setMessage2(objID, objSpan) {
            var xmlObj = null;
            if (window.XMLHttpRequest) {
                xmlObj = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xmlObj = new ActiveXObject("Microsoft.XMLHTTP");
            } else {
                return;
            }
            xmlObj.onreadystatechange = function () {
                if (xmlObj.readyState == 4) {
                    if (xmlObj.status == 200)
                    { updateObj2(xmlObj.responseText, objSpan); }
                }
            }
            xmlObj.open('Post', 'Check/CheckUserName.aspx?Value=' + escape(document.getElementById(objID).value) + '&Type=' + objSpan, true);
            xmlObj.send('');
        }
        function updateObj2(data, span) {
            if (span == "spanUserName") {
                if (data == "false") { document.getElementById(span).innerHTML = "<img src='images/Correct.gif' alt=''> <strong>该会员名可以使用!</strong>"; }
                else if (data == "true") { document.getElementById(span).innerHTML = "<img src='images/Error.gif' alt=''> 该会员名已经被人使用!"; }
                else { document.getElementById(span).innerHTML = "<img src='images/Error.gif' alt=''> " + data; }
            }
            if (span == "spanUserPhone") {
                if (data == "false") { document.getElementById(span).innerHTML = "<img src='images/Correct.gif' alt=''> <strong>该手机号可以使用!</strong>"; }
                else if (data == "true") { document.getElementById(span).innerHTML = "<img src='images/Error.gif' alt=''> 该手机号已经被人使用!"; }
                else { document.getElementById(span).innerHTML = "<img src='images/Error.gif' alt=''> " + data; }
            }
            if (span == "spanUserEmail") {
                if (data == "false") { document.getElementById(span).innerHTML = "<img src='images/Correct.gif' alt=''> <strong>该邮箱可以使用!</strong>"; }
                else if (data == "true") { document.getElementById(span).innerHTML = "<img src='images/Error.gif' alt=''> 该邮箱已经被人使用!"; }
                else { document.getElementById(span).innerHTML = "<img src='images/Error.gif' alt=''> " + data; }
            }
            if (span == "spanUserQQ") {
                if (data == "false") { document.getElementById(span).innerHTML = "<img src='images/Correct.gif' alt=''> <strong>该QQ号可以使用!</strong>"; }
                else if (data == "true") { document.getElementById(span).innerHTML = "<img src='images/Error.gif' alt=''> 该QQ号已经被人使用!"; }
                else { document.getElementById(span).innerHTML = "<img src='images/Error.gif' alt=''> " + data; }
            }
        }
        //结束
        //所有输入框获得焦点开始
        function checkClick(objSpan) {
            if (objSpan == "spanUserName") { document.getElementById(objSpan).innerHTML = "<b>输入会员名,作为登录时的帐号</b>"; return false; }
            if (objSpan == "spanUserPassword") { document.getElementById(objSpan).innerHTML = "<b>密码长度6～16位!</b>"; return false; }
            if (objSpan == "spanUserPassword2") { document.getElementById(objSpan).innerHTML = "<b>重复输入一遍上面的密码</b>"; return false; }
            if (objSpan == "spanUserPhone") { document.getElementById(objSpan).innerHTML = "<b>便于与您取的联系，不会公开</b>"; return false; }
            if (objSpan == "spanUserEmail") { document.getElementById(objSpan).innerHTML = "<b>忘记密码时可通过此邮箱找回,请正确输入</b>"; return false; }
            if (objSpan == "spanUserQQ") { document.getElementById(objSpan).innerHTML = "<b>请输入你的QQ号</b>"; return false; }
            if (objSpan == "spanUserRealName") { document.getElementById(objSpan).innerHTML = "<b>请输入你的真实姓名</b>"; return false; }
            if (objSpan == "spanUserAddress") { document.getElementById(objSpan).innerHTML = "<b>请输入你的联系地址</b>"; return false; }
            if (objSpan == "spanUserCompany") { document.getElementById(objSpan).innerHTML = "<b>请输入你的单位名称</b>"; return false; }
        }
        //结束
        //提交事件触发开始
        function checkNull() {
            if (document.getElementById("txtUserName").value == "")
            { document.getElementById("spanUserName").innerHTML = "<img src='images/Error.gif' alt=''> 会员名不可以为空!"; return false; }
            if (document.getElementById("txtUserPassword").value == "")
            { document.getElementById("spanUserPassword").innerHTML = "<img src='images/Error.gif' alt=''> 密码不可以为空!"; return false; }
            else if (document.getElementById("txtUserPassword").value.length<6 || document.getElementById("txtUserPassword").value.length>16)
            { document.getElementById("spanUserPassword").innerHTML = "<img src='images/Error.gif' alt=''> 密码长度6～16位!"; return false; }
            if (document.getElementById("txtUserPassword2").value == "")
            { document.getElementById("spanUserPassword2").innerHTML = "<img src='images/Error.gif' alt=''> 请再输入一遍密码!"; return false; }
            else if (document.getElementById("txtUserPassword2").value.length<6 || document.getElementById("txtUserPassword2").value.length>16)
            { document.getElementById("spanUserPassword2").innerHTML = "<img src='images/Error.gif' alt=''> 密码长度6～16位!"; return false; }
            else if (document.getElementById('txtUserPassword').value != document.getElementById('txtUserPassword2').value)
            { document.getElementById("spanUserPassword2").innerHTML = "<img src='images/Error.gif' alt=''> 两次设定的密码不一致!"; return false; }
            if (document.getElementById("txtUserPhone").value == "")
            { document.getElementById("spanUserPhone").innerHTML = "<img src='images/Error.gif' alt=''> 手机号码不可以为空!"; return false; }
            else if (!(/^13\d{9}$/g.test(document.getElementById("txtUserPhone").value)) && !(/^15\d{9}$/g.test(document.getElementById("txtUserPhone").value)) && !(/^18\d{9}$/g.test(document.getElementById("txtUserPhone").value)))
            { document.getElementById("spanUserPhone").innerHTML = "<img src='images/Error.gif' alt=''> 手机号码格式不对!"; return false; }
            if (document.getElementById("txtUserEmail").value == "")
            { document.getElementById("spanUserEmail").innerHTML = "<img src='images/Error.gif' alt=''> Email地址不可以为空!"; return false; }
            else if (document.getElementById("txtUserEmail").value != "") {
                if (!/^[\w-]+(\.[\w-]+)*@[\w-]+(\.(\w)+)*(\.(\w){2,3})$/.test(document.getElementById("txtUserEmail").value))
                { document.getElementById("spanUserEmail").innerHTML = "<img src='images/Error.gif' alt=''> 请输入正确的Email地址!"; return false; }
            }
            if (document.getElementById("txtUserQQ").value == "")
            { document.getElementById("spanUserQQ").innerHTML = "<img src='images/Error.gif' alt=''> QQ号码不可以为空!"; return false; }
            else if (!(/^\d{5,10}$/.test(document.getElementById("txtUserQQ").value)))
            { document.getElementById("spanUserQQ").innerHTML = "<img src='images/Error.gif' alt=''> QQ号码格式不对!"; return false; }
            if (document.getElementById("txtUserRealName").value == "")
            { document.getElementById("spanUserRealName").innerHTML = "<img src='images/Error.gif' alt=''> 真实姓名不可以为空!"; return false; }
            if (document.getElementById("txtUserAddress").value == "")
            { document.getElementById("spanUserAddress").innerHTML = "<img src='images/Error.gif' alt=''> 联系地址不可以为空!"; return false; }
            if (document.getElementById("txtUserCompany").value == "")
            { document.getElementById("spanUserCompany").innerHTML = "<img src='images/Error.gif' alt=''> 单位名称不可以为空!"; return false; }
            if (document.getElementById("tbxRegisterVerifier").value == "")
            { document.getElementById("spanUserCode").innerHTML = "<img src='images/Error.gif' alt=''> 请输入验证码!"; return false; }
            document.getElementById("divbutton").style.display = "none";
            document.getElementById("loading").style.display = "block";
            setMessage(); //发送注册信息
            return false;
        }
        //结束
        //发送注册信息开始
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
                { document.getElementById("loading").innerHTML = img + " 正在注册..."; }
                if (xmlObj.readyState == 1)
                { document.getElementById("loading").innerHTML = img + " 正在注册..."; }
                if (xmlObj.readyState == 2)
                { document.getElementById("loading").innerHTML = img + " 正在注册..."; }
                if (xmlObj.readyState == 3)
                { document.getElementById("loading").innerHTML = img + " 正在注册..."; }
                if (xmlObj.readyState == 4) {
                    document.getElementById("loading").innerHTML = img + " 正在注册...";
                    if (xmlObj.status == 200)
                    { updateObj(xmlObj.responseText); }
                }
            }
            xmlObj.open('Post', 'Check/CheckUserReg.aspx?UserName=' + escape(document.getElementById("txtUserName").value) + '&Pwd=' + document.getElementById("txtUserPassword").value + '&UserPhone=' + document.getElementById("txtUserPhone").value + '&UserEmail=' + document.getElementById("txtUserEmail").value + '&UserQQ=' + document.getElementById("txtUserQQ").value + '&UserRealName=' + escape(document.getElementById("txtUserRealName").value) + '&UserAddress=' + escape(document.getElementById("txtUserAddress").value) + '&UserCompany=' + escape(document.getElementById("txtUserCompany").value) + '&Code=' + document.getElementById("tbxRegisterVerifier").value, true);
            xmlObj.send('');
        }
        function updateObj(data) {
            if (data == "该会员名已经被人使用!") { document.getElementById("spanUserName").innerHTML = "<img src='images/Error.gif' alt=''> 该会员名已经被人使用!"; document.getElementById("divbutton").style.display = "block"; document.getElementById("loading").style.display = "none"; }
            else if (data == "该手机号已经被人使用!") { document.getElementById("spanUserPhone").innerHTML = "<img src='images/Error.gif' alt=''> 该手机号已经被人使用!"; document.getElementById("divbutton").style.display = "block"; document.getElementById("loading").style.display = "none"; }
            else if (data == "该邮箱已经被人使用!") { document.getElementById("spanUserEmail").innerHTML = "<img src='images/Error.gif' alt=''> 该邮箱已经被人使用!"; document.getElementById("divbutton").style.display = "block"; document.getElementById("loading").style.display = "none"; }
            else if (data == "该QQ号已经被人使用!") { document.getElementById("spanUserQQ").innerHTML = "<img src='images/Error.gif' alt=''> 该QQ号已经被人使用!"; document.getElementById("divbutton").style.display = "block"; document.getElementById("loading").style.display = "none"; }
            else if (data == "验证码错误!") { document.getElementById("spanUserCode").innerHTML = "<img src='images/Error.gif' alt=''> 验证码错误!"; document.getElementById("divbutton").style.display = "block"; document.getElementById("loading").style.display = "none"; }
            else if (data == "成功") { alert("会员注册成功"); window.location = "Default.aspx"; }
            else { alert(data); document.getElementById('divbutton').style.display = 'block'; document.getElementById('loading').style.display = 'none'; }
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
                document.getElementById("button1Reg").click();
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
                <td width="30%" align="right">
                    会员名
                </td>
                <td width="70%">
                    <input type="text" id="txtUserName" name="txtUserName" class="input_off" onfocus="this.className='input_on';checkClick('spanUserName');"
                        onblur="this.className='input_off';checkUserName('txtUserName','spanUserName');" />
                    <span id="spanUserName"><strong>作为下次登录的帐号</strong></span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    创建密码
                </td>
                <td>
                    <input type="password" id="txtUserPassword" name="txtUserPassword" class="input_off"
                        onfocus="this.className='input_on';checkClick('spanUserPassword');" onblur="this.className='input_off';checkOther('txtUserPassword','spanUserPassword')"
                        maxlength="16" />
                    <span id="spanUserPassword"><strong>密码请设为6-16位字母或数字</strong></span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    确认密码
                </td>
                <td>
                    <input type="password" id="txtUserPassword2" name="txtUserPassword2" class="input_off"
                        onfocus="this.className='input_on';checkClick('spanUserPassword2');" onblur="this.className='input_off';checkOther('txtUserPassword2','spanUserPassword2')"
                        maxlength="16" />
                    <span id="spanUserPassword2">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    手机号
                </td>
                <td>
                    <input type="text" id="txtUserPhone" name="txtUserPhone" class="input_off" onfocus="this.className='input_on';checkClick('spanUserPhone');"
                        onblur="this.className='input_off';checkUserName('txtUserPhone','spanUserPhone');"
                        maxlength="11" />
                    <span id="spanUserPhone"><strong>便于与您取的联系，不会公开</strong></span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    邮箱
                </td>
                <td>
                    <input type="text" id="txtUserEmail" name="txtUserEmail" class="input_off" onfocus="this.className='input_on';checkClick('spanUserEmail');"
                        onblur="this.className='input_off';checkUserName('txtUserEmail','spanUserEmail');" />
                    <span id="spanUserEmail"><strong>用于找回密码，不会公开</strong></span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    QQ
                </td>
                <td>
                    <input type="text" id="txtUserQQ" name="txtUserQQ" class="input_off" onfocus="this.className='input_on';checkClick('spanUserQQ');"
                        onblur="this.className='input_off';checkUserName('txtUserQQ','spanUserQQ');"
                        maxlength="10" />
                    <span id="spanUserQQ"><strong>便于及时沟通交流</strong></span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    姓名
                </td>
                <td>
                    <input type="text" id="txtUserRealName" name="txtUserRealName" class="input_off"
                        onfocus="this.className='input_on';checkClick('spanUserRealName');" onblur="this.className='input_off';checkOther('txtUserRealName','spanUserRealName');"
                        maxlength="4" />
                    <span id="spanUserRealName"><strong>输入您的称谓</strong></span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    联系地址
                </td>
                <td>
                    <input type="text" id="txtUserAddress" name="txtUserAddress" class="input_off" onfocus="this.className='input_on';checkClick('spanUserAddress');"
                        onblur="this.className='input_off';checkOther('txtUserAddress','spanUserAddress');" />
                    <span id="spanUserAddress">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单位名称
                </td>
                <td>
                    <input type="text" id="txtUserCompany" name="txtUserCompany" class="input_off" onfocus="this.className='input_on';checkClick('spanUserCompany');"
                        onblur="this.className='input_off';checkOther('txtUserCompany','spanUserCompany');" />
                    <span id="spanUserCompany">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    验证码
                </td>
                <td style="line-height: 24px; height: 24px;">
                    <table cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td>
                                <input type="text" id="tbxRegisterVerifier" name="tbxRegisterVerifier" style="width: 60px;"
                                    class="input_off" onfocus="this.className='input_on'" onblur="this.className='input_off'" />
                            </td>
                            <td style="padding-left: 5px;">
                                <img src="Check/Code.aspx" id="Image1" border="0" align="middle" style="cursor: pointer;
                                    width: 110px; height: 25px;" onclick="this.src='Check/Code.aspx?' + Math.random()"
                                    alt="点击刷新" />
                            </td>
                            <td style="width: 280px;">
                                <a href="javascript:imgchange('Image1');" title="看不清？换一张"><span style="color: #c00;">
                                    看不清？换一张</span></a> <span id="spanUserCode"></span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <span id='divbutton' style="padding-left: 0px;">
                        <input type="button" id="button1Reg" name="button1Reg" value="注 册" style="background: url(images/btn_02.gif) no-repeat;
                            font-size: 14px; font-weight: bold; color: #c00; height: 31px; line-height: 31px;
                            width: 112px; text-align: center; border: none; cursor: pointer;" onclick="return checkNull();" />
                    </span><span id='loading'>&nbsp;</span>
                </td>
            </tr>
        </table>
    </div>
    <!--Content End-->
    </form>
</body>
</html>
