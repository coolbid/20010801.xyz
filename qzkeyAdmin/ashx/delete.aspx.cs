using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.Components;

public partial class qzkeyAdmin_ashx_delete : Basic.ManagerPage
{
    basic.BasicPage bp = new basic.BasicPage();
    protected Basic.Model.ManagerInfo admin_info;
    string strUserName;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strResult = null;
        string strID, strTb;
        string[] id_list = null;

        if (!Page.IsPostBack)
        {
            admin_info = GetAdminInfo();
            strUserName = admin_info.UserID;
        }
        strID = Request["id"];
        strTb = Request["tb"];
        id_list = strID.Substring(1, strID.Length - 1).Split(',');
        for (int i = 0; i < id_list.Length; i++)
        {
            Log log = new Log();
            log.AddSingleLog(DateTime.Now.ToString(), Request.UserHostAddress, strUserName, "删除 " + strTb + "-Id：" + id_list[i].ToString());

            bp.doExecute("delete from " + strTb + " where ID=" + Int32.Parse(id_list[i].ToString()));
        }
        strResult = "success";

        Response.Write(strResult);
    }
}