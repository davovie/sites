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

public partial class DeptRpt : System.Web.UI.Page
{
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    ReportDocument rprt = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        rprt.Load(Server.MapPath("~/crptDept.rpt"));

        using (SqlConnection con = new SqlConnection(strconn))
        {
           // SqlConnection con = new SqlConnection(@"performgtConnectionString");
            SqlCommand cmd = new SqlCommand("SELECT  [compname0]  ,[compadd3] ,[deptcode],[dept],[compadd0] FROM [performgt].[dbo].[deptview]", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds,"deptview");
            rprt.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rprt;

        }
    }
}