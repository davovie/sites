<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="Styles/bootstrap.js" type="text/javascript"></script>
</head>
<body>
    
    <form id="form1" runat="server">
        <div class="topdiv"></div>
    
     <style>
         body
         {
             background-color: #f4f7f7;
         }
.topdiv
{
	
	height: 180px;
}
.bottomdiv
{
	
	height: 55px;
}
.panel
{
	width: 400px;
    margin: 0 auto;
}
.footer
{
	background-color: Lime;
	height: 35px;
	text-align:center;
	line-height:35px;
	margin-top: 5px;
}
.bg-primary
{
   background-color:greenyellow;
    line-height: 30px;
    height:30px;
   border-radius: 3px;
   text-align:center;
   color:black;
   
}
p.bg-primary
{
    color:black;
    background-color:lime;
  margin-bottom:2px;
  z-index: -1;
}
.panel-heading h3.panel-tittle
{
    background-color:gray;
}
.btn
 {margin-right: 2px; 
        width:75px;   
}

@media only screen and (max-width:700px)
 {
         .topdiv {
             display: none;
         }
.panel
{
	    margin-top:20px;
}

           .bg-primary
            {
                height:20px;
                margin-top: 0px;
                display:none;
                color:black;
            }
.panel-heading h3.panel-tittle
{
    background-color:gray;
}
 }
    </style>
    
     <div class="panel panel-success">
        <div class="panel-heading">
    <h3 class="panel-title">Login Details</h3>
    </div>
        
    <div class="panel-body">
    <div class="form-group">
       
        <div class="form-group">
        <label>UserName</label>
            <asp:TextBox ID="txtUserName" class="form-control" placeholder="Enter UserName" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
        <label>Password</label>
            <asp:TextBox ID="txtPassword" class="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
        </div>


       
    <asp:Button ID="btnLogin" class="btn btn-success pull-right" runat="server" Text="Login" onclick="btnLogin_Click" />

        <asp:Label ID="lblSave" class="form-control"  runat="server" Width="78%" Text="Label" ForeColor="Red"></asp:Label>
 </div>


    </div>
         </div>
        
        <div class="bottomdiv"></div>
    </form>
</body>
</html>
