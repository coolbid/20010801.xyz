<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PicNews.aspx.cs" Inherits="PicNews" %>

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
    <ucTop:Top ID="Top" runat="server" />
    <%--默认--%>
    <link href="/css/page.css" rel="stylesheet" type="text/css" />
    <script>
        $(function () {//限制字符串（自适应）
            var width = $(".wenzi").css("width").replace("px", "");
            var ziti = $(".wenzi").css("font-size").replace("px", "");
            var number = parseInt(parseInt(width) / parseInt(ziti)); 
            var number1 = parseInt(number*2)+parseInt(number/2); 
            $(".wenzi").each(function () {
                var wenzi = $(this).find(".jianjie").text();
                if (wenzi.length > number1)
                {
                    wenzi = wenzi.substring(0, number1) + "...";
                    $(this).find(".jianjie").text(wenzi);
                }
            });
        });
    </script>
    <style type="text/css">
        .inside_news { margin:0 auto;}
        .inside_news dl{ height:100px; padding:20px 0px; border-bottom:1px dashed #ccc;}
        .inside_news dl dt{ float:left; width:15%; height:100px; }
        .inside_news dl dt img{ width:100%; height:100px;}
        .inside_news dl dd { float:right; width:80%;}
        .inside_news dl dd strong{ display:block; font-weight:normal; height:30px; line-height:30px;}
        .inside_news dl dd strong a{ float:left; color:#333; font-size:20px;font-weight: 600;}
        .inside_news dl dd strong i{ float:right; font-style:normal; font-size:14px;}
        .inside_news dl dd span{ display:block; line-height:20px; padding-top:10px; font-size:14px;height: 60px;overflow: hidden;}
        .inside_news dl dd span i{  float:right;font-style:normal;cursor:pointer}
        .inside_news dl dd span i:hover{color: #f60;}
    </style>
</head>
<body>
    <form id="form1">
        <ucStart:Start ID="Start" runat="server" />
        <!--Content Start-->
        <asp:Repeater ID="DataList2" runat="server">
            <ItemTemplate>
                <div class="inside_news">
                    <dl>
                        <dt>
                            <a href="<%#CheckUrl(Eval("url", "{0}"), Eval("id", "{0}"))%>">
                                <img src="/<%#Eval("Path") %>"></a></dt>
                        <dd><strong><a href="<%#CheckUrl(Eval("url", "{0}"), Eval("id", "{0}"))%>"><%#Eval("title") %></a><i>日期：<%#Convert.ToDateTime(Eval("putdate")).ToString("yyyy-MM-dd")%></i></strong>
                            <span class="wenzi"><font class="jianjie"><%#Eval("keycontent") %></font><i onclick="javascript:window.location.href='<%#CheckUrl(Eval("url", "{0}"), Eval("id", "{0}"))%>'">[详细]</i></span>
                        </dd>
                    </dl>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="clear">
        </div>
        <div class="page_box" style="width: 100%; padding-top: 5px; padding-bottom: 8px;">
            <%=Basic.Engine.Get.PagiNation.GetPageHtml(intTotalCount, page)%>
        </div>
        <!--Content End-->
        <ucEnd:End ID="End" runat="server" />
    </form>
</body>
</html>

