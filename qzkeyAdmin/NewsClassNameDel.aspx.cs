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
using WebApp.Components;

public partial class Manager_NewsClassNameDel : Basic.ManagerPage
{
    NewsClass newsclass = new NewsClass();
    int intID;
    BasicPage bp = new BasicPage();
    string strUserName = "";
    string strRole1 = "";

    protected Basic.Model.ManagerInfo admin_info;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            admin_info = GetAdminInfo();
            strUserName = admin_info.UserID;
            strRole1 = admin_info.Role;
        }

        SystemTools system = new SystemTools();
        if (system.IsNumberic(Request["ID"]))
        {
            intID = Int32.Parse(Request["ID"]);
            if (!IsPostBack)
            {
                DelColumnName();
            }
        }
    }
    private void DelColumnName()
    {
        SqlDataReader reader = newsclass.GetColumnListSub(intID);
        if (reader.Read())
        {
            reader.Close();
            Response.Redirect("Show_Error.aspx?message=删除失败，先删除其子栏目！&url=NewsClass.aspx");
        }
        else
        {
            reader.Close();
            if (strRole1 == "1")
            {
                int intRowCount = newsclass.DeleteSingleColumnList(intID);
                if (intRowCount > 0)
                {
                    Log log = new Log();
                    log.AddSingleLog(DateTime.Now.ToString(), Request.UserHostAddress, strUserName, "删除栏目-Id：" + intID);
                    bp.doExecute("delete from news where classid=" + intID);
                    Response.Redirect("Show_Success.aspx?message=删除成功！&url=NewsClass.aspx");
                }
            }
            else
            {
                string strRole = null;
                reader = newsclass.GetSingleColumnList(intID);
                if (reader.Read())
                {
                    strRole = reader["Role"].ToString();
                }
                reader.Close();
                if (strRole == "0")
                {
                    int intRowCount = newsclass.DeleteSingleColumnList(intID);
                    if (intRowCount > 0)
                    {
                        Log log = new Log();
                        log.AddSingleLog(DateTime.Now.ToString(), Request.UserHostAddress, strUserName, "删除栏目-Id：" + intID);
                        bp.doExecute("delete from news where classid=" + intID);
                        Response.Redirect("Show_Success.aspx?message=删除成功！&url=NewsClass.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Show_Error.aspx?message=系统默认设置，无法删除！&url=NewsClass.aspx");
                }
            }
        }
    }
}

