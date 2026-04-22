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
using basic;
using System.IO;
using WebApp.Components;

public partial class Manager_ProClassNameEdit : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    int intID;
    string strPicPath = "";
    public string strImg;
    string filename;
    ProClass proclass = new ProClass();
    public string strContext = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools system = new SystemTools();
        btnSave.Attributes.Add("onclick", "return checkNull()");
        intID = Int32.Parse(Request["ID"]);
        if (!IsPostBack)
        {
            LoadList();
            showNewsClassName();
        }
    }
    private void showNewsClassName()
    {
        SqlDataReader reader = proclass.GetSingleProClass(intID);
        if (reader.Read())
        {
            strContext = reader["ConText"].ToString();
            dropParentId.SelectedValue = reader["ParentId"].ToString();
            txtConText.Text = reader["ConText"].ToString();
            txtpaixu.Text = reader["paixu"].ToString();

            string neiron = reader["content"].ToString();

            //seo
            int len = neiron.Split('^').Length;
            if (len > 1)
            {
                content.Value = neiron.Split('^')[0];
                txtTitle.Text = neiron.Split('^')[1];
                txtDescription.Text = neiron.Split('^')[2];
                txtKeyWords.Text = neiron.Split('^')[3];
            }
            else
            {
                content.Value = reader["content"].ToString();
            }

            rblstate.SelectedValue = reader["state"].ToString();
            txt_path.Text = reader["path"].ToString();
            strImg = reader["path"].ToString();
            if (reader["path"].ToString() != "")//判断是否有图片
            {
                rblpic.Items[1].Selected = true;
            }
            else
            {
                rblpic.Items[0].Selected = true;
            }
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        if (Int32.Parse(dropParentId.SelectedValue) == intID)
        {
            Response.Redirect("Show_Error.aspx?message=操作失败，父级分类不能是当前分类！&url=ProClass.aspx");
        }
        else
        {
            bool sign = false;
            SqlDataReader dr = proclass.GetProClassSub(intID);
            DataTable dt = SystemTools.ConvertDataReaderToDataTable(dr);
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            int rowCount = ds.Tables[0].Rows.Count;

            for (int i = 0; i < rowCount; i++)
            {
                if (dropParentId.SelectedValue == ds.Tables[0].Rows[i]["id"].ToString())
                {
                    sign = true;
                    break;
                }
            }
            if (sign == true)
            {
                Response.Redirect("Show_Error.aspx?message=操作失败，父级分类不能是当前分类的子级分类!！&url=ProClass.aspx");
            }
            else
            {
                
                strPicPath = txt_path.Text;
                int intRowCount = proclass.UpdateSingleProClass(intID, Int32.Parse(txtpaixu.Text), Int32.Parse(dropParentId.SelectedValue), txtConText.Text, content.Value, strPicPath, Int32.Parse(rblstate.SelectedValue));
                string neirong = content.Value.Replace("^", "") + "^" + txtTitle.Text.Replace("^", "") + "^" + txtDescription.Text.Replace("^", "") + "^" + txtKeyWords.Text.Replace("^", "");
                bp.doExecute("update ProClass set content=N'" + neirong.Replace("'", "''") + "' where id=" + intID);

                if (intRowCount > 0)
                {
                    Response.Redirect("Show_Success.aspx?message=修改成功！&url=ProClass.aspx");
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
        DataSet ds = bp.SelectDataBase("ProClass", "select * from ProClass where parentid=" + id + " order by id asc");
        DataView dv = ds.Tables[0].DefaultView;
        foreach (DataRowView drv in dv)
        {

            //形成下拉列表
            ListItem li = new ListItem(MakeFelgefu(count) + drv["context"].ToString(), drv["id"].ToString());
            dropParentId.Items.Add(li);

            //再次遍历
            MakeTr(drv["id"].ToString(), count + 1);
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
            Returnwords = ("├").PadLeft(count, '　');
        }
        return Returnwords;
    }
    public string chkPic(string path)
    {
        string strPath = null;

        if (string.IsNullOrEmpty(path))
        {
            strPath = "<a href='../upload/default.jpg' target='_blank'><img src='../upload/default.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";
        }
        else
        {
            if (!File.Exists(Server.MapPath("../" + path)))
            {
                strPath = "<a href='../" + path + "' target='_blank'><img src='../upload/zanwu.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";

            }
            else
            {
                if (path.ToLower().Contains(".jpg") || path.ToLower().Contains(".png") || path.ToLower().Contains(".gif"))
                {
                    strPath = "<a href='../" + path + "' target='_blank'><img src='../" + path + "' alt='有缩略图' style='height:28px;width:31px;border:1px solid #dadada;'  /></a>";
                }
                else
                {
                    strPath = "<a href='../" + path + "' target='_blank'><img src='../upload/fujian.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";
                }
            }
        }
        return strPath;
    }
}

