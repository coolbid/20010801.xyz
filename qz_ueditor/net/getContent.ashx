<%@ WebHandler Language="C#" Class="getContent" %>
/**
 * Created by visual studio 2010
 * User: xuheng
 * Date: 12-3-6
 * Time: 下午21:23
 * To get the value of editor and output the value .
 */
using System;
using System.Web;
using System.Web.SessionState;

public class getContent : IHttpHandler, IRequiresSessionState, IReadOnlySessionState
{

    public void ProcessRequest(HttpContext context)
    {
        //判断有没有上传权限
        Basic.ManagerPage mp = new Basic.ManagerPage();
        if (!mp.IsUserLogin())
        {
            context.Response.Write("No permission, please do not attempt illegally");
            context.Response.End();
        }

        context.Response.ContentType = "text/html";

        //获取数据
        string content = context.Server.HtmlEncode(context.Request.Form["myEditor"]);


        //存入数据库或者其他操作
        //-------------

        //显示
        context.Response.Write("<script src='../ueditor.parse.js' type='text/javascript'></script>");
        context.Response.Write(
            "<script>uParse('.content',{" +
                  "'highlightJsUrl':'../third-party/SyntaxHighlighter/shCore.js'," +
                  "'highlightCssUrl':'../third-party/SyntaxHighlighter/shCoreDefault.css'" +
              "})" +
            "</script>");

        context.Response.Write("第1个编辑器的值");
        context.Response.Write("<div class='content'>" + context.Server.HtmlDecode(content) + "</div>");

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}