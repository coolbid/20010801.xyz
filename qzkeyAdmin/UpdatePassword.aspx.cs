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

public partial class Manager_UpdatePassword : Basic.ManagerPage
{
    protected Basic.Model.ManagerInfo admin_info;
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("onclick", "return checkNull()");
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        admin_info = GetAdminInfo();
        string strUserName = admin_info.UserID;

        bool sign = false;
        Admin admin = new Admin();
        SqlDataReader reader = admin.GetAdminLogin(strUserName, txtAdminPassword.Text.Trim());
        if (reader.Read())
        {
            sign = true;
        }
        reader.Close();
        if (sign == true)
        {
            int intRowCount = admin.UpdateAdminPassword(strUserName, txtAdminPassword.Text.Trim(), txtAdminPassword2.Text.Trim());
            if (intRowCount > 0)
            {
                Session[Basic.Keys.SessonAdminModel] = null;
                Basic.Engine.CookieDo.WriteCookie("UserID", "str_key", -14400);
                Basic.Engine.CookieDo.WriteCookie("Role", "str_key", -14400);
                Basic.Engine.CookieDo.WriteCookie("Password", "str_key", -14400);
                Response.Write("<script language='javascript'>alert('修改成功，请从新登录！');window.open('Login.aspx')</script>");
            }
        }
        else
        {
            Response.Redirect("Show_Error.aspx?message=原密码不正确，密码修改失败！&url=UpdatePassword.aspx");
        }
    }
}

