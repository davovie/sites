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
            load_ddlDept();
            load_ddlApproval();
           
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
            
            if (System.DBNull.Value.Equals(readme[5]))
            {
                ddlDept.Text = "";
            }
            else
            {
                ddlDept.Text = readme["locate"].ToString();
            }

            
            if (System.DBNull.Value.Equals(readme[7]))
            {
                txtLocate1.Text = "";
            }
            else
            {
                txtLocate1.Text = readme["locate1"].ToString();
            }
            
                        
        }
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
       using (SqlConnection conn = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("InsertTrouble1", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@transid", SqlDbType.VarChar).Value = txtTransID.Text;
                cmd.Parameters.AddWithValue("to", ddlApproval.Text);
                cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text;
                cmd.Parameters.Add("@prepareby", SqlDbType.VarChar).Value = txtPrepareby.Text.ToString();
                cmd.Parameters.Add("@apparatus", SqlDbType.VarChar).Value = txtApparatus.Text;
                cmd.Parameters.Add("@dept", SqlDbType.VarChar).Value = ddlDept.Text;
                cmd.Parameters.Add("@locate", SqlDbType.VarChar).Value = txtLocate1.Text;
                cmd.Parameters.Add("@faultcode", SqlDbType.VarChar).Value = txtFaultCode.Text;
                cmd.Parameters.Add("@des", SqlDbType.VarChar).Value = txtDes.Text;
                cmd.Parameters.Add("@station", SqlDbType.VarChar).Value = txtStation.Text;
                cmd.Parameters.Add("@locate1", SqlDbType.VarChar).Value = txtLocate1.Text;
                

                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();
                ClearTexbox(Page.Controls);
            }

        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearTexbox(Page.Controls);
    }
    protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateTextBoxes();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();
        String query = "select * from troubleview where transid='" + txtTransID.Text + "'";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            if (System.DBNull.Value.Equals(readme[0]))
            {
                txtTransDate.Text = "";
            }
            else
            {
                txtTransDate.Text = readme["transdate"].ToString();
            }
            if (System.DBNull.Value.Equals(readme[1]))
            {
                txtPrepareby.Text = "";
            }
            else
            {
                txtPrepareby.Text = readme["prepareby"].ToString();
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
               // ddlDept.Items.Clear();
                ddlDept.Text = readme["dept"].ToString();
            }
            if (System.DBNull.Value.Equals(readme[5]))
            {
                txtLocate1.Text = "";
            }
            else
            {
                txtLocate1.Text = readme["locate"].ToString();
            }

            if (System.DBNull.Value.Equals(readme[6]))
            {
                txtStation.Text = "";
            }
            else
            {
                txtStation.Text = readme["station"].ToString();
            }
            if (System.DBNull.Value.Equals(readme[7]))
            {
                txtLocate1.Text = "";
            }
            else
            {
                txtLocate1.Text = readme["locate1"].ToString();
            }
           
        }
    }
    public void load_ddlApproval()
    {
       // string des = txtDes.Text;

        using (SqlConnection con = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT design FROM approval "))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    ddlApproval.DataSource = ds.Tables[0];
                    ddlApproval.DataTextField = "design";
                    ddlApproval.DataValueField = "design";
                    ddlApproval.DataBind();
                }
            }
        }
       // ddlDes.Items.Insert(0, new ListItem("--Select The Appropiate Fault--", "0"));
    }
    public void load_ddlDept()
    {
        //string des = txtDes.Text;

        using (SqlConnection con = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT dept FROM dept "))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    ddlDept.DataSource = ds.Tables[0];
                    ddlDept.DataTextField = "dept";
                    ddlDept.DataValueField = "dept";
                    ddlDept.DataBind();
                }
            }
        }
        // ddlDes.Items.Insert(0, new ListItem("--Select The Appropiate Fault--", "0"));
    }
    public void load_ddlDes()
    {
        string des = txtDes.Text;

        using (SqlConnection con = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT faultcode, des FROM fault where des like '" + des + "%' "))
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
        ddlDes.Items.Insert(0, new ListItem("--Select The Appropiate Fault--", "0"));
    }
    protected void btnSearch_Click1(object sender, EventArgs e)
    {
        load_ddlDes();
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
       
        using (SqlConnection conn = new SqlConnection(strconn))
        {
            using (SqlCommand cmd = new SqlCommand("UpdateTrouble", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("transid", txtTransID.Text);
                cmd.Parameters.AddWithValue("to", ddlApproval.Text);
                cmd.Parameters.Add("@transdate", SqlDbType.DateTime).Value = txtTransDate.Text;
                cmd.Parameters.AddWithValue("prepareby", txtPrepareby.Text);
                cmd.Parameters.AddWithValue("dept", ddlDept.Text);
                cmd.Parameters.AddWithValue("locate", txtLocate1.Text);
                cmd.Parameters.AddWithValue("station", txtStation.Text);
                cmd.Parameters.AddWithValue("apparatus", txtApparatus.Text);
                cmd.Parameters.AddWithValue("faultcode", txtFaultCode.Text);
                cmd.Parameters.AddWithValue("des", txtDes.Text);

                cmd.Parameters.AddWithValue("locate1", txtLocate1.Text);

                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();
                // lblSave.Text = "Record Saved";
                // GridView1.DataBind();
                ClearTexbox(Page.Controls);
            }

        }
    }

    protected void ddlDept_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}

