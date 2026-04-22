using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using basic;

public partial class GetState : System.Web.UI.Page
{
    string OrderId = "";
    string zhifuState = "未付款";
    protected void Page_Load(object sender, EventArgs e)
    {

        string OrderId = basic.Tools.RequestClass.GetQueryString("OrderId");
        BasicPage bp = new BasicPage();
        SqlDataReader reader = bp.getRead("select zhuangtai from tborder where bianhao='" + OrderId + "'");
        if (reader.Read())
        {
            zhifuState = reader["zhuangtai"].ToString();
        }
        reader.Close();

        if (zhifuState == "已微信付款")
        {
            Response.Write("1");
        }
        else
        {
            Response.Write("0");
        }
    }
}