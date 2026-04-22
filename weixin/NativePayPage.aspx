<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NativePayPage.aspx.cs" Inherits="NativePayPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html;image/gif;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>微信扫码支付</title>
    <script type="text/javascript" src="/js/jquery-1.6.min.js"></script>
    <link href="/css/wxsm/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .wei { width: 1000px; margin: 0 auto; background: #fff; margin-top: 20px; border-left: #f4f4f4 solid 1px; border-right: #f4f4f4 solid 1px; border-bottom: #f4f4f4 solid 1px; box-shadow: 0px 5px 10px #ddd;text-align: center; }
        .wei h2 { height: 60px; line-height: 60px; padding: 0 50px; color: #333; background: url(/images/wei_05.png) 50px center no-repeat; border-top: #c00 solid 5px; font-size: 24px; font-family: "Microsoft Yahei"; font-weight: normal; }
        .wei .a { height: 500px; overflow: hidden; }
        .wei .b { height: 60px; margin: 0 50px; line-height: 60px; padding-left: 20px; background: url(/images/wei_04.png) 0 center no-repeat; }
        .wei .b a { color: #2EA7E7; font-size: 14px; font-weight: bold; }
        .wei .left { width: 247px; text-align:center; overflow: hidden; padding-top: 55px; margin:0 auto; }
        .wei .left .a1 { padding: 5px; border: #ddd solid 1px; }
        .wei .left .a1 img { height: 235px; width: 235px; }
        .wei .left .a2 { height: 40px; padding: 10px 0; background: url(/images/wei_03.png) #FF7674 50px center no-repeat; line-height: 20px; font-size: 14px; font-weight: bold; color: #fff;  margin-top: 20px; }
        .wei .right { width: 500px; height: 500px; float: right; background: url(/images/wei_01.png) 0 25px no-repeat; }
        .wx_xq { border: #ddd solid 1px; font-size: 14px; padding: 10px; line-height: 24px; color: #666; width: 980px; margin: 0 auto; }
        .wx_xq span { color: #f60; font-weight: bold; }
        .wx_xq a { color: #2EA7E7; font-size: 14px; font-weight: bold; }
        .wei .c { text-align: center; font-size: 14px; color: #999; padding: 80px 0; }
    </style>
    <script type="text/javascript">
        var seconds;
        var objTimer;
        var timerOrderState;

        $(window).load(function ()
        {
            if ($("#zhifustate").val() == "未付款")
            {
                timerOrderState = setInterval(QueryOrderState, 3000);
            }
        })

        //获取付款状态
        function QueryOrderState()
        {
            //获取微信二维码
            $.ajax({
                type: "get",
                async: true,  // 设置同步方式  ********
                url: "GetState.aspx?OrderId=<%=OrderId%>",
                datatype: "json",
                success: function (msg)
                {
                    if (msg == "1")
                    {
                        window.clearInterval(timerOrderState);
                        window.clearInterval(objTimer);
                        window.location.href = '/notify_url.aspx';
                    }
                }
            });
        }
    </script>
</head>
<body>
    <div class="top_2" style="width: 1000px; margin: 0 auto;">
        <div class="top_2_left">
           
        </div>
        <div class="top_2_right">
        </div>
    </div>
    <div class="wx_xq">
        你要支付的订单号：<span><%=OrderId%></span>，金额：￥<span><%=Price%></span>元<br />
        你选择的支付方式是：<span>微信扫码支付</span>，请用微信扫描下面二维码进行付款。
    </div>
    <div class="wei">
        <input type="hidden" id="zhifustate" value="0" runat="server">
        <h2>
            微信扫码支付</h2>
        <%if (zhifuState == "未付款")
          {
        %>
        <div class="a">
            <div class="left">
                <div class="a1">
                    <img src="<%=ImgUrl %>" />
                </div>
                <div class="a2">
                    请使用微信扫一扫<br />
                    扫描二维码支付</div>
            </div>

            <div class="right">
            </div>
        </div>
        <%
          }
          else
          { 
        %>
        <div class="c">
            <img src="/images/tishi.png"><br />
            您通过微信成功付款<%=Price%>元 宝贝将在您指定的时间内送达！<br />
        </div>
        <%
          } %>
        
    </div>
</body>
<script>
setInterval("QueryOrderState();",1000);

</script>
</html>
