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

public partial class Admin_Login : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlCommand cmd1 = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void loginn()
    {
        
        SqlConnection conn = new SqlConnection(strconn);
        //conn.Open();
        //SqlCommand cmd = conn.CreateCommand();
        //cmd.CommandType = CommandType.Text;
        //cmd .CommandText = "select username,password from [user] where username='" + txtUserName.Text + "' and password='" + txtPassword.Text + "'";
        //cmd.ExecuteNonQuery();
        //DataTable dt = new DataTable();
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        //da.Fill(dt);
        //foreach (DataRow dr in dt.Rows)
        //    {
        //    Session["username"] = dr["username"].ToString();
        //    Response.Redirect("Default.aspx");
        //}


        String query = "select * from [user] where username='" + txtUserName.Text + "' and password='" + txtPassword.Text + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        conn.Open();
        SqlDataReader readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            Session["username"] = txtUserName.Text;
            if (readme["status"].ToString() == "User")
            {
               // lblSave.Text = Session["username"].ToString();
                Response.Redirect("Users/Default.aspx");
            }
            else
            {
               // lblSave.Text = Session["username"].ToString();
                Response.Redirect("Admin/Default.aspx");
            }
            conn.Close();
            conn.Open();
            string query1 = "update [user] set inout= 'in' where username= '" + txtUserName.Text + "'";
            cmd = new System.Data.SqlClient.SqlCommand(query1, conn);
            cmd.ExecuteNonQuery();

            

            //    //conn.Close();
            //    //conn.Open();
             

            //    conn.Close();

            }

             else
             {
                //    // Response.Redirect("Default.aspx");
                //     //lblinfo.Visible = true;
                lblSave.Text = "INVALID Username or Password, Try Again!";
       //     txtPassword.Text = "";
       //     txtPassword.Focus();
       //     return;
      }
       //// Response.Redirect("../Users/Default.aspx");

      

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        loginn();
    }
}