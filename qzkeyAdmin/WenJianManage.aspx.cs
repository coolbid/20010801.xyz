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
using System.IO;
using WebApp.Components;

public partial class wltx_admin_WenJianManage : Basic.ManagerPage
{
    public NewsClass newsclass = new NewsClass();
    string strAction;
    int intID;
    public string strNewsname = null;
    string filename;
    string strPicPath = null;
    int rowCount;//用来记录总记录数
    DataSet dst = new DataSet();
    public Picture picure = new Picture();
    public string strImg = null;
    basic.BasicPage bp = new basic.BasicPage();
    protected Basic.Model.ManagerInfo admin_info;
    protected void Page_Load(object sender, EventArgs e)
    {
        strAction = Request["Action"];
        //提交事件
        btnSave.Attributes.Add("onclick", "return checkNull()");

        if (strAction == "Add")
        {
            pnlList.Visible = false;
            pnlEdit.Visible = true;
            if (Request["ID"] != null)
            {
                intID = Convert.ToInt16(Request["ID"]);
                if (intID > 0)
                {
                    if (!IsPostBack)
                    {
                        showContent();
                    }
                }
            }
        }
        else
        {
            pnlList.Visible = true;
            pnlEdit.Visible = false;
            if (!IsPostBack)
            {
                getListBox();
            }
        }

    }
    protected void getListBox()
    {
        dst = new DataSet();
        dst = bp.SelectDataBase("tbpic", "select * from tbpic where Type='Wenjian' order by Paixu desc,ID desc");
        rowCount = dst.Tables[0].Rows.Count;//取得总记录数目
        if (rowCount > 0)
        {
            this.gvList.DataSource = dst.Tables[0].DefaultView;
            this.gvList.DataKeyField = "ID";
            this.gvList.DataBind();
        }
        else
        {
            pnlList.Visible = false;
            pnlShow.Visible = true;
        }
    }

    protected void gvList_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string fileFullPath = "";
        SqlDataReader reader = picure.GetSinglePic(Int32.Parse(gvList.DataKeys[e.Item.ItemIndex].ToString()));
        if (reader.Read())
        {
            fileFullPath = reader["Path"].ToString();
        }
        reader.Close();

        fileFullPath = MapPath("../"+ fileFullPath);

        int intRowCount = picure.DeleteSinglePic(Int32.Parse(gvList.DataKeys[e.Item.ItemIndex].ToString()));
        if (intRowCount > 0)
        {
            // 1、首先判断文件或者文件路径是否存在
            if (File.Exists(fileFullPath))
            {
                // 2、根据路径字符串判断是文件还是文件夹
                FileAttributes attr = File.GetAttributes(fileFullPath);
                // 3、根据具体类型进行删除
                if (attr == FileAttributes.Directory)
                {
                    // 3.1、删除文件夹
                    Directory.Delete(fileFullPath, true);
                }
                else
                {
                    // 3.2、删除文件
                    File.Delete(fileFullPath);
                }
                File.Delete(fileFullPath);
            }

            admin_info = GetAdminInfo();
            string strUserName = admin_info.UserID;
            Log log = new Log();
            log.AddSingleLog(DateTime.Now.ToString(), Request.UserHostAddress, strUserName, "删除文件空间-Id：" + Int32.Parse(gvList.DataKeys[e.Item.ItemIndex].ToString()));
            Response.Redirect("Show_Success.aspx?message=删除成功！&url=WenJianManage.aspx");
        }
    }

    protected void showContent()
    {
        SqlDataReader reader = picure.GetSinglePic(intID);
        if (reader.Read())
        {
            txtPaixu.Text = reader["Paixu"].ToString();
            dropType.SelectedValue = reader["Type"].ToString();
            txtUrl.Text = reader["Url"].ToString();
            txt_path.Text = reader["Path"].ToString();
            strImg = reader["Path"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object s, EventArgs e)
    {
        int intPaixu = Int32.Parse(txtPaixu.Text);
        strPicPath = txt_path.Text;

        if (intID == 0)
        {
            int intIdentity = picure.AddSinglePic(0, intPaixu, dropType.SelectedValue, 0, 0, strPicPath, txtUrl.Text, "无", DateTime.Now.ToString());
            if (intIdentity > 0)
            {
                Response.Redirect("Show_Success.aspx?message=添加成功！&url=WenJianManage.aspx");
            }
        }
        else
        {
            int intRowCount = picure.UpdateSinglePic(intID, 0, intPaixu, dropType.SelectedValue, 0, 0, strPicPath, txtUrl.Text, "无");
            if (intRowCount > 0)
            {
                Response.Redirect("Show_Success.aspx?message=修改成功！&url=WenJianManage.aspx");
            }
        }

    }

    //protected string upload()
    //{
    //    string strResult = null;
    //    if (fileup.PostedFile.ContentLength != 0)
    //    {
    //        if (fileup.PostedFile.ContentLength <= WebSet.PicManageFileLength * 1024)
    //        {
    //            Boolean fileok = false;
    //            filename = DateTime.Now.ToString("yyyyMMddHHmmss");
    //            String fileextension = System.IO.Path.GetExtension(fileup.PostedFile.FileName).ToLower();
    //            String[] allowedextensions = { ".jpg", ".png", ".gif", ".swf" };
    //            for (int i = 0; i < allowedextensions.Length; i++)
    //            {
    //                if (fileextension == allowedextensions[i])
    //                {
    //                    fileok = true;
    //                    break;
    //                }
    //            }
    //            if (fileok == true)
    //            {
    //                String filepath = Path.Combine(Server.MapPath("../upload/img"), Path.GetFileName(filename + fileextension));

    //                fileup.PostedFile.SaveAs(filepath);
    //                strPicPath = "upload/img/" + filename + fileextension;
    //                strResult = "success";
    //            }
    //            else
    //            {
    //                strResult = "文件类型错误！正确格式为：jpg或png或gif或swf";
    //            }
    //        }
    //        else
    //        {
    //            strResult = "文件大小不能超过" + WebSet.PicManageFileLength + "KB！";
    //        }
    //    }
    //    else
    //    {
    //        strResult = "no file";
    //    }
    //    return strResult;
    //}
    protected void dropClassID_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected string ChangeType(int ClassID)
    {
        return "";
    }
}

