<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProDetail.aspx.cs" Inherits="ProDetail" %>

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

    <script src="/js/Validator-2.0.1.js" type="text/javascript"></script>
    <script src="/js/simpleAlert.js" type="text/javascript"></script>
    <link href="/js/simpleAlert.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
  <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <link href="/css/lightbox.css" rel="stylesheet">
    <script src="/js/lightbox.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.showpic_flash').bxSlider({
              pagerCustom: '#pic-page',
               adaptiveHeight: true,
            });

        });
    </script>
     <SCRIPT language=javaScript>
         function CheckJob() {
             if (document.myform.product.value.length == "") {
                 alert("Please enter the product name!");
                 document.myform.product.focus();
                 return false;
             }

             if (document.myform.tel.value.length == "") {
                 alert("Please enter your tel!");
                 document.myform.tel.focus();
                 return false;
             }
             if (document.myform.email.value.length == "") {
                 alert("Please enter your email!");
                 document.myform.email.focus();
                 return false;
             }

         }
</SCRIPT>
</head>
<body id="product">
  
 <ucHeadControl:HeadControl id="HeadControl" runat="server" />
    <ucLinkControl:LinkControl id="LinkControl" runat="server" />
<!-- main -->
<div class="container">    
<div class="row">
<div class="path_bg"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;<a href="/">Home</a>&nbsp;>&nbsp;<a href="#"> PRODUCT </a>&nbsp;>&nbsp;<a href="#"> <%=strProName %> </a> </div>
<!-- right -->
<div class="col-xs-12 col-sm-8 col-md-9" style="float:right">
<div class="list_box">
<h2 class="left_h"><%=strProName %></h2>
<!-- showpic -->
<%if(ConImg!=null)
  { %>
<div class="col-sm-12 col-md-6 showpic_box">
<ul class="showpic_flash">
 
  <%for (int i = 0; i < ConImg.Length; i++)
    {
        %>
        <li><a class="example-image-link" href="<%=ConImg[i] %>" data-lightbox="example-set" target="_blank"><img class="example-image" src="<%=ConImg[i] %>"></a></li>
        <% 
    } %>
 
</ul>  
<div id="pic-page">
<%for (int i = 0; i < ConImg.Length; i++)
    {
        %>
      
<a data-slide-index="<%=i %>" href="<%=ConImg[i] %>"><img src="<%=ConImg[i] %>"/></a>
        <% 
    } %>  
</div>
</div>  
  <%} %> 
                               
<!-- product_info -->
<div class="col-sm-12 col-md-6 proinfo_box">
<h1 class="product_h1"><%=strProName %></h1>
<ul class="product_info">
<%=strProKey %>
<li>
<form id="orderform" method="post" action="/w83/Inquiry/">
<a href="#content" class="btn btn-primary page-btn"><span class="fa fa-caret-right" aria-hidden="true"></span> INQUIRY</a>&nbsp;&nbsp;
<a href="mailto:<%=mc.ShowWebsiteKeyById(1,"Email") %>" class="btn btn-primary page-btn"><span class="fa fa-caret-right" aria-hidden="true"></span> EMAIL</a>
</form>
</li>
</ul>
</div>

<div class="product_con"><%=strProDescription %></div>

<div class="point">
<span class="to_prev col-xs-12 col-sm-6 col-md-6">PREVIOUS:<a href="<%=strNextUrl %>"><%=strNext %></a></span>
<span class="to_next col-xs-12 col-sm-6 col-md-6">Next:<a href="<%=strPreviousUrl %>"><%=strPrevious %></a></span>
</div>
</div>
                    
<div id="content" class="list_box">
<div class="pr"><span>Inquiry:</span></div>
<div class="feedback">
<form id="myform" onsubmit="return false;"  >
<div class="form-group">
<div class="col-sm-12"><label for="products">Product name&nbsp;<em style="color:red;">* </em>&nbsp;: </label></div>
<div class="col-sm-12"><input type="text" name="product" ty-data="VeriNotNull" ty-title="Product name"   value="<%=strProName %>" class="form-control" id="products" placeholder="Required"></div>
</div>
<div class="form-group">
<div class="col-sm-12"> <label for="tel" class="control-label">Phone&nbsp;<em style="color:red;">* </em>&nbsp;: </label></div>
<div class="col-sm-12"><input type="text" name="tel"  ty-data="VeriNotNull" ty-title="Phone" i class="form-control" id="tel" placeholder="Required"></div>
</div>
<div class="form-group">
<div class="col-sm-12">  <label for="inputEmail" >E-mail&nbsp;<em style="color:red;">* </em>&nbsp;: </label></div>
<div class="col-sm-12"><input type="email" name="email"  ty-data="VeriNotNull" ty-title="E-mail" i  class="form-control" id="inputEmail" placeholder="Required"></div>
</div>
<div class="form-group">
<div class="col-sm-12">  <label for="contents" class="control-label">Message:  </label></div>
<div class="col-sm-12"><textarea name="contents"  ty-data="VeriNotNull" ty-title="Message" id="content"  class="form-control" rows="6"></textarea></div>
</div>
<div class="form-group">
<div class="col-sm-12">   <label for="code" class="control-label">Captcha: </label> 

  <img id="Image1" align="absmiddle" onclick="this.src='/Check/Code.aspx?' + Math.random()"
                                    alt="点击刷新" src="/Check/Code.aspx" style="padding:5px 2px;" />
 </div>
<div class="col-sm-12"><input type="text" name="code" class="form-control" id="code"  ty-data="VeriNotNull" ty-title="Captcha" id="txtTitle" /></div>
</div>
<div class="form-group" style="margin-top:20px;">
<div class="col-sm-12"><button type="button"    ty-event="checkNull();" name="button" value="send" class="send TyBtnSubmit">Send</button>&nbsp;<button type="reset" name="reset" class="reset">Reset</button></div>
</div>
</form>
<script>
    function checkNull() {
        var pro = $("#products").val().trim();
        var tel = $("#tel").val().trim();
        var email = $("#inputEmail").val().trim();
        var content = $("#content").val().trim();
        var code = $("#code").val().trim();

        $.ajax({
            type: "get",
            url: "/Check/CheckMessage2.aspx?products=" + escape(pro) + "&tel=" + escape(tel) + "&email=" + escape(email) + "&Email=" + escape(email) + "&Content=" + escape(content) + "&Code=" + escape(code),
            success: function (msg) {
                if (msg == "success") { 
                    tijiao("Success", "��ϲ�㣬�ύ�ɹ���");
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                }
               
               
                else if (msg == "false") { 
                    tijiao("Error", "��֤�����");
                }
                else {
                   
                    tijiao("Error", "���ź����ύʧ�ܣ�");
                }
            }
        });

    }
</script>
</div>
</div> 
                    
                    
<div class="list_related"> 
<h2 class="left_h2">Related Products</h2>
<div class="product_list related_list">
  <%for (int i = 0; i < intPro; i++)
    {
        string title = dtPro.Rows[i]["proname"].ToString();
        string id = dtPro.Rows[i]["proid"].ToString(); 
        string path = dtPro.Rows[i]["propath"].ToString(); 
      %>
      <div class="col-sm-4 col-md-3 col-mm-6 product_img"><a href="/prodetail/<%=id %>">
      <img src="/<%=path %>" class="opacity_img img-thumbnail"></a><p class="product_title"><a href="/prodetail/<%=id %>">
      <%=bp.SubString(title,40)%></a></p></div>

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
    <div class="foot_nav"><a href="tel:18606201315"><span class="glyphicon glyphicon-phone btn-lg" aria-hidden="true"></span>Call</a></div>
    <div class="foot_nav"><a id="gotocate" href="#"><span class="glyphicon glyphicon-th-list btn-lg" aria-hidden="true"></span>Menu</a></div>
    <div class="foot_nav"><a id="gototop" href="#"><span class="glyphicon glyphicon-circle-arrow-up btn-lg" aria-hidden="true"></span>Top</a></div>
</nav>

<SCRIPT language=javaScript>
    function CheckJob1() {
        if (document.form1.email.value == "") { alert("Please enter the email number��"); document.form1.email.focus(); return false; }
        return true;
    }
</SCRIPT>


    <ucFootControl:FootControl id="FootControl" runat="server" />
</body>
</html>
