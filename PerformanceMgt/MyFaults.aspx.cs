using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class MsFaults : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void ClearTexbox(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;
            ClearTexbox(ctrl.Controls);
            btnSave.Enabled = true;
            btnDelete.Enabled = false;
            btnUpdate.Enabled = false;
        }
        lblSave.Visible = false;
    }
    protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
        }
    }
    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        ////GridViewRow row = GridView1.SelectedRow;
        ////ddlDept.Text = row.Cells[0].Text;
        ////txtDept.Text = row.Cells[1].Text;
        //// txtCountry.Text = (row.FindControl("lblCountry") as Label).Text;

        string myString = GridView1.SelectedRow.Cells[0].Text.ToString();
        txtFaultCode.Text = myString;
        string myString1 = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtDes.Text = myString1;
        //string myString2 = GridView1.SelectedRow.Cells[2].Text.ToString();
        //txtImei1.Text = myString2;
        //string myString3 = GridView1.SelectedRow.Cells[3].Text.ToString();
        //txtImei2.Text = myString3;
        //////foreach (GridViewRow row in GridView1.Rows)
        //////{
        //////    if (row.RowIndex == GridView1.SelectedIndex)
        //////    {
        //////        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
        //////        row.ToolTip = string.Empty;
        //////    }
        //////    else
        //////    {
        //////        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
        //////        row.ToolTip = "Click to select this row.";
        //////    }
        //////}
        btnSave.Enabled = false;
        btnDelete.Enabled = true;
        btnUpdate.Enabled = true;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();
        String query = "select * from fault where faultcode='" + txtFaultCode.Text + "'";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            if (System.DBNull.Value.Equals(readme[1]))
            {
                txtDes.Text = "";
            }
            else
            {
                txtDes.Text = readme["des"].ToString();
            }
        }
    }
    protected void GridView1_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);
        }
    }

    protected void btnSave1_Click(object sender, EventArgs e)
    {
        ClearTexbox(Page.Controls);

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("InsertFault", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@faultcode", SqlDbType.VarChar).Value = txtFaultCode.Text;
                cmd.Parameters.Add("@des", SqlDbType.VarChar).Value = txtDes.Text;

                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();
                lblSave.Text = "Record Saved";
                GridView1.DataBind();
                ClearTexbox(Page.Controls);
            }

        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearTexbox(Page.Controls);
        
    }
}