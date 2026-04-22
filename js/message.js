//检验提交数据格式合法性
function checkNull() {
    var code = document.getElementById("txtCode").value;
    var title = document.getElementById("txtTitle").value;
    var realname = document.getElementById("txtRealname").value;
    var phone = document.getElementById("txtPhone").value;
    var email = document.getElementById("txtEmail").value;
    var content = document.getElementById("txtContent").value;
    document.getElementById('Button1').disabled = true;
    document.getElementById("divbutton").style.display = "none";
    document.getElementById("loading").style.display = "block";
    //提交信息开始
    $.ajax({
        type: "get",
        url: "/Check/CheckMessage.aspx?Title=" + escape(title) + "&Realname=" + escape(realname) + "&Phone=" + escape(phone) + "&Email=" + escape(email) + "&Content=" + escape(content) + "&Code=" + escape(code),
        success: function (msg) {
            if (msg == "success") {
                document.getElementById("divbutton").style.display = "block";
                document.getElementById("loading").style.display = "none";
                tijiao("Success", "恭喜你，提交成功！");
                setTimeout(function () {
                    window.location.reload();
                }, 1000);
            }
            else if (msg == "failure") {
                document.getElementById('Button1').disabled = false;
                document.getElementById("divbutton").style.display = "block";
                document.getElementById("loading").style.display = "none";
                tijiao("Error","很遗憾，提交失败！");
            }
            else if (msg == "error") {
                document.getElementById('Button1').disabled = false;
                document.getElementById("divbutton").style.display = "block";
                document.getElementById("loading").style.display = "none";
                tijiao("Error","您的请求带有不合法的参数，谢谢合作！");
            }
            else if (msg == "false") {
                document.getElementById('Button1').disabled = false;
                document.getElementById("divbutton").style.display = "block";
                document.getElementById("loading").style.display = "none";
                tijiao("Error","验证码错误！");
            }
        }
    });
    //提交信息结束
}
//验证码，看不请，换一张
function imgchange(imgid) {
    var img = document.getElementById(imgid);
    img.src = img.src + '?' + Math.random();
}
//获得焦点
document.onkeydown = function (event) {
    e = event ? event : (window.event ? window.event : null);
    if (e.keyCode == 13) {
        document.getElementById("Button1").click();
        return false;
    }
}