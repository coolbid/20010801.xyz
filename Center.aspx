<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Center.aspx.cs" Inherits="Center" %>

<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<%@ Register Src="~/UserControls/Link.ascx" TagName="LinkControl" TagPrefix="ucLinkControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/Category.ascx" TagName="CategoryControl" TagPrefix="ucCategoryControl" %>
<%@ Register Src="~/UserControls/Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<%@ Register Src="~/UserControls/Contact.ascx" TagName="ContactControl" TagPrefix="ucContactControl" %>
<!doctype html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <meta charset="UTF-8">
    <script type="text/javascript" src="/js/jquery-1.6.min.js"></script>
    <script src="/js/Validator-2.0.1.js" type="text/javascript"></script>
    <script src="/js/simpleAlert.js" type="text/javascript"></script>
    <link href="/js/simpleAlert.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
* {margin:0;padding:0}
a {text-decoration:none;color:black}
ul {list-style:none}
body {background:#f7f7f7}
.wrap {width:800px;margin:0 auto}
.Tit {height:60px;line-height:60px;text-align:center;border-bottom:1px solid#ddd;background:#fff;font-size:24px;text-shadow:0 0 10px#000;color:#fff;font-weight:bolder}
.Tit div {float:left;width:32px;height:32px;margin:15px;cursor:pointer;background-image:url(/images/homehui.png);background-size:100%100%}
.Tit div:hover {background-image:url(/images/homehei.png)}
.Tit span {width:736px;display:block}
.con {margin-top:20px;padding:30px 33px;width:730px;background:#fff url("/images/wave.png")repeat-x top;border:1px solid#e5e5e5;border-top:none;position:absolute}
.inside_left {float:left;width:25%}
.inside_left .side_a dl dt {display:block;color:#fff;line-height:50px;height:50px;background:url(../images/left_cate.jpg)center no-repeat;padding-left:20px;font-size:18px}
.inside_left .side_a dl dd {height:49px;line-height:49px;background:#eee;border-bottom:#fff solid 1px}
.inside_left .side_a dl dd a {cursor:pointer;display:block;padding-left:30px;font-size:14px;background:url(../images/pcrj2.jpg)right center no-repeat}
.inside_left .side_a dl dd a:hover {background:url(../images/pcrj.jpg)right center no-repeat;color:#2279c8}
.inside_left .side_a dl .hover {background:url(../images/pcrj.jpg)right center no-repeat;color:#2279c8}
.inside_right {float:right;width:70%}
.weizhi {height:35px;border-bottom:1px solid#ccc}
.weizhi strong {font-weight:normal;float:left;font-size:16px;color:#cb0000;padding-left:10px;background:url(../images/homes.jpg)left center no-repeat}
.hyzxbg {padding:10px 10px;margin-top:10px}
.inside_con {padding:10px 0}
.hyzx01 table {border-spacing:0}
.hyzx01 table th {height:36px;line-height:36px;background:#3378b9;color:#fff;font-weight:normal;font-size:12px}
.hyzx01 table td {text-align:center;line-height:2em;padding:5px 0;font-size:12px}
.lg_re {width:340px;margin:30px auto}
.lg_re li {line-height:37px;margin-bottom:20px}
.bdDv01 {height:37px;position:relative}
.bdDv01 input[type="text"] {display:block;border-radius:5px;height:35px;width:340px;box-sizing:border-box;padding-left:70px;padding-right:10px;outline:none;color:rgb(102,102,102);border:1px solid rgb(229,229,229)}
.bdDv01 input[type="text"]:focus {box-shadow:0 0 6px#01aaef}
.bdDv01 span {display:block;height:37px;width:55px;padding:0 10px;font-size:12px;color:rgb(178,178,178);position:absolute;left:0;top:0}
.dlli {margin-top:20px}
.dlli input[type="button"] {display:block;letter-spacing:5px;width:100%;height:35px;outline:none;font-size:16px;cursor:pointer;text-align:center;background-color:rgb(255,102,0);color:white;border-style:none;border-radius:4px}

    </style>
</head>
<body>
    <div class="wrap">
        <div class="Tit">
            <div onclick="javascript:window.location.href='/'"></div>
            <span>个人中心</span>
        </div>
        <div class="con">
            <div class="inside_left">
                <div class="side_a">
                    <dl>
                        <dt><%=strUsername %></dt>
                        <dd><a class="hover" date="hui1">我的订单</a></dd>
                        <dd><a date="hui2">修改密码</a></dd>
                        <dd><a date="zhuxiao">安全退出</a></dd>
                    </dl>
                </div>
            </div>
            <div class="inside_right hui1">
                <div class="weizhi"><strong>我的订单</strong></div>
                <div class="inside_con">
                    <div class="hyzxbg">
                        <div class="hyzx01">
                            <table width="100%" border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border-width: thin; border-style: solid; border-color: #ccc;">
                                <tbody>
                                    <tr>
                                        <th scope="col">订单号</th>
                                        <th scope="col">总金额</th>
                                        <th scope="col">状态</th>
                                        <th scope="col">操作</th>
                                    </tr>
                                    <%for (int i = 0; i < intOrder; i++)
                                        {
                                            string bianhao = dstOrder.Tables[0].Rows[i]["bianhao"].ToString();
                                            string jiage = dstOrder.Tables[0].Rows[i]["jiage"].ToString();
                                            string zhuangtai = dstOrder.Tables[0].Rows[i]["zhuangtai"].ToString();
                                            if (zhuangtai == "" || zhuangtai == null || zhuangtai == "未付款")
                                            {
                                                zhuangtai = "未付款<a style=\"color:red\" href=\"/zhifubao/" + bianhao + "\">（付款）</a>";
                                            }
                                    %>
                                    <tr>
                                        <td><a><%=bianhao %></a></td>
                                        <td>￥<%=jiage %></td>
                                        <td><%=zhuangtai %></td>
                                        <td>
                                            <a href="/dingdan/<%=bianhao %>">查看订单</a></td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="inside_right hui2" style="display: none">
                <div class="weizhi"><strong>修改密码</strong></div>
                <div class="inside_con">
                    <div class="hyzxbg">
                        <form id="form2">
                        <div class="hyzx01">
                            <ul class="lg_re">
                                <li>
                                    <div class="bdDv01">
                                        <input id="oldPasswords" ty-data="VeriNotNull,VeriPsw" ty-title="原密码" placeholder="6-16字母数字组合" type="text">
                                        <span>原密码:</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="bdDv01">
                                        <input id="Passwords" ty-data="VeriNotNull,VeriPsw" ty-title="新密码" placeholder="6-16字母数字组合" type="text">
                                        <span>新密码:</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="bdDv01">
                                        <input id="ZPasswords" ty-data="VeriNotNull,VeriEqual" equalid="Passwords" ty-title="新密码" placeholder="6-16字母数字组合" type="text">
                                        <span>确认密码:</span>
                                    </div>
                                </li>
                                <li class="dlli">
                                    <input type="button" class="TyBtnSubmit" ty-event="checkSearch2()" id="SearchButton" value="立即修改">
                                </li>
                            </ul>
                        </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(".side_a a").click(function () {
            $(".side_a a").removeClass("hover");
            $(this).addClass("hover");
            var strclass = $(this).attr("date");
            if (strclass != "zhuxiao") {
                $(".inside_right").hide();
                $("." + strclass).show();
            }
            else {
                delCookie('webUserName');
            }
        });
        function getCookie(key) {
            var arr, reg = RegExp('(^| )' + key + '=([^;]+)(;|$)');
            if (arr = document.cookie.match(reg))    //["username=liuwei;", "", "liuwei", ";"]
                return decodeURIComponent(arr[2]);
            else
                return null;
        }
        function delCookie(key) {
            var date = new Date();
            date.setTime(date.getTime() - 1);
            var delValue = getCookie(key);
            if (!!delValue) {
                document.cookie = key + '=' + delValue + ';expires=' + date.toGMTString();
            }
            location.reload();
        }

        function checkSearch2() {
            //姓名
            var oldPasswords = document.getElementById("oldPasswords").value;
            var Passwords = document.getElementById("Passwords").value;
            var ZPasswords = document.getElementById("ZPasswords").value;
            //防止用户多次点击
            document.getElementById('SearchButton').disabled = true;
            document.getElementById('SearchButton').value = "正在修改...";
            //提交信息开始
            $.ajax({
                type: "get",
                url: "Check/CheckPassword.aspx?oldPasswords=" + escape(oldPasswords) + "&Passwords=" + escape(Passwords),
                success: function (msg) {
                    if (msg == "ok") {
                        tijiao("Success", "密码修改成功！");
                        setTimeout(function () {
                            location.reload();
                        }, 1000);
                    }
                    else if (msg == "weideng") {
                        window.location.href = "/login";
                    }
                    else if (msg == "cuowu") {
                        document.getElementById('SearchButton').value = "立即修改";
                        document.getElementById('SearchButton').disabled = false;
                        tijiao("Error","原密码错误，请重新输入!");
                    }
                    else {
                        document.getElementById('SearchButton').value = "立即修改";
                        document.getElementById('SearchButton').disabled = false;
                        tijiao("Error","含非法字符，资料提交失败！");
                    }
                }
            });
        }
    </script>

</body>
</html>
