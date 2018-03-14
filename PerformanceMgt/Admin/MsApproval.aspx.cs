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

public partial class MsApproval : System.Web.UI.Page
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
        txtApprvCode.Text = myString;
        string myString1 = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtDesign.Text = myString1;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();
        String query = "select * from approval where apprvcode='" + txtApprvCode.Text + "'";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            if (System.DBNull.Value.Equals(readme[0]))
            {
                txtDesign.Text = "";
            }
            else
            {
                txtApprvCode.Text = readme["apprvcode"].ToString();
            }

            if (System.DBNull.Value.Equals(readme[1]))
            {
                txtDesign.Text = "";
            }
            else
            {
                txtDesign.Text = readme["dept"].ToString();
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
        if (txtApprvCode.Text == "" || txtDesign.Text == "")
        {
            lblSave.Visible = true;
            lblSave.Text = "Please Fill All Fields";
            return;
        }
       
        using (SqlConnection conn = new SqlConnection(strconn)) {
      using (SqlCommand cmd = new SqlCommand("InsertApproval", conn)) {
      cmd.CommandType = CommandType.StoredProcedure;

      cmd.Parameters.Add("@apprvcode", SqlDbType.VarChar).Value = txtApprvCode.Text;
      cmd.Parameters.Add("@design", SqlDbType.VarChar).Value = txtDesign.Text;

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
        if (txtApprvCode.Text == "")
        {
            lblSave.Visible = true;
            lblSave.Text = "Please Enter Code to Delete";
            return;
        }
        btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
        SqlConnection conn = new SqlConnection(strconn);

        conn.Open();


        string query = "delete from approval where apprvcode='" + txtApprvCode.Text + "'";
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
        if (txtApprvCode.Text == "" || txtDesign.Text == "")
        {
            lblSave.Visible = true;
            lblSave.Text = "Please Fill All Fields";
            return;
        }
        
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();

        String query = "select * from approval where apprvcode='" + txtApprvCode.Text + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            //SqlConnection conn = new SqlConnection(strconn);
            //cmd.Connection = conn;
            conn.Close();
            conn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateApproval";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("apprvcode", (txtApprvCode.Text));
            cmd.Parameters.AddWithValue("design", (txtDesign.Text));
            cmd.ExecuteNonQuery();
            conn.Close();

            lblSave.Visible = true;
            lblSave.Text = "Record Updated";
            ClearTexbox(Page.Controls);
            GridView1.DataBind();
        }
    }

   
    protected void PopulateTextBoxes()
    {
        string design = txtDesign.Text;

        SqlConnection con = new SqlConnection(strconn);
        SqlCommand cmd = new SqlCommand();
        String strQuery = "select apprvcode,design from approval where apprvcode= '" + txtApprvCode.Text + "'";

        cmd.Parameters.AddWithValue("@apprvcode", txtApprvCode.Text);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                txtApprvCode.Text = sdr[0].ToString();
                txtDesign.Text = sdr[1].ToString();
                // txtDept.Text = sdr["dept"].ToString();
                //txtOldQty.Text = sdr["qty"].ToString();
                //txtCprice.Text = sdr["cprice"].ToString();
                //txtOldPrice.Text = sdr["cprice"].ToString();
            }
            //txtQty.Text = "1";
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
}
