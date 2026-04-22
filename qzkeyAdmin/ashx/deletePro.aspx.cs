using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class qzkeyAdmin_ashx_deletePro : Basic.ManagerPage
{
    basic.BasicPage bp = new basic.BasicPage();
    protected void Page_Load(object sender, EventArgs e)
    {
        string strResult = null;
        string strID, strTb;
        string[] id_list = null;

        strID = Request["id"];
        strTb = Request["tb"];
        id_list = strID.Substring(1, strID.Length - 1).Split(',');
        for (int i = 0; i < id_list.Length; i++)
        {
            bp.doExecute("delete from Product where ProId=" + Int32.Parse(id_list[i].ToString()));
        }
        strResult = "success";
        Response.Write(strResult);
    }
}