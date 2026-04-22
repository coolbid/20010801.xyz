<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="Message2" %>

<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<%@ Register Src="~/UserControls/Link.ascx" TagName="LinkControl" TagPrefix="ucLinkControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/Category.ascx" TagName="CategoryControl" TagPrefix="ucCategoryControl" %>
<%@ Register Src="~/UserControls/Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<%@ Register Src="~/UserControls/Contact.ascx" TagName="ContactControl" TagPrefix="ucContactControl" %>
<%--fastcontrol 0.1--%>
<%@ Register Src="~/UserControls/Top.ascx" TagName="Top" TagPrefix="ucTop" %>
<%@ Register Src="~/UserControls/Start.ascx" TagName="Start" TagPrefix="ucStart" %>
<%@ Register Src="~/UserControls/End.ascx" TagName="End" TagPrefix="ucEnd" %>
<!doctype html>
<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <meta name="description" id="description" content="" runat="server" />
    <meta name="keywords" id="keywords" content="" runat="server" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/bxslider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bxslider.min.js"></script>
    <script src="/js/common.js"></script>
    <script src="/js/bootstrap.js"></script>
    <!--[if lt IE 9]>
  <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <%--默认--%>
    <script src="/js/Validator-2.0.1.js" type="text/javascript"></script>
    <script src="/js/simpleAlert.js" type="text/javascript"></script>
    <link href="/js/simpleAlert.css" rel="stylesheet" type="text/css" /> 
</head>
<body> 
    <ucHeadControl:HeadControl id="HeadControl" runat="server" />
    <ucLinkControl:LinkControl id="LinkControl" runat="server" />
    <!-- main -->
    <div class="container">
        <div class="row">
            <div class="path_bg">
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp; <a
                    href="/">Home</a>&nbsp;&nbsp;>&nbsp;&nbsp;Feedback
            </div>
            <!-- right -->
            <div class="col-xs-12 col-sm-8 col-md-9" style="float: right">
                <div class="list_box">
                    <h2 class="left_h">
                        Inquriry</h2>
                    <div class="feedback">
                        <form id="myform" onsubmit="return false;" class="form-horizontal">
                        <div class="form-group">
                            <label for="title" class="col-sm-3 control-label">
                                Title:
                            </label>
                            <div class="col-sm-6">
                                <input type="text" name="title" ty-data="VeriNotNull" ty-title="主题" class="form-control"
                                    id="title" placeholder="Required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label">
                                Your Name:
                            </label>
                            <div class="col-sm-6">
                                <input type="text" name="name" ty-data="VeriNotNull" ty-title="姓名" class="form-control"
                                    id="username" placeholder="Required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tel" class="col-sm-3 control-label">
                                Phone:
                            </label>
                            <div class="col-sm-6">
                                <input type="text" name="tel" ty-data="VeriNotNull" ty-title="手机号" class="form-control"
                                    id="tel">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class="col-sm-3 control-label">
                                E-mail:
                            </label>
                            <div class="col-sm-6">
                                <input type="email" name="email" ty-data="VeriNotNull" ty-title="邮箱" class="form-control"
                                    id="inputEmail" placeholder="Required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contents" class="col-sm-3 control-label">
                                Message:
                            </label>
                            <div class="col-sm-6">
                                <textarea name="contents" ty-data="VeriNotNull" ty-title="内容" id="txtContent" class="form-control"
                                    rows="3"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="code" class="col-xs-12 col-sm-3 control-label">
                                Captcha:
                            </label>
                            <div class="col-xs-7 col-sm-2">
                                <input type="text" name="code" class="form-control" ty-data="VeriNotNull" ty-title="内容"
                                    id="code"></div>
                            <div class="col-xs-2 col-sm-1"> 
                                <img id="Image1" align="absmiddle" onclick="this.src='/Check/Code.aspx?' + Math.random()"
                                    alt="点击刷新" src="/Check/Code.aspx" class="codeimg" />
                                </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-10">
                                <button type="button" ty-event="checkNull();" name="button" value="Send" class="TyBtnSubmit btn btn-danger page-btn">
                                    Send</button>&nbsp;
                                <button type="reset" name="reset" class="btn btn-default grey-btn">
                                    Reset</button>
                            </div>
                        </div>
                        <script>
                            //检验提交数据格式合法性
                            function checkNull() {
                                var code = document.getElementById("code").value;
                                var title = document.getElementById("title").value;
                                var realname = document.getElementById("username").value;
                                var phone = document.getElementById("tel").value;
                                var email = document.getElementById("inputEmail").value;
                                var content = document.getElementById("txtContent").value;
                                //提交信息开始
                                $.ajax({
                                    type: "get",
                                    url: "/Check/CheckMessage.aspx?Title=" + escape(title) + "&Realname=" + escape(realname) + "&Phone=" + escape(phone) + "&Email=" + escape(email) + "&Content=" + escape(content) + "&Code=" + escape(code),
                                    success: function (msg) {
                                        if (msg == "success") {

                                            tijiao("Success", "恭喜你，提交成功！");
                                            setTimeout(function () {
                                                window.location.reload();
                                            }, 1000);
                                        }
                                        else if (msg == "failure") {

                                            tijiao("Error", "很遗憾，提交失败！");
                                        }
                                        else if (msg == "error") {
                                            tijiao("Error", "您的请求带有不合法的参数，谢谢合作！");
                                        }
                                        else if (msg == "false") {
                                            tijiao("Error", "验证码错误！");
                                        }
                                    }
                                });
                                //提交信息结束
                            }
                        </script>
                        <input type="hidden" name="__hash__" value="df5be9eb4eea6d1ff5ac359b6dee6190_07093f7e273a5d1cf1446548ccebc466" /></form>
                    </div>
                </div>
            </div>
            <!-- left -->
            <ucLeftControl:LeftControl id="LeftControl" runat="server" />
        </div>
    </div>
    <nav class="navbar navbar-default navbar-fixed-bottom footer_nav">
    <div class="foot_nav btn-group dropup">
        <a class="dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
            <span class="glyphicon glyphicon-share btn-lg" aria-hidden="true"></span>Share
        </a>  
        <div class="dropdown-menu webshare">
        	<!-- AddToAny BEGIN -->
<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
<a class="a2a_dd" href="https://www.addtoany.com/share_save"></a>
<a class="a2a_button_facebook"></a>
<a class="a2a_button_twitter"></a>
<a class="a2a_button_google_plus"></a>
<a class="a2a_button_linkedin"></a>
</div>
<!-- AddToAny END -->        	
        </div>
    </div>
    <div class="foot_nav"><a href="tel:<%=mc.ShowWebsiteKeyById(1,"Mobile") %>"><span class="glyphicon glyphicon-phone btn-lg" aria-hidden="true"></span>Call</a></div>
    <div class="foot_nav"><a id="gotocate" href="#"><span class="glyphicon glyphicon-th-list btn-lg" aria-hidden="true"></span>Menu</a></div>
    <div class="foot_nav"><a id="gototop" href="#"><span class="glyphicon glyphicon-circle-arrow-up btn-lg" aria-hidden="true"></span>Top</a></div>
</nav>
    <script language="javaScript">
        function CheckJob1() {
            if (document.form1.email.value == "") { alert("Please enter the email number？"); document.form1.email.focus(); return false; }
            return true;
        }
    </script>
    <ucFootControl:FootControl ID="FootControl" runat="server" />
 
</body>
</html>
