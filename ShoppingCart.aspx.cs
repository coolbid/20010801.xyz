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

public partial class ShoppingCart : System.Web.UI.Page
{
    public string strWebUrl = "http://" + HttpContext.Current.Request.Url.Host;
    public BasicPage bp = new BasicPage();
    public domainname dn = new domainname();
    public MyClass mc = new MyClass();
    public string Mac;
    protected void Page_Load(object sender, EventArgs e)
    {
        Common common = new Common();
        ClientSEO clientseo = common.showSEO();
        this.Title = "购物车-" + mc.ShowWebsiteKeyById(1, "CompanyName");
        dn.GetBuyControl();
        Mac = basic.Tools.RequestClass.getLocalMac();//获取本机物理地址
        showcart();
    }
    public DataTable dtbcart = new DataTable();
    public int intcart;
    public void showcart()
    {
        dtbcart = bp.SelectDataBase("news", "select * from shoppingcart where Mac='" + Mac + "' order by id desc").Tables[0];
        intcart = dtbcart.Rows.Count;
    }

    public string ShowPro(int Proid,string key)
    {
        string context = null;
        SqlDataReader myread = bp.getRead("select "+ key + " from Product where Proid=  " + Proid);
        if (myread.Read())
        {
            context = myread[key].ToString();
        }
        myread.Close();
        return context;
    }
    public bool IsNumberic(string oText)//判断是否是数字(包含小数)
    {
        try
        {
            Double var1 = System.Convert.ToDouble(oText);
            return true;
        }
        catch
        {
            return false;
        }
    }



}
