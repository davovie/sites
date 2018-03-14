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

public partial class MsEnergyReturn1 : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
        if (!IsPostBack)
        {
            load_ddlDes();
            loadcurentdate();
            copy_DLL_to_LBL();
            BindGrid();
        }
    }
    public void loadcurentdate()
    {
        txtTransDate.Text = DateTime.Now.ToString("dd/MM/yyyy :hh mm");
        ddlDay.Text = DateTime.Now.ToString("dd");
        ddlMonth.Text = DateTime.Now.ToString("MM");
        ddlYear.Text = DateTime.Now.ToString("yyyy");
    }
    public void copy_lbl_to_ddl()
    {
        string strDate = txtTransDate.Text; //Format – dd/MM/yyyy
        //string strDate = "26/07/2011"; //Format – dd/MM/yyyy
        //split string date by separator, here I'm using '/'
        string[] arrDate = strDate.Split('/');

        //now use array to get specific date object
        string day = arrDate[0].ToString();
        string month = arrDate[1].ToString();
        string year = arrDate[2].ToString();
        ddlDay.Text = day;
        ddlMonth.Text = month;
        ddlYear.Text = year;
    }
    public void copy_DLL_to_LBL()
    {
        txtTransDate.Text = ddlDay.SelectedItem.Value + "/" + ddlMonth.SelectedItem.Value + "/" + ddlYear.SelectedItem.Value;
       string transdate = txtTransDate.Text;
       //transdate = txtTransDate.Text;
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
        string myString = GridView1.SelectedRow.Cells[0].Text.ToString();
        txtSnNo.Text = myString;
        string myString0 = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtTransID.Text = myString0;
        string myString1 = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtTransDate.Text = myString1;
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
        copy_lbl_to_ddl();
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
    private void BindGrid()
    {
        //using (SqlConnection con = new SqlConnection(strconn))
        //{
        //    using (SqlCommand cmd = new SqlCommand("select * from energydetail WHERE meterno = 'IMP98445320' and  transdate = (SELECT MAX(transdate)FROM energydetail )"))
        //    {
        //        using (SqlDataAdapter sda = new SqlDataAdapter())
        //        {
        //            cmd.Connection = con;
        //            sda.SelectCommand = cmd;
        //            using (DataTable dt = new DataTable())
        //            {
        //                if (dt.Rows.Count > 0)
        //                GridView2.DataSource = dt;
        //                GridView2.DataBind();
        //            }
        //        }
        //    }
        //}
    }

    public void load_ddlDes()
    {
       // string stkdes = txtStkDes.Text;

        using (SqlConnection con = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT meterno FROM meterdetail"))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    ddlMeterNo.DataSource = ds.Tables[0];
                    ddlMeterNo.DataTextField = "meterno";
                    ddlMeterNo.DataValueField = "meterno";
                    ddlMeterNo.DataBind();
                }
            }
        }
        ddlMeterNo.Items.Insert(0, new ListItem("--Select a Meter No:--", "0"));
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
                cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text;
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

protected void Button1_Click(object sender, EventArgs e)
{
    System.Data.SqlClient.SqlDataReader readme;
    SqlConnection conn = new SqlConnection(strconn);
    conn.Open();
    String query = "select * from energydetail where transno='" + txtTransID.Text + "'";
    cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    readme = cmd.ExecuteReader();
    if (readme.Read())
    {
        if (System.DBNull.Value.Equals(readme[1]))
        {
            txtTransDate.Text = "";
        }
        else
        {
            txtTransDate.Text = readme["transdate"].ToString();
            txtSnNo.Text = readme["snno"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[2]))
        {
            txtStation.Text = "";
        }
        else
        {
            txtStation.Text = readme["station"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[3]))
        {
            txtMeterNo.Text = "";
        }
        else
        {
            txtMeterNo.Text = readme["meterno"].ToString();
            ddlMeterNo.Text = txtMeterNo.Text;
        }
        if (System.DBNull.Value.Equals(readme[4]))
        {
            txtTransformer.Text = "";
        }
        else
        {
            txtTransformer.Text = readme["transformer"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[5]))
        {
            txtCtRatio.Text = "";
        }
        else
        {
            txtCtRatio.Text = readme["ctratio"].ToString();
        }

        if (System.DBNull.Value.Equals(readme[6]))
        {
            txtVoltage.Text = "";
        }
        else
        {
            txtVoltage.Text = readme["voltage"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[7]))
        {
            txtMf.Text = "";
        }
        else
        {
            txtMf.Text = readme["mf"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[8]))
        {
            txtPreviousI.Text = "0";
        }
        else
        {
            txtPreviousI.Text = readme["importps"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[9]))
        {
            txtPreviousI.Text = "0";
        }
        else
        {
            txtPreviousI.Text = readme["exportps"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[10]))
        {
            txtDiffI.Text = "0";
        }
        else
        {
            txtDiffI.Text = readme["diff"].ToString();
        }
        //if (System.DBNull.Value.Equals(readme[11]))
        //{
        //    txtCertify.Text = "";
        //}
        //else
        //{
        //    txtCertify.Text = readme["certify"].ToString();
        //}
        btnAdd.Enabled = false;
       btnUpdate1.Enabled = true;
       btnDelete1.Enabled = true;
       copy_lbl_to_ddl();
       caltotimpandexp();
    }
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
    btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
    SqlConnection conn = new SqlConnection(strconn);

    SqlConnection sqlCon = new SqlConnection(strconn);
    SqlCommand sqlComm = new SqlCommand();
    sqlComm.Connection = sqlCon;

    sqlComm.CommandText = "DeleteEnergyDetail";
    sqlComm.CommandType = CommandType.StoredProcedure;
    sqlComm.Parameters.AddWithValue("transno", txtTransID.Text);
    //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

    sqlCon.Open();

    sqlComm.ExecuteNonQuery();

    conn.Close();
    // lblSave.Visible = true;
    // lblSave.Text = "Record Deleted";
    ClearTexbox(Page.Controls);
    //GridView1.DataBind();
    
}
protected void btnAdd_Click(object sender, EventArgs e)
{
    copy_DLL_to_LBL();
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
            cmd.Parameters.Add("@importps", SqlDbType.VarChar).Value = txtPreviousI.Text;
            cmd.Parameters.Add("@exportps", SqlDbType.VarChar).Value = txtPreviousI.Text;
            cmd.Parameters.Add("@diff", SqlDbType.VarChar).Value = txtDiffI.Text;
            cmd.Parameters.Add("@importpv", SqlDbType.VarChar).Value = txtPreviousI.Text;
            cmd.Parameters.Add("@exportpv", SqlDbType.VarChar).Value = txtPreviousI.Text;
            cmd.Parameters.Add("@diff1", SqlDbType.VarChar).Value = txtDiff1.Text;
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
    decimal import = Decimal.Parse(txtPreviousI.Text);
    decimal export = Decimal.Parse(txtPreviousI.Text);
    txtDiffI.Text = (import - export).ToString();

    return;
}
protected void btnUpdate1_Click(object sender, EventArgs e)
{
    copy_DLL_to_LBL();
    using (SqlConnection conn = new SqlConnection(strconn))
//    {
        using (SqlCommand cmd = new SqlCommand("[UpdateEnergyDetail]", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@snno", SqlDbType.BigInt).Value = txtSnNo.Text;
            cmd.Parameters.Add("@transno", SqlDbType.VarChar).Value = txtTransID.Text;
            cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text;
            cmd.Parameters.Add("@station", SqlDbType.VarChar).Value = txtStation.Text;
            cmd.Parameters.Add("@meterno", SqlDbType.VarChar).Value = txtMeterNo.Text;
            cmd.Parameters.Add("@transformer", SqlDbType.VarChar).Value = txtTransformer.Text;
            cmd.Parameters.Add("@ctratio", SqlDbType.VarChar).Value = txtCtRatio.Text;
            cmd.Parameters.Add("@voltage", SqlDbType.VarChar).Value = txtVoltage.Text;
            cmd.Parameters.Add("@mf", SqlDbType.VarChar).Value = txtMf.Text;
            //cmd.Parameters.Add("@apparatus", SqlDbType.VarChar).Value = txtApparatus.Text;
            cmd.Parameters.Add("@importps", SqlDbType.VarChar).Value = txtPreviousI.Text;
            cmd.Parameters.Add("@exportps", SqlDbType.VarChar).Value = txtPreviousI.Text;
            cmd.Parameters.Add("@diff", SqlDbType.VarChar).Value = txtDiffI.Text;


            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("transno", txtTransID.Text);
            //cmd.Parameters.AddWithValue("transdate", txtTransDate.Text);
            //cmd.Parameters.AddWithValue("station", txtStation.Text);
            //cmd.Parameters.AddWithValue("meterno", txtMeterNo.Text);
            //cmd.Parameters.AddWithValue("transformer", txtTransformer.Text);
            //cmd.Parameters.AddWithValue("ctratio", txtCtRatio.Text);
            //cmd.Parameters.AddWithValue("voltage", txtVoltage.Text);
            //cmd.Parameters.AddWithValue("mf", txtMf.Text);
            ////cmd.Parameters.AddWithValue("importps", txtPrevious.Text);
            //cmd.Parameters.AddWithValue("exportps", txtPresent.Text);
            //cmd.Parameters.AddWithValue("diff", txtDiff.Text);
            
            //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

            conn.Open();
            cmd.ExecuteNonQuery();

            conn.Close();
            // lblSave.Text = "Record Saved";
            // GridView1.DataBind();
            ClearTexbox(Page.Controls);
        }

    }
protected void btnUpdate_Click(object sender, EventArgs e)
{

}
protected void btnDelete1_Click(object sender, EventArgs e)
{
    btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
    SqlConnection conn = new SqlConnection(strconn);

    SqlConnection sqlCon = new SqlConnection(strconn);
    SqlCommand sqlComm = new SqlCommand();
    sqlComm.Connection = sqlCon;

    sqlComm.CommandText = "DeleteEnergyDetail";
    sqlComm.CommandType = CommandType.StoredProcedure;
    sqlComm.Parameters.AddWithValue("snno", txtSnNo.Text);
    //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

    sqlCon.Open();

    sqlComm.ExecuteNonQuery();

    conn.Close();
    // lblSave.Visible = true;
    // lblSave.Text = "Record Deleted";
    ClearTexbox(Page.Controls);
    //GridView1.DataBind();
}
protected void btnNew_Click(object sender, EventArgs e)
{
    ClearTexbox(Page.Controls);
    btnAdd.Enabled = true;
    btnUpdate1.Enabled = false;
    btnDelete1.Enabled = false;
    loadcurentdate();
    load_ddlDes();
}
protected void ddlDay_SelectedIndexChanged(object sender, EventArgs e)
{
    copy_DLL_to_LBL();
}
protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
{
    copy_DLL_to_LBL();
}
protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
{
    copy_DLL_to_LBL();
}
protected void ddlMeterNo_SelectedIndexChanged(object sender, EventArgs e)
{
    PopulateTextBoxes();
}
protected void PopulateTextBoxes()
{
    SqlConnection con = new SqlConnection(strconn);
    SqlCommand cmd = new SqlCommand();
    String strQuery = "select meterno, station,transformer,voltage,ctratio,mf from meterdetail where meterno = @meterno";

    cmd.Parameters.AddWithValue("@meterno", ddlMeterNo.SelectedItem.Value);
    cmd.CommandType = CommandType.Text;
    cmd.CommandText = strQuery;
    cmd.Connection = con;
    try
    {
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            txtMeterNo.Text = sdr[0].ToString();
            txtStation.Text = sdr[1].ToString();
            txtTransformer.Text = sdr["transformer"].ToString();
            txtVoltage.Text = sdr["voltage"].ToString();
            txtCtRatio.Text = sdr["ctratio"].ToString();
            txtMf.Text = sdr["mf"].ToString();
        }
       // txtQty.Text = "1";
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

protected void txtDiff_TextChanged(object sender, EventArgs e)
{

}
}


