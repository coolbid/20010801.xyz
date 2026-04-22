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
using basic;
using System.IO;
using WebApp.Components;
using System.Text;

public partial class Manager_ProAdd : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    Products products = new Products();
    public int rowCount;//用来记录总记录数
    DataSet dst = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            fenlei.Value = basic.Tools.RequestClass.GetQueryString("Fenlei");
            proname.Value = basic.Tools.RequestClass.GetQueryString("ProName");
            txtCheck.Value = basic.Tools.RequestClass.GetQueryString("Check");
        }

    }
}

