<%@ WebHandler Language="C#" Class="upload" %>

using System;
using System.Web;
using System.IO;

public class upload : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string action = basic.Tools.RequestClass.GetQueryString("Action");

        switch (action)
        {
            case "PicMFile": //PicManage.aspx图片上传
                PicMFile(context);
                break;
            case "NewsMFile": //News.aspx图片上传
                NewsMFile(context);
                break;
            case "DownMFile": //News.aspx附件上传
                DownMFile(context);
                break;
            case "ProClassMFile": //ProClass.aspx图片上传
                ProClassMFile(context);
                break;
            case "ProMFile": //Product.aspx图片上传
                ProMFile(context);
                break;
            case "BackMFile": //BackGround.aspx图片上传
                BackMFile(context);
                break;
            case "NewsClassMFile": //NewsClassEdit.aspx图片上传
                NewsClassMFile(context);
                break;
            case "WJMFile": //WenJianManage.aspx文件上传
                WJMFile(context);
                break;
            case "WaterMFile": //水印图片文件上传
                WaterMFile(context);
                break;
        }

    }
    /// <summary>
    /// PicManage.aspx图片上传
    /// </summary>
    /// <param name="context"></param>
    private void PicMFile(HttpContext context)
    {
        string xten = domain.domainname.GetIndexConfigValue("PicManageFile");
        string FileLength = domain.domainname.GetIndexConfigValue("PicManageFileLength");
        string _upfilepath = HttpContext.Current.Request["UpFilePath"]; //取得上传的对象名称
        Boolean fileok = false;
        HttpPostedFile fileup = context.Request.Files[_upfilepath];
        if (fileup.ContentLength != 0)
        {
            if (fileup.ContentLength <= Double.Parse(FileLength) * 1024)
            {
                string fileextension = System.IO.Path.GetExtension(fileup.FileName).ToLower();
                string filename1 = DateTime.Now.ToString("yyyy")+"/"+DateTime.Now.ToString("MM");
                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + fileextension;//上传的文件名（自定义）+ 文件后缀
                String[] allowedextensions = xten.Split(',');
                for (int i = 0; i < allowedextensions.Length; i++)
                {
                    string lei = allowedextensions[i];
                    if (lei.IndexOf(".") == (-1))
                    {
                        lei = "." + lei;
                    }
                    if (fileextension == lei)
                    {
                        fileok = true;
                        break;
                    }
                }
                if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("../upload/img/"+filename1)))
                {
                    System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("../upload/img/"+filename1));
                }
                if (fileok == true)
                {
                    fileup.SaveAs(HttpContext.Current.Server.MapPath("../upload/img/"+filename1+"/") + "\\" + filename);
                    Water("../upload/img/"+filename1+"/" + filename);
                    context.Response.Write("{msg: 1, msgbox: \"upload/img/" +filename1+"/"+ filename + "\"}");
                }
                else
                {
                    context.Response.Write("{msg: 0, msgbox: \"文件类型错误！正确格式为："+xten+"\"}");
                }
            }
            else
            {
                context.Response.Write("{msg: 0, msgbox: \"文件大小不能超过" + FileLength + "KB！\"}");
            }
        }
        context.Response.End();
    }

    /// <summary>
    /// News.aspx图片上传
    /// </summary>
    /// <param name="context"></param>
    private void NewsMFile(HttpContext context)
    {
        string xten = domain.domainname.GetIndexConfigValue("NewsFile");
        string FileLength = domain.domainname.GetIndexConfigValue("NewsFileLength");
        string _upfilepath = HttpContext.Current.Request["UpFilePath"]; //取得上传的对象名称
        Boolean fileok = false;
        HttpPostedFile fileup = context.Request.Files[_upfilepath];
        if (fileup.ContentLength != 0)
        {
            if (fileup.ContentLength <= Double.Parse(FileLength) * 1024)
            {
                string fileextension = System.IO.Path.GetExtension(fileup.FileName).ToLower();
                string filename1 = DateTime.Now.ToString("yyyy")+"/"+DateTime.Now.ToString("MM");
                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + fileextension;//上传的文件名（自定义）+ 文件后缀
                String[] allowedextensions = xten.Split(',');
                for (int i = 0; i < allowedextensions.Length; i++)
                {
                    string lei = allowedextensions[i];
                    if (lei.IndexOf(".") == (-1))
                    {
                        lei = "." + lei;
                    }
                    if (fileextension == lei)
                    {
                        fileok = true;
                        break;
                    }
                }
                if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("../upload/"+filename1)))
                {
                    System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("../upload/"+filename1));
                }
                if (fileok == true)
                {
                    fileup.SaveAs(HttpContext.Current.Server.MapPath("../upload/"+filename1+"/") + "\\" + filename);
                    context.Response.Write("{msg: 1, msgbox: \"upload/"+filename1+"/" + filename + "\"}");
                }
                else
                {
                    context.Response.Write("{msg: 0, msgbox: \"文件类型错误！正确格式为："+xten+"\"}");
                }
            }
            else
            {
                context.Response.Write("{msg: 0, msgbox: \"文件大小不能超过" + FileLength + "KB！\"}");
            }
        }
        context.Response.End();
    }

    /// <summary>
    /// News.aspx附件上传
    /// </summary>
    /// <param name="context"></param>
    private void DownMFile(HttpContext context)
    {
        string xten = domain.domainname.GetIndexConfigValue("DownloadFile");
        string FileLength = domain.domainname.GetIndexConfigValue("DownloadFileLength");
        string _upfilepath = HttpContext.Current.Request["UpFilePath"]; //取得上传的对象名称
        Boolean fileok = false;
        HttpPostedFile fileup = context.Request.Files[_upfilepath];
        if (fileup.ContentLength != 0)
        {
            if (fileup.ContentLength <= Double.Parse(FileLength) * 1024 * 1024)
            {
                string fileextension = System.IO.Path.GetExtension(fileup.FileName).ToLower();
                string filename1 = DateTime.Now.ToString("yyyy")+"/"+DateTime.Now.ToString("MM");
                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + fileextension;//上传的文件名（自定义）+ 文件后缀
                String[] allowedextensions = xten.Split(',');
                for (int i = 0; i < allowedextensions.Length; i++)
                {
                    string lei = allowedextensions[i];
                    if (lei.IndexOf(".") == (-1))
                    {
                        lei = "." + lei;
                    }
                    if (fileextension == lei)
                    {
                        fileok = true;
                        break;
                    }
                }
                if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("../upload/"+filename1)))
                {
                    System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("../upload/"+filename1));
                }
                if (fileok == true)
                {
                    fileup.SaveAs(HttpContext.Current.Server.MapPath("../upload/"+filename1+"/") + "\\" + filename);
                    context.Response.Write("{msg: 1, msgbox: \"upload/"+filename1+"/" + filename + "\"}");
                }
                else
                {
                    context.Response.Write("{msg: 0, msgbox: \"文件类型错误！正确格式为："+xten+"\"}");
                }
            }
            else
            {
                context.Response.Write("{msg: 0, msgbox: \"文件大小不能超过" + FileLength + "M！\"}");
            }
        }
        context.Response.End();
    }

    /// <summary>
    /// ProClass.aspx图片上传
    /// </summary>
    /// <param name="context"></param>
    private void ProClassMFile(HttpContext context)
    {
        string xten = domain.domainname.GetIndexConfigValue("ProClassFile");
        string FileLength = domain.domainname.GetIndexConfigValue("ProClassFileLength");
        string _upfilepath = HttpContext.Current.Request["UpFilePath"]; //取得上传的对象名称
        Boolean fileok = false;
        HttpPostedFile fileup = context.Request.Files[_upfilepath];
        if (fileup.ContentLength != 0)
        {
            if (fileup.ContentLength <= Double.Parse(FileLength) * 1024)
            {
                string fileextension = System.IO.Path.GetExtension(fileup.FileName).ToLower();
                string filename1 = DateTime.Now.ToString("yyyy")+"/"+DateTime.Now.ToString("MM");
                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + fileextension;//上传的文件名（自定义）+ 文件后缀
                String[] allowedextensions = xten.Split(',');
                for (int i = 0; i < allowedextensions.Length; i++)
                {
                    string lei = allowedextensions[i];
                    if (lei.IndexOf(".") == (-1))
                    {
                        lei = "." + lei;
                    }
                    if (fileextension == lei)
                    {
                        fileok = true;
                        break;
                    }
                }
                if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("../upload/"+filename1)))
                {
                    System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("../upload/"+filename1));
                }
                if (fileok == true)
                {
                    fileup.SaveAs(HttpContext.Current.Server.MapPath("../upload/"+filename1+"/") + "\\" + filename);
                    context.Response.Write("{msg: 1, msgbox: \"upload/"+filename1+"/" + filename + "\"}");
                }
                else
                {
                    context.Response.Write("{msg: 0, msgbox: \"文件类型错误！正确格式为："+xten+"\"}");
                }
            }
            else
            {
                context.Response.Write("{msg: 0, msgbox: \"文件大小不能超过" + FileLength + "KB！\"}");
            }
        }
        context.Response.End();
    }

    /// <summary>
    /// Product.aspx图片上传
    /// </summary>
    /// <param name="context"></param>
    private void ProMFile(HttpContext context)
    {
        string xten = domain.domainname.GetIndexConfigValue("ProductFile");
        string FileLength = domain.domainname.GetIndexConfigValue("ProductFileLength");
        string _upfilepath = HttpContext.Current.Request["UpFilePath"]; //取得上传的对象名称
        Boolean fileok = false;
        HttpPostedFile fileup = context.Request.Files[_upfilepath];
        if (fileup.ContentLength != 0)
        {
            if (fileup.ContentLength <= Double.Parse(FileLength) * 1024)
            {
                string fileextension = System.IO.Path.GetExtension(fileup.FileName).ToLower();
                string filename1 = DateTime.Now.ToString("yyyy")+"/"+DateTime.Now.ToString("MM");
                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + fileextension;//上传的文件名（自定义）+ 文件后缀
                String[] allowedextensions = xten.Split(',');
                for (int i = 0; i < allowedextensions.Length; i++)
                {
                    string lei = allowedextensions[i];
                    if (lei.IndexOf(".") == (-1))
                    {
                        lei = "." + lei;
                    }
                    if (fileextension == lei)
                    {
                        fileok = true;
                        break;
                    }
                }
                if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("../upload/"+filename1)))
                {
                    System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("../upload/"+filename1));
                }
                if (fileok == true)
                {
                    fileup.SaveAs(HttpContext.Current.Server.MapPath("../upload/"+filename1+"/") + "\\" + filename);
                    context.Response.Write("{msg: 1, msgbox: \"upload/" +filename1+"/"+ filename + "\"}");
                }
                else
                {
                    context.Response.Write("{msg: 0, msgbox: \"文件类型错误！正确格式为："+xten+"\"}");
                }
            }
            else
            {
                context.Response.Write("{msg: 0, msgbox: \"文件大小不能超过" + FileLength + "KB！\"}");
            }
        }
        context.Response.End();
    }
    /// <summary>
    /// BackGround.aspx图片上传
    /// </summary>
    /// <param name="context"></param>
    private void BackMFile(HttpContext context)
    {
        string xten = domain.domainname.GetIndexConfigValue("BackGroundFile");
        string FileLength = domain.domainname.GetIndexConfigValue("BackGroundFileLength");
        string _upfilepath = HttpContext.Current.Request["UpFilePath"]; //取得上传的对象名称
        Boolean fileok = false;
        HttpPostedFile fileup = context.Request.Files[_upfilepath];
        if (fileup.ContentLength != 0)
        {
            if (fileup.ContentLength <= Double.Parse(FileLength) * 1024)
            {
                string fileextension = System.IO.Path.GetExtension(fileup.FileName).ToLower();
                string filename1 = DateTime.Now.ToString("yyyy")+"/"+DateTime.Now.ToString("MM");
                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + fileextension;//上传的文件名（自定义）+ 文件后缀
                String[] allowedextensions = xten.Split(',');
                for (int i = 0; i < allowedextensions.Length; i++)
                {
                    string lei = allowedextensions[i];
                    if (lei.IndexOf(".") == (-1))
                    {
                        lei = "." + lei;
                    }
                    if (fileextension == lei)
                    {
                        fileok = true;
                        break;
                    }
                }
                if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("../upload/img/"+filename1)))
                {
                    System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("../upload/img/"+filename1));
                }
                if (fileok == true)
                {
                    fileup.SaveAs(HttpContext.Current.Server.MapPath("../upload/img/"+filename1+"/") + "\\" + filename);
                    context.Response.Write("{msg: 1, msgbox: \"upload/img/"+filename1+"/" + filename + "\"}");
                }
                else
                {
                    context.Response.Write("{msg: 0, msgbox: \"文件类型错误！正确格式为："+xten+"\"}");
                }
            }
            else
            {
                context.Response.Write("{msg: 0, msgbox: \"文件大小不能超过" + FileLength + "KB！\"}");
            }
        }
        context.Response.End();
    }

    /// <summary>
    /// NewsClass.aspx图片上传
    /// </summary>
    /// <param name="context"></param>
    private void NewsClassMFile(HttpContext context)
    {
        string xten = domain.domainname.GetIndexConfigValue("NewsClassFile");
        string FileLength = domain.domainname.GetIndexConfigValue("NewsClassFileLength");
        string _upfilepath = HttpContext.Current.Request["UpFilePath"]; //取得上传的对象名称
        Boolean fileok = false;
        HttpPostedFile fileup = context.Request.Files[_upfilepath];
        if (fileup.ContentLength != 0)
        {
            if (fileup.ContentLength <= Double.Parse(FileLength) * 1024)
            {
                string fileextension = System.IO.Path.GetExtension(fileup.FileName).ToLower();
                string filename1 = DateTime.Now.ToString("yyyy")+"/"+DateTime.Now.ToString("MM");
                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + fileextension;//上传的文件名（自定义）+ 文件后缀
                String[] allowedextensions = xten.Split(',');
                for (int i = 0; i < allowedextensions.Length; i++)
                {
                    string lei = allowedextensions[i];
                    if (lei.IndexOf(".") == (-1))
                    {
                        lei = "." + lei;
                    }
                    if (fileextension == lei)
                    {
                        fileok = true;
                        break;
                    }
                }
                if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("../upload/img/"+filename1)))
                {
                    System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("../upload/img/"+filename1));
                }
                if (fileok == true)
                {
                    fileup.SaveAs(HttpContext.Current.Server.MapPath("../upload/img/"+filename1+"/") + "\\" + filename);
                    context.Response.Write("{msg: 1, msgbox: \"upload/img/"+filename1+"/" + filename + "\"}");
                }
                else
                {
                    context.Response.Write("{msg: 0, msgbox: \"文件类型错误！正确格式为："+xten+"\"}");
                }
            }
            else
            {
                context.Response.Write("{msg: 0, msgbox: \"文件大小不能超过" + FileLength + "KB！\"}");
            }
        }
        context.Response.End();
    }
    /// <summary>
    /// WenJianManage.aspx图片上传
    /// </summary>
    /// <param name="context"></param>
    private void WJMFile(HttpContext context)
    {
        string _upfilepath = HttpContext.Current.Request["UpFilePath"]; //取得上传的对象名称
        Boolean fileok = false;
        HttpPostedFile fileup = context.Request.Files[_upfilepath];
        string filename = fileup.FileName;


        fileup.SaveAs(HttpContext.Current.Server.MapPath("/"+filename));
        context.Response.Write("{msg: 1, msgbox: \"" + filename + "\"}");


        context.Response.End();
    }

    /// <summary>
    /// 水印图片上传
    /// </summary>
    /// <param name="context"></param>
    private void WaterMFile(HttpContext context)
    {
        string _upfilepath = HttpContext.Current.Request["UpFilePath"]; //取得上传的对象名称
        Boolean fileok = false;
        HttpPostedFile fileup = context.Request.Files[_upfilepath];
        if (fileup.ContentLength != 0)
        {
            if (fileup.ContentLength <= 300 * 1024)
            {
                string fileextension = System.IO.Path.GetExtension(fileup.FileName).ToLower();
                string filename = "TYWater" + fileextension;//上传的文件名（自定义）+ 文件后缀
                String[] allowedextensions = {"png","jpg","gif"};
                for (int i = 0; i < allowedextensions.Length; i++)
                {
                    string lei = allowedextensions[i];
                    if (lei.IndexOf(".") == (-1))
                    {
                        lei = "." + lei;
                    }
                    if (fileextension == lei)
                    {
                        fileok = true;
                        break;
                    }
                }
               
                if (fileok == true)
                {
                    fileup.SaveAs(HttpContext.Current.Server.MapPath("/images/"+filename));
                    context.Response.Write("{msg: 1, msgbox: \"/images/" + filename + "\"}");
                }
                else
                {
                    context.Response.Write("{msg: 0, msgbox: \"文件类型错误！正确格式为：png,jpg,gif\"}");
                }
            }
            else
            {
                context.Response.Write("{msg: 0, msgbox: \"文件大小不能超过300KB！\"}");
            }
        }
        context.Response.End();
    }


    /// <summary>
    /// 水印处理
    /// </summary>
    /// <param name="filename">上传服务器图片和生成水印图片的路径</param>
    public void Water(string filename) {
        string watermarktype = domain.domainname.GetIndexConfigValue("watermarktype");
        string watermarkposition = domain.domainname.GetIndexConfigValue("watermarkposition");
        string watermarkimgquality = domain.domainname.GetIndexConfigValue("watermarkimgquality");
        if(watermarkimgquality==""||watermarkimgquality==null)
        {
            watermarkimgquality = "80";
        }
        string watermarkpic = domain.domainname.GetIndexConfigValue("watermarkpic");
        string watermarktransparency = domain.domainname.GetIndexConfigValue("watermarktransparency");
        if(watermarktransparency==""||watermarktransparency==null)
        {
            watermarktransparency = "5";
        }
        string watermarktext = domain.domainname.GetIndexConfigValue("watermarktext");
        if(watermarktext==""||watermarktext==null)
        {
            watermarktext = "腾云网";
        }
        string watermarkfont = domain.domainname.GetIndexConfigValue("watermarkfont");
        string watermarkfontsize = domain.domainname.GetIndexConfigValue("watermarkfontsize");
        if(watermarkfontsize==""||watermarkfontsize==null)
        {
            watermarkfontsize = "12";
        }
        if (watermarktype == "2")
        {
            if (!System.IO.File.Exists(Basic.Tools.Utils.GetMapPath(watermarkpic)))
            {
                Basic.Tools.WaterMark.AddImageSignText(filename, filename, watermarktext, Int32.Parse(watermarkposition), Int32.Parse(watermarkimgquality), watermarkfont, Int32.Parse(watermarkfontsize));
            }
            else
            {
                Basic.Tools.WaterMark.AddImageSignPic(filename, filename, watermarkpic, Int32.Parse(watermarkposition), Int32.Parse(watermarkimgquality), Int32.Parse(watermarktransparency));
            }
        }
        else if (watermarktype == "1")
        {
            Basic.Tools.WaterMark.AddImageSignText(filename, filename, watermarktext, Int32.Parse(watermarkposition), Int32.Parse(watermarkimgquality), watermarkfont, Int32.Parse(watermarkfontsize));
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