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

public partial class Manager_AddNewsSet : Basic.ManagerPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtClassID.Value = basic.Tools.RequestClass.GetQueryString("ClassId");
        }
    }
}
