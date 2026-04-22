<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

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
          <!--默认设置开始-->
    <meta charset="UTF-8">
    <script type="text/javascript" src="/js/jquery-1.6.min.js"></script>
    <style type="text/css">
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
.MinusCart {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -370px 1px;border:none;cursor:pointer;}
.PlusCart {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -370px -53px;border:none;cursor:pointer;}
.btndelcard {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -155px -31px;border:none;cursor:pointer;}
.btndelcardhover {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -135px -31px;border:none;cursor:pointer;}
.MinusCarthover {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -370px -17px;border:none;cursor:pointer;}
.PlusCarthover {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -370px -35px;border:none;cursor:pointer;}
.jixugouwu {width:110px;height:26px;line-height:26px;background:#ddd;color:#fff;font-size:12px;border-radius:3px;border:none;font-weight:bold;cursor:pointer;margin-left:0;}
.qingdengdai {width:110px;height:26px;line-height:26px;background:rgb(255,102,0);color:#fff;font-size:12px;border-radius:3px;border:none;font-weight:bold;cursor:pointer;margin-left:0;}
.qujiezhang {width:110px;height:26px;line-height:26px;background:#f60;color:#fff;font-size:12px;border-radius:3px;border:none;font-weight:bold;cursor:pointer;margin-left:0;}
.qingkonggwc {width:90px;height:26px;line-height:26px;background:#88b67a;color:#fff;font-size:12px;border-radius:3px;border:none;font-weight:bold;cursor:pointer;margin-left:0;}
.tb01 td a:hover {color:#f00 !important;text-decoration:underline;}
.tb01 td {font-size:12px;}
.wenzi {font-size:13px !important;}
.gowu {width:70%;height:35px;outline:none;font-size:16px;cursor:pointer;text-align:center;background-color:rgb(255,102,0);color:white;border-style:none;border-radius:4px;}
    </style>
    <script type="text/javascript">
        $(function () {
            $(".btndelcard").hover(function () { $(this).addClass("btndelcardhover") }, function () { $(this).removeClass("btndelcardhover") });
            $(".MinusCart").hover(function () { $(this).addClass("MinusCarthover") }, function () { $(this).removeClass("MinusCarthover") });
            $(".PlusCart").hover(function () { $(this).addClass("PlusCarthover") }, function () { $(this).removeClass("PlusCarthover") });
        });
    </script>
    <script type="text/javascript" src="/js/cart.js"></script>
        <!--默认设置结束-->
</head>
<body>
    <div class="wrap">
        <div class="Tit">
            <div onclick="javascript:window.location.href='/'"></div>
            <span>购物车</span>
        </div>
        <div class="con ">
            <table class="tb01 qzl" <%if (intcart <= 0)
                { %>style="display:none" <%} %> width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tbody>
                    <tr style="color: #A2A2A2; background: #F7F7F7;">
                        <td width="50" height="36" style="border-bottom: 1px solid #ccc;">&nbsp;&nbsp;产品名称
                        </td>
                        <td height="36" style="border-bottom: 1px solid #ccc; font-size: 14px;"></td>
                        <td width="14%" align="center" style="border-bottom: 1px solid #ccc; font-size: 14px;">单价
                        </td>
                        <td width="14%" align="center" style="border-bottom: 1px solid #ccc; font-size: 14px;">数量
                        </td>
                        <td width="14%" align="center" style="border-bottom: 1px solid #ccc; font-size: 14px;">总价
                        </td>
                        <td align="center" width="50" style="border-bottom: 1px solid #ccc"></td>
                    </tr>
                    <%
                        double deZongJi = 0.00;
                        double deZongJi1 = 0.00;
                        for (int i = 0; i < intcart; i++)
                        {
                            string Proid = dtbcart.Rows[i]["Proid"].ToString();
                            string number = dtbcart.Rows[i]["number"].ToString();
                            string danjia = ShowPro(Int32.Parse(Proid), "ProPrice");
                            string name = ShowPro(Int32.Parse(Proid), "ProName");
                            string path = ShowPro(Int32.Parse(Proid), "ProPath");
                            if (!IsNumberic(danjia))
                            {
                                danjia = "0";//不为数字，则为0;
                            }
                            deZongJi = double.Parse(number) * double.Parse(danjia);
                            deZongJi1 += deZongJi;
                    %>
                    <tr class="ech">
                        <td align="left" height="60" style="border-bottom: 1px solid #ccc; padding: 5px 0px 5px 5px; line-height: 20px; overflow: hidden;">
                            <a href="/prodetail/<%=Proid%>" title="<%=name %>" target="_blank">
                                <img style="height: 60px; width: 60px;" src="/<%=path %>"></a>
                        </td>
                        <td align="left" height="60" style="border-bottom: 1px solid #ccc; padding: 5px 0px; line-height: 20px; overflow: hidden;">&nbsp;<a href="/prodetail/<%=Proid %>" title="<%=name %>" target="_blank"><%=name%></a>
                        </td>
                        <td align="center" style="border-bottom: 1px solid #ccc;">￥<font class="dj"><%=Convert.ToDouble(danjia).ToString("0.00")%></font>
                        </td>
                        <td align="center" class="PDI<%=Proid %>" style="border-bottom: 1px solid #ccc">
                            <table>
                                <tr>
                                    <td>
                                        <input type="button" class="MinusCart" onclick="jian('<%=Proid %>');">
                                    </td>
                                    <td class="wenzi">
                                        <input style="width: 22px; text-align: center;" oninput="onInput('<%=Proid %>')" onpropertychange="onPropertyChange('<%=Proid %>')" value="<%=number%>" /></td>
                                    <td>
                                        <input type="button" class="PlusCart" onclick="jia('<%=Proid %>');">
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="center" style="border-bottom: 1px solid #ccc">￥<font class="zj"><%=Convert.ToDouble(deZongJi).ToString("0.00")%></font>
                        </td>
                        <td align="center" style="border-bottom: 1px solid #ccc; color: #F00; text-decoration: underline;">
                            <input type="button" class="btndelcard" onclick="DeleteCart('<%=Proid %>');">
                        </td>
                    </tr>
                    <%
                    } %>
                    <tr>
                        <td colspan="8" align="center">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td align="right" style="line-height: 45px;">总计：￥<font class="hj" style="color: #F00; font-size: 20px; font-weight: bold; font-family: Arial"><%=Convert.ToDouble(deZongJi1).ToString("0.00")%></font>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="button" value="清空购物车" onclick="javascript: Empty();" class="qingkonggwc">
                                        </td>
                                        <td align="right" style="line-height: 45px;">
                                            <span>
                                                <input type="button" value="继续购物" onclick="javascript: GouWu();" class="jixugouwu">
                                            </span><span id="divHidden">
                                                <input type="button" value="提交" onclick="javascript: FillOrders();" class="qujiezhang">
                                            </span><span id="divShow" style="display: none;">
                                                <input type="button" value="loading…" class="qingdengdai">
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="gouwu_shangpin qzl1" <%if (intcart > 0)
                { %>style="display:none" <%} %>>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tbody>
                        <tr>
                            <td width="50%" align="right">
                                <div style="width: 240px; text-align: left;">
                                    <span style="font-size: 26px; line-height: 35px;">您的购物车还是空的，赶紧行动吧！<br>
                                    </span>
                                </div>
                                <div style="width: 240px; text-align: left; margin-top: 20px;">
                                    <input type="button" class="gowu" id="button1" value="去购物 >>" onclick="javascript: window.location.href = '<%=strWebUrl %>';"
                                        class="btncai">
                                </div>
                            </td>
                            <td>
                                <img width="200" src="/images/nullcard.jpg">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>

