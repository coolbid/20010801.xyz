<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dingdan.aspx.cs" Inherits="dingdan" %>

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
    <style type="text/css">
* {margin:0 auto;}
a {text-decoration:none;}
ul {list-style:none;}
body {background:#f7f7f7;}
.wrap {width:800px;margin:0 auto;}
.Tit {height:60px;line-height:60px;text-align:center;border-bottom:1px solid #ddd;background:#fff;font-size:24px;text-shadow:0 0 10px #000;color:#fff;font-weight:bolder;}
.Tit div {float:left;width:32px;height:32px;margin:15px;cursor:pointer;background-image:url(/images/homehui.png);background-size:100% 100%;}
.Tit div:hover {background-image:url(/images/homehei.png);}
.con {margin-top:20px;padding:30px 33px;width:730px;background:#fff url("/images/wave.png") repeat-x top;border:1px solid #e5e5e5;border-top:none;}
.MinusCart {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -370px 1px;border:none;cursor:pointer;}
.PlusCart {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -370px -53px;border:none;cursor:pointer;}
.btndelcard {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -158px -31px;border:none;cursor:pointer;}
.btndelcardhover {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -135px -31px;border:none;cursor:pointer;}
.MinusCarthover {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -370px -17px;border:none;cursor:pointer;}
.PlusCarthover {width:20px;height:20px;background:url(/images/icon-common.png) no-repeat -370px -35px;border:none;cursor:pointer;}
.jixugouwu {width:110px;height:26px;line-height:26px;background:#ddd;color:#fff;font-size:12px;border-radius:3px;border:none;font-weight:bold;cursor:pointer;margin-left:0;}
.qingdengdai {width:110px;height:26px;line-height:26px;background:#ddd;color:#fff;font-size:12px;border-radius:3px;border:none;font-weight:bold;cursor:pointer;margin-left:0;}
.qujiezhang {width:110px;height:26px;line-height:26px;background:#f60;color:#fff;font-size:12px;border-radius:3px;border:none;font-weight:bold;cursor:pointer;margin-left:0;}
.qingkonggwc {width:90px;height:26px;line-height:26px;background:#88b67a;color:#fff;font-size:12px;border-radius:3px;border:none;font-weight:bold;cursor:pointer;margin-left:0;}
.tb01 td a:hover {color:#f00 !important;text-decoration:underline;}
.tb01 td {font-size:12px;}
.tb01 td a {color:#000;}
.tb01 td a:hover {color:#f00 !important;text-decoration:underline;}
.wenzi {font-size:13px !important;}
.settlement {padding:7px 5px;background:#f60;color:#fff;font-size:12px;border-radius:3px;border:none;cursor:pointer;}
.lyTb {width:100%;}
.lyTb tr {height:37px;}
.lyTb tr td:first-child {width:15%;}
.lyTb input[type="text"] {width:53%;border-radius:5px;height:35px;box-sizing:border-box;padding:0 10px;outline:none;color:rgb(102,102,102);border:1px solid rgb(229,229,229);}
.lyTb input[type="text"]:focus {box-shadow:0 0 6px #01aaef;}
.lyTb textarea {border-radius:5px;width:calc(53% - 22px);padding:10px;outline:none;color:rgb(102,102,102);border:1px solid rgb(229,229,229);}
.lyTb textarea:focus {box-shadow:0 0 6px #01aaef;}
    </style>
    <script type="text/javascript">
        $(function () {
            $(".btndelcard").hover(function () { $(this).addClass("btndelcardhover") }, function () { $(this).removeClass("btndelcardhover") });
            $(".MinusCart").hover(function () { $(this).addClass("MinusCarthover") }, function () { $(this).removeClass("MinusCarthover") });
            $(".PlusCart").hover(function () { $(this).addClass("PlusCarthover") }, function () { $(this).removeClass("PlusCarthover") });

        });
    </script>
</head>
<body>
    <div class="wrap">
        <div class="Tit">
            <div onclick="javascript:window.location.href='/'"></div>
            <span>订单信息</span>
        </div>
        <div class="con">
            <table class="lyTb">
                <tbody>
                    <tr>
                        <td>收件人名称：
                        </td>
                        <td>
                            <%=ShowOrder("name") %>
                        </td>
                    </tr>
                    <tr>
                        <td>收件人地址：
                        </td>
                        <td>
                            <%=ShowOrder("dizhi") %>
                        </td>
                    </tr>
                    <tr>
                        <td>收件人电话：
                        </td>
                        <td>
                            <%=ShowOrder("phone") %>
                        </td>
                    </tr>
                    <tr>
                        <td>备注：
                        </td>
                        <td>
                            <%=ShowOrder("content") %>
                        </td>
                    </tr>
                    <tr style="line-height: 20px;">
                        <td>产品信息：
                        </td>
                    </tr>
                </tbody>
            </table>
            <table class="tb01" width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tbody>
                    <tr style="color: #A2A2A2; background: #F7F7F7;">
                        <td width="50" height="36" style="border-bottom: 1px solid #ccc;">&nbsp;
                        </td>
                        <td height="36" style="border-bottom: 1px solid #ccc;">&nbsp;&nbsp;产品名称
                        </td>
                        <td width="14%" align="center" style="border-bottom: 1px solid #ccc;">价格
                        </td>
                        <td width="14%" align="center" style="border-bottom: 1px solid #ccc">数量
                        </td>
                        <td width="14%" align="center" style="border-bottom: 1px solid #ccc">总价
                        </td>
                        <td align="center" width="50" style="border-bottom: 1px solid #ccc"></td>
                    </tr>
                    <%
                        double deZongJi = 0.00;
                        double deZongJi1 = 0.00;
                        for (int i = 0; i < intcart; i++)
                        {
                            string Proid = dtbcart.Rows[i]["Proid"].ToString();
                            string number = dtbcart.Rows[i]["Pronumber"].ToString();
                            string danjia = dtbcart.Rows[i]["ProPrice"].ToString();
                            string name = dtbcart.Rows[i]["ProName"].ToString();
                            string path = dtbcart.Rows[i]["ProPath"].ToString();
                            if (!IsNumberic(danjia))
                            {
                                danjia = "0";//不为数字，则为0;
                            }
                            deZongJi = double.Parse(number) * double.Parse(danjia);
                            deZongJi1 += deZongJi;
                    %>
                    <tr>
                        <td align="left" height="60" style="border-bottom: 1px solid #ccc; padding: 5px 0 5px 5px; line-height: 20px; overflow: hidden;">
                            <a href="/prodetail/<%=Proid%>">
                                <img style="height: 60px; width: 60px;" src="/<%=path %>"></a>
                        </td>
                        <td align="left" height="60" style="border-bottom: 1px solid #ccc; padding: 5px 0; line-height: 20px; overflow: hidden;">&nbsp;<a href="/prodetail/<%=Proid%>"><%=name %></a>
                        </td>
                        <td align="center" style="border-bottom: 1px solid #ccc;">￥<%=danjia %>
                        </td>
                        <td align="center" style="border-bottom: 1px solid #ccc">
                            <table>
                                <tbody>
                                    <tr>

                                        <td>
                                            <%=number %>
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td align="center" style="border-bottom: 1px solid #ccc">￥<%=deZongJi %>

                        </td>
                        <td align="center" style="border-bottom: 1px solid #ccc;"></td>
                    </tr>
                    <%} %>
                    <tr>
                        <td colspan="8" align="center">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td align="right" style="line-height: 45px;">总计：￥<font class="zp" style="color: #F00; font-size: 20px; font-weight: bold; font-family: Arial"><%=deZongJi1 %></font>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
