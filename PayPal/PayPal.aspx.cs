using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using basic;
using System.Data.SqlClient;

public partial class PayPal : System.Web.UI.Page
{
    public string strOrderId = null;
    public string strPrice = null;
    public BasicPage bp = new BasicPage();
    public string strPrice1="0.0";
    public int flag = 1;
    public string Usename = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        strOrderId = basic.Tools.RequestClass.GetQueryString("orderid");
        Usename = domain.domainname.GetIndexConfigValue("PayPal");
        SqlDataReader myread = bp.getRead("select top 1 jiage from tborder where bianhao='"+strOrderId+"'");
        if (myread.Read())
        {
            strPrice = myread["jiage"].ToString();
            string HuiLv = domain.domainname.GetIndexConfigValue("HuiLv");
            strPrice1 = (Math.Round(Double.Parse(strPrice)/Double.Parse(HuiLv))).ToString();
            if(Double.Parse(strPrice1) < 0.01)
            {
                flag = 0;
            }
        }
        myread.Close();
    }
}
