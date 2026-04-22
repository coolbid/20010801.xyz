<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PicDetail.aspx.cs" Inherits="PicDetail" %>

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
    <link href="css/lightbox.css" rel="stylesheet">
    <script src="js/lightbox.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.showpic_flash').bxSlider({
              pagerCustom: '#pic-page',
               adaptiveHeight: true,
            });

        });
    </script>
</head>
<body id="photo">
    <ucHeadControl:HeadControl id="HeadControl" runat="server" />
    <ucLinkControl:LinkControl id="LinkControl" runat="server" />
    <!-- main -->
    <div class="container">
        <div class="row">
            <div class="path_bg">
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;<a href="/">Home</a>&nbsp;>&nbsp;<a
                    href="#">
                    <%=strParentColumnName %>
                </a>&nbsp;>&nbsp;<a href="#">
                    <%=strColumnName %>
                </a>
            </div>
            <!-- right -->
            <div class="col-xs-12 col-sm-8 col-md-9" style="float: right">
                <div class="list_box">
                    <h2 class="left_h">
                        <%=strColumnName %></h2>
                    <!-- showpic -->
                    <div class="col-sm-11 col-md-8 col-md-offset-2" style="margin-bottom: 30px; margin-top: 20px;">
                        <ul class="showpic_flash">
                            <li><a class="example-image-link" href="/<%=strNewsPath %>" data-lightbox="example-set"
                                target="_blank">
                                <img class="example-image" src="/<%=strNewsPath %>"></a></li>
                        </ul>
                        <div id="pic-page">
                            <a data-slide-index="0" href="/<%=strNewsPath %>">
                                <img src="/<%=strNewsPath %>" /></a>
                        </div>
                    </div>
                    <div class="product_con">
                        <asp:Label ID="lblContent" runat="server"></asp:Label></div>
                    <div class="point">
                        <span class="to_prev col-xs-12 col-sm-6 col-md-6">PREVIOUS£º<a href="/newsdetail/<%=strNext %>"><%=strNext %></a></span>
                        <span class="to_next col-xs-12 col-sm-6 col-md-6">Next:<a href="/newsdetail/<%=intPrevious %>"><%=strPrevious %></a></span>
                    </div>
                </div>
                <div class="list_related">
                    <h2 class="left_h">
                        RELATED PHOTO</h2>
                    <div class="product_list related_list">
                        <%showNews(intClassID, 3); %>
                        <%for (int i = 0; i < intNews; i++)
                          {
                              string title = dtblNews.Rows[i]["title"].ToString();
                              string id = dtblNews.Rows[i]["id"].ToString();
                              string path = dtblNews.Rows[i]["path"].ToString();
                              string url = dtblNews.Rows[i]["url"].ToString();
                              if (url == "") { url = "/newsdetail/" + id; }
                        %>
                        <div class="col-sm-4 col-md-4 col-mm-6 product_img">
                            <a href="<%=url %>">
                                <img src="/<%=path %>" class="img-thumbnail" /></a><p class="product_title">
                                    <a href="<%=url %>">
                                        <%=bp.SubString(title,28)%></a></p>
                        </div>
                        <%} %>
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
<script type="text/javascript" src="//static.addtoany.com/menu/page.js"></script>
<!-- AddToAny END -->        	
        </div>
    </div>
    <div class="foot_nav"><a href="tel:<%=mc.ShowWebsiteKeyById(1,"Mobile") %>"><span class="glyphicon glyphicon-phone btn-lg" aria-hidden="true"></span>Call</a></div>
    <div class="foot_nav"><a id="gotocate" href="#"><span class="glyphicon glyphicon-th-list btn-lg" aria-hidden="true"></span>Menu</a></div>
    <div class="foot_nav"><a id="gototop" href="#"><span class="glyphicon glyphicon-circle-arrow-up btn-lg" aria-hidden="true"></span>Top</a></div>
</nav>
    <script language="javaScript">
        function CheckJob1() {
            if (document.form1.email.value == "") { alert("Please enter the email number£¿"); document.form1.email.focus(); return false; }
            return true;
        }
    </script>
    <ucFootControl:FootControl id="FootControl" runat="server" />
</body>
</html>
