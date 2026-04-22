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

public partial class GetStatistics : System.Web.UI.Page
{
    //获取流量统计
    BasicPage bp = new BasicPage();
    protected void Page_Load(object sender, EventArgs e)
    {

        string Putdate = DateTime.Now.ToString("yyyy-MM-dd");

        //今日流量
        string strToday = "0";
        SqlDataReader RreadToday = bp.getRead("select Number from TbLiuliang where Putdate='" + Putdate + "'");
        if (RreadToday.Read())
        {
            strToday = RreadToday["Number"].ToString();
        }
        RreadToday.Close();

        //昨日流量
        string strYesToday = "0";
        SqlDataReader RreadYesToday = bp.getRead("select Number from TbLiuliang where Putdate='" + DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd") + "'");
        if (RreadYesToday.Read())
        {
            strYesToday = RreadYesToday["Number"].ToString();
        }
        RreadYesToday.Close();

        //本月流量
        string strMonth = "0";
        SqlDataReader RreadMonth = bp.getRead("select sum(Number) from TbLiuliang where Putdate like '" + DateTime.Now.ToString("yyyy-MM") + "%'");
        if (RreadMonth.Read())
        {
            strMonth = RreadMonth[0].ToString();
        }
        RreadMonth.Close();

        //总流量
        string strTotal = "0";
        SqlDataReader RreadTotal = bp.getRead("select sum(Number) from TbLiuliang");
        if (RreadTotal.Read())
        {
            strTotal = RreadTotal[0].ToString();
        }
        RreadTotal.Close();

        //返回数据
        Response.Write(strToday + "|" + strYesToday + "|" + strMonth + "|" + strTotal);
    }
}