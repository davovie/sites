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


public partial class insert : System.Web.UI.Page
{
    //SqlCommand cmd = new SqlCommand();
    //String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //SqlConnection con = new SqlConnection(strconn);
    SqlConnection con = new SqlConnection (@"Data Source=.\sqlexpress;Initial Catalog=performgt;Persist Security Info=True;User ID=sa;Password=fanny ");
    string name, city;
    protected void Page_Load(object sender, EventArgs e)
    {
        name = Request.QueryString["nm"].ToString();
        city  = Request.QueryString["ct"].ToString();

        con.open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into table1 values('"+ name .ToString() +"','"+ city .ToString ()+"')";
        cmd.EndExecuteNonQuery();

        con.Close();
        
    }
}
