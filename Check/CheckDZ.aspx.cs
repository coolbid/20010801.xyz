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

public partial class CheckDZ : System.Web.UI.Page
{
    BasicPage bp = new BasicPage();
    protected void Page_Load(object sender, EventArgs e)
    {
        string Proid = basic.Tools.RequestClass.GetQueryString("Proid");
        string action = basic.Tools.RequestClass.GetQueryString("action");
        string sql = "";
        if(action=="zan")
        {
            sql = "update News set state=state+1 where id='" + Proid + "'";
        }
        else if(action=="cai")
        {
            sql = "update News set status=status+1 where id='" + Proid + "'";
        }
        if (bp.doExecute(sql))
        {
            Response.Write("success");
        }

    }
}
