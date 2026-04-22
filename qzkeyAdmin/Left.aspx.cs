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

public partial class Manager_Left : Basic.ManagerPage
{
    public string strFormState = null;
    public string strvip;
    protected void Page_Load(object sender, EventArgs e)
    {
        strvip = domain.domainname.GetIndexConfigValue("VIPControl");
        if (!IsPostBack)
        {
            showContent();
        }
    }
    protected void showContent()
    {
        Submit Submit = new Submit();
        int intID = 1;
        SqlDataReader reader = Submit.GetForm(intID);
        if (reader.Read())
        {
            strFormState = reader["FormState"].ToString();
        }
        reader.Close();
    }
}

