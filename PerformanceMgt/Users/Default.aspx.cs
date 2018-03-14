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

public partial class _Default : System.Web.UI.Page 
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["username"] != null)
        //{
            //Response.Redirect("Default.aspx");
            lblWelcome.Text = Session["username"].ToString();

        //}
        //else
        //{
           
        //}
        count_trouble();
        count_checked();
        count_unchecked();
        count_login();
        
    }
   public void count_trouble()
    {
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();
        String query = "select count(transid) as count from trouble";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            Label1.Text = readme["count"].ToString();
           Label2.Text = Label1.Text;
           
        }
    }
    public void count_checked()
    {
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();
        String query = "select count(transid) as count from trouble where checked = 'y'";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            lblChecked.Text = readme["count"].ToString();
            Label4.Text = lblChecked.Text;
        }
    }
    public void count_unchecked()
    {
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();
        String query = "select count(transid) as count from trouble where fixed = 'n'";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
          lblUnchecked.Text = readme["count"].ToString();
            Label5.Text = lblUnchecked.Text;
        }
    }
    public void count_login()
    {
        System.Data.SqlClient.SqlDataReader readme;
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();
        String query = "select count(username) as count from [user] where inout = 'in'";
        cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        readme = cmd.ExecuteReader();
        if (readme.Read())
        {
            Label6.Text = readme["count"].ToString();
          //  Label5.Text = lblUnchecked.Text;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
          Response.Redirect("MsTroubleCheck.aspx");
        //System.Data.SqlClient.SqlDataReader readme;
        //SqlConnection conn = new SqlConnection(strconn);
        //conn.Open();
        //String query = "select count(treansid) as count from trouble";
        //cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        //readme = cmd.ExecuteReader();
        //if (readme.Read())
        //{
        //    Label1.Text = readme["count"].ToString();
        //}
        //    //    if (System.DBNull.Value.Equals(readme[0]))
        //    //    {
        //    //        txtSnNo.Text = "";
        //    //    }
        //    //    else
        //    //    {
        //    //        txtSnNo.Text = readme["snno"].ToString();
        //    //    }

        //    //    if (System.DBNull.Value.Equals(readme[1]))
        //    //    {
        //    //        txtUser.Text = "";
        //    //    }
        //    //    else
        //    //    {
        //    //        txtUser.Text = readme["users"].ToString();
        //    //    }
        //    //   // Response.Redirect("MsRouter.aspx");
        //    //}
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
        //string myString = GridView1.SelectedRow.Cells[0].Text.ToString();
        //txtSnNo.Text = myString;
        //string myString1 = GridView1.SelectedRow.Cells[1].Text.ToString();
        //txtUser.Text = myString1;
    }
    protected void GridView1_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);
        }
    }


    protected void ddlReport_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("MsTroubleReporting.aspx");
    }
}
