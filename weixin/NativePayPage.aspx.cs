using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Text;
using ThoughtWorks;
using ThoughtWorks.QRCode;
using ThoughtWorks.QRCode.Codec;
using ThoughtWorks.QRCode.Codec.Data;
using WxPayAPI;
using System.Data.SqlClient;
using System.Data;
using basic;

public partial class NativePayPage : System.Web.UI.Page
{
    public string OrderId = "";
    public string ImgUrl = "";
    public string TotalPrice = "";
    public string Price = "";
    public string zhifuState = "未付款";
    public string strState = "";
    BasicPage bp = new BasicPage();
    protected void Page_Load(object sender, EventArgs e)
    {

        string strOrderid = basic.Tools.RequestClass.GetQueryString("orderid");
        string strPrice = "";
        SqlDataReader myread = bp.getRead("select top 1 jiage from tborder where bianhao='" + strOrderid + "'");
        if (myread.Read())
        {
            strPrice = myread["jiage"].ToString();
        }
        myread.Close();
        Price = strPrice;
        strPrice = Convert.ToInt32(Decimal.Parse(strPrice) * 100).ToString();
        if (strPrice != "")
        {
            OrderId = strOrderid;
            NativePay nativePay = new NativePay();
            string Url = nativePay.GetPayUrl(strOrderid, strPrice);

            //将url生成二维码图片
            ImgUrl = "MakeQRCode.aspx?data=" + HttpUtility.UrlEncode(Url);

        }

    }

}