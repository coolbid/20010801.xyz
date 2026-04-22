<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BackGround.aspx.cs" Inherits="Manager_BackGround" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站背景</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("bgValue").value == "") { alert("请先选择背景颜色！"); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
        function checkNull3()
        {
            if (document.getElementById("fileup").value == "" && document.getElementById("pic").value == "") { alert("请上传背景图片"); document.getElementById("fileup").focus(); return false; }
            var bgDisplayModeSign = false;
            var bgDisplayMode = document.getElementsByName("radlbgDisplayMode");
            for (var i = 0; i < bgDisplayMode.length; i++)
            {
                if (bgDisplayMode[i].checked)
                {
                    bgDisplayModeSign = true; break;
                }
            }
            if (bgDisplayModeSign == false) { alert("请选择显示方式"); return false; }

            var radlbgStateSign = false;
            var bgState = document.getElementsByName("radlbgState");
            for (var i = 0; i < bgState.length; i++)
            {
                if (bgState[i].checked)
                {
                    radlbgStateSign = true; break;
                }
            }
            if (radlbgStateSign == false) { alert("请选择是否启用自定义背景"); return false; }
            document.getElementById("divShow3").style.display = "none";
            document.getElementById("divHidden3").style.display = "block";
            return true;
        }
        function checkNull2()
        {
            document.getElementById("divShow2").style.display = "none";
            document.getElementById("divHidden2").style.display = "block";
            return true;
        }
        function setok(url, type, i)
        {
            document.getElementById("bg" + i).checked = "true";
            $(".bankzfdiv img").css('border', '1px #999 solid');
            $(".bankzfdiv #img" + i).css('border', '1px #f00 solid');

            document.getElementById("bgValue").value = "images/bg/bgimg_" + i + ".gif";
        }
    </script>
    <style type="text/css">
        body, div, ul, li, a, img, p, dl, dt, dd, h1, h2, h3, h4, span, strong { margin: 0; padding: 0; }
        ul, li, dl, dt, dd { list-style: none; }
        .bankzfdiv input { height: 38px; }
        #b1 a { text-decoration: none; }
        #b2 a { text-decoration: none; }
        #b3 a { text-decoration: none; }
        #b4 a { text-decoration: none; }
        .bankzfdiv { line-height: 45px; }
        .bankzfdiv ul li { float: left; padding-right: 20px; padding-top: 10px; width: 120px; }
        .bankzfdiv ul li img { height: 60px; width: 60px; border: 1px solid #999; padding: 2px; }
    </style>
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
                            <div class="titlebt">
                                网站背景
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
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="left_txt" height="30" colspan="2" bgcolor="#f2f2f2">
                            <div id="divHidden2" style="display: none;">
                                <table>
                                    <tr>
                                        <td>
                                            <img src="images/admin_images/loading.gif" />
                                        </td>
                                        <td>
                                            <span style="color: #666; padding-left: 5px;">正在保存...</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="divShow2">
                                <asp:Button ID="btnReset" Text="恢复默认背景" runat="server" OnClick="btnResetClick" CssClass="button" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="bankzfdiv" id="b1">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg1','a',1);">
                                                        <input type="radio" name="bg" id="bg1" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_1.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_1.gif" border="0" id="img1" alt="" <%if(strpath=="images/bg/bgimg_1.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg2','a',2);">
                                                        <input type="radio" name="bg" id="bg2" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_2.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_2.gif" border="0" id="img2" alt="" <%if(strpath=="images/bg/bgimg_2.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg3','a',3);">
                                                        <input type="radio" name="bg" id="bg3" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_3.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_3.gif" border="0" id="img3" alt="" <%if(strpath=="images/bg/bgimg_3.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg4','a',4);">
                                                        <input type="radio" name="bg" id="bg4" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_4.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_4.gif" border="0" id="img4" alt="" <%if(strpath=="images/bg/bgimg_4.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg5','a',5);">
                                                        <input type="radio" name="bg" id="bg5" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_5.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_5.gif" border="0" id="img5" alt="" <%if(strpath=="images/bg/bgimg_5.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg6','a',6);">
                                                        <input type="radio" name="bg" id="bg6" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_6.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_6.gif" border="0" id="img6" alt="" <%if(strpath=="images/bg/bgimg_6.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg7','a',7);">
                                                        <input type="radio" name="bg" id="bg7" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_7.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_7.gif" border="0" id="img7" alt="" <%if(strpath=="images/bg/bgimg_7.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg8','a',8);">
                                                        <input type="radio" name="bg" id="bg8" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_8.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_8.gif" border="0" id="img8" alt="" <%if(strpath=="images/bg/bgimg_8.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg9','a',9);">
                                                        <input type="radio" name="bg" id="bg9" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_9.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_9.gif" border="0" id="img9" alt="" <%if(strpath=="images/bg/bgimg_9.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg10','a',10);">
                                                        <input type="radio" name="bg" id="bg10" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_10.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_10.gif" border="0" id="img10" alt="" <%if(strpath=="images/bg/bgimg_10.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg11','a',11);">
                                                        <input type="radio" name="bg" id="bg11" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_11.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_11.gif" border="0" id="img11" alt="" <%if(strpath=="images/bg/bgimg_11.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg12','a',12);">
                                                        <input type="radio" name="bg" id="bg12" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_12.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_12.gif" border="0" id="img12" alt="" <%if(strpath=="images/bg/bgimg_12.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg13','a',13);">
                                                        <input type="radio" name="bg" id="bg13" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_13.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_13.gif" border="0" id="img13" alt="" <%if(strpath=="images/bg/bgimg_13.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg14','a',14);">
                                                        <input type="radio" name="bg" id="bg14" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_14.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_14.gif" border="0" id="img14" alt="" <%if(strpath=="images/bg/bgimg_14.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg15','a',15);">
                                                        <input type="radio" name="bg" id="bg15" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_15.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_15.gif" border="0" id="img15" alt="" <%if(strpath=="images/bg/bgimg_15.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg16','a',16);">
                                                        <input type="radio" name="bg" id="bg16" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_16.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_16.gif" border="0" id="img16" alt="" <%if(strpath=="images/bg/bgimg_16.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg17','a',17);">
                                                        <input type="radio" name="bg" id="bg17" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_17.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_17.gif" border="0" id="img17" alt="" <%if(strpath=="images/bg/bgimg_17.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg18','a',18);">
                                                        <input type="radio" name="bg" id="bg18" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_18.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_18.gif" border="0" id="img18" alt="" <%if(strpath=="images/bg/bgimg_18.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg19','a',19);">
                                                        <input type="radio" name="bg" id="bg19" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_19.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_19.gif" border="0" id="img19" alt="" <%if(strpath=="images/bg/bgimg_19.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg20','a',20);">
                                                        <input type="radio" name="bg" id="bg20" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_20.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_20.gif" border="0" id="img20" alt="" <%if(strpath=="images/bg/bgimg_20.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg21','a',21);">
                                                        <input type="radio" name="bg" id="bg21" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_21.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_21.gif" border="0" id="img21" alt="" <%if(strpath=="images/bg/bgimg_21.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg22','a',22);">
                                                        <input type="radio" name="bg" id="bg22" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_22.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_22.gif" border="0" id="img22" alt="" <%if(strpath=="images/bg/bgimg_22.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg23','a',23);">
                                                        <input type="radio" name="bg" id="bg23" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_23.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_23.gif" border="0" id="img23" alt="" <%if(strpath=="images/bg/bgimg_23.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg24','a',24);">
                                                        <input type="radio" name="bg" id="bg24" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_24.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_24.gif" border="0" id="img24" alt="" <%if(strpath=="images/bg/bgimg_24.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" hidefocus="true" onclick="setok('bg25','a',25);">
                                                        <input type="radio" name="bg" id="bg25" value="" style="cursor: pointer;" <%if(strpath=="images/bg/bgimg_25.gif") {%>checked="checked" <%} %> />&nbsp;&nbsp;
                                                        <img src="../images/bg/bgimg_25.gif" border="0" id="img25" alt="" <%if(strpath=="images/bg/bgimg_25.gif") {%>style="border:1px #f00 solid;" <%} %> />
                                                    </a>
                                                </li>
                                            </ul>
                                            <input type="hidden" name="bgValue" id="bgValue" value="" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="divHidden" style="display: none;">
                                <table>
                                    <tr>
                                        <td>
                                            <img src="images/admin_images/loading.gif" />
                                        </td>
                                        <td>
                                            <span style="color: #666; padding-left: 5px;">正在保存...</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="divShow">
                                <asp:Button ID="btnSave" Text="启用所选背景" runat="server" OnClick="btnSaveClick" CssClass="button" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <%if (strImg != null && strImg != "")
                                  {
                                %>
                                <tr>
                                    <td align="left" height="30" bgcolor="#f2f2f2">
                                        缩略图
                                    </td>
                                    <td bgcolor="#f2f2f2" class="BackGround News2">
                                        <a href="../<%=strImg %>" target="_blank">
                                            <img src="../<%=strImg %>" alt="" /></a>
                                    </td>
                                </tr>
                                <%} %>
                                <tr>
                                    <td width="10%" align="left" height="30" bgcolor="#f2f2f2">
                                        自定义背景图片：<font color='red'>*</font>
                                    </td>
                                    <td width="90%" bgcolor="#f2f2f2">
                                        <asp:TextBox ID="txt_path" value="upload/default.jpg" runat="server" Style="width: 220px" CssClass="txtInput normal left" MaxLength="255"></asp:TextBox>
                                        <a href="javascript:;" class="files">
                                            <input type="file" id="FileUpload" name="FileUpload" onchange="Upload('BackMFile', 'txt_path', 'FileUpload');" /></a>
                                      
                            <span class="uploading">正在上传，请稍候...</span>
                                        <span style="color: Red;">
                                            <asp:Label ID="lpath" runat="server"></asp:Label></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="30">
                                        显示方式：<font color='red'>*</font>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="radlbgDisplayMode" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
                                            <asp:ListItem Text="全平铺" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="居中" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="左右平铺" Value="2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="30" bgcolor="#f2f2f2">
                                        是否启用：<font color='red'>*</font>
                                    </td>
                                    <td bgcolor="#f2f2f2">
                                        <asp:RadioButtonList ID="radlbgState" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                                            <asp:ListItem Text="开启" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="关闭" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="divHidden3" style="display: none;">
                                <table>
                                    <tr>
                                        <td>
                                            <img src="images/admin_images/loading.gif" />
                                        </td>
                                        <td>
                                            <span style="color: #666; padding-left: 5px;">正在保存...</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="divShow3">
                                <asp:Button ID="btnSave3" Text="启用上传背景" runat="server" OnClick="btnSaveClick3" CssClass="button" /></div>
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
