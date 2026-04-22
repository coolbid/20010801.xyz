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

public partial class Manager_Query : Basic.ManagerPage
{
    Links links = new Links();
    int rowCount;//用来记录总记录数
    string strAction = null;
    int intID;
    int intTypeID;
    DataSet dst = new DataSet();
    basic.BasicPage bp = new basic.BasicPage();
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
        dst = new DataSet();
        dst = bp.SelectDataBase("TbQuery", "select * from TbQuery");
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
        bp.doExecute("delete from tbQuery where id=" + gvList.DataKeys[e.RowIndex].Value.ToString());
        Response.Redirect("Show_Success.aspx?message=删除成功！&url=Query.aspx");
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
        SqlDataReader reader = bp.getRead("select * from TbQuery where id=" + intID);
        if (reader.Read())
        {
            txtName.Text = reader["Name"].ToString();
            txtMobile.Text = reader["Mobile"].ToString();
            txtCompany.Text = reader["Company"].ToString();
            txtKeys.Text = reader["Keys"].ToString();
            txtResult.Text = reader["Result"].ToString();
            txtContent.Text = reader["Content"].ToString();
            rblState.SelectedValue = reader["State"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object s, EventArgs e)
    {
        string Name = txtName.Text.Trim();
        string Mobile = txtMobile.Text.Trim();
        string Company = txtCompany.Text.Trim();
        string Keys = txtKeys.Text.Trim();
        string Result = txtResult.Text.Trim();
        string Content = txtContent.Text.Trim();
        string State = rblState.SelectedValue;
        string strPutdate = DateTime.Now.ToString();
        if (intID == 0)
        {
            bp.doExecute("insert into TbQuery(Name,Mobile,Company,Keys,Result,Content,State,Putdate) values('" + Name + "','" + Mobile + "','" + Company + "','" + Keys + "','" + Result + "','" + Content + "','" + State + "','" + strPutdate + "')");

            Response.Redirect("Show_Success.aspx?message=添加成功！&url=Query.aspx");
        }
        else
        {
            bp.doExecute("update TbQuery set Name='" + Name + "',Mobile='" + Mobile + "',Company='" + Company + "',Keys='" + Keys + "',Result='" + Result + "',Content='" + Content + "',State='" + State + "' where id=" + intID);
            Response.Redirect("Show_Success.aspx?message=修改成功！&url=Query.aspx");
        }
    }
}

