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

public partial class Manager_SubmitForm : Basic.ManagerPage
{
    Submit Submit = new Submit();
    protected Basic.Model.ManagerInfo admin_info;
    protected void Page_Load(object sender, EventArgs e)
    {
        admin_info = GetAdminInfo();
        string strRole = admin_info.Role;
        if (strRole == "1")
        {
            btnSave.Attributes.Add("onclick", "return checkNull()");
            if (!IsPostBack)
            {
                showContent();
            }
        }
        else
        {
            Response.Write("<script>");
            Response.Write("alert('没有访问该文件的权限');parent.location.href='login.aspx'");
            Response.Write("</script>");
        }
    }
    protected void showContent()
    {
        int intID = 1;
        SqlDataReader reader = Submit.GetForm(intID);
        if (reader.Read())
        {
            radlState.SelectedValue = reader["FormState"].ToString();
            txtContent.Text = reader["FormContent"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        int intID = 1;
        int intRowCount = Submit.UpdateSetForm(intID, radlState.SelectedValue, txtContent.Text);
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=表单保存成功！&Url=SubmitForm.aspx");
        }
    }
}

