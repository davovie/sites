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
using System.Collections.Generic;
using System.Text;

public partial class MsEnergyReturn : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    protected void Page_Load(object sender, EventArgs e)
    {
        txtTransDate.Text = DateTime.Now.ToString("dd/MM/yyyy hh:mm");
        //ddlDay.Text = DateTime.Now.ToString("dd");
        //ddlMonth.Text = DateTime.Now.ToString("MM");
        //ddlYear.Text = DateTime.Now.ToString("yyyy");
       // txtTransID.Text = "00000002";
        Calendar1.Visible = false;
    }
   
    public void loadcurentdate()
    {
        txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        //ddlDay.Text = DateTime.Now.ToString("dd");
        //ddlMonth.Text = DateTime.Now.ToString("MM");
        //ddlYear.Text = DateTime.Now.ToString("yyyy");
    }
    public void copy_lbl_to_ddl()
    {
        //string strDate = txtTransDate.Text; //Format – dd/MM/yyyy
        ////string strDate = "26/07/2011"; //Format – dd/MM/yyyy
        ////split string date by separator, here I'm using '/'
        //string[] arrDate = strDate.Split('/');

        ////now use array to get specific date object
        //string day = arrDate[0].ToString();
        //string month = arrDate[1].ToString();
        //string year = arrDate[2].ToString();
        //ddlDay.Text = day;
        //ddlMonth.Text = month;
        //ddlYear.Text = year;
    }
    public void ClearTexbox(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;
            ClearTexbox(ctrl.Controls);
        }
       // lblSave.Visible = false;
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
        //////GridViewRow row = GridView1.SelectedRow;
        //////ddlDept.Text = row.Cells[0].Text;
        //////txtDept.Text = row.Cells[1].Text;
        ////// txtCountry.Text = (row.FindControl("lblCountry") as Label).Text;

        string myString = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtTransID.Text = myString;
        string myString1 = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtDate.Text = myString1;
        string myString2 = GridView1.SelectedRow.Cells[3].Text.ToString();
        txtStation.Text = myString2;
        string myString3 = GridView1.SelectedRow.Cells[4].Text.ToString();
        txtMeterNo.Text = myString3;
        string myString4 = GridView1.SelectedRow.Cells[5].Text.ToString();
        txtTransformer.Text = myString4;
        ////////foreach (GridViewRow row in GridView1.Rows)
        ////////{
        ////////    if (row.RowIndex == GridView1.SelectedIndex)
        ////////    {
        ////////        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
        ////////        row.ToolTip = string.Empty;
        ////////    }
        ////////    else
        ////////    {
        ////////        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
        ////////        row.ToolTip = "Click to select this row.";
        ////////    }
        ////////}
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //System.Data.SqlClient.SqlDataReader readme;
        //SqlConnection conn = new SqlConnection(strconn);
        //conn.Open();
        //String query = "select * from fault where des='" + txtDes.Text + "'";
        //cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        //readme = cmd.ExecuteReader();
        //if (readme.Read())
        //{
        //    if (System.DBNull.Value.Equals(readme[1]))
        //    {
        //        txtDes.Text = "";
        //    }
        //    else
        //    {
        //        txtDes.Text = readme["des"].ToString();
        //    }
        //}
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //System.Data.SqlClient.SqlDataReader readme;
        //SqlConnection conn = new SqlConnection(strconn);
        //conn.Open();
        //String query = "select * from fault where faultcode='" + txtFaultCode.Text + "'";
        //cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        //readme = cmd.ExecuteReader();
        //if (readme.Read())
        //{
        //    if (System.DBNull.Value.Equals(readme[1]))
        //    {
        //        txtDes.Text = "";
        //    }
        //    else
        //    {
        //        txtDes.Text = readme["des"].ToString();
        //    }
        //}
        }
       
    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("InsertEnergymaster", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@transno", SqlDbType.VarChar).Value = txtTransID.Text;
                cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtDate.Text;
                cmd.Parameters.Add("@balr1", SqlDbType.VarChar).Value = txtTotImport.Text;
                cmd.Parameters.Add("@balr2", SqlDbType.VarChar).Value = txtTotExport.Text;
                cmd.Parameters.Add("@totimport", SqlDbType.VarChar).Value = txtTotImport.Text;
                cmd.Parameters.Add("@totexport", SqlDbType.VarChar).Value = txtTotExport.Text;
                cmd.Parameters.Add("@totdiff", SqlDbType.VarChar).Value = txtTotDiff.Text;
                //cmd.Parameters.Add("@locate1", SqlDbType.VarChar).Value = txtLocate1.Text;
                ////cmd.Parameters.Add("@apparatus", SqlDbType.VarChar).Value = txtApparatus.Text;
                //cmd.Parameters.Add("@reason", SqlDbType.VarChar).Value = txtReason.Text;
                //cmd.Parameters.Add("@workdn", SqlDbType.VarChar).Value = txtWorkdn.Text;
                //cmd.Parameters.Add("@certify", SqlDbType.VarChar).Value = txtCertify.Text;

                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();
                // lblSave.Text = "Record Saved";
                // GridView1.DataBind();
              // ClearTexbox(Page.Controls);
            }

        }
    }
protected void  btnLook_Click(object sender, EventArgs e)
{
    //txtFaultCode.Text = "";

    //    System.Data.SqlClient.SqlDataReader readme;
    //    SqlConnection conn = new SqlConnection(strconn);
    //    conn.Open();
    //    String query = "select * from fault where des like '%Elect'";
    //    cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    //    readme = cmd.ExecuteReader();
    //    if (readme.Read())
    //    {
    //        if (System.DBNull.Value.Equals(readme[1]))
    //        {
    //            txtFaultCode.Text = "";
    //        }
    //        else
    //        {
    //            txtFaultCode.Text = readme["faultcode"].ToString();
    //        }
    //    }
}
protected void btnUpdate_Click(object sender, EventArgs e)
{
//    using (SqlConnection conn = new SqlConnection(strconn))
//    {
//        using (SqlCommand cmd = new SqlCommand("UpdateTrouble", conn))
//        {
//            cmd.CommandType = CommandType.StoredProcedure;
//            cmd.Parameters.AddWithValue("transid", txtTransID.Text);
//            cmd.Parameters.AddWithValue("transdate", txtTransDate.Text);
//            cmd.Parameters.AddWithValue("dept", ddlDept.Text);
//            cmd.Parameters.AddWithValue("locate", txtLocate.Text);
//            cmd.Parameters.AddWithValue("faultcode", txtFaultCode.Text);
//            cmd.Parameters.AddWithValue("des", txtDes.Text);
//            cmd.Parameters.AddWithValue("station", ddlStation.Text);
//            cmd.Parameters.AddWithValue("locate1", txtLocate1.Text);
//            //cmd.Parameters.AddWithValue("apparatus", txtApparatus.Text);
//            cmd.Parameters.AddWithValue("reason", txtReason.Text);
//            cmd.Parameters.AddWithValue("certify", txtCertify.Text);
            
//            //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

//            conn.Open();
//            cmd.ExecuteNonQuery();

//            conn.Close();
//            // lblSave.Text = "Record Saved";
//            // GridView1.DataBind();
//            ClearTexbox(Page.Controls);
//        }

//    }
}
protected void Button1_Click(object sender, EventArgs e)
{
    //System.Data.SqlClient.SqlDataReader readme;
    //SqlConnection conn = new SqlConnection(strconn);
    //conn.Open();
    //String query = "select * from troubleview where transid='" + txtTransID.Text + "'";
    //cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    //readme = cmd.ExecuteReader();
    //if (readme.Read())
    //{
    //    if (System.DBNull.Value.Equals(readme[1]))
    //    {
    //        txtTransDate.Text = "";
    //    }
    //    else
    //    {
    //        txtTransDate.Text = readme["transdate"].ToString();
    //    }
    //    if (System.DBNull.Value.Equals(readme[2]))
    //    {
    //        txtFaultCode.Text = "";
    //    }
    //    else
    //    {
    //        txtFaultCode.Text = readme["faultcode"].ToString();
    //    }
    //    if (System.DBNull.Value.Equals(readme[3]))
    //    {
    //        txtDes.Text = "";
    //    }
    //    else
    //    {
    //        txtDes.Text = readme["des"].ToString();
    //    }
    //    if (System.DBNull.Value.Equals(readme[4]))
    //    {
    //        ddlDept.Text = "";
    //    }
    //    else
    //    {
    //        ddlDept.Text = readme["dept"].ToString();
    //    }
    //    if (System.DBNull.Value.Equals(readme[5]))
    //    {
    //        txtLocate.Text = "";
    //    }
    //    else
    //    {
    //        txtLocate.Text = readme["locate"].ToString();
    //    }
       
    //    if (System.DBNull.Value.Equals(readme[6]))
    //    {
    //        ddlStation.Text = "";
    //    }
    //    else
    //    {
    //        ddlStation.Text = readme["station"].ToString();
    //    }
    //    if (System.DBNull.Value.Equals(readme[7]))
    //    {
    //        txtLocate1.Text = "";
    //    }
    //    else
    //    {
    //        txtLocate1.Text = readme["locate1"].ToString();
    //    }
    //    if (System.DBNull.Value.Equals(readme[8]))
    //    {
    //        ddlDept.Text = "";
    //    }
    //    else
    //    {
    //        ddlDept.Text = readme["dept"].ToString();
    //    }
    //    if (System.DBNull.Value.Equals(readme[9]))
    //    {
    //        txtReason.Text = "";
    //    }
    //    else
    //    {
    //        txtReason.Text = readme["reason"].ToString();
    //    }
    //    if (System.DBNull.Value.Equals(readme[10]))
    //    {
    //        txtWorkdn.Text = "";
    //    }
    //    else
    //    {
    //        txtWorkdn.Text = readme["workdn"].ToString();
    //    }
    //    if (System.DBNull.Value.Equals(readme[11]))
    //    {
    //        txtCertify.Text = "";
    //    }
    //    else
    //    {
    //        txtCertify.Text = readme["certify"].ToString();
    //    }
    //    btnSave.Enabled = false;
    //    btnUpdate.Enabled = true;
    //    btnDelete.Enabled = true;
    //}
}
protected void btnDate_Click(object sender, EventArgs e)
{
    //if (Calendar1.Visible)
    //{
    //    Calendar1.Visible = false;
    //}
    //else
    //{
    //    Calendar1.Visible = true;
    //}
}
protected void Calendar1_SelectionChanged(object sender, EventArgs e)
{
   // txtTransDate.Text = Calendar1.SelectedDate.ToString();
    //txtTransDate.Text = Calendar1.SelectedDate.ToString("d");
    //Calendar1.Visible = false; 
}
protected void btnClear_Click(object sender, EventArgs e)
{
    //ClearTexbox(Page.Controls);
    //btnSave.Enabled = true;
    //btnDelete.Enabled = false;
    //btnUpdate.Enabled = false;
}
protected void btnDelete_Click(object sender, EventArgs e)
{
   // btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
   // SqlConnection conn = new SqlConnection(strconn);

   // SqlConnection sqlCon = new SqlConnection(strconn);
   // SqlCommand sqlComm = new SqlCommand();
   // sqlComm.Connection = sqlCon;
    
   // sqlComm.CommandText = "DeleteTrouble";
   // sqlComm.CommandType = CommandType.StoredProcedure;
   // sqlComm.Parameters.AddWithValue("transid", txtTransID.Text);
   // //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

   // sqlCon.Open();

   // sqlComm.ExecuteNonQuery();

   // conn.Close();
   //// lblSave.Visible = true;
   //// lblSave.Text = "Record Deleted";
   // ClearTexbox(Page.Controls);
   // //GridView1.DataBind();
    
}
protected void btnAdd_Click(object sender, EventArgs e)
{
    using (SqlConnection conn = new SqlConnection(strconn))
    {
        using (SqlCommand cmd = new SqlCommand("InsertEnergyDetail", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@transno", SqlDbType.VarChar).Value = txtTransID.Text;
            cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text;
            cmd.Parameters.Add("@station", SqlDbType.VarChar).Value = txtStation.Text;
            cmd.Parameters.Add("@meterno", SqlDbType.VarChar).Value = txtMeterNo.Text;
            cmd.Parameters.Add("@transformer", SqlDbType.VarChar).Value = txtTransformer.Text;
            cmd.Parameters.Add("@ctratio", SqlDbType.VarChar).Value = txtCtRatio.Text;
            cmd.Parameters.Add("@voltage", SqlDbType.VarChar).Value = txtVoltage.Text;
            cmd.Parameters.Add("@mf", SqlDbType.VarChar).Value = txtMf.Text;
            //cmd.Parameters.Add("@apparatus", SqlDbType.VarChar).Value = txtApparatus.Text;
            cmd.Parameters.Add("@importpv", SqlDbType.VarChar).Value = txtPreviousI.Text;
            cmd.Parameters.Add("@importps", SqlDbType.VarChar).Value = txtPresentI.Text;
            cmd.Parameters.Add("@diff", SqlDbType.VarChar).Value = txtDiffI.Text;
            cmd.Parameters.Add("@exportpv", SqlDbType.VarChar).Value = txtPreviousE.Text;
            cmd.Parameters.Add("@exportps", SqlDbType.VarChar).Value = txtPresentE.Text;
            cmd.Parameters.Add("@diff1", SqlDbType.VarChar).Value = txtDiffE.Text;

            conn.Open();
            cmd.ExecuteNonQuery();

            conn.Close();
            // lblSave.Text = "Record Saved";
             GridView1.DataBind();
           // ClearTexbox(Page.Controls);
             caltotimpandexp();
             subtract();
        }

    }
   
}
public void caltotimpandexp()
{
    System.Data.SqlClient.SqlDataReader readme;
    SqlConnection conn = new SqlConnection(strconn);
    conn.Open();
    String query = "select sum(importps) as amt1, sum(exportps) as amt2 from energydetail where transno = '" + txtTransID.Text + "'";
    cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    readme = cmd.ExecuteReader();
    if (readme.Read())
//    System.Data.SqlClient.SqlDataReader readcode;
//    SqlConnection conn = new SqlConnection(strconn);
//    conn.Close();
//    conn.Open();
//    string query1 = "select sum(import) as amt1, sum(export) as amt2 from energydetail where transnono = '" + txtTransID.Text + "'";
//    cmd = new System.Data.SqlClient.SqlCommand(query1, conn);
//    readcode = strconn.ExecuteReader();
//    //strconn.ExecuteNonQuery();
//    // conn.Close();
//    if (readcode.Read())
    {
        {
            txtTotImport.Text = readme["amt1"].ToString();
            txtTotExport.Text = readme["amt2"].ToString();
        }
    }
}
private void subtract()
{
    //decimal import = Decimal.Parse(txtPrevious.Text);
    //decimal export = Decimal.Parse(txtPresent.Text);
    //txtDiff.Text = (import - export).ToString();

    return;
}
protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
{
    if (Calendar1.Visible)
    {
        Calendar1.Visible = false;
    }
    else
    {
        Calendar1.Visible = true;
    }
}
protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
{
    txtTransDate.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy hh:mm");
    Calendar1.Visible = false; 
}
}

