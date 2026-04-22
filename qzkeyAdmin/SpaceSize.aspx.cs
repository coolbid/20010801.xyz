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

public partial class Manager_SpaceSize : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    public string Leixing;
    protected void Page_Load(object sender, EventArgs e)
    {
        Lspace.Text = Math.Round(Convert.ToDouble(bp.GetDirectoryLength(HttpContext.Current.Request.PhysicalApplicationPath)) / 1048576, 2).ToString() + "M";
        //SqlDataReader myread = bp.getRead("select top 1 Type from TbTimeLimit");
        //if (myread.Read())
        //{
        //    Leixing = myread[0].ToString();
        //    if (Leixing == "入门型")
        //    {
        //        Leixing = "20M";
        //    }
        //    if (Leixing == "标准型")
        //    {
        //        Leixing = "100M";
        //    }
        //    if (Leixing == "旗舰型")
        //    {
        //        Leixing = "1000M";
        //    }
        //    if (Leixing == "定制型")
        //    {
        //        Leixing = "1000M";
        //    }
        //}
        //myread.Close();
    }
}

