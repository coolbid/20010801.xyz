<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PayPal.aspx.cs" Inherits="PayPal" %>

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
    <meta name="description" id="description" content="" runat="server" />
    <meta name="keywords" id="keywords" content="" runat="server" />
    <title></title>
    <meta charset="utf-8">
    <script type="text/javascript" src="/js/jquery-1-7-2.js"></script>
</head>
<body>
   
    <form action="http://www.paypal.com/cgi-bin/webscr" method="post">
    <div style="display:none;" >
    <input type="text" name="cmd" value="_cart">
    <input type="text" name="upload" value="1">
    <input type="text" name="business" value="<%=Usename %>">
    <input type="text" name="item_name_1" value="<%=Usename %>">
    <input type="text" name="amount_1" value="<%=strPrice1 %>">
    <input type="text" name="quantity_1" value="1">
    <input type="text" name="custom" value="<%=strOrderId %>">
    <input type="text" name="currency_code" value="USD">
    <!--这里重写url，将覆盖全局设置-->
    <input type="text" name="return" value="/return_url.aspx">
    <input type="text" name="notify_url" value="/PayPal/notify_url.aspx" />
    <input type="submit" id="btnMit" value="Upload Cart" alt="Make payments with PayPal-it's fastfree and secure!" />
    </div>
    <script>
        $("#btnMit").click();
    </script>
    </form>
  
</body>
</html>
