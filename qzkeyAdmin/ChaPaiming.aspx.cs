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
using System.Net;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Xml;

public partial class qzkeyAdmin_ChaPaiming : Basic.ManagerPage
{
    public string strMapPath = HttpContext.Current.Server.MapPath("/Upload/config/seo.txt");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}