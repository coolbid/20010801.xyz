<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNews.aspx.cs" Inherits="Manager_AddNews" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>批量上传</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1-7-2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input runat="server" type="hidden" id="txtTitle" value="" />
    <input runat="server" type="hidden" id="txtCheck" value="" />
    <input runat="server" type="hidden" id="txtClassID" value="" />
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
                                批量上传
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
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="left_txt" bgcolor="#f2f2f2" align="left">
                            <a href="NewsClass.aspx">返回导航菜单</a>
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                    <tr>
                        <td class="td_left">
                        </td>
                        <td class="td_right" style="padding-top: 40px;">
                            <div id="content">
                                <div id="swfu_container" style="margin: 0px 0px;">
                                    <div>
                                        <span id="spanButtonPlaceholder"></span>
                                    </div>
                                    <div id="divFileProgressContainer" style="height: 75px;">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
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
    <%--批量添加--%>
    <script type="text/javascript" src="swfupload/swfupload.js"></script>
    <script type="text/javascript" src="js/handlers.js"></script>
    <script type="text/javascript">
        var swfu;
        window.onload = function ()
        {

            swfu = new SWFUpload({

                upload_url: "Tools/uploadnews.aspx?ClassID=" + escape($("#txtClassID").val()) + "&Title=" + escape($("#txtTitle").val()) + "&Check=" + escape($("#txtCheck").val()),
                post_params: {
                    "ASPSESSID": "<%=Session.SessionID %>" // 附加参数,版本2新功能
                },

                // File Upload Settings
                file_size_limit: "29 MB", // 单位kb, 限制文件大小
                file_types: "*.jpg;*.gif;*.png;*.jpeg", //允许的文件类型
                file_types_description: "JPG Images",
                file_upload_limit: "999",    // Zero means unlimited

                file_queue_error_handler: fileQueueError,
                file_dialog_complete_handler: fileDialogComplete,
                upload_progress_handler: uploadProgress,
                upload_error_handler: uploadError,
                upload_success_handler: uploadSuccess,
                upload_complete_handler: uploadComplete,

                // Button settings
                button_image_url: "images/XPButtonNoText_160x22.png",
                button_placeholder_id: "spanButtonPlaceholder",
                button_width: 160,
                button_height: 22,
                button_text: '<span class="button">选择图片</span>',
                button_text_style: '.button { font-size: 14px; line-height:22px; text-align:center;}',
                button_text_top_padding: 1,
                button_text_left_padding: 5,

                // Flash Settings
                flash_url: "swfupload/swfupload.swf", // Relative to this file

                custom_settings: {
                    upload_target: "divFileProgressContainer"
                },

                // Debug Settings
                debug: false
            });
        }
    </script>
</body>
</html>
