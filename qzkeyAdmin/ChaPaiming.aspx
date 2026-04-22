<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChaPaiming.aspx.cs" Inherits="qzkeyAdmin_ChaPaiming" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>关键词查排名</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1-7-2.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function ()
        {
            //存入点击列的每一个TD的内容；
            var aTdCont = [];
            //点击列的索引值
            var thi = 0

            //重新对TR进行排序
            var setTrIndex = function (tdIndex)
            {
                for (i = 0; i < aTdCont.length; i++)
                {
                    var trCont = aTdCont[i];
                    $("#bbbb tbody tr").each(function ()
                    {
                        var thisText = $(this).children("td:eq(" + tdIndex + ")").text();
                        if (thisText == trCont)
                        {
                            $("#bbbb tbody").append($(this));
                        }
                    });
                }
            }

            //比较函数的参数函数
            var compare_down = function (a, b)
            {
                return a - b;
            }

            var compare_up = function (a, b)
            {
                return b - a;
            }

            //比较函数
            var fSort = function (compare)
            {
                aTdCont.sort(compare);
            }

            //取出TD的值，并存入数组,取出前二个TD值；
            var fSetTdCont = function (thIndex)
            {
                $("#bbbb tbody tr").each(function ()
                {
                    var tdCont = $(this).children("td:eq(" + thIndex + ")").text();
                    aTdCont.push(tdCont);
                });
            }
            //点击时需要执行的函数
            var clickFun = function (thindex)
            {
                aTdCont = [];
                //获取点击当前列的索引值
                var nThCount = thindex;
                //调用sortTh函数 取出要比较的数据
                fSetTdCont(nThCount);
            }

            //点击事件绑定函数
            $("th").toggle(function ()
            {
                thi = $(this).index();
                clickFun(thi);
                //调用比较函数,降序
                fSort(compare_up);
                //重新排序行
                setTrIndex(thi);
            }, function ()
            {
                clickFun(thi);
                //调用比较函数 升序
                fSort(compare_down);
                //重新排序行
                setTrIndex(thi);
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="17" valign="top" background="images/admin_images/mail_leftbg.gif">
                <img src="images/admin_images/left-top-right.gif" width="17" height="29" />
            </td>
            <td valign="top" background="images/admin_images/content-bg.gif">
                <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg">
                    <tr>
                        <td height="31">
                            <div class="title_left">
                            </div>
                            <div class="titlebt2">
                                关键词查排名
                            </div>
                            <div class="title_right">
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="16" valign="top" background="images/admin_images/mail_rightbg.gif">
                <img src="images/admin_images/nav-right-bg.gif" width="16" height="29" />
            </td>
        </tr>
        <tr>
            <td valign="middle" background="images/admin_images/mail_leftbg.gif">
                &nbsp;
            </td>
            <td valign="top" bgcolor="#F7F8F9">
                <!--内容开始-->
                <style type="text/css">
                    .txtInput { margin-right: 5px; padding: 0 3px 0 3px; width: 80px; height: 22px; line-height: 22px; background: #FAFAFA; border: 1px solid #D7D7D7; vertical-align: middle; font-size: 12px; font-family: '微软雅黑'; }
                    .btnSearch { padding: 0; width: 55px; height: 24px; line-height: 24px; color: #707070; border: none; background: url(../images/hjh586.jpg) repeat-x; cursor: pointer; vertical-align: middle; overflow: hidden; }
                    thead th { cursor: pointer; }
                </style>
                <table width="600px;" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td colspan="2" style="padding-top: 10px;">
                            <input id="btnzairu" type="button" onclick="zairu()" value="载入关键词" style="cursor: pointer;" />
                            <input id="btnpaiming" type="button" onclick="chapm()" value="一键查排名" style="cursor: pointer;" />
                            <script type="text/javascript">
                                //查排名
                                function chapm()
                                {
                                    $("#btnpaiming").unbind();
                                    $("#btnpaiming").attr("disabled", "disabled"); //不可用
                                    $("#btnpaiming").val("正在查询中");
                                    var eachcount = 0;
                                    var ali = $('.guanjianci');
                                    ali.each(function (index)
                                    {
                                        eachcount++;
                                        var guanjianci = $(this).html();
                                        var id = $(this).attr("id");

                                        $.ajax({
                                            type: "get",
                                            async: true, //同步
                                            url: "ashx/chapaiming.aspx?spm=" + GetCode(9) + "&keywords=" + guanjianci,
                                            datatype: "json",
                                            success: function (msg)
                                            {
                                                if (msg == "0")
                                                {
                                                    $("#pm" + id).html("99");
                                                }
                                                else
                                                {
                                                    $("#pm" + id).html(msg);
                                                }
                                            }
                                        });
                                        //                                        if (eachcount >= ali.length)
                                        //                                        {
                                        //                                            $("#btnpaiming").val("查询完毕");
                                        //                                        }
                                    });
                                    setInterval("shuaxinpaiming()", 1000); //一秒
                                }
                                function shuaxinpaiming()
                                {
                                    var text = $(".pmresult:contains('NULL')").html();
                                    if (text != 'NULL')
                                    {
                                        $("#btnpaiming").val("查询完毕");
                                    }
                                    //                                    var jieguov = "1";
                                    //                                    var control_font = $(".pmresult");
                                    //                                    for (var i = 0; i < control_font.length; i++)
                                    //                                    {
                                    //                                        var inner = $(control_font[i]).html();
                                    //                                        if (inner == "NULL")
                                    //                                        {
                                    //                                            jieguov = "0";
                                    //                                        }
                                    //                                    }
                                    //                                    if (jieguov == "1")
                                    //                                    {
                                    //                                        $("#btnpaiming").val("查询完毕");
                                    //                                    }
                                }

                                //载入关键词
                                function zairu()
                                {
                                    $("#btnzairu").unbind();
                                    $("#btnzairu").attr("disabled", "disabled"); //不可用
                                    $("#btnzairu").val("正在载入中");
                                    $.ajax({
                                        type: "get",
                                        async: true,
                                        url: "ashx/zhairuguanjianci.aspx?action=zairu",
                                        datatype: "json",
                                        success: function (msg)
                                        {
                                            if (msg == "1")
                                            {
                                                $("#btnzairu").css("color", "blue");
                                                alert("载入成功");
                                                location.reload();
                                            }
                                            else
                                            {
                                                $("#btnzairu").css("color", "red");
                                                $("#btnzairu").val("载入失败了");
                                            }
                                        }
                                    });
                                }
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-top: 10px;">
                            <div id="bbbb">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                                    <thead>
                                        <tr style="background: #eaebf0; line-height: 26px;">
                                            <th width="50px" style="border-left: 1px solid #ddd;">
                                                序号
                                            </th>
                                            <th align="left" style="border-left: 1px solid #ddd;">
                                                &nbsp;关键词
                                            </th>
                                            <th width="80px" style="border-left: 1px solid #ddd;">
                                                搜索引擎
                                            </th>
                                            <th width="80px" style="border-left: 1px solid #ddd; border-right: 1px solid #ddd;">
                                                排名
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            //读取每行链接
                                            String[] fileLines = System.IO.File.ReadAllLines(strMapPath);
                                            int len = fileLines.Length;
                                            for (int i = 0; i < len; i++)
                                            {
                                                string con = fileLines[i].ToString();
                                        %>
                                        <tr>
                                            <td align="center" style="line-height: 24px; height: 24px; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd;">
                                                <%=i+1%>
                                            </td>
                                            <td align="left" style="border-bottom: 1px solid #ddd; border-left: 1px solid #ddd;">
                                                &nbsp; <font class="guanjianci" id="<%=i+1%>">
                                                    <%=con%></font>
                                            </td>
                                            <td align="center" style="border-bottom: 1px solid #ddd; border-left: 1px solid #ddd;">
                                                <a href="https://www.baidu.com/s?wd=<%=con%>" title="打开百度查询" target="_blank">百度</a>
                                            </td>
                                            <td align="center" style="border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; border-right: 1px solid #ddd;">
                                                <font id="pm<%=i+1%>" class="pmresult">NULL</font>
                                            </td>
                                        </tr>
                                        <%
                                            }
 
                                
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                <!--内容结束-->
            </td>
            <td background="images/admin_images/mail_rightbg.gif">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="bottom" background="images/admin_images/mail_leftbg.gif">
                <img src="images/admin_images/buttom_left2.gif" width="17" height="17" />
            </td>
            <td background="images/admin_images/buttom_bgs.gif">
                <img src="images/admin_images/buttom_bgs.gif" width="17" height="17">
            </td>
            <td valign="bottom" background="images/admin_images/mail_rightbg.gif">
                <img src="images/admin_images/buttom_right2.gif" width="16" height="17" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
