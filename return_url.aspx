<%@ Page Language="C#" AutoEventWireup="true" CodeFile="return_url.aspx.cs" Inherits="return_url" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style>
 * {margin:0 auto;}
a {text-decoration:none;}
ul {list-style:none;}
body {background:#f7f7f7;}
.wrap {width:800px;margin:0 auto;}
.Tit {height:60px;line-height:60px;text-align:center;border-bottom:1px solid #ddd;background:#fff;font-size:24px;text-shadow:0 0 10px #000;color:#fff;font-weight:bolder;}
.Tit div {float:left;width:32px;height:32px;margin:15px;cursor:pointer;background-image:url(/images/homehui.png);background-size:100% 100%;}
.Tit div:hover {background-image:url(/images/homehei.png);}
.Tit span {width:736px;display:block;}
.con {margin-top:20px;padding:30px 33px;width:730px;background:#fff url("/images/wave.png") repeat-x top;border:1px solid #e5e5e5;border-top:none;}
.xdcgTxt {display:block;color:#000;line-height:30px;font-weight:bold;font-size:30px;text-indent:30px;padding:15px 0 30px;}
.alDv {display:block;padding:15px;border-radius:10px;margin:30px auto;width:300px;transition:500ms;}
.alDv img {display:block;width:100%;}
.alDv:hover {box-shadow:0 0 10px #01aaef;}
.zf {display:block;width:100px;height:30px;line-height:30px;padding:5px 15px;margin:30px auto;color:#01aaef;text-align:center;font-size:18px;border-radius:5px;border:1px solid #01aaef;transition:500ms;}
.zf:hover {box-shadow:0 0 10px #01aaef;border-color:#fff;color:#fff;font-weight:bolder;text-shadow:0 0 10px #01aaef;}
.cgdv {padding:30px 0 0 0;}
.cgdv dt {width:100px;height:100px;margin:0 auto;}
.cgdv dt img {display:block;width:100%;height:100%;}
.cgdv dd {color:#000;line-height:30px;text-align:center;font-size:24px;margin-top:30px;}
.cgdv dd span {color:#f00;}
    </style>
</head>
<body>
    <div class="wrap">
        <div class="Tit">
            <div onclick="javascript:window.location.href='/'"></div>
            <span><%=asd %></span>
        </div>
        <%if (asd == "支付成功")
            {%>
        <div class="con">
            <dl class="cgdv">
                <dt>
                    <img src="/images/cg.png">
                </dt>
                <dd>您已成功付款 <font style="color: red"><%=strPrice %></font> 元，订单号：<font style="color: red"><%=out_trade_no %></font>
                </dd>
            </dl>
        </div>
        <%} %>
    </div>
</body>
</html>