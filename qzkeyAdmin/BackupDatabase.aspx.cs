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
using basic;

public partial class Manager_BackupDatabase : Basic.ManagerPage
{
    public BasicPage bp = new BasicPage();
    public string strDataPath;
    protected void Page_Load(object sender, EventArgs e)
    {
        button1.Attributes.Add("onclick", "return checkNull()");
        strDataPath = HttpContext.Current.Request.PhysicalApplicationPath + "Backup\\";
    }
    protected void button1_click(object s, EventArgs e)
    {
        bool Backup;
        Backup = bp.DbBackup(bp.strDatabase, strDataPath, DateTime.Now.ToString("yyyy-MMdd-HHmm-ss"));
        if (Backup == true)
        {
            Response.Redirect("Show_Success.aspx?Message=数据库备份成功！&Url=BackupDatabase.aspx");
        }
    }
}

