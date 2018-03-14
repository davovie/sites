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


public partial class MeterRpt : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        ReportDocument rptDoc = new ReportDocument();
        SqlConnection sqlCon = new SqlConnection(strconn);
        DataTable dt = new DataTable();
        dt.TableName = "meterdetail ";
        //String sqlCon = new SqlConnection(strconn);
        SqlDataAdapter da = new SqlDataAdapter("SELECT dbo.compinfo.compname0, dbo.meterdetail.meterno, dbo.meterdetail.transformer, dbo.meterdetail.ctratio, dbo.meterdetail.mf, dbo.meterdetail.voltage, dbo.meterdetail.station FROM dbo.compinfo CROSS JOIN dbo.meterdetail", sqlCon);
        da.Fill(dt);
        DataSet ds = new DataSet();
        //ds.Tables(0).Merge(dt);
        rptDoc.Load(Server.MapPath("crpMeter.rpt"));
        rptDoc.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rptDoc;
    }
}