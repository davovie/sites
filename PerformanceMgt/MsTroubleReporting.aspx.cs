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

public partial class MsTroubleReporting : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtTransDate.Text = DateTime.Now.ToString();
           // txtCertDate.Text = DateTime.Now.ToString();
            load_ddlDept();
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
        // lblSave.Visible = false;
    }
    //    //protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    //    //{
    //    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    //    {
    //    //        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
    //    //        e.Row.ToolTip = "Click to select this row.";
    //    //    }
    //    //}
    //    //protected void OnSelectedIndexChanged(object sender, EventArgs e)
    //    //{
    //    //    ////GridViewRow row = GridView1.SelectedRow;
    //    //    ////ddlDept.Text = row.Cells[0].Text;
    //    //    ////txtDept.Text = row.Cells[1].Text;
    //    //    //// txtCountry.Text = (row.FindControl("lblCountry") as Label).Text;

    //    //    string myString = GridView1.SelectedRow.Cells[0].Text.ToString();
    //    //    txtFaultCode.Text = myString;
    //    //    string myString1 = GridView1.SelectedRow.Cells[1].Text.ToString();
    //    //    txtDes.Text = myString1;
    //    //    //string myString2 = GridView1.SelectedRow.Cells[2].Text.ToString();
    //    //    //txtImei1.Text = myString2;
    //    //    //string myString3 = GridView1.SelectedRow.Cells[3].Text.ToString();
    //    //    //txtImei2.Text = myString3;
    //    //    //////foreach (GridViewRow row in GridView1.Rows)
    //    //    //////{
    //    //    //////    if (row.RowIndex == GridView1.SelectedIndex)
    //    //    //////    {
    //    //    //////        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
    //    //    //////        row.ToolTip = string.Empty;
    //    //    //////    }
    //    //    //////    else
    //    //    //////    {
    //    //    //////        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
    //    //    //////        row.ToolTip = "Click to select this row.";
    //    //    //////    }
    //    //    //////}
    //    //}
    //    //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    //    //{
    //    //    System.Data.SqlClient.SqlDataReader readme;
    //    //    SqlConnection conn = new SqlConnection(strconn);
    //    //    conn.Open();
    //    //    String query = "select * from fault where des='" + txtDes.Text + "'";
    //    //    cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    //    //    readme = cmd.ExecuteReader();
    //    //    if (readme.Read())
    //    //    {
    //    //        if (System.DBNull.Value.Equals(readme[1]))
    //    //        {
    //    //            txtDes.Text = "";
    //    //        }
    //    //        else
    //    //        {
    //    //            txtDes.Text = readme["des"].ToString();
    //    //        }
    //    //    }
    //    //}
    //    //protected void GridView1_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    //    //{
    //    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    //    {
    //    //        e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);
    //    //    }
    //    //}
    //    public void load_ddlDes()
    //    {
    //        string des = txtDes.Text;

    //        using (SqlConnection con = new SqlConnection(strconn))
    //        {
    //            using (SqlCommand cmd = new SqlCommand("SELECT faultcode, des FROM fault where des like '%" + des + "%' "))
    //            {
    //                cmd.CommandType = CommandType.Text;
    //                cmd.Connection = con;
    //                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //                {
    //                    DataSet ds = new DataSet();
    //                    sda.Fill(ds);
    //                    ddlDes.DataSource = ds.Tables[0];
    //                    ddlDes.DataTextField = "des";
    //                    ddlDes.DataValueField = "faultcode";
    //                    ddlDes.DataBind();
    //                }
    //            }
    //        }
    //        ddlDes.Items.Insert(0, new ListItem("-- Select The Appropiate Fault --", "0"));
    //    }
    //    protected void btnSave1_Click(object sender, EventArgs e)
    //    {
    //        ClearTexbox(Page.Controls);

    //    }
    //    protected void btnSearch_Click(object sender, EventArgs e)
    //    {
    //        System.Data.SqlClient.SqlDataReader readme;
    //        SqlConnection conn = new SqlConnection(strconn);
    //        conn.Open();
    //        String query = "select * from fault where faultcode='" + txtFaultCode.Text + "'";
    //        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    //        readme = cmd.ExecuteReader();
    //        if (readme.Read())
    //        {
    //            if (System.DBNull.Value.Equals(readme[1]))
    //            {
    //                txtDes.Text = "";
    //            }
    //            else
    //            {
    //                txtDes.Text = readme["des"].ToString();
    //            }
    //        }
    //        }

    //    protected void btnSave_Click(object sender, EventArgs e)
    //    {
    //         if (txtTransID.Text == "")
    //        {
    //            lblSave.Text = ("Trans Id cannot be empty");
    //        }

    //        copy_DLL_to_LBL();
    //        using (SqlConnection conn = new SqlConnection(strconn))
    //        {
    //            using (SqlCommand cmd = new SqlCommand("InsertTrouble", conn))
    //            {
    //                cmd.CommandType = CommandType.StoredProcedure;

    //               cmd.Parameters.Add("@transid", SqlDbType.VarChar).Value = txtTransID.Text;
    //                cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtDate.Text;
    //             //   cmd.Parameters.Add("@transtime", SqlDbType.DateTime).Value = txtTime.Text.ToString();
    //                cmd.Parameters.Add("@dept", SqlDbType.VarChar).Value = ddlDept.Text;
    //                cmd.Parameters.Add("@locate", SqlDbType.VarChar).Value = ddlDept.Text;
    //                cmd.Parameters.Add("@faultcode", SqlDbType.VarChar).Value = txtFaultCode.Text;
    //                cmd.Parameters.Add("@des", SqlDbType.VarChar).Value = txtDes.Text;
    //                cmd.Parameters.Add("@station", SqlDbType.VarChar).Value = ddlStation.Text;
    //                cmd.Parameters.Add("@locate1", SqlDbType.VarChar).Value = txtLocate1.Text;
    //                //cmd.Parameters.Add("@apparatus", SqlDbType.VarChar).Value = txtApparatus.Text;
    //                cmd.Parameters.Add("@reason", SqlDbType.VarChar).Value = txtReason.Text;
    //                cmd.Parameters.Add("@workdn", SqlDbType.VarChar).Value = txtWorkdn.Text;
    //                cmd.Parameters.Add("@certify", SqlDbType.VarChar).Value = txtCertify.Text;
    //                cmd.Parameters.Add("@certdate", SqlDbType.DateTime).Value = txtDate0.Text;

    //                conn.Open();
    //                cmd.ExecuteNonQuery();

    //                conn.Close();
    //               // lblSave.Text = "Record Saved";
    //               // GridView1.DataBind();
    //                ClearTexbox(Page.Controls);
    //            }

    //        }
    //    }
    //protected void  btnLook_Click(object sender, EventArgs e)
    //{
    //    load_ddlDes();
    //}
    //protected void btnUpdate_Click(object sender, EventArgs e)
    //{
    //    if (txtTransID.Text == "")
    //    {
    //        lblSave.Text = ("Trans Id cannot be empty");
    //    }
    //    using (SqlConnection conn = new SqlConnection(strconn))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("UpdateTrouble", conn))
    //        {
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.AddWithValue("transid", txtTransID.Text);
    //            cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtDate.Text;
    //            cmd.Parameters.AddWithValue("dept", ddlDept.Text);
    //            cmd.Parameters.AddWithValue("locate", ddlDept.Text);
    //            cmd.Parameters.AddWithValue("faultcode", txtFaultCode.Text);
    //            cmd.Parameters.AddWithValue("des", txtDes.Text);
    //            cmd.Parameters.AddWithValue("station", ddlStation.Text);
    //            cmd.Parameters.AddWithValue("locate1", txtLocate1.Text);
    //            //cmd.Parameters.AddWithValue("apparatus", txtApparatus.Text);
    //            cmd.Parameters.AddWithValue("reason", txtReason.Text);
    //            cmd.Parameters.AddWithValue("certify", txtCertify.Text);
    //            cmd.Parameters.Add("@certdate", SqlDbType.DateTime).Value = txtDate0.Text;

    //            //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

    //            conn.Open();
    //            cmd.ExecuteNonQuery();

    //            conn.Close();
    //            // lblSave.Text = "Record Saved";
    //            // GridView1.DataBind();
    //            ClearTexbox(Page.Controls);
    //        }

    //    }
    //}
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    System.Data.SqlClient.SqlDataReader readme;
    //    SqlConnection conn = new SqlConnection(strconn);
    //    conn.Open();
    //    String query = "select * from troubleview where transid='" + txtTransID.Text + "'";
    //    cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    //    readme = cmd.ExecuteReader();
    //    if (readme.Read())
    //    {
    //        if (System.DBNull.Value.Equals(readme[1]))
    //        {
    //            txtDate.Text = "";
    //        }
    //        else
    //        {
    //            txtDate.Text = readme["transdate"].ToString();
    //        }
    //        if (System.DBNull.Value.Equals(readme[1]))
    //        {
    //            txtDate0.Text = "";
    //        }
    //        else
    //        {
    //            txtDate0.Text = readme["certdate"].ToString();
    //        }
    //        if (System.DBNull.Value.Equals(readme[2]))
    //        {
    //            txtFaultCode.Text = "";
    //        }
    //        else
    //        {
    //            txtFaultCode.Text = readme["faultcode"].ToString();
    //        }
    //        if (System.DBNull.Value.Equals(readme[3]))
    //        {
    //            txtDes.Text = "";
    //        }
    //        else
    //        {
    //            txtDes.Text = readme["des"].ToString();
    //        }
    //        if (System.DBNull.Value.Equals(readme[4]))
    //        {
    //            ddlDept.Text = "";
    //        }
    //        else
    //        {
    //            ddlDept.Text = readme["dept"].ToString();
    //        }
    //        if (System.DBNull.Value.Equals(readme[5]))
    //        {
    //            ddlDept.Text = "";
    //        }
    //        else
    //        {
    //            ddlDept.Text = readme["locate"].ToString();
    //        }

    //        if (System.DBNull.Value.Equals(readme[6]))
    //        {
    //            ddlStation.Text = "";
    //        }
    //        else
    //        {
    //            ddlStation.Text = readme["station"].ToString();
    //        }
    //        if (System.DBNull.Value.Equals(readme[7]))
    //        {
    //            txtLocate1.Text = "";
    //        }
    //        else
    //        {
    //            txtLocate1.Text = readme["locate1"].ToString();
    //        }
    //        if (System.DBNull.Value.Equals(readme[8]))
    //        {
    //            ddlDept.Text = "";
    //        }
    //        else
    //        {
    //            ddlDept.Text = readme["dept"].ToString();
    //        }
    //        if (System.DBNull.Value.Equals(readme[9]))
    //        {
    //            txtReason.Text = "";
    //        }
    //        else
    //        {
    //            txtReason.Text = readme["reason"].ToString();
    //        }
    //        if (System.DBNull.Value.Equals(readme[10]))
    //        {
    //            txtWorkdn.Text = "";
    //        }
    //        else
    //        {
    //            txtWorkdn.Text = readme["workdn"].ToString();
    //        }
    //        if (System.DBNull.Value.Equals(readme[11]))
    //        {
    //            txtCertify.Text = "";
    //        }
    //        else
    //        {
    //            txtCertify.Text = readme["certify"].ToString();
    //        }
    //        btnSave.Enabled = false;
    //        btnUpdate.Enabled = true;
    //        btnDelete.Enabled = true;
    //        copy_lbl_dll();
    //        copy_txt_dll();
    //    }
    //}


    //protected void btnClear_Click(object sender, EventArgs e)
    //{
    //    ClearTexbox(Page.Controls);
    //    btnSave.Enabled = true;
    //    btnDelete.Enabled = false;
    //    btnUpdate.Enabled = false;
    //    lblSave.Visible = false;
    //}
    //protected void btnDelete_Click(object sender, EventArgs e)
    //{
    //    if (txtTransID.Text == "")
    //    {
    //        lblSave.Text = ("Trans Id cannot be empty");
    //    }
    //    btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
    //    SqlConnection conn = new SqlConnection(strconn);

    //    SqlConnection sqlCon = new SqlConnection(strconn);
    //    SqlCommand sqlComm = new SqlCommand();
    //    sqlComm.Connection = sqlCon;

    //    sqlComm.CommandText = "DeleteTrouble";
    //    sqlComm.CommandType = CommandType.StoredProcedure;
    //    sqlComm.Parameters.AddWithValue("transid", txtTransID.Text);
    //    //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

    //    sqlCon.Open();

    //    sqlComm.ExecuteNonQuery();

    //    conn.Close();
    //   // lblSave.Visible = true;
    //   // lblSave.Text = "Record Deleted";
    //    ClearTexbox(Page.Controls);
    //    //GridView1.DataBind();

    //}
    //public void copy_lbl_dll()
    //{
    //    string strDate = txtDate.Text.ToString(); //Format – dd/MM/yyyy
    //    //string strDate = "26/07/2011"; //Format – dd/MM/yyyy
    //    //split string date by separator, here I'm using '/'
    //    string[] arrDate = strDate.Split('/');

    //    //now use array to get specific date object
    //    string day = arrDate[0].ToString();
    //    string month = arrDate[1].ToString();
    //    string year = arrDate[2].ToString();
    //    string[] arrTime = year.Split();
    //    string hour = arrTime[0].ToString();
    //    string minute = arrTime[1].ToString();
    //    ddlDay.Text = day;
    //    ddlMonth.Text = month;
    //  // ddlYear.Text = hour ;
    //   TextBox1.Text = hour;
    //    string onlyyr = TextBox1.Text.ToString();
    //   ddlYear.Text = onlyyr; 
    //    string[] arrHour = minute.Split(':');
    //    string hr = arrHour[0].ToString();
    //    string min = arrHour[1].ToString();
    //    ddlHr.Text = hr;
    //    ddlMin.Text = min;
    //}
    //public void copy_DLL_to_LBL()
    //{
    //    txtDate.Text = (ddlDay.SelectedItem.Value + "/" + ddlMonth.SelectedItem.Value + "/" + ddlYear.SelectedItem.Value + " " + ddlHr.SelectedItem.Value + ":" + ddlMin.SelectedItem.Value );
    //}
    //public void copy_txt_dll()
    //{
    //    string strDate0 = txtDate0.Text.ToString(); //Format – dd/MM/yyyy
    //    //string strDate = "26/07/2011"; //Format – dd/MM/yyyy
    //    //split string date by separator, here I'm using '/'
    //    string[] arrDate0 = strDate0.Split('/');

    //    //now use array to get specific date object
    //    string day = arrDate0[0].ToString();
    //    string month = arrDate0[1].ToString();
    //    string year = arrDate0[2].ToString();
    //    //string[] arrTime = year.Split();
    //    //string hour = arrTime[0].ToString();
    //    //string minute = arrTime[1].ToString();
    //    ddlDay0.Text = day;
    //    ddlMonth0.Text = month;
    //    //ddlYear0.Text = year;
    //    //ddlMin.Text = minute;
    //    //string[] arrHour = minute.Split(':');
    //    //string hr = arrHour[0].ToString();
    //    //string min = arrHour[1].ToString();
    //    //ddlHr.Text = hr;
    //    //ddlMin.Text = min;
    //}
    //public void copy_DLL_to_TXT()
    //{
    //    txtDate0.Text = (ddlDay0.SelectedItem.Value + "/" + ddlMonth0.SelectedItem.Value + "/" + ddlYear0.SelectedItem.Value + " " + ddlHr.SelectedItem.Value + ":" + ddlMin.SelectedItem.Value);
    //}

    //protected void ddlDay_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string formdate = ddlDay.SelectedItem.Value + "/" + ddlMonth.SelectedItem.Value + "/" + ddlYear.SelectedItem.Value + " " + ddlHr.SelectedItem.Value + ":" + ddlMin.SelectedItem.Value;
    //    txtDate.Text = formdate.ToString();
    //}
    //protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    copy_DLL_to_LBL();
    //}
    //protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    copy_DLL_to_LBL();
    //}

    //protected void ddlDay0_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string formdate0 = ddlDay0.SelectedItem.Value + "/" + ddlMonth0.SelectedItem.Value + "/" + ddlYear0.SelectedItem.Value + " " + ddlHr.SelectedItem.Value + ":" + ddlMin.SelectedItem.Value;
    //    txtDate0.Text = formdate0.ToString();
    //}
    //protected void ddlMonth0_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    copy_DLL_to_TXT();
    //}
    //protected void ddlYear0_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    copy_DLL_to_TXT();
    //}

    //protected void ddlDes_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //   PopulateTextBoxes();
    //}
    protected void PopulateTextBoxes()
    {
        //string des = txtDes.Text;

        //SqlConnection con = new SqlConnection(strconn);
        //SqlCommand cmd = new SqlCommand();
        //String strQuery = "select faultcode,des from fault where faultcode= '" + ddlDes.Text + "'";

        //cmd.Parameters.AddWithValue("@faulcotde", ddlDes.SelectedItem.Value);
        //cmd.CommandType = CommandType.Text;
        //cmd.CommandText = strQuery;
        //cmd.Connection = con;
        //try
        //{
        //    con.Open();
        //    SqlDataReader sdr = cmd.ExecuteReader();
        //    while (sdr.Read())
        //    {
        //        txtFaultCode.Text = sdr[0].ToString();
        //        txtDes.Text = sdr[1].ToString();
        //        // txtDes.Text = sdr["des"].ToString();
        //        //txtOldQty.Text = sdr["qty"].ToString();
        //        //txtCprice.Text = sdr["cprice"].ToString();
        //        //txtOldPrice.Text = sdr["cprice"].ToString();
        //    }
        //    //txtQty.Text = "1";
        //}
        //catch (Exception ex)
        //{
        //    throw ex;
        //}
        //finally
        //{
        //    con.Close();
        //    con.Dispose();
        //}
    }

    //protected void btnNew_Click(object sender, EventArgs e)
    //{
    //    btnSearch.Enabled = false;
    //    btnUpdate.Enabled = false;
    //    btnDelete.Enabled = false;
    //    ClearTexbox(Page.Controls);
    //    copy_DLL_to_LBL();
    //    copy_DLL_to_TXT();
    //    txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm");
    //    txtDate0.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm");
    //    copy_lbl_dll();
    //    copy_txt_dll();
    //}

    //protected void txtDate_TextChanged(object sender, EventArgs e)
    //{

    //}
    //protected void ddlHr_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    copy_DLL_to_LBL();
    //    copy_DLL_to_TXT();
    //}
    //protected void ddlMin_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    copy_DLL_to_LBL();
    //    copy_DLL_to_TXT();
    //}
    //    SqlCommand cmd = new SqlCommand();
    //    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    //    protected void Page_Load(object sender, EventArgs e)
    //    {
    //        if (!IsPostBack)
    //        {

    //            txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm");
    //            txtDate0.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm");
    //            lblSave.Visible = false;
    //            copy_lbl_dll();
    //            copy_txt_dll();
    //        }
    //    }

    //    public void ClearTexbox(ControlCollection ctrls)
    //    {
    //        foreach (Control ctrl in ctrls)
    //        {
    //            if (ctrl is TextBox)
    //                ((TextBox)ctrl).Text = string.Empty;
    //            ClearTexbox(ctrl.Controls);
    //        }
    //       // lblSave.Visible = false;
    // }
    //    //protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    //    //{
    //    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    //    {
    //    //        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
    //    //        e.Row.ToolTip = "Click to select this row.";
    //    //    }
    //    //}
    //    //protected void OnSelectedIndexChanged(object sender, EventArgs e)
    //    //{
    //    //    ////GridViewRow row = GridView1.SelectedRow;
    //    //    ////ddlDept.Text = row.Cells[0].Text;
    //    //    ////txtDept.Text = row.Cells[1].Text;
    //    //    //// txtCountry.Text = (row.FindControl("lblCountry") as Label).Text;

    //    //    string myString = GridView1.SelectedRow.Cells[0].Text.ToString();
    //    //    txtFaultCode.Text = myString;
    //    //    string myString1 = GridView1.SelectedRow.Cells[1].Text.ToString();
    //    //    txtDes.Text = myString1;
    //    //    //string myString2 = GridView1.SelectedRow.Cells[2].Text.ToString();
    //    //    //txtImei1.Text = myString2;
    //    //    //string myString3 = GridView1.SelectedRow.Cells[3].Text.ToString();
    //    //    //txtImei2.Text = myString3;
    //    //    //////foreach (GridViewRow row in GridView1.Rows)
    //    //    //////{
    //    //    //////    if (row.RowIndex == GridView1.SelectedIndex)
    //    //    //////    {
    //    //    //////        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
    //    //    //////        row.ToolTip = string.Empty;
    //    //    //////    }
    //    //    //////    else
    //    //    //////    {
    //    //    //////        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
    //    //    //////        row.ToolTip = "Click to select this row.";
    //    //    //////    }
    //    //    //////}
    //    //}
    //    //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    //    //{
    //    //    System.Data.SqlClient.SqlDataReader readme;
    //    //    SqlConnection conn = new SqlConnection(strconn);
    //    //    conn.Open();
    //    //    String query = "select * from fault where des='" + txtDes.Text + "'";
    //    //    cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    //    //    readme = cmd.ExecuteReader();
    //    //    if (readme.Read())
    //    //    {
    //    //        if (System.DBNull.Value.Equals(readme[1]))
    //    //        {
    //    //            txtDes.Text = "";
    //    //        }
    //    //        else
    //    //        {
    //    //            txtDes.Text = readme["des"].ToString();
    //    //        }
    //    //    }
    //    //}
    //    //protected void GridView1_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    //    //{
    //    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    //    {
    //    //        e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);
    //    //    }
    //    //}
    //    public void load_ddlDes()
    //    {
    //        string des = txtDes.Text;

    //        using (SqlConnection con = new SqlConnection(strconn))
    //        {
    //            using (SqlCommand cmd = new SqlCommand("SELECT faultcode, des FROM fault where des like '%" + des + "%' "))
    //            {
    //                cmd.CommandType = CommandType.Text;
    //                cmd.Connection = con;
    //                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //                {
    //                    DataSet ds = new DataSet();
    //                    sda.Fill(ds);
    //                    ddlDes.DataSource = ds.Tables[0];
    //                    ddlDes.DataTextField = "des";
    //                    ddlDes.DataValueField = "faultcode";
    //                    ddlDes.DataBind();
    //                }
    //            }
    //        }
    //        ddlDes.Items.Insert(0, new ListItem("-- Select The Appropiate Fault --", "0"));
    //    }
    //    protected void btnSave1_Click(object sender, EventArgs e)
    //    {
    //        ClearTexbox(Page.Controls);

    //    }
    //    protected void btnSearch_Click(object sender, EventArgs e)
    //    {
    //        System.Data.SqlClient.SqlDataReader readme;
    //        SqlConnection conn = new SqlConnection(strconn);
    //        conn.Open();
    //        String query = "select * from fault where faultcode='" + txtFaultCode.Text + "'";
    //        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    //        readme = cmd.ExecuteReader();
    //        if (readme.Read())
    //        {
    //            if (System.DBNull.Value.Equals(readme[1]))
    //            {
    //                txtDes.Text = "";
    //            }
    //            else
    //            {
    //                txtDes.Text = readme["des"].ToString();
    //            }
    //        }
    //        }

    //    protected void btnSave_Click(object sender, EventArgs e)
    //    {
    //         if (txtTransID.Text == "")
    //        {
    //            lblSave.Text = ("Trans Id cannot be empty");
    //        }

    //        copy_DLL_to_LBL();
    //        using (SqlConnection conn = new SqlConnection(strconn))
    //        {
    //            using (SqlCommand cmd = new SqlCommand("InsertTrouble", conn))
    //            {
    //                cmd.CommandType = CommandType.StoredProcedure;

    //               cmd.Parameters.Add("@transid", SqlDbType.VarChar).Value = txtTransID.Text;
    //                cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtDate.Text;
    //             //   cmd.Parameters.Add("@transtime", SqlDbType.DateTime).Value = txtTime.Text.ToString();
    //                cmd.Parameters.Add("@dept", SqlDbType.VarChar).Value = ddlDept.Text;
    //                cmd.Parameters.Add("@locate", SqlDbType.VarChar).Value = ddlDept.Text;
    //                cmd.Parameters.Add("@faultcode", SqlDbType.VarChar).Value = txtFaultCode.Text;
    //                cmd.Parameters.Add("@des", SqlDbType.VarChar).Value = txtDes.Text;
    //                cmd.Parameters.Add("@station", SqlDbType.VarChar).Value = ddlStation.Text;
    //                cmd.Parameters.Add("@locate1", SqlDbType.VarChar).Value = txtLocate1.Text;
    //                //cmd.Parameters.Add("@apparatus", SqlDbType.VarChar).Value = txtApparatus.Text;
    //                cmd.Parameters.Add("@reason", SqlDbType.VarChar).Value = txtReason.Text;
    //                cmd.Parameters.Add("@workdn", SqlDbType.VarChar).Value = txtWorkdn.Text;
    //                cmd.Parameters.Add("@certify", SqlDbType.VarChar).Value = txtCertify.Text;
    //                cmd.Parameters.Add("@certdate", SqlDbType.DateTime).Value = txtDate0.Text;

    //                conn.Open();
    //                cmd.ExecuteNonQuery();

    //                conn.Close();
    //               // lblSave.Text = "Record Saved";
    //               // GridView1.DataBind();
    //                ClearTexbox(Page.Controls);
    //            }

    //        }
    //    }
    //protected void  btnLook_Click(object sender, EventArgs e)
    //{
    //    load_ddlDes();
    //}
    //protected void btnUpdate_Click(object sender, EventArgs e)
    //{
    //    if (txtTransID.Text == "")
    //    {
    //        lblSave.Text = ("Trans Id cannot be empty");
    //    }
    //    using (SqlConnection conn = new SqlConnection(strconn))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("UpdateTrouble", conn))
    //        {
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.AddWithValue("transid", txtTransID.Text);
    //            cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtDate.Text;
    //            cmd.Parameters.AddWithValue("dept", ddlDept.Text);
    //            cmd.Parameters.AddWithValue("locate", ddlDept.Text);
    //            cmd.Parameters.AddWithValue("faultcode", txtFaultCode.Text);
    //            cmd.Parameters.AddWithValue("des", txtDes.Text);
    //            cmd.Parameters.AddWithValue("station", ddlStation.Text);
    //            cmd.Parameters.AddWithValue("locate1", txtLocate1.Text);
    //            //cmd.Parameters.AddWithValue("apparatus", txtApparatus.Text);
    //            cmd.Parameters.AddWithValue("reason", txtReason.Text);
    //            cmd.Parameters.AddWithValue("certify", txtCertify.Text);
    //            cmd.Parameters.Add("@certdate", SqlDbType.DateTime).Value = txtDate0.Text;

    //            //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

    //            conn.Open();
    //            cmd.ExecuteNonQuery();

    //            conn.Close();
    //            // lblSave.Text = "Record Saved";
    //            // GridView1.DataBind();
    //            ClearTexbox(Page.Controls);
    //        }

    //    }
    //}
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
        //    //if (System.DBNull.Value.Equals(readme[1]))
        //    //{
        //    //    txtDate.Text = "";
        //    //}
        //    //else
        //    //{
        //    //    txtDate.Text = readme["transdate"].ToString();
        //    //}
        //    //if (System.DBNull.Value.Equals(readme[1]))
        //    //{
        //    //    txtDate0.Text = "";
        //    //}
        //    //else
        //    //{
        //    //    txtDate0.Text = readme["certdate"].ToString();
        //    //}
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
        //    //if (System.DBNull.Value.Equals(readme[4]))
        //    //{
        //    //    ddlDept.Text = "";
        //    //}
        //    //else
        //    //{
        //    //    ddlDept.Text = readme["dept"].ToString();
        //    //}
        //    if (System.DBNull.Value.Equals(readme[5]))
        //    {
        //        ddlDept.Text = "";
        //    }
        //    else
        //    {
        //        ddlDept.Text = readme["locate"].ToString();
        //    }

        //    //if (System.DBNull.Value.Equals(readme[6]))
        //    //{
        //    //    ddlStation.Text = "";
        //    //}
        //    //else
        //    //{
        //    //    ddlStation.Text = readme["station"].ToString();
        //    //}
        //    if (System.DBNull.Value.Equals(readme[7]))
        //    {
        //        txtLocate1.Text = "";
        //    }
        //    else
        //    {
        //        txtLocate1.Text = readme["locate1"].ToString();
        //    }
        //    //if (System.DBNull.Value.Equals(readme[8]))
        //    //{
        //    //    ddlDept.Text = "";
        //    //}
        //    //else
        //    //{
        //    //    ddlDept.Text = readme["dept"].ToString();
        //    //}
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
        //    //btnSave.Enabled = false;
        //    //btnUpdate.Enabled = true;
        //    //btnDelete.Enabled = true;
        //    //copy_lbl_dll();
        //    //copy_txt_dll();
        //}
    }


    //protected void btnClear_Click(object sender, EventArgs e)
    //{
    //    ClearTexbox(Page.Controls);
    //    btnSave.Enabled = true;
    //    btnDelete.Enabled = false;
    //    btnUpdate.Enabled = false;
    //    lblSave.Visible = false;
    //}
    //protected void btnDelete_Click(object sender, EventArgs e)
    //{
    //    if (txtTransID.Text == "")
    //    {
    //        lblSave.Text = ("Trans Id cannot be empty");
    //    }
    //    btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
    //    SqlConnection conn = new SqlConnection(strconn);

    //    SqlConnection sqlCon = new SqlConnection(strconn);
    //    SqlCommand sqlComm = new SqlCommand();
    //    sqlComm.Connection = sqlCon;

    //    sqlComm.CommandText = "DeleteTrouble";
    //    sqlComm.CommandType = CommandType.StoredProcedure;
    //    sqlComm.Parameters.AddWithValue("transid", txtTransID.Text);
    //    //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

    //    sqlCon.Open();

    //    sqlComm.ExecuteNonQuery();

    //    conn.Close();
    //   // lblSave.Visible = true;
    //   // lblSave.Text = "Record Deleted";
    //    ClearTexbox(Page.Controls);
    //    //GridView1.DataBind();

    //}
    //public void copy_lbl_dll()
    //{
    //    string strDate = txtDate.Text.ToString(); //Format – dd/MM/yyyy
    //    //string strDate = "26/07/2011"; //Format – dd/MM/yyyy
    //    //split string date by separator, here I'm using '/'
    //    string[] arrDate = strDate.Split('/');

    //    //now use array to get specific date object
    //    string day = arrDate[0].ToString();
    //    string month = arrDate[1].ToString();
    //    string year = arrDate[2].ToString();
    //    string[] arrTime = year.Split();
    //    string hour = arrTime[0].ToString();
    //    string minute = arrTime[1].ToString();
    //    ddlDay.Text = day;
    //    ddlMonth.Text = month;
    //  // ddlYear.Text = hour ;
    //   TextBox1.Text = hour;
    //    string onlyyr = TextBox1.Text.ToString();
    //   ddlYear.Text = onlyyr; 
    //    string[] arrHour = minute.Split(':');
    //    string hr = arrHour[0].ToString();
    //    string min = arrHour[1].ToString();
    //    ddlHr.Text = hr;
    //    ddlMin.Text = min;
    //}
    //public void copy_DLL_to_LBL()
    //{
    //    txtDate.Text = (ddlDay.SelectedItem.Value + "/" + ddlMonth.SelectedItem.Value + "/" + ddlYear.SelectedItem.Value + " " + ddlHr.SelectedItem.Value + ":" + ddlMin.SelectedItem.Value );
    //}
    //public void copy_txt_dll()
    //{
    //    string strDate0 = txtDate0.Text.ToString(); //Format – dd/MM/yyyy
    //    //string strDate = "26/07/2011"; //Format – dd/MM/yyyy
    //    //split string date by separator, here I'm using '/'
    //    string[] arrDate0 = strDate0.Split('/');

    //    //now use array to get specific date object
    //    string day = arrDate0[0].ToString();
    //    string month = arrDate0[1].ToString();
    //    string year = arrDate0[2].ToString();
    //    //string[] arrTime = year.Split();
    //    //string hour = arrTime[0].ToString();
    //    //string minute = arrTime[1].ToString();
    //    ddlDay0.Text = day;
    //    ddlMonth0.Text = month;
    //    //ddlYear0.Text = year;
    //    //ddlMin.Text = minute;
    //    //string[] arrHour = minute.Split(':');
    //    //string hr = arrHour[0].ToString();
    //    //string min = arrHour[1].ToString();
    //    //ddlHr.Text = hr;
    //    //ddlMin.Text = min;
    //}
    //public void copy_DLL_to_TXT()
    //{
    //    txtDate0.Text = (ddlDay0.SelectedItem.Value + "/" + ddlMonth0.SelectedItem.Value + "/" + ddlYear0.SelectedItem.Value + " " + ddlHr.SelectedItem.Value + ":" + ddlMin.SelectedItem.Value);
    //}

    //protected void ddlDay_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string formdate = ddlDay.SelectedItem.Value + "/" + ddlMonth.SelectedItem.Value + "/" + ddlYear.SelectedItem.Value + " " + ddlHr.SelectedItem.Value + ":" + ddlMin.SelectedItem.Value;
    //    txtDate.Text = formdate.ToString();
    //}
    //protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    copy_DLL_to_LBL();
    //}
    //protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    copy_DLL_to_LBL();
    //}

    //protected void ddlDay0_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string formdate0 = ddlDay0.SelectedItem.Value + "/" + ddlMonth0.SelectedItem.Value + "/" + ddlYear0.SelectedItem.Value + " " + ddlHr.SelectedItem.Value + ":" + ddlMin.SelectedItem.Value;
    //    txtDate0.Text = formdate0.ToString();
    //}
    //protected void ddlMonth0_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    copy_DLL_to_TXT();
    //}
    //protected void ddlYear0_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    copy_DLL_to_TXT();
    //}

    //protected void ddlDes_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //   PopulateTextBoxes();
    //}
    //protected void PopulateTextBoxes()
    //{
    //    string des = txtDes.Text;

    //    SqlConnection con = new SqlConnection(strconn);
    //    SqlCommand cmd = new SqlCommand();
    //    String strQuery = "select faultcode,des from fault where faultcode= '" + ddlDes.Text + "'";

    //    cmd.Parameters.AddWithValue("@faulcotde", ddlDes.SelectedItem.Value);
    //    cmd.CommandType = CommandType.Text;
    //    cmd.CommandText = strQuery;
    //    cmd.Connection = con;
    //    try
    //    {
    //        con.Open();
    //        SqlDataReader sdr = cmd.ExecuteReader();
    //        while (sdr.Read())
    //        {
    //            txtFaultCode.Text = sdr[0].ToString();
    //            txtDes.Text = sdr[1].ToString();
    //            // txtDes.Text = sdr["des"].ToString();
    //            //txtOldQty.Text = sdr["qty"].ToString();
    //            //txtCprice.Text = sdr["cprice"].ToString();
    //            //txtOldPrice.Text = sdr["cprice"].ToString();
    //        }
    //        //txtQty.Text = "1";
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //    finally
    //    {
    //        con.Close();
    //        con.Dispose();
    //    }
    //}
    protected void btnSave_Click(object sender, EventArgs e)
    {

        //if (txtTransID.Text == "" && txtPrepareby.Text == "" && txtStation.Text == "" && ddlDept.Text == "")
        //{
        //    btnSave.Attributes.Add("onclick", "if(confirm('Fill All!')){}else{return false}");
        //    lblSave.Text = ("Fill All!");
        //    return;
        //}

        //using (SqlConnection conn = new SqlConnection(strconn))
        //{
        //    using (SqlCommand cmd = new SqlCommand("InsertTrouble", conn))
        //    {
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        cmd.Parameters.Add("@transid", SqlDbType.VarChar).Value = txtTransID.Text;
        //        cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text.ToString();
        //        cmd.Parameters.Add("@prepareby", SqlDbType.VarChar).Value = txtPrepareby.Text.ToString();
        //        cmd.Parameters.Add("@dept", SqlDbType.VarChar).Value = ddlDept.Text;
        //        cmd.Parameters.Add("@locate", SqlDbType.VarChar).Value = txtLocate1.Text;
        //        cmd.Parameters.Add("@faultcode", SqlDbType.VarChar).Value = txtFaultCode.Text;
        //        cmd.Parameters.Add("@apparatus", SqlDbType.VarChar).Value = txtApparatus.Text;
        //        cmd.Parameters.Add("@des", SqlDbType.VarChar).Value = txtDes.Text;
        //        cmd.Parameters.Add("@station", SqlDbType.VarChar).Value = txtStation.Text;
        //        cmd.Parameters.Add("@locate1", SqlDbType.VarChar).Value = txtLocate1.Text;
        //        //cmd.Parameters.Add("@apparatus", SqlDbType.VarChar).Value = txtApparatus.Text;
        //        cmd.Parameters.Add("@reason", SqlDbType.VarChar).Value = txtReason.Text;
        //        cmd.Parameters.Add("@workdn", SqlDbType.VarChar).Value = txtWorkdn.Text;
        //        cmd.Parameters.Add("@certify", SqlDbType.VarChar).Value = txtCertify.Text;
        //        cmd.Parameters.Add("@certdate", SqlDbType.DateTime).Value = txtCertDate.Text;

        //        conn.Open();
        //        cmd.ExecuteNonQuery();

        //        conn.Close();
        //        // lblSave.Text = "Record Saved";
        //        // GridView1.DataBind();
        //        ClearTexbox(Page.Controls);
        //    }

        //}
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
       // btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
       // SqlConnection conn = new SqlConnection(strconn);
       //        SqlConnection sqlCon = new SqlConnection(strconn);
       //        SqlCommand sqlComm = new SqlCommand();
       //sqlComm.Connection = sqlCon;
       // sqlComm.CommandText = "DeleteTrouble";
       // sqlComm.CommandType = CommandType.StoredProcedure;
       // sqlComm.Parameters.AddWithValue("transid", txtTransID.Text);
       //  sqlCon.Open();
       // sqlComm.ExecuteNonQuery();

       // sqlCon.Close();

       //lblSave.Visible = true;
       // lblSave.Text = "Record Deleted";
       // ClearTexbox(Page.Controls);
     
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearTexbox(Page.Controls);
    }

    protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
    {
      
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        //System.Data.SqlClient.SqlDataReader readme;
        //SqlConnection conn = new SqlConnection(strconn);
        //conn.Open();
        //String query = "select * from troubleview where transid='" + txtTransID.Text + "'";
        //cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        //readme = cmd.ExecuteReader();
        //if (readme.Read())
        //{
        //    if (System.DBNull.Value.Equals(readme[0]))
        //    {
        //        txtTransDate.Text = "";
        //    }
        //    else
        //    {
        //        txtTransDate.Text = readme["transdate"].ToString();
        //    }
        //    if (System.DBNull.Value.Equals(readme[1]))
        //    {
        //        txtPrepareby.Text = "";
        //    }
        //    else
        //    {
        //        txtPrepareby.Text = readme["prepareby"].ToString();
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
        //        txtApparatus.Text = "";
        //    }
        //    else
        //    {
        //        txtApparatus.Text = readme["apparatus"].ToString();
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
        //        txtLocate1.Text = "";
        //    }
        //    else
        //    {
        //        txtLocate1.Text = readme["locate"].ToString();
        //    }

        //    if (System.DBNull.Value.Equals(readme[6]))
        //    {
        //        txtStation.Text = "";
        //    }
        //    else
        //    {
        //        txtStation.Text = readme["station"].ToString();
        //    }
        //    if (System.DBNull.Value.Equals(readme[7]))
        //    {
        //        txtLocate1.Text = "";
        //    }
        //    else
        //    {
        //        txtLocate1.Text = readme["locate1"].ToString();
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
        //    if (System.DBNull.Value.Equals(readme[12]))
        //    {
        //        txtCertDate.Text = "";
        //    }
        //    else
        //    {
        //        txtCertDate.Text = readme["CertDate"].ToString();
        //    }
        //    //btnSave.Enabled = false;
        //    //btnUpdate.Enabled = true;
        //    //btnDelete.Enabled = true;
        //    //copy_lbl_dll();
        //    //copy_txt_dll();
        //}
    }
    public void load_ddlDes()
    {
        //string des = txtDes.Text;

        //using (SqlConnection con = new SqlConnection(strconn))
        //{
        //    using (SqlCommand cmd = new SqlCommand("SELECT faultcode, des FROM fault where des like '" + des + "%' "))
        //    {
        //        cmd.CommandType = CommandType.Text;
        //        cmd.Connection = con;
        //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //        {
        //            DataSet ds = new DataSet();
        //            sda.Fill(ds);
        //            ddlDes.DataSource = ds.Tables[0];
        //            ddlDes.DataTextField = "des";
        //            ddlDes.DataValueField = "faultcode";
        //            ddlDes.DataBind();
        //        }
        //    }
        //}
        //ddlDes.Items.Insert(0, new ListItem("--Select The Appropiate Fault--", "0"));
    }
    public void load_ddlDept()
    {
        //string des = txtDes.Text;

        //using (SqlConnection con = new SqlConnection(strconn))
        //{
        //    using (SqlCommand cmd = new SqlCommand("SELECT dept FROM dept "))
        //    {
        //        cmd.CommandType = CommandType.Text;
        //        cmd.Connection = con;
        //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //        {
        //            DataSet ds = new DataSet();
        //            sda.Fill(ds);
        //            ddlDept.DataSource = ds.Tables[0];
        //            ddlDept.DataTextField = "dept";
        //            ddlDept.DataValueField = "dept";
        //            ddlDept.DataBind();
        //        }
        //    }
        //}
        //// ddlDes.Items.Insert(0, new ListItem("--Select The Appropiate Fault--", "0"));
    }
    protected void btnSearch_Click1(object sender, EventArgs e)
    {
        load_ddlDes();
    
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    { 
        //using (SqlConnection conn = new SqlConnection(strconn))
        //{
        //    using (SqlCommand cmd = new SqlCommand("UpdateTrouble1", conn))
        //    {
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("transid", txtTransID.Text);
        //        cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text;
        //        cmd.Parameters.AddWithValue("prepareby", txtPrepareby.Text);
        //        cmd.Parameters.AddWithValue("apparatus", txtApparatus.Text);
        //        cmd.Parameters.AddWithValue("dept", ddlDept.Text);
        //        cmd.Parameters.AddWithValue("locate", txtLocate1.Text);
        //        cmd.Parameters.AddWithValue("station", txtStation.Text);
        //        cmd.Parameters.AddWithValue("faultcode", txtFaultCode.Text);
        //        cmd.Parameters.AddWithValue("des", txtDes.Text);

        //        cmd.Parameters.AddWithValue("locate1", txtLocate1.Text);

        //        cmd.Parameters.AddWithValue("reason", txtReason.Text);
        //        cmd.Parameters.AddWithValue("certify", txtCertify.Text);
        //        cmd.Parameters.Add("@certdate", SqlDbType.DateTime).Value = txtCertDate.Text;

        //        //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

        //        conn.Open();
        //        cmd.ExecuteNonQuery();

        //        conn.Close();
        //        // lblSave.Text = "Record Saved";
        //        // GridView1.DataBind();
        //        ClearTexbox(Page.Controls);
        //    }

        //}
    }

    protected void ddlDes_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateTextBoxes();
    }
}

