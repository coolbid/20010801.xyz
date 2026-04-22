using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Scripting;
using System.IO;
using ICSharpCode.SharpZipLib.Zip;
using System.Data.SqlClient;
using WebApp.Components;

public partial class Manager_YuanmaBeifen : Basic.ManagerPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string result = "0";
            string key = basic.Tools.RequestClass.GetQueryString("key");
            if (key == "39x3f39x2hjsfhsdfs2x3f8gs")
            {
                string genmulu = Server.MapPath("/") + "|";
                string yuming = "|" + HttpContext.Current.Request.Url.Host;
                string beifenwenjan = yuming.Replace("|www.", "").Replace("|", "");
                string strZipPath = genmulu.Replace(@"wwwroot\|", "databases\\") + beifenwenjan + "-" + DateTime.Now.ToString("yyyy-MM-dd-HHmmss") + "yuanmabeifen.zip";
                string strZipTopDirectoryPath = genmulu.Replace("|", "");
                int intZipLevel = 6;
                string strPassword = "";
                string[] filesOrDirectoriesPaths = new string[] { genmulu.Replace("|", "") };
                bool beifen = Zip(strZipPath, strZipTopDirectoryPath, intZipLevel, strPassword, filesOrDirectoriesPaths);
                if (beifen)
                {
                    result = "1";//备份成功
                }
                else
                {
                    result = "0";//备份失败
                }
            }
            Response.Write(result);
        }
    }

    /// <summary>
    /// 生成压缩文件
    /// </summary>
    /// <param name="strZipPath">生成的zip文件的路径</param>
    /// <param name="strZipTopDirectoryPath">源文件的上级目录</param>
    /// <param name="intZipLevel">T压缩等级</param>
    /// <param name="strPassword">压缩包解压密码</param>
    /// <param name="filesOrDirectoriesPaths">源文件路径</param>
    /// <returns></returns>
    private bool Zip(string strZipPath, string strZipTopDirectoryPath, int intZipLevel, string strPassword, string[] filesOrDirectoriesPaths)
    {
        try
        {
            List<string> AllFilesPath = new List<string>();
            if (filesOrDirectoriesPaths.Length > 0) // get all files path
            {
                for (int i = 0; i < filesOrDirectoriesPaths.Length; i++)
                {
                    string strfilespath = filesOrDirectoriesPaths[i];//文件路径
                    if (System.IO.File.Exists(strfilespath))
                    {
                        AllFilesPath.Add(strfilespath);
                    }
                    else if (Directory.Exists(strfilespath))
                    {
                        GetDirectoryFiles(strfilespath, AllFilesPath);
                    }
                }
            }

            if (AllFilesPath.Count > 0)
            {

                ZipOutputStream zipOutputStream = new ZipOutputStream(System.IO.File.Create(strZipPath));
                zipOutputStream.SetLevel(intZipLevel);
                zipOutputStream.Password = strPassword;

                for (int i = 0; i < AllFilesPath.Count; i++)
                {
                    string strFile = AllFilesPath[i].ToString();
                    try
                    {

                        string strFileSubstring = strFile.Substring(strFile.Length - 1);
                        if (strFileSubstring == "") //folder
                        {
                            string strFileName = strFile.Replace(strZipTopDirectoryPath, "");
                            if (strFileName.StartsWith(""))
                            {
                                strFileName = strFileName.Substring(1);
                            }
                            ZipEntry entry = new ZipEntry(strFileName);
                            entry.DateTime = DateTime.Now;
                            zipOutputStream.PutNextEntry(entry);
                        }
                        else //file
                        {
                            FileStream fs = System.IO.File.OpenRead(strFile);

                            byte[] buffer = new byte[fs.Length];
                            fs.Read(buffer, 0, buffer.Length);

                            string strFileName = strFile.Replace(strZipTopDirectoryPath, "");
                            if (strFileName.StartsWith(""))
                            {
                                strFileName = strFileName.Substring(0);
                            }
                            ZipEntry entry = new ZipEntry(strFileName);
                            entry.DateTime = DateTime.Now;
                            zipOutputStream.PutNextEntry(entry);
                            zipOutputStream.Write(buffer, 0, buffer.Length);

                            fs.Close();
                            fs.Dispose();
                        }
                    }
                    catch
                    {
                        continue;
                    }
                }

                zipOutputStream.Finish();
                zipOutputStream.Close();

                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }

    /// <summary>
    /// Gets the directory files.
    /// </summary>
    /// <param name="strParentDirectoryPath">源文件路径</param>
    /// <param name="AllFilesPath">所有文件路径</param>
    private void GetDirectoryFiles(string strParentDirectoryPath, List<string> AllFilesPath)
    {
        string[] files = Directory.GetFiles(strParentDirectoryPath);
        for (int i = 0; i < files.Length; i++)
        {
            AllFilesPath.Add(files[i]);
        }
        string[] directorys = Directory.GetDirectories(strParentDirectoryPath);
        for (int i = 0; i < directorys.Length; i++)
        {
            GetDirectoryFiles(directorys[i], AllFilesPath);
        }
        if (files.Length == 0 && directorys.Length == 0) //empty folder
        {
            AllFilesPath.Add(strParentDirectoryPath);
        }
    }

}