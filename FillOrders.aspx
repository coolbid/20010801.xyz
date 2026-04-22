<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FillOrders.aspx.cs" Inherits="FillOrders" %>

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
.tb01 td a:hover {color:#f00 !important;text-decoration:underline;}
.tb01 td {font-size:12px;}
.tb01 td a {color:#000;}
.tb01 td a:hover {color:#f00 !important;text-decoration:underline;}
.wenzi {font-size:13px !important;}
.settlement {width:110px;height:35px;outline:none;font-size:16px;cursor:pointer;text-align:center;background-color:rgb(255,102,0);color:white;border-style:none;border-radius:4px;}
.lyTb {width:100%;margin-top:36px;}
.lyTb tr {height:37px;}
.lyTb tr td:first-child {width:15%;}
.lyTb input[type="text"] {width:55.5%;border-radius:5px;height:35px;box-sizing:border-box;padding:0 10px;outline:none;color:rgb(102,102,102);border:1px solid rgb(229,229,229);}
.lyTb input[type="text"]:focus {box-shadow:0 0 6px #01aaef;}
.lyTb select {width:18%;border-radius:5px;height:35px;box-sizing:border-box;padding:0 10px;outline:none;color:rgb(102,102,102);border:1px solid rgb(229,229,229);}
.lyTb select:focus {box-shadow:0 0 6px #01aaef;}
.lyTb textarea {border-radius:5px;width:calc(55.5% - 22px);padding:10px;outline:none;color:rgb(102,102,102);border:1px solid rgb(229,229,229);}
.lyTb td span {float:right;}
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
            <span>提交订单信息</span>
        </div>
        <div class="con">
            <table class="tb01" width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tbody>
                    <tr style="color: #A2A2A2; background: #F7F7F7;">
                        <td width="50" height="36" style="border-bottom: 1px solid #ccc;">&nbsp;&nbsp;产品名称
                        </td>
                        <td height="36" style="border-bottom: 1px solid #ccc;"></td>
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
                    <tr>
                        <td align="left" height="60" style="border-bottom: 1px solid #ccc; padding: 5px 0 5px 5px; line-height: 20px; overflow: hidden;">
                            <a target="_blank" href="/prodetail/<%=Proid%>">
                                <img style="height: 60px; width: 60px;" src="/<%=path %>"></a>
                        </td>
                        <td align="left" height="60" style="border-bottom: 1px solid #ccc; padding: 5px 0; line-height: 20px; overflow: hidden;">&nbsp;<a target="_blank" href="/prodetail/<%=Proid%>"><%=name %></a>
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
                </tbody>
            </table>
            <form id="form2">
                <table class="lyTb">
                <tbody>
                    <tr>
                        <td><span><font style="color: red">*</font>收件人姓名：</span>
                        </td>
                        <td>
                            <input id="Name" ty-data="VeriNotNull" ty-title="收件人姓名" maxlength="12" value="" placeholder="长度不超过12个字符" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td><span><font style="color: red">*</font>地址信息：</span>
                        </td>

                        <td>
                            <select id="s_province" name="s_province"></select>
                            <select id="s_city" name="s_city"></select>
                            <select id="s_county" name="s_county"></select>
                        </td>
                    </tr>
                    <tr>
                        <td><span><font style="color: red">*</font>详细地址：</span>
                        </td>
                        <td>
                            <input id="Address" ty-data="VeriNotNull" ty-title="详细地址" maxlength="25" placeholder="请输入详细地址信息，如道路、门牌号、小区等信息" value="" type="text">
                        </td>
                    </tr>
                    <tr>
                        <td><span><font style="color: red">*</font>收件人手机号：</span>
                        </td>
                        <td>
                            <input id="Phone" ty-data="VeriNotNull,VeriPhone" ty-title="收件人手机号" maxlength="11" placeholder="请输入手机号码" value="" type="text">
                        </td>
                    </tr>
                    <tr>
                        <td><span>备注：</span>
                        </td>
                        <td>
                            <textarea placeholder="选填,请先和商家协商一致" style="height: 50px" id="Content"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8" align="center">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td align="right" style="line-height: 45px;">总计：￥<font class="zp" style="color: #F00; font-size: 20px; font-weight: bold; font-family: Arial"><%=deZongJi1 %></font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td align="right" style="line-height: 45px;">
                                            <input class="settlement TyBtnSubmit" type="button" ty-event="check()" value="提  交">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            </form>
            

        </div>
    </div>
    <script>
        function check() {
            var Name = $("#Name").val();
            var s_province = $("#s_province").val();
            if (s_province == "" || s_province == null || s_province == "省份") { tijiao("Error","请选择省份！");  return false; }
            var s_city = $("#s_city").val();
            if (s_city == "" || s_city == null || s_city == "地级市") { tijiao("Error","请选择地级市！"); $("#Name").focus; return false; }
            var s_county = $("#s_county").val();
            if (s_county == "" || s_county == null || s_county == "市、县级市") { tijiao("Error","请选择市、县级市！"); $("#Name").focus; return false; }
            var Address = $("#Address").val();
            var Phone = $("#Phone").val(); 
            var Content = $("#Content").val();
            var Price = $(".zp").text();
            $.ajax({
                type: "get",
                url: "/Check/CheckOrder.aspx?name=" + escape(Name) + "&Address=" + escape(s_province + s_city + s_county + Address) + "&Tel=" + escape(Phone) + "&Price=" + escape(Price) + "&Content=" + escape(Content),
                success: function (msg) {
                    if (msg != "error" && msg != "login") {
                        tijiao("Success","订单提交成功！");
                        setTimeout(function () {
                            window.location.href = "/pay/" + msg;
                        }, 1000);
                    }
                    else {
                        tijiao("Error","含非法字符，资料提交失败！");
                    }
                }
            });
        }
     
    </script>
    <script src="/js/area.js" type="text/javascript"></script>
    <script type="text/javascript">_init_area();</script>
</body>
</html>
