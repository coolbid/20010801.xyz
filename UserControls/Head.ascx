<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Head.ascx.cs" Inherits="Head" %><script type="text/javascript" src="https://tyw.key.400301.com/js/replace_word_limit.js"></script>
 
<script type="text/javascript" language="javascript">
    //①搜索开始
    function checkSearch() {
        if ($("#KeyName").val() == "" || $("#KeyName").val() == null) {
            alert("请输入搜索关键词");
            $("#KeyName").val("");
            $("#KeyName").focus();
            return false;
        }
        var Search_url = $("#key-Search").val();
        window.location.href = Search_url + "?q=" + escape($("#KeyName").val());
    }

    //②按下回车键出发某个按钮开始
    document.onkeydown = function (event) {
        e = event ? event : (window.event ? window.event : null);
        if (e.keyCode == 13) {
            document.getElementById("SearchButton").click();
            return false;
        }
    }

    //③加入收藏js代码开始
    function AddFavorite(sURL, sTitle) {
        try {
            window.external.addFavorite(sURL, sTitle);
        }
        catch (e) {
            try {
                window.sidebar.addPanel(sTitle, sURL, "");
            }
            catch (e) {
                alert("您使用的浏览器不支持此功能，请按“Ctrl+D”键手工加入收藏");
            }
        }
    }
</script>
<!--④设置网站背景开始-->
<%=str_Bg%>
<!--④结束-->

<header>
<link type="text/css" rel="stylesheet" href="/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="/css/ionicons.min.css"/>
<link type="text/css" rel="stylesheet" href="/css/font-style.css"/>
<div class="top_menu">
<div class="container">
<span class="top_name">Welcome: <%=strCompanyName %></span>
<div class="top_lang">
<p class="nav_icons">                            
<a href="https://www.facebook.com/High-speed-wire-rod-rolling-mill-109275977468385/" target="_blank" ><i class="fa fa-facebook"></i></a>
<a href="https://twitter.com/hafeiindustry" target="_blank" ><i class="fa fa-twitter"></i></a>
<!--<a href="http://web.soonidea.com/w83" target="_blank" ><i class="fa fa-google-plus" ></i></a> -->					
<a href="https://www.linkedin.com/company/sunshinehafei" target="_blank"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
<a href="https://www.instagram.com/challenge/?next=/eric.duan.18" target="_blank" ><i class="fa fa-instagram" ></i></a>
<a href="https://www.youtube.com/channel/UC3niJCmeQp5GqVS4Et7A9zA" target="_blank"><i class="fa fa-youtube"></i></a>
<span><a href="/message/25" class="quote">Get a Free Quote</a></span>
</p>
</div>
</div>
</div>
<div class="container">
<div class="row">
<div class="col-xs-12 col-sm-8 col-md-8"><a href="<%=mc.SelectPicKeyByClassID(1,"Url") %>"><img src="/<%=mc.SelectPicByClassID(1) %>" class="logo"/><img src="/<%=mc.SelectPicByClassID(9) %>" class="logo"/></a></div>
<div id="topsearch" class="col-xs-12 col-sm-4 col-md-4">
 
<div class="input-group search_group">
<input type="text" name="name" class="form-control input-sm" placeholder="Product search" id="KeyName" />
<span class="input-group-btn"><span id="submit_search" onclick="checkSearch();return false;" title="Product search" class="glyphicon glyphicon-search btn-lg" aria-hidden="true"></span></span>
</div>
 
</div>
</div>
</div>
<!-- Fixed navbar -->
<nav id="top_nav" class="navbar navbar-default navbar-static-top">
<div class="container">
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<span id="small_search" class="glyphicon glyphicon-search" aria-hidden="true"></span>
<a class="navbar-brand" href="#">NAVIGATION</a>
</div>
<div id="navbar" class="navbar-collapse collapse">
<ul class="nav navbar-nav  navbar-nav-e">




<%for (int i = 0; i < intMenu; i++)
  {
      string Id = dstMenu.Tables[0].Rows[i]["Id"].ToString();
      string ColumnUrlClient = dstMenu.Tables[0].Rows[i]["ColumnUrlClient"].ToString();
      string ColumnStaticPage = dstMenu.Tables[0].Rows[i]["ColumnStaticPage"].ToString();
      string StaticPage = dstMenu.Tables[0].Rows[i]["StaticPage"].ToString();
      string ColumnName = dstMenu.Tables[0].Rows[i]["ColumnName"].ToString();
      showMenuSub(Int32.Parse(Id));
      string sClass = "class=\"menu_down\"";
      if (intMenuSub == 0)
      {
          sClass = null;
      }
        %>
    
    <%if (intMenuSub > 0)
      { 
      %>
         <li class=" dropdown"><a href="<%=returnUrl(ColumnUrlClient,ColumnStaticPage,StaticPage) %>"><%=ColumnName %></a>
<a href="#" id="app_menudown" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-menu-down btn-xs"></span></a>
<ul class="dropdown-menu nav_small" role="menu">


<%for (int j = 0; j < intMenuSub; j++)
  {

      string ColumnUrlClient2 = dstMenuSub.Tables[0].Rows[j]["ColumnUrlClient"].ToString();
      string ColumnStaticPage2 = dstMenuSub.Tables[0].Rows[j]["ColumnStaticPage"].ToString();
      string StaticPage2 = dstMenuSub.Tables[0].Rows[j]["StaticPage"].ToString();
      string ColumnName2 = dstMenuSub.Tables[0].Rows[j]["ColumnName"].ToString();
                    %>
                    <li><a href="<%=ColumnUrlClient2 %>"><%=ColumnName2 %></a></li>
                    <%} %> 
</ul>
</li>
      <%
          }
      else
      {%>
            <li><a href="<%=ColumnUrlClient %>"><%=ColumnName %></a></li>
            <%} %>
          
            <%
                }
            %> 
</ul>
</div><!--/.nav-collapse -->
</div>
</nav>
</header>
