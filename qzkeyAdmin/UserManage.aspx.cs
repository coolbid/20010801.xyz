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

public partial class Manager_UserManage : Basic.ManagerPage
{
    User user = new User();
    int rowCount;//用来记录总记录数
    string strAction = null;
    public int intID;
    DataSet dst = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("onclick", "return BackWait()");
        strAction = Request["Action"];
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
            GridViewFill();
        }
    }
    private void GridViewFill()
    {
        SqlDataReader dr = user.GetUser();
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
        int intRowCount = user.DeleteSingleUser(Int32.Parse(gvList.DataKeys[e.RowIndex].Value.ToString()));
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?message=删除成功！&url=UserManage.aspx");
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
        SqlDataReader reader = user.GetSingleUser(intID);
        if (reader.Read())
        {
            txtUserAccount.Text = reader["UserAccount"].ToString();
            txtUserName.Text = reader["UserName"].ToString();
            txtUserPassword.Text = reader["UserPassword"].ToString();
            txtUserPassword2.Text = reader["UserPassword"].ToString();
            txtUserEmail.Text = reader["UserEmail"].ToString();
            txtUserQQ.Text = reader["UserQQ"].ToString();
            txtUserPhone.Text = reader["UserPhone"].ToString();
            radlUserState.SelectedValue = reader["UserState"].ToString();
            txtUserRealName.Text = reader["UserRealName"].ToString();
            txtUserAddress.Text = reader["UserAddress"].ToString();
            txtUserCompany.Text = reader["UserCompany"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object s, EventArgs e)
    {
        double dblUserAccount = Double.Parse(txtUserAccount.Text.Trim());
        string strUserName = txtUserName.Text.Trim();
        string strUserPassword = txtUserPassword.Text.Trim();
        string strUserEmail = txtUserEmail.Text.Trim();
        string strUserQQ = txtUserQQ.Text.Trim();
        string strUserPhone = txtUserPhone.Text.Trim();
        string strUserState = radlUserState.SelectedValue;
        string strUserRealName = txtUserRealName.Text;
        string strUserAddress = txtUserAddress.Text;
        string strUserCompany = txtUserCompany.Text;
        string strPutdate = DateTime.Now.ToString();
        if (intID == 0)
        {
            int intIdentity = user.AddSingleUser(dblUserAccount, strUserName, strUserPassword, strUserEmail, strUserQQ, strUserPhone, strUserState, strUserRealName, strUserAddress, strUserCompany, strPutdate);
            if (intIdentity > 0)
            {
                Response.Redirect("Show_Success.aspx?message=会员添加成功！&url=UserManage.aspx");
            }
            else
            {
                Response.Redirect("Show_Error.aspx?message=用户名已存在，添加失败！&url=UserManage.aspx");
            }
        }
        else
        {
            int intRowCount = user.UpdateSingleUser(intID, dblUserAccount, strUserName, strUserPassword, strUserEmail, strUserQQ, strUserPhone, strUserState, strUserRealName, strUserAddress, strUserCompany);
            if (intRowCount > 0)
            {
                Response.Redirect("Show_Success.aspx?message=会员信息修改成功！&url=UserManage.aspx");
            }
        }
    }
    protected string showUserState(string strUserState)
    {
        string strValue = null;
        if (strUserState == "0")
        {
            strValue = "正常";
        }
        else
        {
            strValue = "<font color='red'>禁止</font>";
        }
        return strValue;
    }
}

