<%@ WebHandler Language="C#" Class="Paixu" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Data;
using System.Data.SqlClient;

public class Paixu : IHttpHandler, IRequiresSessionState
{
    WebApp.Components.SystemTools systemtools = new WebApp.Components.SystemTools();
    basic.BasicPage bp = new basic.BasicPage();
    protected Basic.Model.ManagerInfo admin_info;
    public void ProcessRequest(HttpContext context)
    {
        string strResult = null;
        string strxuhao = null;
        string strpaixu = null;
        string strColumnValue = null;
        string strColumnUrl = null;
        string strColumnType = null;
        string[] xuhao = null;
        string[] paixu = null;
        string[] ColumnValue = null;
        string[] ColumnUrl = null;
        string[] ColumnType = null;

        bool returnValue = false;
        returnValue = systemtools.StartProcessRequest();

        admin_info = new Basic.ManagerPage().GetAdminInfo();
        if (admin_info != null)
        {
            if (returnValue == true)
            {
                strxuhao = context.Request["xuhao"];
                strpaixu = context.Request["paixu"];
                strColumnValue = context.Request["columnValue"];
                strColumnType = context.Request["ColumnType"];
                strColumnUrl = context.Request["ColumnUrl"];
                xuhao = strxuhao.Substring(1, strxuhao.Length - 1).Split(',');
                paixu = strpaixu.Substring(1, strpaixu.Length - 1).Split(',');
                ColumnValue = strColumnValue.Substring(1, strColumnValue.Length - 1).Split(',');
                ColumnType = strColumnType.Substring(1, strColumnType.Length - 1).Split(',');
                ColumnUrl = strColumnUrl.Substring(1, strColumnUrl.Length - 1).Split(',');
                for (int i = 0; i < xuhao.Length; i++)
                {
                    string ColumnTypeNew = ColumnType[i].ToString();
                    int Columnid = Int32.Parse(xuhao[i].ToString());
                    SqlDataReader myread = bp.getRead("select ColumnType from ColumnList where id=" + Columnid);
                    if (myread.Read())
                    {
                        if (myread[0].ToString() == ColumnTypeNew)//栏目类型没改变
                        {
                            bp.doExecute("update ColumnList set ColumnName=N'" + ColumnValue[i].ToString() + "',ColumnNo=" + Int32.Parse(paixu[i].ToString()) + ",ColumnUrlClient=N'" + ColumnUrl[i].ToString() + "' where ID=" + Columnid);
                        }
                        else
                        {
                            bp.doExecute("update ColumnList set ColumnType=N'" + ColumnTypeNew + "',ColumnName=N'" + ColumnValue[i].ToString() + "',ColumnNo=" + Int32.Parse(paixu[i].ToString()) + ",ColumnUrlClient=N'" + showUrl(ColumnTypeNew, Columnid) + "' where ID=" + Columnid);
                        }
                    }
                    myread.Close();
                }
                strResult = "success";
            }
            else
            {
                strResult = "failure";
            }
        }
        else
        {
            strResult = "Disconnect";
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(strResult);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    protected string showUrl(string strColumnType, int intID)
    {
        string strColumnUrlClient = null;

        if (strColumnType == "最终页面")
        {
            strColumnUrlClient = "/about/" + intID;
        }
        else if (strColumnType == "联系方式")
        {
            strColumnUrlClient = "/contact/" + intID;
        }
        else if (strColumnType == "新闻列表")
        {
            strColumnUrlClient = "/news/" + intID;
        }
        else if (strColumnType == "下载中心")
        {
            strColumnUrlClient = "/download/" + intID;
        }
        else if (strColumnType == "二级分类")
        {
            strColumnUrlClient = "/newsclass/" + intID;
        }
        else if (strColumnType == "图片相册")
        {
            strColumnUrlClient = "/photo/" + intID;
        }
        else if (strColumnType == "图片列表")
        {
            strColumnUrlClient = "/piclist/" + intID;
        }
        else if (strColumnType == "产品列表")
        {
            strColumnUrlClient = "/product";
        }
        else if (strColumnType == "在线留言")
        {
            strColumnUrlClient = "/message/" + intID;
        }
        else if (strColumnType == "在线表单")
        {
            strColumnUrlClient = "/submitform/" + intID;
        }
        else if (strColumnType == "在线支付")
        {
            strColumnUrlClient = "/Pay.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "一级分类")
        {
            strColumnUrlClient = "#";
        }
        else if (strColumnType == "图片新闻")
        {
            strColumnUrlClient = "/picnews/" + intID;
        }
        else if (strColumnType == "网站首页")
        {
            strColumnUrlClient = "/home";
        }
        return strColumnUrlClient;
    }
}
