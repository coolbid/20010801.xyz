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

public partial class Manager_TimeLimit : Basic.ManagerPage
{
    Time time = new Time();
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
        SqlDataReader reader = time.GetTimeLimit(intID);
        if (reader.Read())
        {
            //txtNumber.Text = reader["Number"].ToString();
            txtBeginTime.Text = reader["BeginTime"].ToString();
            txtEndTime.Text = reader["EndTime"].ToString();
            txtEmail.Text = reader["Email"].ToString();
            dropType.SelectedValue = reader["Type"].ToString();
            //txtMobile.Text = reader["Mobile"].ToString();
            // txtQQ.Text = reader["QQ"].ToString();
            txtSMSToMobile.Text = reader["SMSToMobile"].ToString();
            radlSMSState.SelectedValue = reader["SMSState"].ToString();
            // txtPrice.Text = reader["Price"].ToString();
            txtPhone.Text = reader["Phone"].ToString();
            txtBeizhu.Text = reader["Beizhu"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        int intID = 1;
        int intRowCount = time.UpdateTimeLimit(intID, txtBeginTime.Text.Trim(), txtNumber.Text.Trim(), txtEndTime.Text.Trim(), txtEmail.Text.Trim(), dropType.SelectedValue, txtMobile.Text.Trim().Replace("-", ""), txtQQ.Text.Trim(), txtSMSToMobile.Text.Trim(), radlSMSState.SelectedValue, Double.Parse(txtPrice.Text), txtPhone.Text.Trim(), txtBeizhu.Text.Trim());
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=网站配置成功！&Url=TimeLimit.aspx");
        }
    }
}
