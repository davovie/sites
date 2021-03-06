﻿using System;
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

public partial class MsTrouble1: System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm");
            txtDate0.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm");
            lblSave.Visible = false;
            copy_lbl_dll();
            copy_txt_dll();
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
    //protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
    //        e.Row.ToolTip = "Click to select this row.";
    //    }
    //}
    //protected void OnSelectedIndexChanged(object sender, EventArgs e)
    //{
    //    ////GridViewRow row = GridView1.SelectedRow;
    //    ////ddlDept.Text = row.Cells[0].Text;
    //    ////txtDept.Text = row.Cells[1].Text;
    //    //// txtCountry.Text = (row.FindControl("lblCountry") as Label).Text;

    //    string myString = GridView1.SelectedRow.Cells[0].Text.ToString();
    //    txtFaultCode.Text = myString;
    //    string myString1 = GridView1.SelectedRow.Cells[1].Text.ToString();
    //    txtDes.Text = myString1;
    //    //string myString2 = GridView1.SelectedRow.Cells[2].Text.ToString();
    //    //txtImei1.Text = myString2;
    //    //string myString3 = GridView1.SelectedRow.Cells[3].Text.ToString();
    //    //txtImei2.Text = myString3;
    //    //////foreach (GridViewRow row in GridView1.Rows)
    //    //////{
    //    //////    if (row.RowIndex == GridView1.SelectedIndex)
    //    //////    {
    //    //////        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
    //    //////        row.ToolTip = string.Empty;
    //    //////    }
    //    //////    else
    //    //////    {
    //    //////        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
    //    //////        row.ToolTip = "Click to select this row.";
    //    //////    }
    //    //////}
    //}
    //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    System.Data.SqlClient.SqlDataReader readme;
    //    SqlConnection conn = new SqlConnection(strconn);
    //    conn.Open();
    //    String query = "select * from fault where des='" + txtDes.Text + "'";
    //    cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    //    readme = cmd.ExecuteReader();
    //    if (readme.Read())
    //    {
    //        if (System.DBNull.Value.Equals(readme[1]))
    //        {
    //            txtDes.Text = "";
    //        }
    //        else
    //        {
    //            txtDes.Text = readme["des"].ToString();
    //        }
    //    }
    //}
    //protected void GridView1_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);
    //    }
    //}
    public void load_ddlDes()
    {
        string des = txtDes.Text;

        using (SqlConnection con = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT faultcode, des FROM fault where des like '%" + des + "%' "))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    ddlDes.DataSource = ds.Tables[0];
                    ddlDes.DataTextField = "des";
                    ddlDes.DataValueField = "faultcode";
                    ddlDes.DataBind();
                }
            }
        }
        ddlDes.Items.Insert(0, new ListItem("-- Select The Appropiate Fault --", "0"));
    }
    protected void btnSave1_Click(object sender, EventArgs e)
    {
        ClearTexbox(Page.Controls);

    }
    protected void btnSearch_Click(object sender, EventArgs e)
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
       
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtTransID.Text == "")
        {
            lblSave.Text = ("Trans Id cannot be empty");
        }

        copy_DLL_to_LBL();
        using (SqlConnection conn = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("InsertTrouble", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                //cmd.Parameters.Add("@transid", SqlDbType.VarChar).Value = txtTransID.Text;
                cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtDate.Text;
                cmd.Parameters.Add("@dept", SqlDbType.VarChar).Value = ddlDept.Text;
                cmd.Parameters.Add("@locate", SqlDbType.VarChar).Value = txtLocate.Text;
                cmd.Parameters.Add("@faultcode", SqlDbType.VarChar).Value = txtFaultCode.Text;
                cmd.Parameters.Add("@des", SqlDbType.VarChar).Value = txtDes.Text;
                cmd.Parameters.Add("@station", SqlDbType.VarChar).Value = ddlStation.Text;
                cmd.Parameters.Add("@locate1", SqlDbType.VarChar).Value = txtLocate1.Text;
                //cmd.Parameters.Add("@apparatus", SqlDbType.VarChar).Value = txtApparatus.Text;
                cmd.Parameters.Add("@reason", SqlDbType.VarChar).Value = txtReason.Text;
                cmd.Parameters.Add("@workdn", SqlDbType.VarChar).Value = txtWorkdn.Text;
                cmd.Parameters.Add("@certify", SqlDbType.VarChar).Value = txtCertify.Text;
                cmd.Parameters.Add("@CERTdate", SqlDbType.DateTime).Value = txtDate0.Text;
                
                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();
               // lblSave.Text = "Record Saved";
               // GridView1.DataBind();
                ClearTexbox(Page.Controls);
            }

        }
    }
protected void  btnLook_Click(object sender, EventArgs e)
{
    load_ddlDes();
}
protected void btnUpdate_Click(object sender, EventArgs e)
{
    if (txtTransID.Text == "")
    {
        lblSave.Text = ("Trans Id cannot be empty");
    }
    using (SqlConnection conn = new SqlConnection(strconn))
    {
        using (SqlCommand cmd = new SqlCommand("UpdateTrouble", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("transid", txtTransID.Text);
            cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtDate.Text;
            cmd.Parameters.AddWithValue("dept", ddlDept.Text);
            cmd.Parameters.AddWithValue("locate", txtLocate.Text);
            cmd.Parameters.AddWithValue("faultcode", txtFaultCode.Text);
            cmd.Parameters.AddWithValue("des", txtDes.Text);
            cmd.Parameters.AddWithValue("station", ddlStation.Text);
            cmd.Parameters.AddWithValue("locate1", txtLocate1.Text);
            //cmd.Parameters.AddWithValue("apparatus", txtApparatus.Text);
            cmd.Parameters.AddWithValue("reason", txtReason.Text);
            cmd.Parameters.AddWithValue("certify", txtCertify.Text);
            cmd.Parameters.Add("@CERTdate", SqlDbType.DateTime).Value = txtDate0.Text;
            
            //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

            conn.Open();
            cmd.ExecuteNonQuery();

            conn.Close();
            // lblSave.Text = "Record Saved";
            // GridView1.DataBind();
            ClearTexbox(Page.Controls);
        }

    }
}
protected void Button1_Click(object sender, EventArgs e)
{
    System.Data.SqlClient.SqlDataReader readme;
    SqlConnection conn = new SqlConnection(strconn);
    conn.Open();
    String query = "select * from troubleview where transid='" + txtTransID.Text + "'";
    cmd = new System.Data.SqlClient.SqlCommand(query, conn);
    readme = cmd.ExecuteReader();
    if (readme.Read())
    {
        if (System.DBNull.Value.Equals(readme[1]))
        {
            txtDate.Text = "";
        }
        else
        {
            txtDate.Text = readme["transdate"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[2]))
        {
            txtFaultCode.Text = "";
        }
        else
        {
            txtFaultCode.Text = readme["faultcode"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[3]))
        {
            txtDes.Text = "";
        }
        else
        {
            txtDes.Text = readme["des"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[4]))
        {
            ddlDept.Text = "";
        }
        else
        {
            ddlDept.Text = readme["dept"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[5]))
        {
            txtLocate.Text = "";
        }
        else
        {
            txtLocate.Text = readme["locate"].ToString();
        }
       
        if (System.DBNull.Value.Equals(readme[6]))
        {
            ddlStation.Text = "";
        }
        else
        {
            ddlStation.Text = readme["station"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[7]))
        {
            txtLocate1.Text = "";
        }
        else
        {
            txtLocate1.Text = readme["locate1"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[8]))
        {
            ddlDept.Text = "";
        }
        else
        {
            ddlDept.Text = readme["dept"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[9]))
        {
            txtReason.Text = "";
        }
        else
        {
            txtReason.Text = readme["reason"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[10]))
        {
            txtWorkdn.Text = "";
        }
        else
        {
            txtWorkdn.Text = readme["workdn"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[11]))
        {
            txtCertify.Text = "";
        }
        else
        {
            txtCertify.Text = readme["certify"].ToString();
        }
        if (System.DBNull.Value.Equals(readme[14]))
        {
            txtDate0.Text = "";
        }
        else
        {
            txtDate0.Text = readme["certdate"].ToString();
        }
        btnSave.Enabled = false;
        btnUpdate.Enabled = true;
        btnDelete.Enabled = true;
        copy_lbl_dll();
        copy_txt_dll();
    }
}


protected void btnClear_Click(object sender, EventArgs e)
{
    ClearTexbox(Page.Controls);
    btnSave.Enabled = true;
    btnDelete.Enabled = false;
    btnUpdate.Enabled = false;
    lblSave.Visible = false;
}
protected void btnDelete_Click(object sender, EventArgs e)
{
    if (txtTransID.Text == "")
    {
        lblSave.Text = ("Trans Id cannot be empty");
    }
    btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
    SqlConnection conn = new SqlConnection(strconn);

    SqlConnection sqlCon = new SqlConnection(strconn);
    SqlCommand sqlComm = new SqlCommand();
    sqlComm.Connection = sqlCon;
    
    sqlComm.CommandText = "DeleteTrouble";
    sqlComm.CommandType = CommandType.StoredProcedure;
    sqlComm.Parameters.AddWithValue("transid", txtTransID.Text);
    //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

    sqlCon.Open();

    sqlComm.ExecuteNonQuery();

    conn.Close();
   // lblSave.Visible = true;
   // lblSave.Text = "Record Deleted";
    ClearTexbox(Page.Controls);
    //GridView1.DataBind();
    
}
public void copy_lbl_dll()
{
    string strDate = txtDate.Text.ToString(); //Format – dd/MM/yyyy
    //string strDate = "26/07/2011"; //Format – dd/MM/yyyy
    //split string date by separator, here I'm using '/'
    string[] arrDate = strDate.Split('/');

    //now use array to get specific date object
    string day = arrDate[0].ToString();
    string month = arrDate[1].ToString();
    string year = arrDate[2].ToString();
    ddlDay.Text = day;
    ddlMonth.Text = month;
   // ddlYear.Text = year;
}
public void copy_txt_dll()
{
    string strDate1 = txtDate0.Text.ToString(); //Format – dd/MM/yyyy
    string[] arrDate1 = strDate1.Split('/');
    //now use array to get specific date object
    string day1 = arrDate1[0].ToString();
    string month1 = arrDate1[1].ToString();
    string year1 = arrDate1[2].ToString();
    ddlDay0.Text = day1;
    ddlMonth0.Text = month1;
    // ddlYear.Text = year;
}
public void copy_DLL_to_LBL()
{
    txtDate.Text = (ddlDay.SelectedItem.Value + "/" + ddlMonth.SelectedItem.Value + "/" + ddlYear.SelectedItem.Value);
}
protected void ddlDay_SelectedIndexChanged(object sender, EventArgs e)
{
    string formdate = ddlDay.SelectedItem.Value + "/" + ddlMonth.SelectedItem.Value + "/" + ddlYear.SelectedItem.Value;
    txtDate.Text = formdate.ToString();
}
protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
{
    copy_DLL_to_LBL();
}
protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
{
    copy_DLL_to_LBL();
}



protected void ddlDes_SelectedIndexChanged(object sender, EventArgs e)
{
   PopulateTextBoxes();
}
protected void PopulateTextBoxes()
{
    string des = txtDes.Text;

    SqlConnection con = new SqlConnection(strconn);
    SqlCommand cmd = new SqlCommand();
    String strQuery = "select faultcode,des from fault where faultcode= '" + ddlDes.Text + "'";

    cmd.Parameters.AddWithValue("@faulcotde", ddlDes.SelectedItem.Value);
    cmd.CommandType = CommandType.Text;
    cmd.CommandText = strQuery;
    cmd.Connection = con;
    try
    {
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            txtFaultCode.Text = sdr[0].ToString();
            txtDes.Text = sdr[1].ToString();
           // txtDes.Text = sdr["des"].ToString();
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

protected void btnNew_Click(object sender, EventArgs e)
{
    btnSearch.Enabled = false;
    btnUpdate.Enabled = false;
    btnDelete.Enabled = false;
    ClearTexbox(Page.Controls);
    copy_DLL_to_LBL();
}
public void copy_DLL_to_LBL1()
{
    txtDate0.Text = (ddlDay0.SelectedItem.Value + "/" + ddlMonth0.SelectedItem.Value + "/" + ddlYear0.SelectedItem.Value);
}
protected void ddlDay0_SelectedIndexChanged(object sender, EventArgs e)
{
    string formdate1 = ddlDay0.SelectedItem.Value + "/" + ddlMonth0.SelectedItem.Value + "/" + ddlYear0.SelectedItem.Value;
    txtDate0.Text = formdate1.ToString();
}
protected void ddlMonth0_SelectedIndexChanged(object sender, EventArgs e)
{
    copy_DLL_to_LBL1();
}
protected void ddlYear0_SelectedIndexChanged(object sender, EventArgs e)
{
    copy_DLL_to_LBL1();
}

protected void txtDate_TextChanged(object sender, EventArgs e)
{

}
protected void txtDate0_TextChanged(object sender, EventArgs e)
{

}
}

