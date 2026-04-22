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

public partial class qzkeyAdmin_PageSetGlobal : System.Web.UI.Page
{
    //读取不到端口，本地测试要换真是网址
    string strUrl = "http://" + HttpContext.Current.Request.Url.Host + "/";
    string strMapPath = HttpContext.Current.Server.MapPath("/Upload/config/href.txt");
    string strJtUrl = HttpContext.Current.Server.MapPath("/Upload/config/jthref.txt");
    string strReaded = HttpContext.Current.Server.MapPath("/Upload/config/readed.txt");
    //替换的url
    string strRurl = HttpContext.Current.Server.MapPath("/Upload/config/url.config");

    BasicPage bp = new BasicPage();
    NewsClass NewsClass = new NewsClass();
    News News = new News();
    Products Products = new Products();

    public string strState = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        string psw = basic.Tools.RequestClass.GetQueryString("spm");
        if (psw == "wEPDwUKLTc2ODkxODkyMw9kFgIC")
        {
            SqlDataReader myread = bp.getRead("select SMSState from TbTimeLimit where id=1");
            if (myread.Read())
            {
                strState = myread[0].ToString();
            }
            myread.Close();
            DoJingtai();
        }
    }

    //开始执行按钮
    protected void DoJingtai()
    {
        if (strState == "1")//启用静态
        {
            try
            {
                bp.doExecute("update ColumnList set ColumnUrlClient='Default.aspx' where ColumnType='网站首页'");
                DelJtLinks();//删除静态页
                //清空链接
                System.IO.File.WriteAllText(strMapPath, string.Empty);
                System.IO.File.WriteAllText(strReaded, string.Empty);

                #region 获取常用固定链接

                //新闻
                DataTable dtList = bp.SelectDataBase("News", "select id from  News where Classid in(select id from ColumnList where columntype='新闻列表')").Tables[0];
                int intList = dtList.Rows.Count;
                for (int i = 0; i < intList; i++)
                {
                    string id = dtList.Rows[i]["id"].ToString();
                    WriteLinks("newsdetail.aspx?id=" + id);
                }
                //产品
                DataTable dtListPro = bp.SelectDataBase("Product", "select ProId from  Product").Tables[0];
                int intListPro = dtListPro.Rows.Count;
                for (int i = 0; i < intListPro; i++)
                {
                    string id = dtListPro.Rows[i]["ProId"].ToString();
                    WriteLinks("prodetail.aspx?proid=" + id);
                }
                //图片列表
                DataTable dtListPic = bp.SelectDataBase("News", "select id from  News where Classid in(select id from ColumnList where columntype='图片列表')").Tables[0];
                int intListPic = dtListPic.Rows.Count;
                for (int i = 0; i < intListPic; i++)
                {
                    string id = dtListPic.Rows[i]["id"].ToString();
                    WriteLinks("picdetail.aspx?id=" + id);
                }
                //资料下载
                DataTable dtListDown = bp.SelectDataBase("News", "select id from  News where Classid in(select id from ColumnList where columntype='资料下载')").Tables[0];
                int intListDown = dtListDown.Rows.Count;
                for (int i = 0; i < intListDown; i++)
                {
                    string id = dtListDown.Rows[i]["id"].ToString();
                    WriteLinks("downloaddetail.aspx?id=" + id);
                }
                #endregion

                //获取首页链接
                GetHref(strUrl);

                //获取二级页面链接
                GetLinks(strMapPath);

                //获取三级页面链接
                GetLinks(strMapPath);

                //获取4级页面链接
                GetLinks(strMapPath);

                //删除重复链接
                DelRepeat(strMapPath);

                CrateHtml();
                bp.doExecute("update TbTimeLimit set SMSState='1' where id=1");
                Response.Write("设置成功");
            }
            catch (Exception ex)
            {

            }
        }
        else if (strState == "2")//启用首页静态
        {
            DelJtLinks();//删除静态页
            //清空链接
            System.IO.File.WriteAllText(strMapPath, string.Empty);
            System.IO.File.WriteAllText(strReaded, string.Empty);

            bp.doExecute("update ColumnList set ColumnUrlClient='index.html' where ColumnType='网站首页'");
            System.IO.StreamWriter sw;
            //获取网页内容
            string strWebUrl = "http://" + HttpContext.Current.Request.Url.Host + "/Default.aspx";
            string HtmlContent = GetWebContent(strWebUrl);
            sw = new System.IO.StreamWriter(Server.MapPath("../index.html"), false, System.Text.Encoding.UTF8);
            //写入网页内容
            sw.Write(HtmlContent);
            sw.Close();

            bp.doExecute("update TbTimeLimit set SMSState='2' where id=1");
            Response.Write("设置成功");
        }
        else
        {
            try
            {

                DelJtLinks();
                bp.doExecute("update TbTimeLimit set SMSState='0' where id=1");
                bp.doExecute("update ColumnList set ColumnUrlClient='default.aspx' where ColumnType='网站首页'");
                Response.Write("设置成功");

            }
            catch (Exception ex)
            {
                Response.Write("设置失败：" + ex.Message);
            }
        }
    }

    #region 获取网页内容

    /// <summary>
    /// 获取网页内容
    /// </summary>
    /// <param name="strUrl"></param>
    /// <returns></returns>
    public static string GetWebContent(string strUrl)
    {
        string strResult = "";
        //声明一个HttpWebRequest请求
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strUrl);
        //设置连接超时时间
        request.Timeout = 30000;
        request.Headers.Set("Pragma", "no-cache");
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream streamReceive = response.GetResponseStream();
        Encoding encoding = Encoding.GetEncoding("utf-8");
        StreamReader streamReader = new StreamReader(streamReceive, encoding);
        strResult = streamReader.ReadToEnd();
        return strResult;
    }
    #endregion

    #region 获取网页上超链接

    /// <summary>
    /// 获取超链接
    /// </summary>
    /// <param name="_url"></param>
    public void GetHref(string _url)
    {
        bool Checkread = true;
        try
        {

            String[] fileLines = System.IO.File.ReadAllLines(strReaded);
            int len = fileLines.Length;
            for (int i = 0; i < len; i++)
            {
                string con = fileLines[i].ToString();
                if (_url == con)
                {
                    Checkread = false;
                    break;
                }
            }
            if (Checkread)
            {
                WriteReadLinks(_url);
                string _Href = @"href=['""]([\S]+?)['""]";
                System.Net.HttpWebRequest request = (HttpWebRequest)WebRequest.Create(_url);
                request.Method = "GET";
                request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
                request.UserAgent = "   Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0";
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                //这个在Post的时候，一定要加上，如果服务器返回错误，他还会继续再去请求，不会使用之前的错误数据，做返回数据
                request.ServicePoint.Expect100Continue = false;
                Stream stream = response.GetResponseStream();
                StreamReader sr = new StreamReader(stream, Encoding.GetEncoding("UTF-8"));//UTF-8
                string htmlContent = sr.ReadToEnd();
                //获取被采集的主要内容
                Regex regBody = new Regex(_Href, RegexOptions.IgnoreCase | RegexOptions.Singleline | RegexOptions.IgnorePatternWhitespace);
                MatchCollection mList = regBody.Matches(htmlContent);

                int Count = mList.Count;
                for (int i = 0; i < Count; i++)
                {
                    string Content = mList[i].ToString();
                    Content = Content.Replace("href=", "").Replace("\"", "").Replace("/", "").Replace("'", "").Trim().ToLower();

                    bool cResult = true;
                    string NoCon = "target,http,target,title=,upload,javascript,.css,mailto,tencent:message,qzkeyadmin,#,callto";
                    string[] sArray = NoCon.Split(',');
                    foreach (string k in sArray)
                    {
                        if (Content.Contains(k.ToString()))
                        {
                            cResult = false;
                            break;
                        }
                    }
                    if (cResult)
                    {
                        WriteLinks(Content);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            string exa = ex.ToString();
        }

    }
    #endregion

    #region 写入已经读取过的txt日志

    /// <summary>
    /// 写入已经读取过的txt日志
    /// </summary>
    /// <param name="readme"></param>
    public void WriteReadLinks(string readme)
    {

        // DelRepeat(strReaded);

        StreamWriter dout = new StreamWriter(strReaded, true);
        dout.Write(readme);
        dout.Write(System.Environment.NewLine); //换行 
        dout.Close();
    }
    #endregion

    #region 写入txt日志

    /// <summary>
    /// 写入txt日志
    /// </summary>
    /// <param name="readme"></param>
    public void WriteLinks(string readme)
    {

        DelRepeat(strMapPath);

        StreamWriter dout = new StreamWriter(strMapPath, true);
        dout.Write(readme);
        dout.Write(System.Environment.NewLine); //换行 
        dout.Close();
    }
    #endregion

    #region 读取txt每行超链接，并获取改链接上所有的链接

    //读取每行链接
    private void GetLinks(string filePath)
    {
        String[] fileLines = System.IO.File.ReadAllLines(filePath);
        int len = fileLines.Length;
        for (int i = 0; i < len; i++)
        {
            string con = fileLines[i].ToString();
            GetHref(strUrl + con);
        }
    }
    #endregion

    #region 去除重复链接

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

    #endregion

    #region 生成静态页面

    public void CrateHtml()
    {
        String[] fileLines = System.IO.File.ReadAllLines(strMapPath);
        int len = fileLines.Length;
        for (int i = 0; i < len; i++)
        {
            string con = fileLines[i].ToString();
            string WebContent = "";
            try
            {
                WebContent = GetWebContent(strUrl + con);
            }
            catch (Exception ex)
            {
                Response.Write("设置失败：" + ex.Message);
            }
            WebContent = HtmlReplace(WebContent);
            string Nurl = "";
            Nurl = HtmlName(con);
            if (!string.IsNullOrEmpty(Nurl))
            {
                createFolder(Nurl);
                System.IO.StreamWriter sw;
                sw = new System.IO.StreamWriter(Server.MapPath("../" + Nurl), false, System.Text.Encoding.UTF8);
                //写入网页内容
                sw.Write(WebContent);
                sw.Close();
                WriteJtUrl(Nurl);
            }
        }
    }
    #endregion

    #region 获取匹配后的url

    public string HtmlName(string url)
    {

        XmlDocument xdoc = new XmlDocument();
        xdoc.Load(strRurl);  //加载xml文件
        XmlNodeList xnl = xdoc.GetElementsByTagName("url");
        for (int j = 0; j < xnl.Count; j++)
        {
            string strPattern = xnl[j].Attributes["pattern"].InnerText;
            string reurl = xnl[j].Attributes["reurl"].InnerText;

            Regex re = new Regex(strPattern, RegexOptions.IgnoreCase);
            Match ma = re.Match(url);

            if (ma.Success)
            {
                int len = 0;
                len = ma.Groups.Count;
                for (int l = 1; l < len; l++)
                {

                    string strO = "\\$" + l;
                    string strN = ma.Groups[l].ToString();
                    Regex r = new Regex(strO);
                    reurl = r.Replace(reurl, strN, 1);
                }
                return reurl;
            }
        }
        return "";
    }
    #endregion

    #region 替换动态网页上的链接

    public string HtmlReplace(string HtmlCon)
    {
        HtmlCon = HtmlCon.Replace("src=\"js/", "src=\"/js/");
        HtmlCon = HtmlCon.Replace("href=\"css/", "href=\"/css/");
        HtmlCon = HtmlCon.Replace("href=\"CSS/", "href=\"/css/");
        HtmlCon = HtmlCon.Replace("src=\"images/", "src=\"/images/");
        HtmlCon = HtmlCon.Replace("src='images/", "src='/images/");
        HtmlCon = HtmlCon.Replace("src=\"upload/", "src=\"/upload/");
        HtmlCon = HtmlCon.Replace("src='upload/", "src='/upload/");
        HtmlCon = HtmlCon.Replace("url(images", "url(/images");
        HtmlCon = HtmlCon.Replace("url(\"images", "url(\"/images");
        HtmlCon = HtmlCon.Replace("url('images", "url('/images");
        HtmlCon = HtmlCon.Replace("src='Check", "src='/Check");
        HtmlCon = HtmlCon.Replace("src=\"Check", "src=\"/Check");
        HtmlCon = HtmlCon.Replace("url(\"upload", "url(\"/upload");
        HtmlCon = HtmlCon.Replace("url('upload", "url('/upload");
        HtmlCon = HtmlCon.Replace("url(upload", "url(/upload");


        XmlDocument xdoc = new XmlDocument();
        xdoc.Load(strRurl);  //加载xml文件
        XmlNodeList xnl = xdoc.GetElementsByTagName("url");
        for (int j = 0; j < xnl.Count; j++)
        {
            string strPattern = xnl[j].Attributes["pattern"].InnerText.Replace("$", "");

            Regex re = new Regex(strPattern, RegexOptions.IgnoreCase | RegexOptions.Singleline | RegexOptions.IgnorePatternWhitespace);
            MatchCollection mList = re.Matches(HtmlCon);

            if (mList.Count > 0)
            {

                for (int c = 0; c < mList.Count; c++)
                {
                    string reurl = xnl[j].Attributes["reurl"].InnerText;
                    string burl = mList[c].ToString();

                    Regex re2 = new Regex(strPattern, RegexOptions.IgnoreCase);
                    Match ma = re.Match(burl);

                    if (ma.Success)
                    {
                        int len = 0;
                        len = ma.Groups.Count;
                        for (int l = 1; l < len; l++)
                        {
                            string strO = "\\$" + l;
                            string strN = ma.Groups[l].ToString();
                            Regex r = new Regex(strO);
                            reurl = r.Replace(reurl, strN, 1);
                        }
                    }
                    burl = burl.Replace(@"?", @"\?").Replace(@"&", @"\&");

                    if (reurl == "index.html")
                    {
                        reurl = strUrl;
                    }
                    else
                    {
                        if (reurl.Contains("index.html"))
                        {
                            reurl = reurl.Replace("index.html", "");
                        }
                    }
                    Regex regContentR = new Regex("['\"](/?)" + burl + "['\"]", RegexOptions.IgnoreCase | RegexOptions.Singleline | RegexOptions.IgnorePatternWhitespace);
                    if (reurl.Contains("http"))
                    {
                        HtmlCon = regContentR.Replace(HtmlCon, "\"" + reurl + "\"");
                    }
                    else
                    {
                        HtmlCon = regContentR.Replace(HtmlCon, "\"/" + reurl + "\"");
                    }
                }
            }
        }


        return HtmlCon;
    }
    #endregion

    #region 写入生成的静态页面

    /// <summary>
    /// 写入生成的静态页面
    /// </summary>
    /// <param name="readme"></param>
    public void WriteJtUrl(string readme)
    {
        StreamWriter dout = new StreamWriter(strJtUrl, true);
        dout.Write(readme);
        dout.Write(System.Environment.NewLine); //换行 
        dout.Close();
    }
    #endregion

    #region 删除静态网页

    //读取每行链接
    private void DelJtLinks()
    {
        try
        {

            string mapurl = MapPath("../index.html");
            System.IO.File.Delete(mapurl);

            DirectoryInfo di = new DirectoryInfo(HttpContext.Current.Request.PhysicalApplicationPath + "html");
            di.Delete(true);
            System.IO.File.WriteAllText(strJtUrl, string.Empty);
        }
        catch (Exception ex)
        {
            
        }
    }
    #endregion

    #region 生成路径

    private void createFolder(string uploadpath)
    {
        if (uploadpath.Contains("/"))
        {
            uploadpath = uploadpath.Substring(0, uploadpath.LastIndexOf("/"));
            string lujing = HttpContext.Current.Request.PhysicalApplicationPath + uploadpath;
            if (!Directory.Exists(lujing))
            {
                Directory.CreateDirectory(lujing);
            }
        }
    }
    #endregion
}