using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class MsDept : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

           // load_ddlDept();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtDept.Text == "")
        {
            lblSave.Visible = true;
            lblSave.Text = "Please Enter a Dept";
            return;
        }
        using (SqlConnection conn = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("InsertDept", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@dept", SqlDbType.VarChar).Value = txtDept.Text;
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();
                lblSave.Text = "Record Saved";
                ddlDept.DataBind();
                GridView1.DataBind();
                ClearTexbox(Page.Controls);
                //lblSave.Visible = false;

            }
        }
    }
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
        ddlDept.Text = myString;
        string myString1 = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtDept.Text = myString1;
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
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();
        String query = "select * from dept where depcode='" + ddlDept.Text + "'";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            if (System.DBNull.Value.Equals(readme[1]))
            {
                txtDept.Text = "";
            }
            else
            {
                txtDept.Text = readme["dept"].ToString();
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
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (ddlDept.Text == "1")
        {

            btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
        }
        else
        {
            SqlConnection conn = new SqlConnection(strconn);

            conn.Open();


            string query = "delete dept where deptcode='" + ddlDept.Text + "'";
            cmd = new System.Data.SqlClient.SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

            conn.Close();
            lblSave.Visible = true;
            lblSave.Text = "Record Deleted";
            ClearTexbox(Page.Controls);
            ddlDept.DataBind();
            GridView1.DataBind();
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (txtDept.Text == "")
        {
            lblSave.Visible = true;
            lblSave.Text = "Please Enter a Dept";
            return;
        }
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();

        String query = "select * from dept where deptcode='" + ddlDept.Text + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            //SqlConnection conn = new SqlConnection(strconn);
            //cmd.Connection = conn;
            conn.Close();
            conn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateDept";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("deptcode", (ddlDept.Text));
            cmd.Parameters.AddWithValue("dept", (txtDept.Text));
            cmd.ExecuteNonQuery();
            conn.Close();

            lblSave.Visible = true;
            lblSave.Text = "Record Updated";
            ClearTexbox(Page.Controls);
            ddlDept.DataBind();
            GridView1.DataBind();
        }
       
    }
    
    protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected void PopulateTextBoxes()
    {
        string dept = txtDept.Text;

        SqlConnection con = new SqlConnection(strconn);
        SqlCommand cmd = new SqlCommand();
        String strQuery = "select deptcode,dept from dept where deptcode= '" + ddlDept.Text + "'";

        cmd.Parameters.AddWithValue("@deptcode", ddlDept.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                ddlDept.Text = sdr[0].ToString();
                txtDept.Text = sdr[1].ToString();
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

    protected void ddlDes_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlDept.SelectedItem.Text = "";
        txtDept.Text = "";
    }
}

