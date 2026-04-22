<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="applicable-device" content="pc,mobile">
    <title></title>
    <meta name="description" id="description" content="" runat="server" />
    <meta name="keywords" id="keywords" content="" runat="server" />

<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/bxslider.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/bxslider.min.js"></script>
<script src="/js/common.js"></script>
<script src="/js/bootstrap.js"></script>
<!--滚动、切换插件-->
<script type="text/javascript" src="/js/jQuery.blockUI.js"></script>
<script type="text/javascript" src="/js/jquery.SuperSlide.js"></script>
<!--[if lt IE 9]>
  <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body> 
    <ucHeadControl:HeadControl ID="HeadControl" runat="server" />
    <ucBannerControl:BannerControl ID="BannerControl" runat="server" />
    <div style="padding: 20px 0; background-color: #eee; overflow:hidden;">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="index_product">
                        <div class="product_head" data-move-y="-40px">
                            <h2><%=mc.ShowColumnName(5) %></h2>
                            <p>
                                <%=mc.ShowColumnSubName(5) %></p>
                        </div>
                        <div class="scroll_03">
                            <div class="bd">
                                <ul>

                                <%showNews(5,10); %>
                                <%for (int i = 0; i < intNews; i++)
  {
      string title = dtblNews.Rows[i]["title"].ToString();
      string id = dtblNews.Rows[i]["id"].ToString();
      string url = dtblNews.Rows[i]["url"].ToString();
      string path = dtblNews.Rows[i]["path"].ToString();
      if (url == "") { url = "/newsdetail/" + id; }
      %>
      <li class="col-sm-4 col-md-3 col-mm-6">
                                        <div class="img">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <a href="<%=url %>">
                                                            <img src="/<%=path %>"></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </li>
      <%} %>

                                     
                                   
                                </ul>
                            </div>
                        </div>
                        <script type="text/javascript">                            jQuery(".scroll_03").slide({ mainCell: ".bd ul", effect: "leftMarquee", vis: 4, interTime: 30, autoPlay: true });</script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="case_box" style="background-image: url(images/bg2.jpg); padding: 30px 0;">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="index_product">
                        <div class="case_head" data-move-y="-40px">
                            <h2><%=mc.ShowColumnName(6)%></h2>
                        </div>
                        <div class="case_list">
                         <%showNews(6,6); %>
                                <%for (int i = 0; i < intNews; i++)
  {
      string title = dtblNews.Rows[i]["title"].ToString();
      string keycontent = dtblNews.Rows[i]["keycontent"].ToString();
      string id = dtblNews.Rows[i]["id"].ToString();
      string url = dtblNews.Rows[i]["url"].ToString();
      string path = dtblNews.Rows[i]["path"].ToString();
      if (url == "") { url = "/newsdetail/" + id; }
      
      %>
     
       <div class="col-sm-4 col-md-4 col-mm-6 case_img">
                                <div class="col-md-3 col-mm-12">
                                    <a href="<%=url %>">
                                        <img src="images/c<%=i+1 %>.png" />
                                    </a>
                                </div>
                                <div class="col-md-9 col-mm-12">
                                    <a href="<%=url %>">
                                        <p class="case_title"><%=bp.SubString(title,20) %></p>
                                    </a>
                                    <p class="case_desc"><%=bp.SubString(keycontent,35)%></p>
                                </div>
                            </div>
      <%} %>


                         
                            <a href="<%=mc.ShowColumnKeyById(6,"ColumnUrlClient") %>" class="btn btn-info" role="button">VIEW ALL</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="padding: 20px 0; background-color: #eee;">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="product_index">
                        <div class="product_head" data-move-y="-40px">
                            <h2>
                                <%=mc.ShowColumnName(7) %></h2>
                            <p><%=mc.ShowColumnSubName(7) %></p>
                        </div>
                        <div class="product_list">


                        <%showNews(7,8); %>
                          <%for (int i = 0; i < intNews; i++)
  {
      string title = dtblNews.Rows[i]["title"].ToString();
      string keycontent = dtblNews.Rows[i]["keycontent"].ToString();
      string id = dtblNews.Rows[i]["id"].ToString();
      string url = dtblNews.Rows[i]["url"].ToString();
      string path = dtblNews.Rows[i]["path"].ToString();
      if (url == "") { url = "/newsdetail/" + id; }
      %>
       <div class="col-sm-4 col-md-3 col-mm-6 product_img" data-move-y="220px">
                                <div class="allim">
                                    <a href="<%=url %>">
                                        <img src="/<%=path %>"></a><p class="product_title">
                                            <a href="<%=url %>"><%=bp.SubString(title,18) %></a></p>
                                    <a href="<%=url %>" class="mdetails">details</a><a href="<%=url %>" class="menquiry">enquiry</a></div>
                            </div>
      <%} %>

                             
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="padding: 20px 0;">
        <div class="about_index">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="about_head" data-move-y="-30px">
                            <h2>
                               <%=mc.ShowColumnName(4) %></h2>
                        </div>
                        <div class="about_content" data-move-y="50px">
                            <div class="col-xs-12 col-sm-12 col-md-5">
                                <img class="about_img" align="left" src="/<%=mc.SelectPicByClassID(8) %>"></div>
                            <div class="col-xs-12 col-sm-12 col-md-7">
                                <p class="about_contents">
                                    <%=mc.ShowColumnKeyById(4,"Remarks") %></p>
                                <a href=" <%=mc.ShowColumnKeyById(4,"ColumnUrlClient") %>" class="btn btn-info" role="button">VIEW ALL</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="padding: 10px 0;">
        <div id="nam1" style="background-image: url(images/bg1.jpg); background-size: cover;
            background-attachment: fixed;">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <h2 style="text-align: center; color: white; padding: 20px 0 50px 0; font-size: 40px;">
                            <%=mc.ShowColumnName(8) %></h2>
                        <div class="va fla3">
                         <%showNews(8,4); %>
                         <%string[] ArrayClass = new string[] { " fa-building-o", "fa-users", "fa-user-secret", "fa-usd" }; %>
                          <%for (int i = 0; i < intNews; i++)
  {
      string title = dtblNews.Rows[i]["title"].ToString();
      string keycontent = dtblNews.Rows[i]["keycontent"].ToString();
      string id = dtblNews.Rows[i]["id"].ToString();  
      %>
        <div class="aa">
                                <div class="i1">
                                    <i class="fa <%=ArrayClass[i] %>" aria-hidden="true" style="color: #fff; font-size: 50px;">
                                    </i>
                                </div>
                                <div class="value<%=i>0?(i+1).ToString():"" %>">
                                    <%=title%></div>
                                <div class="na">
                                   <%=keycontent %></div>
                            </div>
      <%} %>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="news_box">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="news_head" data-move-y="-50px">
                        <h2><%=mc.ShowColumnName(2) %></h2>
                        <p><%=mc.ShowColumnSubName(2) %></p>
                    </div>
                    <div class="col-sm-4 col-md-4 col-mm-6 news_img" id="nam1" style="background-image: url(/<%=mc.SelectPicByClassID(10) %>);">
                    </div>
                    <div class="col-sm-12 col-md-8 col-mm-12">
                        <ul class="news_index" data-move-y="200px">
                        <%showNews(2,4); %>
                         <% for (int i = 0; i < intNews; i++)
   {
       string title = dtblNews.Rows[i]["title"].ToString();
       string url = dtblNews.Rows[i]["url"].ToString();
       string keycontent = dtblNews.Rows[i]["keycontent"].ToString();
       string id = dtblNews.Rows[i]["id"].ToString();
       if (url == "") { url = "/newsdetail/" + id; }

       DateTime dt = DateTime.Parse(dtblNews.Rows[i]["putdate"].ToString());
                                
            %>
            <!-- <li><a href="<%=url %>">
                <%=bp.SubString(title,30)%></a></li> -->

                  <li><span><strong><%=dt.ToString("dd") %></strong><i><%=dt.ToString("yyyy-MM") %></i></span><a href="<%=url %>"> <%=bp.SubString(title,30) %></a><br>
                                <em><%=keycontent %></em></li>
            <%} %>

                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tags_box">
        <div class="container">
            <span class="tags_title"><a href="https://web.soonidea.com/w83/tags/index.html" role="button">
                <%=mc.ShowColumnName(9) %></a></span>
            <button id="tags_btn" class="glyphicon glyphicon-plus" aria-hidden="true">
            </button>
            <span class="tags_rows">
          <%showNews(9,4); %>
                         <% for (int i = 0; i < intNews; i++)
                            {
                                string title = dtblNews.Rows[i]["title"].ToString();
                                string url = dtblNews.Rows[i]["url"].ToString();
                                string keycontent = dtblNews.Rows[i]["keycontent"].ToString();
                                string id = dtblNews.Rows[i]["id"].ToString();
                                if (url == "") { url = "/newsdetail/" + id; }

                                DateTime dt = DateTime.Parse(dtblNews.Rows[i]["putdate"].ToString());
                                
            %>
             <a href="<%=url %>"
                role="button"><%=title %></a> 
            <%} %>
             </span>
        </div>
    </div>
    <script src="js/count.js"></script>
    <script type="text/javascript">

    <%showNews(8,4); %> 
                          <%for (int i = 0; i < intNews; i++)
  {
      string title = dtblNews.Rows[i]["title"].ToString();
      string keycontent = dtblNews.Rows[i]["keycontent"].ToString();
      string id = dtblNews.Rows[i]["id"].ToString();  
      %>

        $(".value<%=i>0?(i+1).ToString():"" %>").numberRock({
            speed: 10,
            count: <%=title %>
        })

      <%} %>

//        $(".value").numberRock({
//            speed: 1,
//            count: 10
//        })
//        $(".value2").numberRock({
//            speed: 10,
//            count: 80
//        })
//        $(".value3").numberRock({
//            speed: 20,
//            count: 200
//        })

//        $(".value4").numberRock({
//            speed: 100,
//            count: 30000000
//        })
    </script>
    <script src="js/jquery.smoove.min.js"></script>
    <script>        $('.product_head,.product_img,.advantage_head,.advantage_col,.about_head,.about_content,.case_head,.news_head,.news_index').smoove({ offset: '10%' });</script>
    <nav class="navbar navbar-default navbar-fixed-bottom footer_nav">
<div class="foot_nav btn-group dropup">
<a class="dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#"><span class="glyphicon glyphicon-share btn-lg" aria-hidden="true"></span>Share</a>  
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
<div class="foot_nav"><a href="tel:+8613798362158"><span class="glyphicon glyphicon-phone btn-lg" aria-hidden="true"></span>Call</a></div>
<div class="foot_nav"><a id="gotocate" href="#"><span class="glyphicon glyphicon-th-list btn-lg" aria-hidden="true"></span>Menu</a></div>
<div class="foot_nav"><a id="gototop" href="#"><span class="glyphicon glyphicon-circle-arrow-up btn-lg" aria-hidden="true"></span>Top</a></div>
</nav>
    <script language="javaScript">
        function CheckJob1() {
            if (document.form1.email.value == "") { alert("Please enter the email number？"); document.form1.email.focus(); return false; }
            return true;
        }
    </script>
    <ucFootControl:FootControl runat="server" ID="FootControl" />
   <script>
       $(".navbar-toggle").click(function () {
           $("#navbar").toggle();
       });
   </script>
</body>
</html>
