<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeptRpt.aspx.cs" Inherits="DeptRpt" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/bootstrap.css" rel="stylesheet" />
    <script src="Styles/bootstrap.js"></script>
    <style>
        .container{
            border: 3px solid red;
            height: 600px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <CR:CrystalReportViewer ID="CrystalReportViewer1" 
            runat="server" AutoDataBind="True" 
            EnableDatabaseLogonPrompt="False" 
            EnableParameterPrompt="False" 
            
            Height="1202px" 
            ReportSourceID="CrystalReportSource1" 
           
            ToolPanelView="None" 
            ToolPanelWidth="200px" 
            Width="1104px" />
        
        <%--<CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="crpDept.rpt">
            </Report>
        </CR:CrystalReportSource>--%>
        
    </div>
    </form>
</body>
</html>
