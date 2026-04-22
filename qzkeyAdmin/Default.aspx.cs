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
using WebApp.Components;
using System.Data.SqlClient;
using basic;

public partial class Manager_Default : Basic.ManagerPage
{

    public string strQq = "";
    public string strUserName = "";
    public string strRole = "0";

    protected Basic.Model.ManagerInfo admin_info;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            admin_info = GetAdminInfo();
            strUserName = admin_info.UserID;
            strRole = admin_info.Role;
        }

        BasicPage bp = new BasicPage();
        SqlDataReader myread = bp.getRead("select Phone from TbTimeLimit");
        if (myread.Read())
        {
            strQq = myread[0].ToString();
        }
        myread.Close();
    }
}

