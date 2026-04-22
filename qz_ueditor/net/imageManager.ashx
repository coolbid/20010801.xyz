<%@ WebHandler Language="C#" Class="imageManager" %>
/**
 * Created by visual studio2010
 * User: xuheng
 * Date: 12-3-7
 * Time: 下午16:29
 * To change this template use File | Settings | File Templates.
 */
using System;
using System.Web;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.SessionState;

public class imageManager : IHttpHandler, IRequiresSessionState, IReadOnlySessionState
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
        
        context.Response.ContentType = "text/plain";

        //string[] paths = { "upload", "upload1" }; //需要遍历的目录列表，最好使用缩略图地址，否则当网速慢时可能会造成严重的延时
        string[] paths = { "upload" };
        string[] filetype = { ".gif", ".png", ".jpg", ".jpeg" };                //文件允许格式

        string action = context.Server.HtmlEncode(context.Request["action"]);

        if (action == "get")
        {
            String str = String.Empty;

            foreach (string path in paths)
            {
                DirectoryInfo info = new DirectoryInfo(context.Server.MapPath("../../" + path));//添加 “/”

                //目录验证
                if (info.Exists)
                {
                    //DirectoryInfo[] infoArr = info.GetDirectories();
                    //foreach (DirectoryInfo tmpInfo in infoArr)
                    //{
                    //    foreach (FileInfo fi in tmpInfo.GetFiles())
                    //    {
                    //        if (Array.IndexOf(filetype, fi.Extension) != -1)
                    //        {
                    //            str += path + "/" + tmpInfo.Name + "/" + fi.Name + "ue_separate_ue";
                    //        }
                    //    }
                    //}
                    foreach (FileInfo fi in info.GetFiles())
                    {
                        if (Array.IndexOf(filetype, fi.Extension) != -1)
                        {
                            str += path + "/" + fi.Name + "ue_separate_ue";
                        }
                    }
                }
            }

            context.Response.Write(str);
        }
    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}