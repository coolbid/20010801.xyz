<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Start.ascx.cs" Inherits="Link" %>
<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<%@ Register Src="~/UserControls/Link.ascx" TagName="LinkControl" TagPrefix="ucLinkControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/Category.ascx" TagName="CategoryControl" TagPrefix="ucCategoryControl" %>
<%@ Register Src="~/UserControls/Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<%@ Register Src="~/UserControls/Contact.ascx" TagName="ContactControl" TagPrefix="ucContactControl" %>


    <ucHeadControl:HeadControl ID="HeadControl1" runat="server" />
    <ucLinkControl:LinkControl ID="LinkControl" runat="server" />
 






  
   
<div class="container">    
<div class="row">
<div class="path_bg">
<span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;<a href="/">Home</a>&nbsp;>&nbsp;<a > <%=strParentColumnName %> </a> 
&nbsp;>&nbsp;<a > <%=strColumnName %> </a>
</div><!-- right -->
<div class="col-xs-12 col-sm-8 col-md-9" style="float:right">
<div class="list_box">
<h2 class="left_h">  <%=strColumnName %> </a> </h2>
<div class="contents"> 