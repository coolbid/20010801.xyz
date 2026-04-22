//»ñÈ¡Ëæ»úÂë
function GetCode(len)
{
    code = "";
    var selectChar = new Array('0.', '1.', '2.', '3.', '4.', '5.', '6.', '7.', '8.', '9.', 'A', 'B', 'C', 'D', 'V', 'a', 'g', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'x', 'y', 'z');
    for (var i = 0; i < len; i++)
    {
        var charIndex = Math.floor(Math.random() * 26);
        code += selectChar[charIndex];
    }
    return "a" + code;
}