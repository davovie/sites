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
    public void ClearTexbox(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;
            ClearTexbox(ctrl.Controls);
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
            if (System.DBNull.Value.Equals(readme[0]))
            {
                txtDes.Text = "";
            }
            else
            {
                txtFaultCode.Text = readme["faultcode"].ToString();
            }

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

    protected void btnSave_Click(object sender, EventArgs e)
    {
       
       using (SqlConnection conn = new SqlConnection(strconn)) {
      using (SqlCommand cmd = new SqlCommand("InsertFault", conn)) {
      cmd.CommandType = CommandType.StoredProcedure;

      cmd.Parameters.Add("@faultcode", SqlDbType.VarChar).Value = txtFaultCode.Text;
      cmd.Parameters.Add("@des", SqlDbType.VarChar).Value = txtDes.Text;

      conn.Open();
      cmd.ExecuteNonQuery();
       
        conn.Close();
        lblSave.Visible = true;
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
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
        SqlConnection conn = new SqlConnection(strconn);

        conn.Open();


        string query = "delete fault where faultcode='" + txtFaultCode.Text + "'";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        cmd.ExecuteNonQuery();

        conn.Close();
        lblSave.Visible = true;
        lblSave.Text = "Record Deleted";
        ClearTexbox(Page.Controls);
        GridView1.DataBind();

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();

        String query = "select * from fault where faultcode='" + txtFaultCode.Text + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            //SqlConnection conn = new SqlConnection(strconn);
            //cmd.Connection = conn;
            conn.Close();
            conn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateFault";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("faultcode", (txtFaultCode.Text));
            cmd.Parameters.AddWithValue("des", (txtDes.Text));
            cmd.ExecuteNonQuery();
            conn.Close();

            lblSave.Visible = true;
            lblSave.Text = "Record Updated";
            ClearTexbox(Page.Controls);
            GridView1.DataBind();
        }
    }
}
