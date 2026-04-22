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

public partial class qzkeyAdmin_shujukubeifen : Basic.ManagerPage
{
    public BasicPage bp = new BasicPage();
    public string strDataPath;
    protected void Page_Load(object sender, EventArgs e)
    {
        strDataPath = HttpContext.Current.Request.PhysicalApplicationPath + "Backup\\";
        bool Backup;
        Backup = bp.DbBackup(bp.strDatabase, strDataPath, DateTime.Now.ToString("yyyy-MMdd-HHmm-ss"));
        if (Backup == true)
        {
            Response.Write("1");
        }
        else
        {
            Response.Write("0");
        }
    }
}

