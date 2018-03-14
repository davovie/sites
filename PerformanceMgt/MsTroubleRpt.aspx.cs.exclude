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
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using Microsoft.Reporting.WebForms;

public partial class MsTroubleRpt : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ReportDocument rptDoc = new ReportDocument();
            DataSet1 ds = new DataSet1();
            SqlConnection sqlCon = new SqlConnection(strconn);
            DataTable dt = new DataTable();
            dt.TableName = "troubleview";
            //String sqlCon = new SqlConnection(strconn);
            SqlDataAdapter da = new SqlDataAdapter("select  * from troubleview where transid= '" + txtTransId .Text + "'", sqlCon);
            da.Fill(dt);
            //ds.Tables(0).Merge(dt);
            rptDoc.Load(Server.MapPath("crpTrouble.rpt"));
            rptDoc.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rptDoc;

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ReportDocument rptDoc = new ReportDocument();
        DataSet1 ds = new DataSet1();
        SqlConnection sqlCon = new SqlConnection(strconn);
        DataTable dt = new DataTable();
        dt.TableName = "troubleview";
        //String sqlCon = new SqlConnection(strconn);
        SqlDataAdapter da = new SqlDataAdapter("select  * from troubleview where transid= '" + txtTransId.Text + "'", sqlCon);
        da.Fill(dt);
        //ds.Tables(0).Merge(dt);
        rptDoc.Load(Server.MapPath("crpTrouble.rpt"));
        rptDoc.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rptDoc;

    }
}
