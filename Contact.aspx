<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact2" %>

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
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <meta name="description" id="description" content="" runat="server" />
    <meta name="keywords" id="keywords" content="" runat="server" />
    <ucTop:Top ID="Top" runat="server" />
    <%--д╛хо--%>
    <style type="text/css">
        /*contact*/
.contact007 {margin-top:10px;}
.contact007 ul li {line-height:30px;border-bottom:#e3d2c1 dashed 1px;}
    </style>
</head>
<body>
    <form id="form1">
        <ucStart:Start ID="Start" runat="server" />
        <!--Content Start-->
        <div class="contact007">
            <ul>
                <%=strCompanyName %>
                <%=strAddress %>
                <%=strContact %>
                <%=strPhone %>
                <%=strEmail %>
                <%=strQQ %>
                <%=strMobile %>
                <%=strFax %>
                <%=strWebUrl %>
                <%=strWeChat %>
                <%=strMap %>
            </ul>
        </div>
        <!--Content End-->
        <ucEnd:End ID="End" runat="server" />
    </form>
</body>
</html>
