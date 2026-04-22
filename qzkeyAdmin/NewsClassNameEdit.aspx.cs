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
using basic;
using WebApp.Components;

public partial class Manager_NewsClassNameEdit : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    public NewsClass newsclass = new NewsClass();
    int intID;
    public string strColumnName;
    public string strFormState = null;
    string filename;
    string strPicPath = null;
    public string strImg = null;
    public string strRole = null;
    protected Basic.Model.ManagerInfo admin_info;
    protected void Page_Load(object sender, EventArgs e)
    {
        admin_info = GetAdminInfo();
        strRole = admin_info.Role;
        SystemTools system = new SystemTools();
        if (system.IsNumberic(Request["ID"]))
        {
            btnSave.Attributes.Add("onclick", "return checkNull()");
            intID = Int32.Parse(Request["ID"]);
            if (!IsPostBack)
            {
                LoadList();
                showFormState();
                showColumnName();
            }
        }
    }
    protected void showFormState()
    {
        Submit Submit = new Submit();
        int intID = 1;
        SqlDataReader reader = Submit.GetForm(intID);
        if (reader.Read())
        {
            strFormState = reader["FormState"].ToString();
        }
        reader.Close();
        dropColumnType.Items.Insert(0, "--选择栏目类别--");
        dropColumnType.Items.Insert(1, "网站首页");
        dropColumnType.Items.Insert(2, "一级分类");
        dropColumnType.Items.Insert(3, "二级分类");
        dropColumnType.Items.Insert(4, "联系方式");
        dropColumnType.Items.Insert(5, "最终页面");
        dropColumnType.Items.Insert(6, "新闻列表");
        dropColumnType.Items.Insert(7, "下载中心");
        dropColumnType.Items.Insert(8, "图片相册");
        dropColumnType.Items.Insert(9, "图片列表");
        dropColumnType.Items.Insert(10, "产品列表");
        dropColumnType.Items.Insert(11, "在线留言");
        dropColumnType.Items.Insert(13, "图片新闻");
        //dropColumnType.Items.Insert(13, "在线支付");
        if (strFormState == "1")
        {
            dropColumnType.Items.Insert(12, "在线表单");
        }
    }
    private void showColumnName()
    {
        SqlDataReader reader = newsclass.GetSingleColumnList(intID);
        if (reader.Read())
        {
            strColumnName = reader["ColumnName"].ToString();
            dropParentId.SelectedValue = reader["ParentId"].ToString();
            dropColumnType.SelectedValue = reader["ColumnType"].ToString();
            txtColumnName.Text = reader["ColumnName"].ToString();
            txtColumnSubName.Text = reader["ColumnSubName"].ToString();
            txtColumnNo.Value = reader["ColumnNo"].ToString();
            radlIndexStatus.SelectedValue = reader["IndexStatus"].ToString();
            radlRole.SelectedValue = reader["Role"].ToString();
            txtRemarks.Text = reader["Remarks"].ToString();
            pic.Value = reader["Path"].ToString();
            strImg = reader["Path"].ToString();
            txtLength.Value = reader["Length"].ToString();
            txtWidth.Value = reader["Width"].ToString();
            txtColumnUrlClient.Text = reader["ColumnUrlClient"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        string strColumnType = dropColumnType.SelectedValue;
        string strColumnName = txtColumnName.Text.Trim();
        string strColumnSubName = txtColumnSubName.Text.Trim();
        int intColumnNo = Int32.Parse(txtColumnNo.Value);
        int intParentId = Int32.Parse(dropParentId.SelectedValue);
        int intIndexStatus = Int32.Parse(radlIndexStatus.SelectedValue);
        string strRemarks = txtRemarks.Text;

        string strColumnUrlClient = null;
        if (strColumnType == "最终页面")
        {
            strColumnUrlClient = "About.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "联系方式")
        {
            strColumnUrlClient = "Contact.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "新闻列表")
        {
            strColumnUrlClient = "News.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "下载中心")
        {
            strColumnUrlClient = "Download.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "二级分类")
        {
            strColumnUrlClient = "NewsClass.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "图片相册")
        {
            strColumnUrlClient = "Photo.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "图片列表")
        {
            strColumnUrlClient = "PicList.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "产品列表")
        {
            strColumnUrlClient = "Product.aspx";
        }
        else if (strColumnType == "在线留言")
        {
            strColumnUrlClient = "Message.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "在线表单")
        {
            strColumnUrlClient = "SubmitForm.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "在线支付")
        {
            strColumnUrlClient = "Pay.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "一级分类")
        {
            strColumnUrlClient = "#";
        }
        else if (strColumnType == "图片新闻")
        {
            strColumnUrlClient = "PicNews.aspx?ClassID="+intID;
        }
        else if (strColumnType == "网站首页")
        {
            strColumnUrlClient = "Default.aspx";
        }
        //如果是不规则页面_开始
        if (txtColumnUrlClient.Text.Trim() != "")
        {
            strColumnUrlClient = txtColumnUrlClient.Text.Trim();
        }
        //结束
        int intRole = 0;
        intRole = Int32.Parse(radlRole.SelectedValue);
        if (Int32.Parse(dropParentId.SelectedValue) == intID)
        {
            Response.Redirect("Show_Error.aspx?message=操作失败，父级分类不能是当前分类！&url=NewsClass.aspx");
        }
        else
        {
            bool sign = false;
            SqlDataReader dr = newsclass.GetColumnListSub(intID);
            DataTable dt = SystemTools.ConvertDataReaderToDataTable(dr);
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            int rowCount = ds.Tables[0].Rows.Count;

            for (int i = 0; i < rowCount; i++)
            {
                if (dropParentId.SelectedValue == ds.Tables[0].Rows[i]["id"].ToString())//有缺陷，选孙子就不对了
                {
                    sign = true;
                    break;
                }
            }
            if (sign == true)
            {
                Response.Redirect("Show_Error.aspx?message=操作失败，父级分类不能是当前分类的子级分类！&url=NewsClass.aspx");
            }
            else
            {
                strPicPath = pic.Value;
                string strResult = upload();
                int intLength = Int32.Parse(txtLength.Value);
                int intWidth = Int32.Parse(txtWidth.Value);
                if (strResult == "success" || strResult == "no file")
                {
                    int intRowCount = newsclass.UpdateSingleColumnList(intID, intParentId, strColumnType, strColumnName, strColumnSubName, intColumnNo, strColumnUrlClient, intRole, intIndexStatus, strRemarks, strPicPath, intLength, intWidth);
                    if (intRowCount > 0)
                    {
                        Response.Redirect("Show_Success.aspx?message=修改成功！&url=NewsClass.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Show_Error.aspx?message=" + strResult + "&url=NewsClass.aspx");
                }
            }
        }
    }
    /// <summary>
    /// 加载整个分类表
    /// </summary>
    private void LoadList()
    {
        ListItem li = new ListItem("顶级分类", "0");
        dropParentId.Items.Add(li);

        int MTcount = 0;//执行遍历的次数
        //开始迭代加载
        MakeTr("0", MTcount);
    }
    /// <summary>
    /// 装配每一行
    /// </summary>
    /// <param name="id">上级ID</param>
    /// <param name="count">迭代次数</param>
    private void MakeTr(string id, int count)
    {
        DataSet ds = bp.SelectDataBase("ColumnList", "select * from ColumnList where parentid=" + id + " order by ColumnNo desc,id asc");
        DataView dv = ds.Tables[0].DefaultView;
        foreach (DataRowView drv in dv)
        {
            //形成下拉列表
            ListItem li = new ListItem(MakeFelgefu(count) + drv["ColumnName"].ToString(), drv["id"].ToString());
            dropParentId.Items.Add(li);

            //再次遍历
            MakeTr(drv["id"].ToString(), count + 2);
        }
    }
    /// <summary>
    /// Make分隔符
    /// </summary>
    /// <param name="count"></param>
    /// <returns></returns>
    private string MakeFelgefu(int count)
    {
        string Returnwords = string.Empty;
        if (count == 0)
        {
            Returnwords = "";
        }
        else
        {
            Returnwords = ("├ ").PadLeft(count, '　');
        }
        return Returnwords;
    }
    protected string upload()
    {
        string strResult = null;
        if (fileup.PostedFile.ContentLength != 0)
        {
            if (fileup.PostedFile.ContentLength <= WebSet.NewsClassFileLength * 1024)
            {
                Boolean fileok = false;
                filename = DateTime.Now.ToString("yyyyMMddHHmmss");
                String fileextension = System.IO.Path.GetExtension(fileup.PostedFile.FileName).ToLower();
                String[] allowedextensions = { ".jpg", ".png", ".gif", ".swf" };
                for (int i = 0; i < allowedextensions.Length; i++)
                {
                    if (fileextension == allowedextensions[i])
                    {
                        fileok = true;
                        break;
                    }
                }
                if (fileok == true)
                {
                    String filepath = Path.Combine(Server.MapPath("../upload/img"), Path.GetFileName(filename + fileextension));

                    fileup.PostedFile.SaveAs(filepath);
                    strPicPath = "upload/img/" + filename + fileextension;
                    strResult = "success";
                }
                else
                {
                    strResult = "文件类型错误！正确格式为：jpg或png或gif";
                }
            }
            else
            {
                strResult = "文件大小不能超过" + WebSet.NewsClassFileLength + "KB！";
            }
        }
        else
        {
            strResult = "no file";
        }
        return strResult;
    }
}

