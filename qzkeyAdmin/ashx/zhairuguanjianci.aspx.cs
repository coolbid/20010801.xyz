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

public partial class qzkeyAdmin_ashx_zhairuguanjianci : Basic.ManagerPage
{
    public string strMapPath = HttpContext.Current.Server.MapPath("/Upload/config/seo.txt");
    basic.BasicPage bp = new BasicPage();
    protected void Page_Load(object sender, EventArgs e)
    {
        string strResult = "0";
        if (basic.Tools.RequestClass.GetQueryString("action") == "zairu")
        {
            try
            {
                GetGuanjianci();
                strResult = "1";
            }
            catch (Exception ex)
            {

            }
        }
        Response.Write(strResult);
        Response.End();
    }
    public void GetGuanjianci()
    {
        //优化
        System.IO.File.WriteAllText(strMapPath, string.Empty);
        SqlDataReader myred = bp.getRead("select webkeywords from SEO");
        if (myred.Read())
        {
            string webkeywords = myred[0].ToString();
            string[] sArray = webkeywords.Split(',');
            foreach (string i in sArray)
            {
                WriteLinks(i.ToString());
            }
        }
        myred.Close();

        //栏目的关键词
        DataTable dt = bp.SelectDataBase("ColumnList", "select ColumnKeywords from ColumnList where ColumnKeywords !=''").Tables[0];
        int len = dt.Rows.Count;
        for (int i = 0; i < len; i++)
        {
            string ColumnKeywords = dt.Rows[i]["ColumnKeywords"].ToString();
            string[] sArray = ColumnKeywords.Split(',');
            foreach (string q in sArray)
            {
                WriteLinks(q.ToString());
            }
        }

        //新闻里的关键词
        DataTable dt2 = bp.SelectDataBase("news", "select keywords from  news  where keywords !=''").Tables[0];
        int len2 = dt2.Rows.Count;
        for (int i = 0; i < len2; i++)
        {
            string ColumnKeywords = dt2.Rows[i]["keywords"].ToString();
            string[] sArray = ColumnKeywords.Split(',');
            foreach (string q in sArray)
            {
                WriteLinks(q.ToString());
            }
        }
        DelRepeat(strMapPath);//删除重复
        //产品里的关键词
        DataTable dt3 = bp.SelectDataBase("product", "select keywords from  product where keywords !=''").Tables[0];
        int len3 = dt3.Rows.Count;
        for (int i = 0; i < len3; i++)
        {
            string ColumnKeywords = dt3.Rows[i]["keywords"].ToString();
            string[] sArray = ColumnKeywords.Split(',');
            foreach (string q in sArray)
            {
                WriteLinks(q.ToString());
            }
        }
        DelRepeat(strMapPath);//删除重复
        //产品分类里的关键词
        DataTable dt4 = bp.SelectDataBase("product", "select content from ProClass where content like '%,%'").Tables[0];
        int len4 = dt4.Rows.Count;
        for (int i = 0; i < len4; i++)
        {
            string content = dt4.Rows[i]["content"].ToString();
            string keys = "";
            int changdu = content.Split('^').Length;
            if (changdu > 1)
            {
                keys = content.Split('^')[3];
            }
            string[] sArray = keys.Split(',');
            foreach (string q in sArray)
            {
                WriteLinks(q.ToString());
            }
        }
        DelRepeat(strMapPath);
    }

    /// <summary>
    /// 写入txt日志
    /// </summary>
    /// <param name="readme"></param>
    public void WriteLinks(string readme)
    {
        if (!string.IsNullOrEmpty(readme) && !readme.Contains("、") && !readme.Contains("，") && !readme.Contains(" "))
        {
            StreamWriter dout = new StreamWriter(strMapPath, true);
            dout.Write(readme);
            dout.Write(System.Environment.NewLine); //换行 
            dout.Close();
        }
    }
    /// <summary>
    /// 去除重复链接
    /// </summary>
    /// <param name="filePath"></param>
    private static void DelRepeat(string filePath)
    {
        if (File.Exists(filePath))
        {
            List<string> list = new List<string>();
            // 打开文件时 一定要注意编码 也许你的那个文件并不是GBK编码的
            using (StreamReader sr = new StreamReader(filePath, Encoding.GetEncoding("UTF-8")))
            {
                while (!sr.EndOfStream) //读到结尾退出
                {
                    string temp = sr.ReadLine();

                    if (!list.Contains(temp))  //去除重复的行
                    {
                        list.Add(temp);
                    }

                }
                sr.Close();
            }
            //写回去,第二个参数 Append = false ，就是说覆盖原来的 
            using (StreamWriter sw = new StreamWriter(filePath, false, Encoding.GetEncoding("UTF-8")))
            {
                foreach (string line in list)
                {
                    sw.WriteLine(line);
                }
                sw.Close();
            }

        }

    }
}