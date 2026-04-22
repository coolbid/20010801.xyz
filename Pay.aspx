<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pay.aspx.cs" Inherits="Pay" %>

<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<%@ Register Src="~/UserControls/Link.ascx" TagName="LinkControl" TagPrefix="ucLinkControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/Category.ascx" TagName="CategoryControl" TagPrefix="ucCategoryControl" %>
<%@ Register Src="~/UserControls/Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<%@ Register Src="~/UserControls/Contact.ascx" TagName="ContactControl" TagPrefix="ucContactControl" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <meta charset="UTF-8">
    <script type="text/javascript" src="/js/jquery-1.6.min.js"></script>
    <script src="/js/Validator-2.0.1.js" type="text/javascript"></script>
    <script src="/js/simpleAlert.js" type="text/javascript"></script>
    <link href="/js/simpleAlert.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        *{
            margin: 0 auto;
        }

        a{
            text-decoration: none;
            cursor:pointer;
        }

        ul{
            list-style: none;
        }

        body{
            background: #f7f7f7;
        }

        .wrap{
            width:800px;
            margin: 0 auto;
        }

        .Tit{
            height: 60px;
            line-height: 60px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            background: #fff;
            font-size: 24px;
            text-shadow: 0 0 10px #000;
            color: #fff;
            font-weight: bolder;
        }
                 .Tit div {
    float: left;
    width: 32px;
    height: 32px;
    margin: 15px;
    cursor: pointer;
    background-image: url(/images/homehui.png);
    background-size: 100% 100%;
}
                  .Tit div:hover{
    background-image: url(/images/homehei.png);
}
                            .Tit span {
                width: 736px;
                display: block;
            }
        .con{
            margin-top: 20px;
            padding: 30px 33px;
            width: 730px;
            background:#fff url("/images/wave.png") repeat-x top;
            border: 1px solid #e5e5e5;
            border-top: none;
        }

        .xdcgTxt{
            display: block;
            color: #000;
            line-height: 30px;
            font-weight: bold;
            font-size: 30px;
            text-indent: 30px;
            padding: 15px 0 30px;
        }

        .alDv{
            display: block;
            padding: 15px;
            border-radius: 10px;
            margin: 30px 10px auto;
            width: 190px;
            transition: 500ms;
            float: left;
        }

        .alDv img{
            display: block;
            width: 100%;
        }

        .alDv:hover{
            box-shadow: 0 0 10px #01aaef;
        }

        .zf{
            display: block;
            width: 100px;
            height: 30px;
            line-height: 30px;
            padding:5px 15px;
            margin: 0px auto;
            color: #01aaef;
            text-align: center;
            font-size: 18px;
            border-radius: 5px;
            border: 1px solid #01aaef;
            transition: 500ms;
            margin-top: 160px;
        }

        .zf:hover{
            box-shadow: 0 0 10px #01aaef;
            border-color:#fff;
            color: #fff;
            font-weight: bolder;
            text-shadow:0 0 10px #01aaef;
        }

        .cgdv{
            padding: 30px 0 0 0;
        }

        .cgdv dt{
            width: 100px;
            height: 100px;
            margin: 0 auto;
        }

        .cgdv dt img{
            display: block;
            width: 100%;
            height: 100%;
        }

        .cgdv dd{
            color: #000;
            line-height: 30px;
            text-align: center;
            font-size: 24px;
            margin-top: 30px;
        }

        .cgdv dd span{
            color: #f00;
        }
        .con .on{
            box-shadow: 0 0 10px #01aaef;
        }
    </style>

</head>
<body>
    <div class="wrap">
        <div class="Tit">
            <div onclick="javascript:window.location.href='/'"></div>
            <span>提交成功</span>
            
        </div>

        <div class="con">
            <dl class="cgdv">
               <dt>
                   <img src="/images/cg.png">
               </dt>
                <dd>
                    订单提交成功，您的订单号为：<span><%=orderid %></span>
                </dd>
            </dl>

        
            <a date="zhifubao" class="alDv on">
                <img src="/images/ali_pay.jpg">
            </a>

            <a date="weixin" class="alDv">
                <img src="/images/weixinzhifu.png">
            </a>

            <a date="paypal" class="alDv">
                <img src="/images/paypal.png">
            </a>

            <a  class="zf">
                去支付
            </a>
        </div>
    </div>
    <script>
        $(".alDv").click(function () {
            $(".alDv").removeClass("on");
            $(this).addClass("on");
        });
        $(".zf").click(function () {
            var pay = $(".con .on").attr("date");
            if (pay == "zhifubao")
            {
                window.location.href = "/zhifubao/<%=orderid%>";
            }
            else if (pay == "weixin")
            {
                window.location.href = "/weixin/<%=orderid%>";
            }
            else if (pay == "paypal") {
                if ("<%=flag%>" == "1")
                {
                    window.location.href = "/PayPal/<%=orderid%>";
                } else {
                    TYalter("金额太低，无法使用PayPal支付");
                }
               
            }
        })
    </script>
              
</body>
</html>

