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

public partial class wltx_admin_PicManage : Basic.ManagerPage
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
        SqlDataReader dr = picure.GetPic();
        DataTable dt = SystemTools.ConvertDataReaderToDataTable(dr);
        dst.Tables.Add(dt);
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
        int intRowCount = picure.DeleteSinglePic(Int32.Parse(gvList.DataKeys[e.Item.ItemIndex].ToString()));
        if (intRowCount > 0)
        {
            admin_info = GetAdminInfo();
            string strUserName = admin_info.UserID;
            Log log = new Log();
            log.AddSingleLog(DateTime.Now.ToString(), Request.UserHostAddress, strUserName, "删除图片空间-Id：" + Int32.Parse(gvList.DataKeys[e.Item.ItemIndex].ToString()));
            Response.Redirect("Show_Success.aspx?message=删除成功！&url=PicManage.aspx");
        }
    }

    protected void showContent()
    {
        SqlDataReader reader = picure.GetSinglePic(intID);
        if (reader.Read())
        {
            txtPaixu.Text = reader["Paixu"].ToString();
            dropType.SelectedValue = reader["Type"].ToString();
            dropClassID.SelectedValue = reader["ClassID"].ToString();
            txtLength.Value = reader["Length"].ToString();
            txtWidth.Value = reader["Width"].ToString();
            txtUrl.Text = reader["Url"].ToString();
            txtBeizhu.Text = reader["Beizhu"].ToString();
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
            int intIdentity = picure.AddSinglePic(Int32.Parse(dropClassID.SelectedValue), intPaixu, dropType.SelectedValue, Int32.Parse(txtLength.Value), Int32.Parse(txtWidth.Value), strPicPath, txtUrl.Text, txtBeizhu.Text, DateTime.Now.ToString());
            if (intIdentity > 0)
            {
                Response.Redirect("Show_Success.aspx?message=添加成功！&url=PicManage.aspx");
            }
        }
        else
        {
            int intRowCount = picure.UpdateSinglePic(intID, Int32.Parse(dropClassID.SelectedValue), intPaixu, dropType.SelectedValue, Int32.Parse(txtLength.Value), Int32.Parse(txtWidth.Value), strPicPath, txtUrl.Text, txtBeizhu.Text);
            if (intRowCount > 0)
            {
                Response.Redirect("Show_Success.aspx?message=修改成功！&url=PicManage.aspx");
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
        txtBeizhu.Text = dropClassID.SelectedItem.Text;
    }
    protected string ChangeType(int ClassID)
    {
        return "";
    }
}

