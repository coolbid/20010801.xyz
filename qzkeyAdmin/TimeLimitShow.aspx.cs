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

public partial class Manager_TimeLimitShow : Basic.ManagerPage
{
    Time time = new Time();
    public int TimeRemainingDays;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showContent();
        }
    }
    protected void showContent()
    {
        int intID = 1;
        SqlDataReader reader = time.GetTimeLimit(intID);
        if (reader.Read())
        {
            lBeginTime.Text = reader["BeginTime"].ToString();
            lEndTime.Text = reader["EndTime"].ToString();
            DateTime t1 = DateTime.Now;
            DateTime t2 = Convert.ToDateTime(lEndTime.Text);
            TimeSpan ts = t2 - t1;
            TimeRemainingDays = ts.Days;
        }
        reader.Close();
    }
}

