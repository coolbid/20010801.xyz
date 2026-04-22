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

public partial class Manager_WebSiteControl : Basic.ManagerPage
{
    WebSite website = new WebSite();
    protected Basic.Model.ManagerInfo admin_info;
    string strUserName;
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
        SqlDataReader reader = website.GetWebSiteControl(intID);
        if (reader.Read())
        {
            radlState.SelectedValue = reader["State"].ToString();
            txtTishi.Text = reader["Tishi"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        int intID = 1;
        int intRowCount = website.UpdateWebSiteControl(intID, radlState.SelectedValue, txtTishi.Text);
        if (intRowCount > 0)
        {
            admin_info = GetAdminInfo();
            strUserName = admin_info.UserID;
            Log log = new Log();
            log.AddSingleLog(DateTime.Now.ToString(), Request.UserHostAddress, strUserName, "网站开关-状态：" + radlState.SelectedValue);
            Response.Redirect("Show_Success.aspx?Message=网站运行状态设置成功！&Url=WebSiteControl.aspx");
        }
    }
}

