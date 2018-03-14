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

public partial class MsEnergyReturn2 : System.Web.UI.Page
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
            load_date();
           // setform();
        }
    }
    public void setform()
    {
        btnAdd.Enabled = false;
        btnDelete1.Enabled = false;
        btnUpdate1.Enabled = false;
    }
    public void load_date()
    {
        txtTransDate.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

    }
    public void copy_DLL_to_LBL()
    {

    }
    public void ClearTexbox(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;
            ClearTexbox(ctrl.Controls);
            txtDiffE.Text = "0";
            txtDiffI.Text = "0";
            txtPresentE.Text = "0";
            txtPreviousE.Text = "0";
            txtPreviousI.Text = "0";
            txtPresentI.Text = "0";

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
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].Text = Convert.ToDateTime(e.Row.Cells[2].Text).ToString("dd/ MM/yyyy");
        }
    }
    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        string myString = GridView1.SelectedRow.Cells[0].Text.ToString();
        txtSnNo.Text = myString;

        string myString1 = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtTransID.Text = myString1;

        string myString2 = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtTransDate.Text = myString2;    

        string myString4 = GridView1.SelectedRow.Cells[3].Text.ToString();
        ddlMeterNo.Text = myString4;
        
        string myString6 = GridView1.SelectedRow.Cells[4].Text.ToString();
        txtPreviousI.Text = myString6;

        string myString7 = GridView1.SelectedRow.Cells[5].Text.ToString();
        txtPresentI.Text = myString7;

        string myString8 = GridView1.SelectedRow.Cells[6].Text.ToString();
        txtDiffI.Text = myString8;

        string myString9 = GridView1.SelectedRow.Cells[7].Text.ToString();
        txtPreviousE.Text = myString9;

        string myString10 = GridView1.SelectedRow.Cells[8].Text.ToString();
        txtPresentE.Text = myString10;

        string myString11 = GridView1.SelectedRow.Cells[9].Text.ToString();
        txtDiffE.Text = myString11;
        btnAdd.Enabled = false;
        btnUpdate1.Enabled = true;
        btnDelete1.Enabled = true;
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
        using (SqlConnection con = new SqlConnection(strconn))
        {
            //using (SqlCommand cmd = new SqlCommand("select * from energydetail WHERE meterno = '"+ ddlMeterNo.Text +"' and  transdate = (SELECT MAX(transdate)FROM energydetail )"))
            using (SqlCommand cmd = new SqlCommand("select transno,transdate,meterno,importpv,importps,diff,exportpv,exportps,diff1 from energydetail WHERE transno = '" + txtTransID.Text + "' orderby snno)"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        if (dt.Rows.Count > 0)
                        {
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }
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
        //ddlMeterNo.Items.Insert(0, new ListItem("--Select a Meter No:--", "0"));

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
                // cmd.CommandType = CommandType.StoredProcedure;

                // cmd.Parameters.Add("@transno", SqlDbType.VarChar).Value = txtTransID.Text;
                //// cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text;
                // cmd.Parameters.Add("@totimportpv", SqlDbType.VarChar).Value = txtTotImportPv.Text;
                // cmd.Parameters.Add("@totimportps", SqlDbType.VarChar).Value = txtTotImportPs.Text;
                // cmd.Parameters.Add("@totdiffi", SqlDbType.VarChar).Value = txtTotDiffI.Text;
                // cmd.Parameters.Add("@totexportpv", SqlDbType.VarChar).Value = txtTotExportPv.Text;
                // cmd.Parameters.Add("@totexportps", SqlDbType.VarChar).Value = txtTotExportPs.Text;
                // cmd.Parameters.Add("@totdiffe", SqlDbType.VarChar).Value = txtTotDiffE.Text;

                // conn.Open();
                // cmd.ExecuteNonQuery();

                // conn.Close();
                // // lblSave.Text = "Record Saved";
                // // GridView1.DataBind();
                // ClearTexbox(Page.Controls);
            }

        }
    }
    protected void btnLook_Click(object sender, EventArgs e)
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

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        //btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
        //SqlConnection conn = new SqlConnection(strconn);

        //SqlConnection sqlCon = new SqlConnection(strconn);
        //SqlCommand sqlComm = new SqlCommand();
        //sqlComm.Connection = sqlCon;

        //sqlComm.CommandText = "DeleteEnergyDetail";
        //sqlComm.CommandType = CommandType.StoredProcedure;
        //sqlComm.Parameters.AddWithValue("transno", txtTransID.Text);
        ////sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

        //sqlCon.Open();

        //sqlComm.ExecuteNonQuery();

        //conn.Close();
        //// lblSave.Visible = true;
        //// lblSave.Text = "Record Deleted";
        //ClearTexbox(Page.Controls);
        ////GridView1.DataBind();

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtTransID.Text == "" || txtPreviousI.Text == "0" || txtPresentI.Text == "0" || txtPreviousE.Text == "0" || txtPresentE.Text == "0")
        {
            lblSave.Visible = true;
            lblSave.Text = "Please Fill all Fields";
            return;
        }
        else
        {
            lblSave.Visible = true;

            caltotimpandexp();
            SqlConnection conn = new SqlConnection(strconn);
            System.Data.SqlClient.SqlDataReader readme;
            // SqlConnection conn = new SqlConnection(strconn);
            conn.Open();
            String query = "select * from energydetail where meterno='" + ddlMeterNo.Text + "' and transno='" + txtTransID.Text + "'";
            cmd = new System.Data.SqlClient.SqlCommand(query, conn);
            readme = cmd.ExecuteReader();
            if (readme.Read())
            {
                lblSave.Text = "Select Another Meter";
                return;
            }
            else
            {
                //using (SqlConnection conn = new SqlConnection(strconn))
                //{
                using (SqlCommand cmd1 = new SqlCommand("InsertEnergyDetail", conn))
                {
                    cmd1.CommandType = CommandType.StoredProcedure;

                    cmd1.Parameters.Add("@transno", SqlDbType.VarChar).Value = txtTransID.Text;
                    cmd1.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text;

                    cmd1.Parameters.Add("@meterno", SqlDbType.VarChar).Value = ddlMeterNo.Text;
                    cmd1.Parameters.Add("@importpv", SqlDbType.VarChar).Value = txtPreviousI.Text;
                    cmd1.Parameters.Add("@importps", SqlDbType.VarChar).Value = txtPresentI.Text;
                    cmd1.Parameters.Add("@diff", SqlDbType.VarChar).Value = txtDiffI.Text;
                    cmd1.Parameters.Add("@exportpv", SqlDbType.VarChar).Value = txtPreviousE.Text;
                    cmd1.Parameters.Add("@exportps", SqlDbType.VarChar).Value = txtPresentE.Text;
                    cmd1.Parameters.Add("@diff1", SqlDbType.VarChar).Value = txtDiffE.Text;
                    conn.Close();
                    conn.Open();
                    cmd1.ExecuteNonQuery();

                    conn.Close();
                    // conn1.Close();
                    lblSave.Text = "Record Saved";
                    GridView1.DataBind();
                    // ClearTexbox(Page.Controls);
                   
                    // }
                }
            }
        }
    }
    public void caltotimpandexp()
    {
        decimal prvi = Decimal.Parse(txtPreviousI.Text);
        decimal psti = Decimal.Parse(txtPresentI.Text);
        decimal diffi = Decimal.Parse(txtDiffI.Text);
        decimal prve = Decimal.Parse(txtPreviousE.Text);
        decimal pste = Decimal.Parse(txtPresentE.Text);
        decimal diffe = Decimal.Parse(txtDiffE.Text);

        diffi = (psti - prvi);
        txtDiffI.Text = diffi.ToString();
        diffe = (pste - prve);
        txtDiffE.Text = diffe.ToString();
    }
    private void subtract()
    {
        //decimal import = Decimal.Parse(txtPreviousI.Text);
        //decimal export = Decimal.Parse(txtPreviousI.Text);
        //txtDiffI.Text = (import - export).ToString();

        //return;
    }
    protected void btnUpdate1_Click(object sender, EventArgs e)
    {
        if (txtTransID.Text == "" || txtPreviousI.Text == "0" || txtPresentI.Text == "0" || txtPreviousE.Text == "0" || txtPresentE.Text == "0")
        {
            lblSave.Visible = true;
            lblSave.Text = "Please Fill all Fields";
            return;
        }
        caltotimpandexp();
        
            using (SqlConnection conn = new SqlConnection(strconn))
            //    {
            using (SqlCommand cmd = new SqlCommand("[UpdateEnergyDetail]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@snno", SqlDbType.BigInt).Value = txtSnNo.Text;
                cmd.Parameters.Add("@transno", SqlDbType.VarChar).Value = txtTransID.Text;
                cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text;

                cmd.Parameters.Add("@meterno", SqlDbType.VarChar).Value = ddlMeterNo.Text;

                //cmd.Parameters.Add("@apparatus", SqlDbType.VarChar).Value = txtApparatus.Text;
                cmd.Parameters.Add("@importps", SqlDbType.VarChar).Value = txtPreviousI.Text;
                cmd.Parameters.Add("@exportps", SqlDbType.VarChar).Value = txtPresentE.Text;
                cmd.Parameters.Add("@diff", SqlDbType.VarChar).Value = txtDiffI.Text;
                cmd.Parameters.Add("@importpv", SqlDbType.VarChar).Value = txtPreviousI.Text;
                cmd.Parameters.Add("@exportpv", SqlDbType.VarChar).Value = txtPresentE.Text;
                cmd.Parameters.Add("@diff1", SqlDbType.VarChar).Value = txtDiffE.Text;
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();
                // lblSave.Text = "Record Saved";
                GridView1.DataBind();
                // ClearTexbox(Page.Controls);
           
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(strconn))
        //    {
        using (SqlCommand cmd = new SqlCommand("[UpdateEnergyMaster]", conn))
        {
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@transno", SqlDbType.VarChar).Value = txtTransID.Text;
            //cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text;
            //cmd.Parameters.Add("@totimportpv", SqlDbType.VarChar).Value = txtPreviousI.Text;
            //cmd.Parameters.Add("@totimportps", SqlDbType.VarChar).Value = txtPresentI.Text;
            //cmd.Parameters.Add("@totdiffi", SqlDbType.VarChar).Value = txtDiffI.Text;
            //cmd.Parameters.Add("@totexportpv", SqlDbType.VarChar).Value = txtPreviousE.Text;
            //cmd.Parameters.Add("@totexportps", SqlDbType.VarChar).Value = txtPresentE.Text;
            //cmd.Parameters.Add("@totdiffe", SqlDbType.VarChar).Value = txtDiffE.Text;
            //conn.Open();
            //cmd.ExecuteNonQuery();

            //conn.Close();
            //// lblSave.Text = "Record Saved";
            //// GridView1.DataBind();
            ////ClearTexbox(Page.Controls);
        }
    }
    protected void btnDelete1_Click(object sender, EventArgs e)
    {
            btnDelete1.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
       

            SqlConnection sqlCon = new SqlConnection(strconn);
            SqlCommand sqlComm = new SqlCommand();
            sqlComm.Connection = sqlCon;

            sqlComm.CommandText = "DeleteEnergyDetail";
            sqlComm.CommandType = CommandType.StoredProcedure;
            sqlComm.Parameters.AddWithValue("snno", txtSnNo.Text);
            //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

            sqlCon.Open();

            sqlComm.ExecuteNonQuery();

            sqlCon.Close();
            lblSave.Visible = true;
            lblSave.Text = "Record Deleted";
            GridView1.DataBind();
        
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        ClearTexbox(Page.Controls);
        btnAdd.Enabled = true;
        btnUpdate1.Enabled = false;
        btnDelete1.Enabled = false;
        load_date();
        // load_ddlDes();
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



    protected void txtDiff_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnClear1_Click(object sender, EventArgs e)
    {
        ClearTexbox(Page.Controls);
        //btnSave.Enabled = true;
        //btnDelete.Enabled = false;
        //btnUpdate.Enabled = false;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {

    }
    protected void ddlMin_SelectedIndexChanged(object sender, EventArgs e)
    {
        copy_DLL_to_LBL();
    }
    protected void ddlSec_SelectedIndexChanged(object sender, EventArgs e)
    {
        copy_DLL_to_LBL();
    }

    protected void btnSeach_Click(object sender, EventArgs e)
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
                txtTransDate.Text = ((DateTime)readme["transdate"]).ToString("dd/MM/yyyy hh:mm");
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
            if (System.DBNull.Value.Equals(readme[8]))
            {
                txtPreviousE.Text = "0";
            }
            else
            {
                txtPresentE.Text = readme["importpv"].ToString();
            }
            if (System.DBNull.Value.Equals(readme[9]))
            {
                txtPresentE.Text = "0";
            }
            else
            {
                txtPresentE.Text = readme["exportpv"].ToString();
            }
            if (System.DBNull.Value.Equals(readme[10]))
            {
                txtDiffE.Text = "0";
            }
            else
            {
                txtDiffE.Text = readme["diff1"].ToString();
            }
           btnAdd.Enabled = true;
            btnUpdate1.Enabled = true;
            btnDelete1.Enabled = true;
        
            caltotimpandexp();
            BindGrid();
        }
    }



    protected void ddlMeterNo_SelectedIndexChanged1(object sender, EventArgs e)
    {
       // PopulateTextBoxes();
    }
    protected void PopulateTextBoxes()
    {
        string meterno = ddlMeterNo.Text;

        SqlConnection con = new SqlConnection(strconn);
        SqlCommand cmd = new SqlCommand();
        String strQuery = "select * from meterdetail where meterno= '" + ddlMeterNo.Text + "'";

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
                ddlMeterNo.Text = sdr[0].ToString();
               // txtTransformer.Text = sdr[1].ToString();
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


