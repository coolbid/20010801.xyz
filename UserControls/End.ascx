<%@ Control Language="C#" AutoEventWireup="true" CodeFile="End.ascx.cs" Inherits="Link" %>
<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<%@ Register Src="~/UserControls/Link.ascx" TagName="LinkControl" TagPrefix="ucLinkControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/Category.ascx" TagName="CategoryControl" TagPrefix="ucCategoryControl" %>
<%@ Register Src="~/UserControls/Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<%@ Register Src="~/UserControls/Contact.ascx" TagName="ContactControl" TagPrefix="ucContactControl" %>

         </div>
</div>
</div>

<!-- left -->
<ucLeftControl:LeftControl ID="LeftControl" runat="server" />
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

<SCRIPT language=javaScript>
    function CheckJob1() {
        if (document.form1.email.value == "") { alert("Please enter the email number£¿"); document.form1.email.focus(); return false; }
        return true;
    }
</SCRIPT>
    <ucFootControl:FootControl ID="FootControl1" runat="server" />
