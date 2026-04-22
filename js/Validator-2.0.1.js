/*! Validator-2.0.1 常用验证插件 By zhushang */

//注意:验证VeriRad时候注意格式，提交按钮给class TyBtnSubmit,被验证的片段放在一个form里并且给form一个id

//验证方法
var ValidatorMessages =
{
    VeriNotNull: "请输入",            //验证不能为空
    VeriPhone: "请输入正确的",        //验证手机号码
    VeriEmail: "请输入正确的",        //验证邮箱
    VeriDigit: "请输入正确的",        //验证大于0的数字
    VeriDate: "请输入正确的",         //验证日期格式 2019-09-01
    VeriQQ: "请输入正确的",           //验证QQ号码
    VeriDdl: "请选择",                //验证下拉列表让选择
    VeriRad: "请选择",                //验证rad选择
    VeriName: "请输入正确的",         //验证用户名 字母开头，允许6-16字母或则数字
    VeriPsw: "请输入正确的",          //验证密码 允许6-16字母数字组合
    VeriEqual: "请输入同样的"         //同样的值
};
$(function ()
{
    //提交事件开始
    $(".TyBtnSubmit").click(function (btn)
    {
        var TYresult = true;
        var formId = $(this).parents("form").attr("id"); //获取当前form ID
        $("#" + formId + " [ty-data^='Veri']").each(function (i)
        {
            var Validator = $(this).attr("ty-data");
            var strs = new Array();
            strs = Validator.split(",");
            for (i = 0; i < strs.length; i++)
            {
                var ziduan = strs[i]; //验证的字段
                var tishi = ValidatorMessages[ziduan]; //对应的提示

                if (tishi)
                {
                    //=======不能为空=======
                    if (ziduan == "VeriNotNull")
                    {
                        var zhi = $(this).val();
                        if (!zhi)
                        {
                            var title = $(this).attr("ty-title");
                            if (!title) { title = ""; }
                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;
                        }
                    }
                    //=======验证手机号码=======
                    if (ziduan == "VeriPhone")
                    {
                        var zhi = $(this).val();
                        var isReg = /^1[3|4|5|6|7|8|9]\d{9}$/; //手机号码验证规则
                        if (!isReg.test(zhi))
                        {
                            var title = $(this).attr("ty-title");
                            if (!title) { title = ""; }
                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;
                        }
                    }
                    //=======验证邮箱=======
                    if (ziduan == "VeriEmail")
                    {
                        var zhi = $(this).val();
                        var isReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                        if (!isReg.test(zhi))
                        {
                            var title = $(this).attr("ty-title");
                            if (!title) { title = ""; }
                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;
                        }
                    }
                    //=======验证QQ号码=======
                    if (ziduan == "VeriQQ")
                    {
                        var zhi = $(this).val();
                        var isReg = /^[1-9]\d{5,11}$/;
                        if (!isReg.test(zhi))
                        {
                            var title = $(this).attr("ty-title");
                            if (!title) { title = ""; }
                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;
                        }
                    }
                    //=======正整数大于0的数字=======
                    if (ziduan == "VeriDigit")
                    {
                        var zhi = $(this).val();
                        var isReg = /^[0-9]*[1-9][0-9]*$/;
                        if (!isReg.test(zhi))
                        {
                            var title = $(this).attr("ty-title");
                            if (!title) { title = ""; }
                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;
                        }
                    }
                    //=======日期 2019-01-02=======
                    if (ziduan == "VeriDate")
                    {
                        var zhi = $(this).val();
                        var isReg = /^((([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29))$/;
                        if (!isReg.test(zhi))
                        {
                            var title = $(this).attr("ty-title");
                            if (!title) { title = ""; }
                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;
                        }
                    }

                    //=======下拉列表请选择=======
                    if (ziduan == "VeriDdl")
                    {
                        var zhi = $(this).val();
                        var title = $(this).attr("ty-title");
                        if (!title) { title = ""; }
                        if (!zhi)
                        {

                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;
                        }
                    }
                    //=======radio请选择=======
                    if (ziduan == "VeriRad")
                    {
                        var tname = $(this).attr("id");
                        var zhi = $("input[name='" + tname + "']:checked").val();
                        var title = $(this).attr("ty-title");
                        if (!title) { title = ""; }
                        if (!zhi)
                        {
                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;
                        }
                    }
                    //=======验证用户名=======
                    if (ziduan == "VeriName")
                    {
                        var zhi = $(this).val();
                        var isReg1 = /^[a-zA-Z]/;  // 字母开头
                        var isReg2 = /[0-9]{1,}/; //包含数字
                        var isReg3 = /^[0-9a-zA-Z]{1,}$/;  //只能包含数组和字母，其他的不行
                        if (isReg3.test(zhi) && zhi.length > 5 && zhi.length < 17)
                        {

                        }
                        else
                        {
                            var title = $(this).attr("ty-title");
                            if (!title) { title = ""; }
                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;
                        }
                    }
                    //=======验证密码=======
                    if (ziduan == "VeriPsw")
                    {
                        var isReg1 = /[a-zA-Z]{1,}/;  // 包含字母
                        var isReg2 = /[0-9]{1,}/;     //包含数字
                        var isReg3 = /^[0-9a-zA-Z]{1,}$/;  //只能包含数组和字母，其他的不行
                        if (isReg3.test(zhi) && zhi.length > 5 && zhi.length < 17)
                        {

                        }
                        else
                        {
                            var title = $(this).attr("ty-title");
                            if (!title) { title = ""; }
                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;

                        }
                    }
                    //=======验证两次输入的值是否一致=======
                    if (ziduan == "VeriEqual")
                    {
                        var zhi = $(this).val();
                        var equalid = $(this).attr("equalid");
                        var title = $(this).attr("ty-title");
                        var ezhi = $("#" + equalid).val();
                        if (zhi != ezhi)
                        {
                            TYalter(tishi + title); $(this).focus(); TYresult = false; return false;
                        }
                    }
                }
            }

        });
        if (!TYresult)
        {
            return false;
        }
        else
        {
            eval($(this).attr("ty-event")); //执行自定义事件
        }
    })
})
//弹出提示
var myalert = "";
function TYalter(content)
{
    myalert = "";
    myalert = "<div class='myShelter' style=\"position: fixed; top: 0; right: 0; bottom: 0; left: 0; z-index: 99; background: rgba(0,0,0,.1);\"></div><div class=\"yir-content\" style=\"z-index: 100; position: fixed; top: -70px; right: 50%; font-family: ;  font-size: 14px; overflow: hidden; margin: 0px auto; text-align: center;  background-color: #fff; line-height: 60px; color: #666; border: 0; border-radius: 4px; padding: 0 20px;\"><img src=\"http://www.400301.com/js/workorder/simpleAlert/img/icon.png\" style=\"position: relative; top: 10px; height: 30px;\" /><span style='padding-left:7px;'>" + content + "</span></div>";

    $("body").append(myalert);
    $(".yir-content").animate({ top: '200px' }, 400);
    setTimeout(function ()
    {
        $(".yir-content").animate({ top: "-70px", }, 200,function (){$(".myShelter").remove(); $(".yir-content").remove();});
    }, 777);

    //控制弹框兼容ie
    var $yirWid = $(".yir-content").innerWidth();
    $(".yir-content").css({ "marginRight": -$yirWid / 2 });
}

function tijiao(result,content) {
    var myTips = simpleAlert({
        "result": result, //Error  Warning
        "btnClose": false, //是否显示关闭按钮
        "content": content,
        "buttons": {
            "确定": function () {
                myTips.close(); return false; //window.open(url, '_self');
            }
        }
    })
    return false;
}
