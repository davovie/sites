﻿using System;
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

public partial class FaultRpt : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    String strconn = ConfigurationManager.ConnectionStrings["performgtConnectionString"].ConnectionString;
    //String strconn = "server=.\\SqlExpress;database=keivid;uid=sa;pwd=fanny";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //ReportDocument rptDoc = new ReportDocument();
            //DataSet1 ds = new DataSet1();
            //SqlConnection sqlCon = new SqlConnection(strconn);
            //DataTable dt = new DataTable();
            //dt.TableName = "fault";
            ////String sqlCon = new SqlConnection(strconn);
            //SqlDataAdapter da = new SqlDataAdapter("select  faultcode, des  from fault", sqlCon);
            //da.Fill(dt);
            ////ds.Tables(0).Merge(dt);
            //rptDoc.Load(Server.MapPath("crpFault.rpt"));
            //rptDoc.SetDataSource(ds);
            //CrystalReportViewer1.ReportSource = rptDoc;
            

        }
    }

   
}
