var simpleAlert = function (opts)
{
    //设置默认参数
    var opt = {
        "result": "",
        "closeAll": false,
        "btnClose": false,
        "content": "",
        "buttons": {}
    }
    //合并参数
    var option = $.extend(opt, opts);
    //事件
    var dialog = {}


    var $simpleAlert = $('<div class="simpleAlert">');
    var $shelter = $('<div class="simpleAlertShelter">');
    var $simpleAlertBody = $('<div class="simpleAlertBody">');
    var $simpleAlertBodyClose = $('<div class="title"><h2>信息</h2><img class="simpleAlertBodyClose" src="http://www.400301.com/images/simpleAlert/close.png" height="12" width="12"/>  </div>');
    //是否显示关闭按钮
    if (option.btnClose == true)
    {
        $simpleAlertBodyClose = $('<div class="title"><h2>信息</h2></div>');
    }


    //提示图标
    var $simpleAlertBodyContent = $('<p class="simpleAlertBodyContent">' + option.content + '</p>');

    if (option.result == "Success")//成功图标
    {
        $simpleAlertBodyContent = $('<p class="simpleAlertBodyContent" style="background:url(http://www.400301.com/images/simpleAlert/Success.png) 15px center no-repeat">' + option.content + '</p>');
    }
    else if (option.result == "Error")//错误图标
    {
        $simpleAlertBodyContent = $('<p class="simpleAlertBodyContent" style="background:url(http://www.400301.com/images/simpleAlert/icon.png) 15px center no-repeat">' + option.content + '</p>');
    }
    else//其他图标
    {
        $simpleAlertBodyContent = $('<p class="simpleAlertBodyContent" style="background:url(http://www.400301.com/images/simpleAlert/Warning.png) 15px center no-repeat">' + option.content + '</p>');
    }
    dialog.init = function ()
    {
        $simpleAlertBody.append($simpleAlertBodyClose).append($simpleAlertBodyContent);
        var num = 0;
        var only = false;
        var onlyArr = [];
        for (var i = 0; i < 2; i++)
        {
            for (var key in option.buttons)
            {
                switch (i)
                {
                    case 0:
                        onlyArr.push(key);
                        break;
                    case 1:
                        if (onlyArr.length <= 1)
                        {
                            only = true;
                        } else
                        {
                            only = false;
                        }
                        num++;
                        var $btn = $('<button class="simpleAlertBtn simpleAlertBtn' + num + '">' + key + '</button>')
                        $btn.bind("click", option.buttons[key]);
                        if (only)
                        {
                            $btn.addClass("onlyOne")
                        }
                        $simpleAlertBody.append($btn);
                        break;
                }

            }
        }
        $simpleAlert.append($shelter).append($simpleAlertBody);
        $("body").append($simpleAlert);
        $simpleAlertBody.show().animate({ "marginTop": "-128px", "opacity": "1" }, 300);
    }
    //右上角关闭按键事件
    $simpleAlertBodyClose.bind("click", function ()
    {
        option.closeAll = false;
        dialog.close();
    })
    dialog.close = function ()
    {
        if (option.closeAll)
        {
            $(".simpleAlert").remove();
        }
        else
        {

            $simpleAlertBody.animate({ "marginTop": "-188px", "opacity": "0" }, 200, function ()
            {

                $(".simpleAlert").remove()
            });
        }
    }
    dialog.init();
    return dialog;
}