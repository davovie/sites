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

public partial class MsUsers : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlCommand cmd1 = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    String strconn1 = ConfigurationManager.ConnectionStrings["performgtConnectionString1"].ConnectionString;
    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    public void ClearTexbox(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;
            ClearTexbox(ctrl.Controls);
        }
        //lblSave.Visible = false;
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
        ////GridViewRow row = GridView1.SelectedRow;
        ////ddlDept.Text = row.Cells[0].Text;
        ////txtDept.Text = row.Cells[1].Text;
        //// txtCountry.Text = (row.FindControl("lblCountry") as Label).Text;

        string myString = GridView1.SelectedRow.Cells[0].Text.ToString();
        txtUserNo.Text = myString;

        string myString1 = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtLName.Text = myString1;

        string myString2 = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtFName.Text = myString2;

        string myString3 = GridView1.SelectedRow.Cells[3].Text.ToString();
        txtUserName.Text = myString3;

        string myString4 = GridView1.SelectedRow.Cells[4].Text.ToString();
        txtPassword1.Text = myString4;

        string myString5 = GridView1.SelectedRow.Cells[5].Text.ToString();
        ddlDept.Text = myString5;

        string myString6 = GridView1.SelectedRow.Cells[6].Text.ToString();
        ddlStatus.Text = myString6;

        //System.Data.SqlClient.SqlDataReader readme;
        //SqlConnection conn = new SqlConnection(strconn1);
        //conn.Open();
        //String query = "select * from user where userno='" + txtUserNo.Text + "'";
        //cmd = new System.Data.SqlClient.SqlCommand(query, conn);
        //readme = cmd.ExecuteReader();
        //if (readme.Read())
        //{
        //    if (System.DBNull.Value.Equals(readme[0]))
        //    {
        //        txtPassword2.Text = "";
        //    }
        //    else
        //    {
        //        txtPassword2.Text = readme["password"].ToString();
        //    }

        //    if (System.DBNull.Value.Equals(readme[1]))
        //    {
        //        txtFName.Text = "";
        //    }
        //    else
        //    {
        //        txtFName.Text = readme["lname"].ToString();
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


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            ddlDept.DataBind();
            ddlStatus.DataBind ();
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {

        if (txtPassword.Text != txtPassword1.Text)
        {
            lblSave.Visible = true;
            lblSave.Text = "Password did not match";
            return;
        }
        else
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            using (SqlConnection conn1 = new SqlConnection(strconn1))
            {
                using (SqlCommand cmd = new SqlCommand("InsertUser", conn))
               // using (SqlCommand cmd1 = new SqlCommand("InsertUser1", conn1))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@lname", SqlDbType.VarChar).Value = txtLName.Text;
                    cmd.Parameters.Add("@fname", SqlDbType.VarChar).Value = txtFName.Text;
                    cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = txtUserName.Text;
                    cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = txtPassword.Text;
                    cmd.Parameters.Add("@dept", SqlDbType.VarChar).Value = ddlDept.Text;
                    cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = ddlStatus.Text;

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    conn.Close();

                    //cmd1.CommandType = CommandType.StoredProcedure;
                    //cmd1.Parameters.Add("@username", SqlDbType.VarChar).Value = txtUserName.Text;
                    //cmd1.Parameters.Add("@password", SqlDbType.VarChar).Value = txtPassword.Text;
                    //cmd1.Parameters.Add("@dept", SqlDbType.VarChar).Value = ddlDept.Text;
                    //cmd1.Parameters.Add("@status", SqlDbType.VarChar).Value = ddlStatus.Text;

                    //conn1.Open();
                    //cmd1.ExecuteNonQuery();

                    //conn1.Close();
                    lblSave.Visible = true;
                    lblSave.Text = "Record Saved";
                    GridView1.DataBind();
                    ClearTexbox(Page.Controls);

                }
            }
        }
    }

  protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearTexbox(Page.Controls);
        ddlDept.Text = null;
    }
  protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text != txtPassword1.Text)
        {
            lblSave.Visible = true;
            lblSave.Text = "Password did not match";
            return;
        }
        else
        {
            SqlConnection sqlCon = new SqlConnection(strconn);
            SqlConnection sqlCon1 = new SqlConnection(strconn1);
            SqlCommand sqlComm = new SqlCommand();
            SqlCommand sqlComm1 = new SqlCommand();
            sqlComm.Connection = sqlCon;
            sqlComm1.Connection = sqlCon1;

            sqlComm.CommandText = "UpdateUser";
            sqlComm.CommandType = CommandType.StoredProcedure;
            sqlComm.Parameters.AddWithValue("userno", txtUserNo.Text);
            sqlComm.Parameters.AddWithValue("LName", txtLName.Text);
            sqlComm.Parameters.AddWithValue("FName", txtFName.Text);
            sqlComm.Parameters.AddWithValue("username", txtUserName.Text);
            sqlComm.Parameters.AddWithValue("password", txtPassword.Text);
            sqlComm.Parameters.AddWithValue("dept", ddlDept.Text);
            sqlComm.Parameters.AddWithValue("status", ddlStatus.Text);
            // sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text));

            sqlCon.Open();
            sqlComm.ExecuteNonQuery();
            sqlCon.Close();

            //sqlComm1.CommandText = "UpdateUser1";
            //sqlComm1.CommandType = CommandType.StoredProcedure;
            ////sqlComm1.Parameters.AddWithValue("userno", txtUserNo.Text);
            //sqlComm1.Parameters.AddWithValue("username", txtLName.Text);
            //sqlComm1.Parameters.AddWithValue("password", txtPassword.Text);
            //sqlComm1.Parameters.AddWithValue("dept", ddlDept.Text);
            //sqlComm1.Parameters.AddWithValue("status", ddlStatus.Text);
            //////sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

            //sqlCon1.Open();
            //sqlComm1.ExecuteNonQuery();
            //sqlCon.Close();
            lblSave.Visible = true;
            lblSave.Text = "Record Updated";
            ClearTexbox(Page.Controls);
            GridView1.DataBind();
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        btnDelete.Attributes.Add("onclick", "if(confirm('Are you sure you want to delete?')){}else{return false}");
        SqlConnection conn = new SqlConnection(strconn);
       // SqlConnection conn1 = new SqlConnection(strconn1);
        SqlConnection sqlCon = new SqlConnection(strconn);
       // SqlConnection sqlCon1 = new SqlConnection(strconn1);
        
        SqlCommand sqlComm = new SqlCommand();
       // SqlCommand sqlComm1 = new SqlCommand();

        sqlComm.Connection = sqlCon;
       // sqlComm.Connection = sqlCon1;

        sqlComm.CommandText = "Deleteuser";
        sqlComm.CommandType = CommandType.StoredProcedure;
        sqlComm.Parameters.AddWithValue("userno", txtUserNo.Text);
        //sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

        sqlCon.Open();
        sqlComm.ExecuteNonQuery();

        sqlCon.Close();

        //sqlComm1.CommandText = "Deleteuser1";
        //sqlComm1.CommandType = CommandType.StoredProcedure;
        //sqlComm1.Parameters.AddWithValue("userno", txtUserNo.Text);
        ////sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

        //sqlCon1.Open();
        //sqlComm1.ExecuteNonQuery();

        //conn1.Close();
        lblSave.Visible = true;
        lblSave.Text = "Record Deleted";
        ClearTexbox(Page.Controls);
        GridView1.DataBind();
    }

    protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

