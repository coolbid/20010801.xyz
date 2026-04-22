//*后台管理页JS函数，Jquery扩展

//================上传文件JS函数开始，需和jquery.form.js一起使用===============
//文件上传
//action        (单张 / 多张 / 其他) 
//repath        (接收返回路径的input阿弟)
//uppath        (上传文件input阿弟)
function Upload(action, repath, uppath)
{

    var sendUrl = "upload.ashx?action=" + action + "&ReFilePath=" + repath + "&UpFilePath=" + uppath;

    //开始提交
    $("#form1").ajaxSubmit
    ({

        beforeSubmit: function (formData, jqForm, options)
        {

        },
        success: function (data, textStatus)
        {
            //alert(data.msg);//0 代表上传失败，1代表上传成功 ，data.msgbox 是返回的信息
            if (data.msg == "1") {
                $("#" + repath).val(data.msgbox);
                if (action == "WaterMFile") {
                    alert("上传成功");
                }
                else {
                    $(".News2 img").attr("src", "/" + data.msgbox);
                }
            }
            else {
                alert(data.msgbox);
            }
        },
        error: function (data, status, e)
        {
            alert("上传失败，错误信息：" + e);

            $("#info").html("上传失败，错误信息：" + e);
        },
        url: sendUrl,
        type: "post",
        dataType: "json",
        timeout: 600000
    });










};