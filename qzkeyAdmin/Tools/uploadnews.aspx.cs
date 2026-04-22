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
using System.IO;
using System.Collections.Generic;
using basic;
using WebApp.Components;
using System.Text;

public partial class Tools_upload : System.Web.UI.Page
{
    News news = new News();
    protected void Page_Load(object sender, EventArgs e)
    {
        string classid = basic.Tools.RequestClass.GetQueryString("ClassId");
        string Title = basic.Tools.RequestClass.GetQueryString("Title");
        string Check = basic.Tools.RequestClass.GetQueryString("Check");

        HttpPostedFile jpeg_image_upload = Request.Files["Filedata"];

        if (jpeg_image_upload.ContentLength <= WebSet.NewsFileLength * 1024)
        {
            string Isimg = System.IO.Path.GetExtension(jpeg_image_upload.FileName).ToLower();
            string filename1 = DateTime.Now.ToString("yyyy");
            string filename2 = DateTime.Now.ToString("MM");
            string filename = DateTime.Now.ToString("yyyyMMddHHmmssfff") + Isimg;



            if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("~\\Upload\\"+ filename1+"\\"+ filename2)))
            {
                System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~\\Upload\\" + filename1 + "\\" + filename2 ));
            }


            string savePath = Server.MapPath(("~\\Upload\\"+ filename1 + "\\" + filename2+"\\") + filename);//Server.MapPath 获得虚拟服务器相对路径
            jpeg_image_upload.SaveAs(savePath);



            if (Check == "checked")
            {
                Title = Path.GetFileNameWithoutExtension(jpeg_image_upload.FileName);//只有名字
            }
            news.AddSingleNews(int.Parse(classid), 0, Title, "", "upload/" +filename1+"/"+filename2+"/" + filename, "", "", "<p style=\"text-align: center;\"><img src=\"/upload/" + filename1 + "/" + filename2 + "/" + filename + "\"/></p>", "", System.DateTime.Now.ToString("yyyy-MM-dd"), 0);

        }
        else
        {
            Response.Write("文件大小不能超过" + WebSet.ProductFileLength + "KB！");
        }
    }
}

