<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<%@ Register Src="~/UserControls/Link.ascx" TagName="LinkControl" TagPrefix="ucLinkControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/Category.ascx" TagName="CategoryControl" TagPrefix="ucCategoryControl" %>
<%@ Register Src="~/UserControls/Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<%@ Register Src="~/UserControls/Contact.ascx" TagName="ContactControl" TagPrefix="ucContactControl" %>
<!doctype html>
<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <meta charset="UTF-8">
    <script type="text/javascript" src="/js/jquery-1.6.min.js"></script>
    <script src="/js/Validator-2.0.1.js" type="text/javascript"></script>
    <script src="/js/simpleAlert.js" type="text/javascript"></script>
    <link href="/js/simpleAlert.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }

        a{
            text-decoration: none;
        }

        ul{
            list-style: none;
        }

        body{
            background: #f7f7f7;
        }

        .wrap{
            width:800px;
            margin: 0 auto;
        }

        .Tit{
            height: 60px;
            line-height: 60px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            background: #fff;
            font-size: 24px;
            text-shadow: 0 0 10px #000;
            color: #fff;
            font-weight: bolder;
        }
         .Tit div {
    float: left;
    width: 32px;
    height: 32px;
    margin: 15px;
    cursor: pointer;
    background-image: url(/images/homehui.png);
    background-size: 100% 100%;
}
                  .Tit div:hover{
    background-image: url(/images/homehei.png);
}
            .Tit span {
                width: 736px;
                display: block;
            }
        .con{
            margin-top: 20px;
            padding: 30px 33px;
            width: 730px;
            background:#fff url("/images/wave.png") repeat-x top;
            border: 1px solid #e5e5e5;
            border-top: none;
        }

        .lg_re{
            width: 340px;
            margin: 30px auto;
        }

        .lg_re li{
            line-height: 37px;
            margin-bottom: 20px;
        }

        .bdDv01{
            height: 37px;
            position: relative;
        }

        .bdDv01 input[type="text"]{
            display: block;
            border-radius: 5px;
            height: 35px;
            width: 340px;
            box-sizing: border-box;
            padding-left: 70px;
            padding-right: 10px;
            outline: none;
            color: rgb(102, 102, 102);
            border: 1px solid rgb(229, 229, 229);
        }

        .bdDv01 input[type="text"]:focus{
            box-shadow:0 0 6px #01aaef;
        }
         .bdDv01 input[type="password"]{
            display: block;
            border-radius: 5px;
            height: 35px;
            width: 340px;
            box-sizing: border-box;
            padding-left: 70px;
            padding-right: 10px;
            outline: none;
            color: rgb(102, 102, 102);
            border: 1px solid rgb(229, 229, 229);
        }

        .bdDv01 input[type="password"]:focus{
            box-shadow:0 0 6px #01aaef;
        }
        .bdDv01 span{
            display: block;
            height: 37px;
            width: 50px;
            padding: 0 10px;
            font-size: 12px;
            color: rgb(178, 178, 178);
            position: absolute;
            left: 0;
            top: 0;
        }

        .dlli{
            margin-top: 20px;
        }

        .dlli input[type="button"]{
            display: block;
            letter-spacing: 5px;
            width: 100%;
            height: 35px;
            outline: none;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            background-color: rgb(255, 102, 0);
            color: white;
            border-style: none;
            border-radius: 4px;
        }

        .goRegister{
            display: block;
            color: #000;
            font-size: 14px;
            height: 37px;
            line-height: 37px;
            text-align: center;
        }

        .goRegister a{
            color: #f00;
        }

        .goRegister a:hover{
            text-decoration: underline;
        }

    </style>
      
    <script>
        document.onkeydown = function (event) {
            e = event ? event : (window.event ? window.event : null);
            if (e.keyCode == 13) {
                checkNull();
                return false;
            }
        }
    </script>
</head>
<body>
    <div class="wrap">
        <div class="Tit">
            <div onclick="javascript:window.location.href='/'"></div>
            <span>登录</span>
        </div>
        <form id="form2">
        <div class="con">
            <ul class="lg_re">
                <li>
                    <div class="bdDv01">
                        <input id="a1" ty-data="VeriNotNull,VeriName" ty-title="用户名" placeholder="6-16字母或数字" type="text">
                        <span>用户名:</span>
                    </div>
                </li>
                <li>
                    <div class="bdDv01">
                        <input id="a2" ty-data="VeriNotNull,VeriPsw" ty-title="密码" placeholder="6-16字母数字组合" type="password">
                        <span>密码:</span>
                    </div>
                </li>
                <li class="dlli">
                    <input type="button" class="TyBtnSubmit" ty-event="checkNull()" value="立即登录">
                </li>
                <li>
                    <span class="goRegister">还没有账户?<a href="/register">去注册</a> </span>
                </li>
            </ul>
        </div>
            </form>
    </div>


    <script type="text/javascript" charset="gb2312">

        //登录
        function checkNull() {
            var Username = $("#a1").val();
            var Password = $("#a2").val();


            var match;
            //登录
            $.ajax({
                type: "get",
                async: false,  // 设置同步方式  ********
                url: "/Check/CheckUserLogin.aspx?LogName=" + escape(Username) + "&LogPwd=" + escape(Password),
                datatype: "json",
                success: function (msg) {
                    match = msg; 
                }
            });
            if (match == "ok") {
                tijiao("Success", "登录成功！");
                setTimeout(function () {
                    window.location.href = "/";
                }, 1000);
            }
            else {
                tijiao("Error", "用户名或密码不正确！");

            }
        }
    </script>

	</body>
</html>
