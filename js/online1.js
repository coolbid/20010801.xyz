
 function goTop(min_height) {
    $(".goTop").click(
        function() {
            $('html,body').animate({
                scrollTop: 0
            }, 700);
        });
    //获取页面的最小高度，无传入值则默认为600像素
    min_height=min_height?min_height:400;
    //为窗口的scroll事件绑定处理函数
    $(window).scroll(function() {
        //获取窗口的滚动条的垂直位置
        var s = $(window).scrollTop();
        //当窗口的滚动条的垂直位置大于页面的最小高度时，让返回顶部元素渐现，否则渐隐
        if (s > min_height) {
            $(".goTop").fadeIn(100);
        } else {
            $(".goTop").fadeOut(200);
        }
    });
}
 
 
$(function() {
    goTop();
});




 function pageScroll(){ 
//把内容滚动指定的像素数（第一个参数是向右滚动的像素数，第二个参数是向下滚动的像素数） 
window.scrollBy(0,-100); 
//延时递归调用，模拟滚动向上效果 
scrolldelay = setTimeout('pageScroll()',100); 
//获取scrollTop值，声明了DTD的标准网页取document.documentElement.scrollTop，否则取document.body.scrollTop；因为二者只有一个会生效，另一个就恒为0，所以取和值可以得到网页的真正的scrollTop值 
var sTop=document.documentElement.scrollTop+document.body.scrollTop; 
//判断当页面到达顶部，取消延时代码（否则页面滚动到顶部会无法再向下正常浏览页面） 
if(sTop==0) clearTimeout(scrolldelay); 
} 


  $(function(){

        // cms客服浮动面板
        if($("#cmsFloatPanel")){
	  $("#cmsFloatPanel > .ctrolPanel > a.totop").click(function(){$("html,body").animate({scrollTop :0}, 800);return false;});
	  var objServicePanel = $("#cmsFloatPanel > .servicePanel");
	  var objMessagePanel = $("#cmsFloatPanel > .messagePanel");
	  var objQrcodePanel = $("#cmsFloatPanel > .qrcodePanel");
	  var w_s = objServicePanel.outerWidth();
	  var w_m = objMessagePanel.outerWidth();
	  var w_q = objQrcodePanel.outerWidth();
	  $("#cmsFloatPanel .ctrolPanel > a.service").bind({
		  click : function(){return false;},
		  mouseover : function(){
			  objMessagePanel.stop().hide();objQrcodePanel.stop().hide();
			  if(objServicePanel.css("display") == "none"){
			     objServicePanel.css("width","0px").show();
			     objServicePanel.animate({"width" : w_s + "px"},600);
			  }
			  return false;
		  }
	  });
	  $(".servicePanel-inner > .serviceMsgPanel > .serviceMsgPanel-hd > a",objServicePanel).bind({
		  click : function(){
			  objServicePanel.animate({"width" : "0px"},600,function(){
				objServicePanel.hide();  
			  });
			  return false;
		  }
	  });
	  $("#cmsFloatPanel > .ctrolPanel > a.message").bind({
		  click : function(){return false;},
		  mouseover : function(){
			  objServicePanel.stop().hide();objQrcodePanel.stop().hide();
			  if(objMessagePanel.css("display") == "none"){
			     objMessagePanel.css("width","0px").show();
			     objMessagePanel.animate({"width" : w_m + "px"},600);
			  }
			  return false;
		  }
	  });
	  $(".messagePanel-inner > .formPanel > .formPanel-bd > a",objMessagePanel).bind({
		  click : function(){
			  objMessagePanel.animate({"width" : "0px"},600,function(){
				objMessagePanel.stop().hide();  
			  });
			  return false;
		  }
	  });
	  $("#cmsFloatPanel > .ctrolPanel > a.qrcode").bind({
		  click : function(){return false;},
		  mouseover : function(){
			  objServicePanel.stop().hide();objMessagePanel.stop().hide();
			  if(objQrcodePanel.css("display") == "none"){
			     objQrcodePanel.css("width","0px").show();
			     objQrcodePanel.animate({"width" : w_q + "px"},600);
			  }
			  return false;
		  }
	  });
	  $(".qrcodePanel-inner > .codePanel > .codePanel-hd > a",objQrcodePanel).bind({
		  click : function(){
			  objQrcodePanel.animate({"width" : "0px"},600,function(){
				objQrcodePanel.stop().hide();  
			  });
			  return false;
		  }
	  });

        }
        
    });
	