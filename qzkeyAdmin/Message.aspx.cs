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
using jmail;
using System.Net.Mail;

public partial class Manager_Message : Basic.ManagerPage
{
    public BasicPage bp = new BasicPage();
    Feedback Feedback = new Feedback();
    int rowCount;//用来记录总记录数
    string strAction = null;
    int intID;
    DataSet dst = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

        btnSave.Attributes.Add("onclick", "return checkNull()");
        strAction = Request.QueryString["Action"];
        if (strAction == null)
        {
            if (!IsPostBack)
            {
                pnlList.Visible = true;
                pnlEdit.Visible = false;
                //绑定数据
                GridViewFill();
            }
        }
        else if (strAction == "View")
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
    }
    private void GridViewFill()
    {
        SqlDataReader dr = Feedback.GetMessage();
        DataTable dt = SystemTools.ConvertDataReaderToDataTable(dr);
        dst = new DataSet();
        dst.Tables.Add(dt);
        rowCount = dst.Tables[0].Rows.Count;
        if (rowCount > 0)
        {
            this.gvList.DataSource = dst.Tables[0].DefaultView;
            this.gvList.DataBind();
        }
        else
        {
            pnlList.Visible = false;
            pnlShow.Visible = true;
        }
    }
    protected void gvList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int intRowCount = Feedback.DeleteSingleMessage(Int32.Parse(gvList.DataKeys[e.RowIndex].Value.ToString()));
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?message=删除成功！&url=Message.aspx");
        }
    }
    protected void NavigateToPage(object sender, CommandEventArgs e)
    {
        //控制转页
        switch (e.CommandArgument.ToString())
        {
            case "First":
                this.gvList.PageIndex = 0;
                break;
            case "Prev":
                if (this.gvList.PageIndex > 0)
                    this.gvList.PageIndex -= 1;
                break;
            case "Next":
                if (this.gvList.PageIndex < (this.gvList.PageCount - 1))
                    this.gvList.PageIndex += 1;
                break;
            case "Last":
                this.gvList.PageIndex = this.gvList.PageCount - 1;
                break;
        }
        GridViewFill();
    }
    protected void GridView_DataBind(object sender, EventArgs e)
    {
        if (dst.Tables[0].Rows.Count > 0)
        {
            GridViewRow pagerRow = gvList.BottomPagerRow;
            //获取Label实例，显示页次信息
            Label lblCurrent = (Label)pagerRow.Cells[0].FindControl("lblPageCurrent");
            Label lblCount = (Label)pagerRow.Cells[0].FindControl("lblPageCount");
            Label lblRow = (Label)pagerRow.Cells[0].FindControl("lblPageRow");
            //获取按钮实例，为了控制其是否可用
            LinkButton btnFirstTem = (LinkButton)pagerRow.Cells[0].FindControl("btnFirst");
            LinkButton btnPrevTem = (LinkButton)pagerRow.Cells[0].FindControl("btnPrev");
            LinkButton btnNextTem = (LinkButton)pagerRow.Cells[0].FindControl("btnNext");
            LinkButton btnLastTem = (LinkButton)pagerRow.Cells[0].FindControl("btnLast");

            if (lblCurrent != null)
                lblCurrent.Text = (this.gvList.PageIndex + 1).ToString();
            if (lblCount != null)
                lblCount.Text = this.gvList.PageCount.ToString();
            if (lblRow != null)
                lblRow.Text = rowCount.ToString();

            if (this.gvList.PageIndex == 0)
            {
                btnFirstTem.Enabled = false;
                btnPrevTem.Enabled = false;
                //只有一页，所有分页按钮不可用
                if (this.gvList.PageCount == 1)
                {
                    btnNextTem.Enabled = false;
                    btnLastTem.Enabled = false;
                }
            }
            else if (this.gvList.PageIndex == (this.gvList.PageCount - 1))
            {
                btnNextTem.Enabled = false;
                btnLastTem.Enabled = false;
            }
        }
    }
    protected void showContent()
    {
        string strStateShenhe = null;
        SqlDataReader reader = Feedback.GetSingleMessage(intID);
        if (reader.Read())
        {
            lblRealname.Text = reader["Realname"].ToString();
            lblPhone.Text = reader["Phone"].ToString();
            lblEmail.Text = reader["Email"].ToString();
            lblTitle.Text = reader["Title"].ToString();
            lblContent.Text = reader["Content"].ToString();
            //lblQQ.Text = reader["QQ"].ToString();
            txtReply.Text = reader["Reply"].ToString();
            strStateShenhe = reader["StateShenhe"].ToString();
        }
        reader.Close();
        if (strStateShenhe == "0")
        {
            bp.doExecute("update Message set StateShenhe=1 where ID=" + intID + "");
        }
    }
    protected void btnSaveClick(object s, EventArgs e)
    {
        string strEmail = lblEmail.Text.Trim();
        string strMailContent = null;
        strMailContent = "<table cellpadding='2' cellspacing='0' border='0' width='600' style='font-size:14px;'>";
        strMailContent = strMailContent + "<tr><td>你在网站 http://" + HttpContext.Current.Request.Url.Host + " 的留言已经得到回复，内容如下：</td></tr>";
        strMailContent = strMailContent + "<tr><td>咨询主题：" + lblTitle.Text + "</td></tr>";
        strMailContent = strMailContent + "<tr><td>咨询内容：" + lblContent.Text + "</td></tr>";
        strMailContent = strMailContent + "<tr><td><b>回复内容：</b>" + txtReply.Text + "</td></tr>";
        strMailContent = strMailContent + "<tr><td>本邮件由系统发送，无需回复！</td></tr>";
        strMailContent = strMailContent + "</table>";

        int intStateShenhe = 1;
        int intStateHuifu = 1;
        int intRowCount = Feedback.UpdateSingleMessage(intID, intStateShenhe, intStateHuifu, txtReply.Text.Trim());
        if (intRowCount > 0)
        {
            bool result = Basic.Tools.Mail.Send(strEmail, "腾云建站", "网站留言回复通知", strMailContent.ToString());
            if (result)
            {
                Response.Redirect("Show_Success.aspx?message=回复成功！&url=Message.aspx");
            }
        }
    }
    public string chkShenhe(string strStateShenhe)
    {
        if (strStateShenhe == "0")
            return "<font color='red'>等待阅读</a>";
        else
            return "已经阅读";
    }
    public string chkHuifu(string strStateHuifu)
    {
        if (strStateHuifu == "0")
            return "<font color='red'>等待回复</a>";
        else
            return "已经回复";
    }
}

