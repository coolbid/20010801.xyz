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

public partial class Checkpinlun : System.Web.UI.Page
{
    BasicPage bp = new BasicPage();
    protected void Page_Load(object sender, EventArgs e)
    {
        string All = basic.Tools.RequestClass.GetQueryString("All");
        string Proid = basic.Tools.RequestClass.GetQueryString("Proid");
        string Name = basic.Tools.RequestClass.GetQueryString("Name");
        if (bp.doExecute("insert into tbpinlun(Name,Content,Proid,putdate) values('" + Name + "','" + All + "','" + Proid + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "')"))
        {
            Response.Write("success");
        }

    }
}
