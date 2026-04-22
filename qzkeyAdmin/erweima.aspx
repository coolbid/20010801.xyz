<%@ Page Language="C#" AutoEventWireup="true" CodeFile="erweima.aspx.cs" Inherits="erweima" %>

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
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <meta name="description" id="description" content="" runat="server" />
    <meta name="keywords" id="keywords" content="" runat="server" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
    <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/css.css" />
    <script src="js/jquery-1-7-2.js"></script>
</head>
<body>
    <form id="form1">
        <div style="text-align: center;">
            <div style="color: blue">第一步：关注微信公众号(企智腾云网)，以便收到微信通知。</div>
            <br />
            <img  src="/images/tengyun.gif" />
            <br />
            <br />
            <div style="color: blue">第二步：获取微信openid，请用微信扫描以下二维码。</div>
            <br />
            <img style="width: 200px; height: 200px" src="http://www.400301.com/Api/Erweima/?data=http://www.400301.com/GetOpenId.aspx" />
            <br />
            <br />
            
        </div>

    </form>
</body>
</html>
