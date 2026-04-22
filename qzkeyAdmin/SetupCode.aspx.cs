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

public partial class Manager_SetupCode : Basic.ManagerPage
{
    WebSite website = new WebSite();
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("onclick", "return checkNull()");
        if (!IsPostBack)
        {
            showContent();
        }

    }
    protected void showContent()
    {
        int intID = 1;
        SqlDataReader reader = website.GetSetupCode(intID);
        if (reader.Read())
        {
            radlState.SelectedValue = reader["State"].ToString();
            txtContent.Text = reader["Content"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        int intID = 1;
        int intRowCount = website.UpdateSetupCode(intID, radlState.SelectedValue, txtContent.Text);
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=嵌入代码保存成功！&Url=SetupCode.aspx");
        }
    }
}

