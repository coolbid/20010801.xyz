<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Foot.ascx.cs" Inherits="Foot" %>
<%if (intQQ > 0)
  {%>
<link rel="stylesheet" type="text/css" href="/CSS/default_blue.css" />
<script type="text/javascript" src="/js/jquery.Sonline.js"></script>
<script type="text/javascript">
    $(function () {
        $("body").Sonline({
            Position: "right", //left或right
            Top: 200, //顶部距离，默认200px
            Effect: true, //滚动或者固定两种方式，布尔值：true或false
            DefaultsOpen: true, //默认展开：true,默认收缩：false
            Qqlist: "<%=strQQList %>" //多个QQ用','隔开，QQ和客服名用'|'隔开
        });
    })	
</script>
<%} %>
 



 <link rel="stylesheet" type="text/css" href="/css/eonline1.css" />
<div id="service">
	<div id="ser_main">
		<a rel="nofollow" id="floatShow1" href="javascript:void(0);" title="Open">&nbsp;</a> 
	</div>
	
	<div id="online">
		<div class="onlineMenu">
       		<ul> 
            	<li class="online_title"><i class="fa fa-comments-o" style="font-size:30px; margin-right:5px;" aria-hidden="true"></i>online service</li>
 
 <%showNews(28,2); %>
 <%for (int i = 0; i < intNews; i++)
   {
       string title = dtblNews.Rows[i]["title"].ToString();
       %>
       <li class="call"> 
				 			<div class="msggroup">
				 				<a href="skype:<%=title %>?chat" title="kevin"><i class="fa fa-skype" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp; <%=title%></a>
				 			</div>
				 		</li>
       <% 
   } %> 			 
                <li class="call">
                	<a rel="nofollow" title="13798362158" href="https://api.whatsapp.com/send?phone=13798362158">
                		<i class="fa fa-whatsapp" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<%=mc.ShowWebsiteKeyById(1,"Mobile") %>                	</a>
                </li>  
                <li class="call">
                	<a rel="nofollow" title="coolbid@live.cn" href="coolbid@live.cn">
                		<i class="fa fa-envelope-o" aria-hidden="true"></i> &nbsp;&nbsp;&nbsp;<%=mc.ShowWebsiteKeyById(1,"Email") %>               	</a>
                </li>
                 
                
                <li class="call">
                	<div class="qrcodePanel">
                		<p><i class="fa fa-weixin" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;ZALO</p>
                		<img style="width:180px;height:180px;" src="/<%=mc.SelectPicByClassID(7) %>"> 
                	</div>                                                                          
                </li>
              
       		</ul>
		</div>
	</div>
</div>

<div class="goTop">
    <!-- <a rel="nofollow"  class="totop" style="display: inline;"></a> -->

</div>

    <script type="text/javascript" src="js/online1.js"></script>


                
<footer>
<div class="footer container">
<div class="row">					
<!-- 第一排 -->
<div class="col-md-3 col-sm-6">
<div class="mm" >
<h2><%=mc.ShowColumnName(1)%></h2>
<i class="decor-brand decor-brand_footer"><img src="/images/decor-brand-red.png" /></i>                                                           
<div class="vv">     
<div >
<div class="links">
<%showNews(1,10); %>

<%for (int i = 0; i < intNews; i++)
  {
      string title = dtblNews.Rows[i]["title"].ToString();
      string id = dtblNews.Rows[i]["id"].ToString();
      string url = dtblNews.Rows[i]["url"].ToString();
      if (url == "") { url = "/newsdetail/" + id; }
      %>
      <p><i class="fa fa-paperclip" aria-hidden="true"></i><a href="<%=url %>"><%=title %></a></p>
      <% 
  } %>
   
</span>
</div>
</div>						
</div>
</div>
</div>
					
<!-- 第二排 -->
<div class="col-md-3 col-sm-6 ">
<div class="mm">
<h2>Subscribe</h2>
<i class="decor-brand decor-brand_footer"><img src="/images/decor-brand-red.png" /></i>
<div >
<h4 ><span class="f-h4-span">By subscribing to our mailing list you will be updated with the latest news from us.<br/>Fill in your e-mail:</span></h4>
<form id="form1" name="form1" class="form-horizontal" method="post" action="_https://web.soonidea.com/w83/?m=Feedback&a=check2&g=e" onSubmit="return CheckJob1()">
<div><input type="email" name="email" class="form-control" id="inputEmail" style="background-color:#f1f1f1;border-radius:5px;" placeholder="Enter your email address…" ></div>
<div><label for="code">Captcha: </label>
<div ><input type="text" name="code" class="form-control" id="code" style="background-color:#f1f1f1;border-radius:5px;"></div>
<div style="padding-left:20px;"><img class="codeimg" src="https://web.soonidea.com/w83/common/verify.html" onclick='this.src=this.src+"?"+Math.random()'/></div>
</div>												 
<div  class="butt"><button class="btn btn-danger page-btn" type="submit" name="button" value="Send" >Send</button>&nbsp; </div>                        
</form>                           
</div>
</div>
</div>

<!--   第三排 -->				    
<div class="col-md-3 col-sm-6 ">
<div id="nam1" class="mm">
<h2>Contact Us</h2>
<i class="decor-brand decor-brand_footer"><img src="/images/decor-brand-red.png" /></i>
<div  class="countt">
<ul class="list-unstyled mbn">
<%=strContact %>
<%=strPhone %>
<%=strMobile %>
<%=strEmail %>
<%=strAddress %>
</ul>		
</div>
</div>
</div>					
					
<!-- 第四排 -->
<div class="col-md-3 col-sm-6" >
<div  id="nam1" class="mm">
<h2>QR Code for mobile</h2>                            
<i class="decor-brand decor-brand_footer"><img src="/images/decor-brand-red.png" /></i>	                  
<div class="footer-block"><img style="width:150px;height:150px;" class="foot-img" src="/images/ewm.jpg"></div>				
</div>
</div>								
</div>
	
<div class="footer-bar">
<p style="text-align:center; margin-top:0px;">CopyRight 2026-<script type="text/javascript">                                                                 var myDate = new Date(); document.write(myDate.getFullYear());</script> 
<%=strCompanyName %> All Right Reserved.&nbsp;  <%=strICP%>

            <%if (strStateManage == "1")
              {%>
            <a href="qzkeyadmin/login.aspx">管理入口</a>&nbsp;&nbsp;
            <%} %>
            <%if (strSupportState == "1")
              {%>
            Technical support：<a href="<%=strWebSite %>" title="<%=strTitle %>" target="_blank"><%=strSupportName %></a>
            <a href="http://www.hafei-group.cn/sitemap.xml">.</a>
            <%} %>
            <%if (strState == "1")
              {%>
            <object data="<%=strPath %>" type="application/x-mplayer2" width="0" height="0">
                <param name="src" value="<%=strPath %>" />
                <param name="autostart" value="1" />
                <param name="loop" value="-1" />
                <param name="playcount" value="infinite" />
            </object>
            <%} %> </p>
</div>	
</div>
</footer>
<!--客服面板-->
<%--<link rel="stylesheet" type="text/css" href="/css/eonline.css" />
<div id="cmsFloatPanel">
<div class="ctrolPanel">
<a class="service" href="#"></a>
<a class="message" href="#"></a>
<a class="qrcode" href="#"></a>
<a class="arrow" title="Top" href="#"></a>
</div>

<div class="servicePanel">
<div class="servicePanel-inner">
<div class="serviceMsgPanel">
<div class="serviceMsgPanel-hd"><a href="#"><span>关闭</span></a></div>
<div class="serviceMsgPanel-bd">
<!--在线QQ-->
<!--在线SKYPE--> 

<div class="msggroup"><a href="skype:kevin?chat"><img  class="qqimg" src="/images/skype.gif" alt="SKYPE在线客服"> kevin</a></div>
<div class="msggroup"><a href="skype:nancy?chat"><img  class="qqimg" src="/images/skype.gif" alt="SKYPE在线客服"> nancy</a></div>
</div>
<div class="serviceMsgPanel-ft"></div>
</div>
<div class="arrowPanel">
<div class="arrow02"></div>
</div>
</div>
</div>

<div class="messagePanel">
<div class="messagePanel-inner">
<div class="formPanel">
<div class="formPanel-bd">
<!-- AddToAny BEGIN -->
<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
<a class="a2a_dd" href="https://www.addtoany.com/share_save"></a>
<a class="a2a_button_facebook"></a>
<a class="a2a_button_twitter"></a>
<a class="a2a_button_google_plus"></a>
<a class="a2a_button_linkedin"></a>
</div>
<!-- AddToAny END -->
<a type="button" class="btn btn-default btn-xs" href="#" style="margin: -20px 0px 0px 8px;">close</a>
</div>
</div>

<div class="arrowPanel">
<div class="arrow01"></div>
<div class="arrow02"></div>
</div>
</div>
</div>

<div class="qrcodePanel">
<div class="qrcodePanel-inner">
<div class="codePanel">
<div class="codePanel-hd"><span style="float:left">Scan the qr code</span><a href="#"><span>Close</span></a></div>
<div class="codePanel-bd"><img src="/<%=mc.SelectPicByClassID(7) %>" alt="the qr code"/></div>
</div>
<div class="arrowPanel">
<div class="arrow01"></div>
<div class="arrow02"></div>
</div>
</div>
</div>
</div>
<script type="text/javascript" src="/js/online.js"></script>--%>
<%if (strCodeState == "1") { Response.Write(strContent ); }%>
