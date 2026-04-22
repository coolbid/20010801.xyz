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

public partial class Manager_Support : Basic.ManagerPage
{
    WebSite website = new WebSite();
    protected Basic.Model.ManagerInfo admin_info;
    protected void Page_Load(object sender, EventArgs e)
    {
        admin_info = GetAdminInfo();

        btnSave.Attributes.Add("onclick", "return checkNull()");
        if (!IsPostBack)
        {
            showContent();
        }

    }
    protected void showContent()
    {
        int intID = 1;
        SqlDataReader reader = website.GetSupport(intID);
        if (reader.Read())
        {
            radlManage.SelectedValue = reader["StateManage"].ToString();
            radlState.SelectedValue = reader["State"].ToString();
            txtSupportName.Text = reader["SupportName"].ToString();
            txtTitle.Text = reader["Title"].ToString();
            txtWebSite.Text = reader["WebSite"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        int intID = 1;
        int intRowCount = website.UpdateSupport(intID, txtSupportName.Text.Trim(), txtTitle.Text.Trim(), txtWebSite.Text.Trim(), radlState.SelectedValue, radlManage.SelectedValue);
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=技术支持设置成功！&Url=Support.aspx");
        }
    }
}

