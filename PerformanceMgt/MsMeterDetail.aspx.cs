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

public partial class MsMeterDetail : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

          
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();

        String query = "select * from meterdetail where meterno='" + txtMeterNo.Text + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            //SqlConnection conn = new SqlConnection(strconn);
            //cmd.Connection = conn;
            conn.Close();
            conn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateMeterDetail";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("meterno", (txtMeterNo.Text));
            cmd.Parameters.AddWithValue("station", (txtStation.Text));
            cmd.Parameters.AddWithValue("transformer", (txtTransformer.Text));
            cmd.Parameters.AddWithValue("voltage", (txtVoltage.Text));
            cmd.Parameters.AddWithValue("ctratio", (txtCtRatio.Text));
            cmd.Parameters.AddWithValue("mf", (txtMf.Text));
            cmd.ExecuteNonQuery();
            conn.Close();

            lblSave.Visible = true;
            lblSave.Text = "Record Updated";
            ClearTexbox(Page.Controls);
            // ddlDept.DataBind();
            GridView1.DataBind();
        }
        else
        {
            using (SqlCommand cmd1 = new SqlCommand("InsertMeterDetail", conn))
            {
                cmd1.CommandType = CommandType.StoredProcedure;

                cmd1.Parameters.Add("@meterno", SqlDbType.VarChar).Value = txtMeterNo.Text;
                cmd1.Parameters.Add("@station", SqlDbType.VarChar).Value = txtStation.Text;
                cmd1.Parameters.Add("@transformer", SqlDbType.VarChar).Value = txtTransformer.Text;
                cmd1.Parameters.Add("@voltage", SqlDbType.VarChar).Value = txtVoltage.Text;
                cmd1.Parameters.Add("@ctratio", SqlDbType.VarChar).Value = txtCtRatio.Text;
                cmd1.Parameters.Add("@mf", SqlDbType.VarChar).Value = txtMf.Text;
                cmd1.Connection = conn;
                conn.Close();
                conn.Open();
                cmd1.ExecuteNonQuery();
                conn.Close();
                lblSave.Visible = true;
               lblSave.Text = "Record Saved";
               GridView1.DataBind();
               ClearTexbox(Page.Controls);
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
      
        string myString = GridView1.SelectedRow.Cells[0].Text.ToString();
        txtMeterNo.Text = myString;
        string myString1 = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtStation.Text = myString1;
        string myString2 = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtTransformer.Text = myString2;
        string myString3 = GridView1.SelectedRow.Cells[3].Text.ToString();
        txtVoltage.Text = myString3;
        string myString4 = GridView1.SelectedRow.Cells[4].Text.ToString();
        txtCtRatio.Text = myString4;
        string myString5 = GridView1.SelectedRow.Cells[5].Text.ToString();
        txtMf.Text = myString5;
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
        String query = "select * from meterdetail where meterno='" + txtMeterNo.Text + "'";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            if (System.DBNull.Value.Equals(readme[1]))
            {
                txtTransformer.Text = "";
            }
            else
            {
                txtTransformer.Text = readme["dept"].ToString();
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
        btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
        SqlConnection conn = new SqlConnection(strconn);

        conn.Open();


        string query = "delete meterdetail where meterno='" + txtMeterNo.Text + "'";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        cmd.ExecuteNonQuery();

        conn.Close();
        lblSave.Visible = true;
        lblSave.Text = "Record Deleted";
       // ClearTexbox(Page.Controls);
        //ddlDept.DataBind();
        GridView1.DataBind();

    }


    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearTexbox(Page.Controls);
    }
}
