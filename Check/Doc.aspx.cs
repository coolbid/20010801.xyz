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
using System.Reflection;
using System.IO;
using WebApp.Components;

public partial class Doc : System.Web.UI.Page
{
    BasicPage bp = new BasicPage();
    int intID;
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools systemtools = new SystemTools();
        if (systemtools.IsNumberic(Request["ID"]))//判断参数是否合法
        {
            intID = Int32.Parse(Request["ID"]);
            updatehits();
        }
    }
    protected void updatehits()
    {
        string strurl = null;
        if (bp.doExecute("update News set hits=hits+1 where id=" + intID + ""))
        {
            SqlDataReader myreader = bp.getRead("select Fujian from News where id=" + intID + "");
            if (myreader.Read())
            {
                strurl = myreader["Fujian"].ToString();
            }
            myreader.Close();
        }
        string filePath = Server.MapPath("../" + strurl); //获取绝对文件路径
        if (File.Exists(filePath))//判断文件是否存在
        {
            Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(strurl.Substring(7, strurl.Length - 7), System.Text.Encoding.UTF8));
            Response.TransmitFile(filePath);//写到输出流中
        }
        else
        {
            Response.Write("不存在该文件");
        }
    }
}
