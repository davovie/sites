using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls.WebParts;
using System.Configuration;

public partial class User : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    //SqlCommand cmd1 = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["CMMSConnectionString"].ConnectionString;
    //String strconn1 = ConfigurationManager.ConnectionStrings["performgtConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string lname = txtLastName.Text;
        string fname = txtFirstName.Text;
        string dept = dDList.Text;
        string address = txtAddress.Text;

        //if (txtPassword.Text != txtPassword1.Text)
        //{
        //    lblSave.Visible = true;
        //    lblSave.Text = "Password did not match";
        //    return;
        //}
        //else
        //{
        using (SqlConnection conn = new SqlConnection(strconn))
        //using (SqlConnection conn1 = new SqlConnection(strconn1))
        {
            using (SqlCommand cmd = new SqlCommand("Insert into [User] (frst_nm, lst_nm, dept, addr)values('"+ txtFirstName.Text + "', '" + txtLastName.Text + "', '" + dDList.Text + "', '" + txtAddress.Text + "')", conn))
            // using (SqlCommand cmd1 = new SqlCommand("InsertUser1", conn1))
            {
                //cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@lname", SqlDbType.VarChar).Value = txtLastName.Text;
                cmd.Parameters.Add("@fname", SqlDbType.VarChar).Value = txtFirstName.Text;
                cmd.Parameters.Add("@dept", SqlDbType.VarChar).Value = dDList.Text;
                cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txtAddress.Text;
                

                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();
                lblMsg.Text = ("Saved successfully");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string lname = txtLastName.Text;
        string fname = txtFirstName.Text;
        string dept = dDList.Text;
        string address = txtAddress.Text;

        //if (txtPassword.Text != txtPassword1.Text)
        //{
        //    lblSave.Visible = true;
        //    lblSave.Text = "Password did not match";
        //    return;
        //}
        //else
        //{
        using (SqlConnection conn = new SqlConnection(strconn))
        //using (SqlConnection conn1 = new SqlConnection(strconn1))
        {
            using (SqlCommand cmd = new SqlCommand("update [user] set lst_nm= '" + txtLastName.Text + "', dept= '" + dDList.Text + "', addr= '" + txtAddress.Text + "' WHERE frst_nm= '" + txtFirstName.Text + "'", conn))
            //using (SqlCommand cmd = new SqlCommand("Update [User] set lst_nm= '" + txtLastName.Text + "', dept= '" + dDList.Text + "', addr= '" + txtAddress.Text + "' WHERE frst_nm= '" + txtFirstName.Text + "'", conn)
            // using (SqlCommand cmd1 = new SqlCommand("InsertUser1", conn1))
            {
                //cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@lname", SqlDbType.VarChar).Value = txtLastName.Text;
                cmd.Parameters.Add("@fname", SqlDbType.VarChar).Value = txtFirstName.Text;
                cmd.Parameters.Add("@dept", SqlDbType.VarChar).Value = dDList.Text;
                cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txtAddress.Text;


                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();
                lblMsg.Text = ("Updated successfully");
            }
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {

    }

    protected void Button4_Click(object sender, EventArgs e)
    {

    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(strconn);
        SqlCommand cmd = new SqlCommand();
        String strQuery = "select * from user_view where frst_nm= '" + txtFirstName.Text + "'";

        //cmd.Parameters.AddWithValue("@stkcode", ddlDes.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                txtLastName.Text = sdr["lst_nm"].ToString();
                dDList.Text = sdr["dept"].ToString();
                txtAddress.Text = sdr["addr"].ToString();
            }
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

    protected void btnLastSearch_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(strconn);
        SqlCommand cmd = new SqlCommand();
        String strQuery = "select * from user_view where lst_nm= '" + txtLastName.Text + "'";

        //cmd.Parameters.AddWithValue("@stkcode", ddlDes.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                txtFirstName.Text = sdr["frst_nm"].ToString();
                dDList.Text = sdr["dept"].ToString();
                txtAddress.Text = sdr["addr"].ToString();
            }
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