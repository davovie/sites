<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" EnableEventValidation = "false" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>CMMS | Dashboard</title>  
    <link href="../Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Styles/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="../Styles/jquery-ui.js" type="text/javascript"></script>
    <script src="../Styles/bootstrap.min.js" type="text/javascript"></script>
    <link href="../Styles/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/LongMaster.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
       .container .container{
           border: 2px solid red;
           margin-left: 0px;
           width: 100%;
           height: 40px;
           border-radius: 5px;
       }
   .menu  
    {
    	height: 35px;
    	margin-top: 5px;
 border-radius: 5px 5px 5px 5px;
 width: 100%;
 margin-left: 1px;
    }
   ul#menu{

height: 35px;
   }
   ul .navbar-nav li  {
          
       line-height: 35px;
       height: 35px;
   }
    #menu .navbar-nav a
    {
    	
    	line-height: 0px;
    	background-color: rgb(10,178,44);
    }
   .container 
    {
    	margin-left:auto;
    
    	width: 90%;
    	}
 .jumbotron {
     height: 100px;
     padding-top: 1px!important;
      margin-bottom: 0px; 
      background-color: lime;     
 }
        #left 
    {

    	background-color: #000000;
    	height : 40px;
    	float: left;
    	width: 80%;
    	 border-radius: 5px 0px 0px 5px;
    }
        #left h3, #left small
    {
    	
    height : 40px;
    	padding: 5px 5px 5px 10px;
    	margin-top: 0px;
    	width: 50%;
    	color: #eee;
    	
    }
    #right 
    {
    	background-color: #000000;
       	width: 20%;
    	height : 40px;
    	float: left;
    	 border-radius: 0px 5px 5px 0px;
    	padding: 4px 5px 5px 10px;
    }
    .breadcrumb
    {
       
    	margin-top: 5px;
    	background: #d3d0d0;
    	color: #fff;
    	width:100%;
    	margin-left: 10px;
    	height: 25px;
        line-height: 10px;
       
    }
    .breadcrumb li
    {
         line-height: 5px;
    	color: #fff;
    	margin-top: 0px;
    }
    
    .three 
    {
         margin-top: 15px;
    	 z-index: 9999;
       	width: 20%;
    	height : auto;
    	float: left;
    	 border-radius: 5px 0px 0px 5px;
    	padding: 1px 0px 0px 5px;
    	margin-top: 34px;
    	margin-left: 20px;
        
    }
    .three .panel-success{
       height: 168px;
        margin: 0px;
       padding: 0px 0px 0px 0px; /*top right bottom left */
      z-index: 9999;
     
    }
    .three .panel-body{
       
       padding: 0px 8px 0px 0px; /*top right bottom left */
       z-index: 9999;
    }
    .three .panel-body .list-group-item{
         z-index: 9999;
      
        width: 160px;
    }
    .four 
    {
    	
       	width: 77%;
    	height : auto;
    	float: left;
    	 border-radius: 5px;
    	padding: 1px 5px 5px 10px;
    	margin-top: 34px;
       
    }
      .four .panel-success{
 
       
           height: 168px;
      }
    .five{
        padding: 1px 0px 0px 5px;
        float: left;
        width: 20%;
        margin-top: 5px;
        height : 275px;
        margin-left: 20px;
       
    }
    .five .panel-body{
          
       padding: 5px 5px 0px 7px; /*top right bottom left */
      height : 220px;
    }
    .six{
       padding: 1px 5px 5px 10px;
        float :left;
        width: 77%;
        margin-top: 5px;
    }
   .panel-success .panel-heading{
       color:#fff;
       background-color: rgb(10,178,44);
    }
   .panel-body 
    {
    	  z-index:999999;
	 
	padding: 0px;
	margin: 0px;
    margin-bottom: 0px;
   	 }
   .six .panel-body
    {
      padding: 5px;
   	 }
    .panel-success
    {
        margin-bottom: 3px;
      
        padding: 0px 0px 5px 0px;
   }
        .panel-body a {
            z-index: 999999;
            text-decoration: none;
            width: 180px;
            padding: 8px;
            margin: 2px;
        }
  .list-group-item   .badge{
        margin-top: 0px;
                 

	 }
     .well{
        height : 105px; 
        margin-top: 5px;
        text-align: center;

         }
     .GridView1{
         width: 100%;
         margin-left: 30px;
     }
     #footer {
    width: 100%;
    border-radius: 5px;
   line-height: 15px;
    height: 35px;
    margin-top: 510px;
    margin-left: 1px;
     color:#fff;
        background-color: lime;
      
}
     #footer p{
 
    height: 30px;
   line-height: 0px;
   margin-top: 0px;
}
  

    </style>
    <script runat="server" type="text/c#">
  protected void Timer1_Tick(object sender, EventArgs e)
    {
        Label3.Text = "Panel refreshed at: " + DateTime.Now.ToLongTimeString();
    }
</script>

</head>
<body>
    <form id="form1" runat="server">
        

    <div class="container">
     <div class="panel panel-success">
     <div class="header">
        <div class="jumbotron">
           <h1 class="page-header">CMMS! <small>Omotosho Electric Energy Company Limited </small></h1>
        </div>
        </div>
     <div class="menu">
     <ul id="menu">
                <%--<li><a href="MsLogin.aspx">File</a>
                       <ul class="filesub">
                          <li><a href="Login.aspx">Login</a></li>
                            <li><a href="#">Backup</a></li>
                            <li><a href="frmMain.aspx">Logout</a></li>
                       </ul>
                      </li> --%>
                    <li class="auto-style1"><a href="Default.aspx">Home</a>
                  <%--  <ul class="mtcesub">
                          
                          <li><a href="MsUsers.aspx">Users</a></li>
                          <li><a href="MsDept.aspx">Deparment</a></li>
                          <li><a href="MsApproval.aspx">Approval</a></li>
                          <li><a href="MsFaults.aspx">Faults</a></li>
                          <li><a href="MsMeterDetail.aspx">MeterDetail</a></li>
                    </ul>--%>
                    </li>
                     <li><a href="#">Reporting</a>
                     <ul class="transsub">
                        <li><a href="MsTroubleReporting.aspx">Trouble</a></li>
                        <li><a href="MsRouter.aspx">Router</a></li>
                        <li><a href="MsEnergyReturn.aspx">Energy Return</a></li>
                        
                    </ul>
                     </li>
                     <li><a href="#">Report</a>
                            <ul class="rptsub">
                                   <li><a href="#">Listing</a>
                                        <ul class="listsub">
                                        <li><a href="DeptRpt.aspx">Dept</a></li>
                                        <li><a href="FaultRpt.aspx">Faults</a></li>
                                        
                                  </ul>
                             
                             </li>
                             <li><a href="TroubleRpt.aspx">Trouble</a></li>
                             <li><a href="#">Checked</a></li>
                             
                         </ul>
                     
                     </li>
               <ul class="nav navbar-nav pull-right">
                        <li>Welcome </li>
                   <li><asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label></li>
                        <li><a href="Login.aspx">Logout</a></li>
                        <%--<asp:Button ID="btnLogout" class="btn btn-success"  Width="80px" runat="server" Text="Logout" OnClick="btnLogout_Click"  />--%>
                       </ul> 
                  
            </ul>
     </div>
    
    <div id="head">
    <div id="left">
     <h3> Dashboard <small>CMMS Main Page</small></h3>
        </div>
         <div id="right">
     
   
    </div>
    </div>
    <div class="container">
    <div id="breadcrumb">
   
    <ol class="breadcrumb">
    <li class="active">Dashboard</li>
    </ol>
 
    </div>
    </div>
    <div class="three">
       <div class="panel panel-success">
        <div class="panel-heading">Dashboard</div>
        
    <div class="panel-body">
        <table cellpadding="0" cellspacing="0" class="nav-justified">
            <tr>
                <td><a href="#" class="list-group-item">Trouble</a></td>
                <td><asp:TextBox ID="TextBox1" runat="server" BorderColor="White" BorderStyle="None" Width="30px"></asp:TextBox><span class="badge pull-right"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span></td>
            </tr>
        </table>
      </div> 
       <div class="panel-body">
        <table cellpadding="0" cellspacing="0" class="nav-justified">
            <tr>
                <td><a href="#" class="list-group-item">Checked</a></td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" BorderColor="White" BorderStyle="None" Width="30px"></asp:TextBox><span class="badge pull-right"><asp:Label ID="lblChecked" runat="server" Text="Label"></asp:Label></span></td>
            </tr>
        </table>
      </div>  
      <div class="panel-body">
        <table cellpadding="0" cellspacing="0" class="nav-justified">
            <tr>
                <td><a href="#" class="list-group-item">UnChecked</a></td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" BorderColor="White" BorderStyle="None" Width="30px"></asp:TextBox><span class="badge pull-right"><asp:Label ID="lblUnchecked" runat="server" Text="Label"></asp:Label></span></td>
            </tr>
        </table>
      </div>      
 </div>
    
    </div>
    <div class="four">
       <div class="panel panel-success">
        <div class="panel-heading">
    Overview
    </div>
       
    <div class="panel-body">
      <div class="col-md-3">
       <div class="well btn btn-block" id="btnSave" onclick="btnSave_Click" >
           <h2><a>@<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></a></h2>
           <h4><a>Users</a></h4>
         
       </div>
   </div>
        <div class="col-md-3">
      <div class="well btn btn-block">
           <h2>@<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h2>
           <h4>Trouble</h4>
       </div>
   </div>
        <div class="col-md-3">
       <div class="well btn btn-block">
           <h2>@<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></h2>
           <h4>Checked</h4>
       </div>
   </div>
           <div class="col-md-3">
       <div class="well btn btn-block">
           <h2>@<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></h2>
           <h4>Unchecked</h4>
       </div>
   </div>
       </div>   
           </div> 
        </div>
        <div class="five">
               <div class="panel panel-success">
        <div class="panel-heading"> General Info </div>
             <div class="panel-body">
      This the the main dashbord of this application 
                 This the the main dashbord of this application 
                 This the the main dashbord of this application This the the main dashbord of this application This the the main dashbord of this application This the the main dashbord of this application
             </div>      
        </div>

        </div>
        <div class="six">
 <div class="panel panel-success">
    <div class="panel-body">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1"  DataKeyNames="transid" 
            EnableModelValidation="True" ForeColor="#333333" AllowPaging="True" 
            Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
            OnRowDataBound="OnRowDataBound">
                <AlternatingRowStyle BackColor="White"  />
                <Columns>
                    <asp:BoundField DataField="transid" HeaderText="transid" ReadOnly="True" 
                        SortExpression="transid" />
                    <asp:BoundField DataField="transdate" HeaderText="transdate" 
                        SortExpression="transdate" />
                    <asp:BoundField DataField="des" HeaderText="des" SortExpression="des" />
                    <asp:BoundField DataField="checked" HeaderText="checked" 
                        SortExpression="checked" />
                    <asp:BoundField DataField="fixed" HeaderText="fixed" SortExpression="fixed" >
                    </asp:BoundField>
                    <asp:BoundField DataField="whynotfix" HeaderText="whynotfix" 
                        SortExpression="whynotfix" >
                    </asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
    
           </div>
        </div>
            </div>
            

           <div id= "footer"> <p>All Right Reserved Precise IT Affairs</p></div>
        </div>
        </div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
            SelectCommand="SELECT [transid], [transdate], [des], [checked], [fixed], [whynotfix],[snno] FROM [trouble] ORDER BY [transid]"></asp:SqlDataSource>
        
        <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server"> </asp:UpdatePanel>
            <asp:Timer ID="Timer1" runat="server" Interval="30000"></asp:Timer>
            <asp:Label runat="server" Text="Page not refreshed yet." id="Label3">
</asp:Label>

        
  
        
    </form>
</body>
</html>
