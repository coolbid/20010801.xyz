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
using System.Data.SqlClient;
using WebApp.Components;
using basic;
using domain;

public partial class Pay : System.Web.UI.Page
{
    public string strColumnName = "在线支付";
    public string strWebUrl = "http://" + HttpContext.Current.Request.Url.Host;
    public DataTable newdt;
    public BasicPage bp = new BasicPage();
    public MyClass mc = new MyClass();
    public domainname dn = new domainname();
    public string orderid;
    public string strPrice1 = "0.0";
    public int flag = 1;
    public string strPrice = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        Common common = new Common();
        ClientSEO clientseo = common.showSEO();
        this.Title = "在线支付-" + mc.ShowWebsiteKeyById(1, "CompanyName");
        dn.GetBuyControl();
        orderid = Request["orderid"];
        SqlDataReader myread = bp.getRead("select top 1 jiage from tborder where bianhao='" + orderid + "'");
        if (myread.Read())
        {
            strPrice = myread["jiage"].ToString();
            string HuiLv = domain.domainname.GetIndexConfigValue("HuiLv");
            strPrice1 = (Math.Round(Double.Parse(strPrice) / Double.Parse(HuiLv))).ToString();
            if (Double.Parse(strPrice1) < 0.01)
            {
                flag = 0;
            }
        }
    }
}
