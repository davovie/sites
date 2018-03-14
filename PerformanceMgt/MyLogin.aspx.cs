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

public partial class MyLogin : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString1"].ConnectionString;
   // String strconn = "server=.\\SqlExpress;database=master;uid=sa;pwd=fanny";
    public SqlDataAdapter da;
    public DataSet ds;
    public DataTable dt;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblinfo.Visible = false;
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //string strconnection = "server=.\\SqlExpress;database=master;uid=sa;pwd=fanny;Integrated Security=True;";

        SqlConnection sqrconnection = new SqlConnection(strconn);
        String SQLQuery = "SELECT * FROM login where username='" + txtUserName.Text + "' and password='" + txtPassword.Text + "'";
        SqlCommand cmd = new SqlCommand(SQLQuery, sqrconnection);
        sqrconnection.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter ad = new SqlDataAdapter(cmd);

        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Response.Redirect("frmMain.aspx");
            lblinfo.Text = "";
           
        }

        else
        {
            lblinfo.Visible = true;
            lblinfo.Text = "Invalid Username or Password, Try Again!";
            txtPassword.Text = "";
            txtPassword.Focus();
            return;
        }

        sqrconnection.Close();            
    }
    }

