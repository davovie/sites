using System;
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

public partial class _Default : System.Web.UI.Page 
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    TextBox1.Text = Request.QueryString["des"];
        //}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       // Response.Redirect("~/Default.aspx?des=" + TextBox1.Text.Trim());
        //System.Data.SqlClient.SqlDataReader readme;
        //SqlConnection conn = new SqlConnection(strconn);
        //conn.Open();
        //String query = "select * from fault where des like '" + "%" + TextBox1.Text + "%" + "'";
        ////select top 200 * from stock_record where stkdes like '" & txtStkDes.Text & "%" & "' ORDER BY stkcode"
        //cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        //readme = cmd.ExecuteReader();
        //if (readme.Read())
        //{
        //    if (System.DBNull.Value.Equals(readme[1]))
        //    {
        //        TextBox2.Text = "";
        //    }
        //    else
        //    {
        //        TextBox2.Text = readme["faultcode"].ToString();
        //    }
        //}
    }
}
