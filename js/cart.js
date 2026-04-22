//加入购物车
function Addcart(Proid)//Proid为传输过来的产品id
{
    $.ajax({
        type: "get",
        url: "/Check/Cart.aspx?Proid=" + Proid +"&Action=add",
        datatype: "json",
        success: function (data) {
            if (data == "true") {
                window.location.href = "/shoppingcart";
            }
            else {
                alert("加入购物车出错,请刷新!");
            }
        },
        error: function (msg) {
            alert("加入购物车出错,请刷新!");
        }
    });
}

//-
function jian(Proid) {
    var number = $(".PDI" + Proid).find(".wenzi input").val();
    if (number > 1) {
        $.ajax({
            type: "get",
            url: "/Check/Cart.aspx?Proid=" + Proid + "&Action=jian",
            datatype: "json",
            success: function (data) {
                if (data == "true") {
                    $(".PDI" + Proid).find(".wenzi input").val(parseInt(number) - 1);
                    jisuan(Proid);
                    jisuanzj();
                }
                else {
                    alert("出错,请刷新!");
                }
            },
            error: function (msg) {
                alert("出错,请刷新!");
            }
        });
    }
}

//+
function jia(Proid) {
    var number = $(".PDI" + Proid).find(".wenzi input").val();
        $.ajax({
            type: "get",
            url: "/Check/Cart.aspx?Proid=" + Proid + "&Action=jia",
            datatype: "json",
            success: function (data) {
                if (data == "true") {
                    $(".PDI" + Proid).find(".wenzi input").val(parseInt(number) + 1);
                    jisuan(Proid);
                    jisuanzj();
                }
                else {
                    alert("出错,请刷新!");
                }
            },
            error: function (msg) {
                alert("出错,请刷新!");
            }
        });
}


//×
function DeleteCart(Proid) {
    $.ajax({
        type: "get",
        url: "/Check/Cart.aspx?Proid=" + Proid + "&Action=Del",
        datatype: "json",
        success: function (data) {
            if (data == "true") {
                $(".PDI" + Proid).parent().remove();
                var oDiv = document.getElementsByClassName('ech');//获取class="ech"的集合,判断其的个数
                if (oDiv.length > 0) {
                    jisuanzj();
                }
                else {
                    $(".qzl1").show();
                    $(".qzl").hide()
                }
            }
            else {
                alert("出错,请刷新!");
            }
        },
        error: function (msg) {
            alert("出错,请刷新!");
        }
    });
}

//清空购物车
function Empty() {
    $.ajax({
        type: "get",
        url: "/Check/Cart.aspx?Action=Empty",
        datatype: "json",
        success: function (data) {
            if (data == "true") {
                    $(".qzl1").show();
                    $(".qzl").hide()
            }
            else {
                alert("出错,请刷新!");
            }
        },
        error: function (msg) {
            alert("出错,请刷新!");
        }
    });
}

function onInput(Proid){
    var number = $(".PDI" + Proid).find(".wenzi input").val();
    if (number.length == 1) {
        number = number.replace(/[^1-9]/g, '');
        $(".PDI" + Proid).find(".wenzi input").val(number);
    } else {
        number = number.replace(/\D/g, '');
        $(".PDI" + Proid).find(".wenzi input").val(number);
    }
    if (number == '')
    {
        number = 1;
        $(".PDI" + Proid).find(".wenzi input").val(number);
    }



    $.ajax({
        type: "get",
        url: "/Check/Cart.aspx?Proid=" + Proid + "&Action=Change&number="+number,
        datatype: "json",
        success: function (data) {
            if (data == "true") {
                jisuan(Proid);
                jisuanzj();
            }
            else {
                alert("出错,请刷新!");
            }
        },
        error: function (msg) {
            alert("出错,请刷新!");
        }
    });
}

function onpropertychange(Proid) {
    var number = $(".PDI" + Proid).find(".wenzi input").val();



    var number = $(".PDI" + Proid).find(".wenzi input").val();
    if (number.length == 1) {
        number = number.replace(/[^1-9]/g, '');
        $(".PDI" + Proid).find(".wenzi input").val(number);
    } else {
        number = number.replace(/\D/g, '');
        $(".PDI" + Proid).find(".wenzi input").val(number);
    }

    if (number == '') {
        number = 1;
        $(".PDI" + Proid).find(".wenzi input").val(number);
    }



    $.ajax({
        type: "get",
        url: "/Check/Cart.aspx?Proid=" + Proid + "&Action=Change&number=" + number,
        datatype: "json",
        success: function (data) {
            if (data == "true") {
                jisuan(Proid);
                jisuanzj();
            }
            else {
                alert("出错,请刷新!");
            }
        },
        error: function (msg) {
            alert("出错,请刷新!");
        }
    });
}

//计算购物车中某个商品的总价 并改变
function jisuan(Proid)
{
    var number = $(".PDI" + Proid).find(".wenzi input").val();
    var dj = $(".PDI" + Proid).parent().find(".dj").text();
    var as = parseInt(number) * parseFloat(dj);
    $(".PDI" + Proid).parent().find(".zj").text(as.toFixed(2));
}

//计算购物车合计 并改变
function jisuanzj() {
    var hj = "0.0";
    $(".ech").each(function () {
        var zj = $(this).find(".zj").text();
        hj = parseFloat(hj) + parseFloat(zj);
    });
    $(".hj").text(hj.toFixed(2));
}


function FillOrders() {
    document.getElementById("divShow").style.display = "";
    document.getElementById("divHidden").style.display = "none";
    window.location.href = "/fillorders";
}

function GouWu() {
    window.location.href = "/product";
}

