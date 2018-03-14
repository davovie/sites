<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Style/bootstrap.js"></script>
    <link href="../Style/bootstrap.css" rel="stylesheet" />
    <link href="../Style/font-awesome.css" rel="stylesheet" />
    <link href="../Style/font-awesome.min.css" rel="stylesheet" />
    <link href="../Style/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron">
                <h1 class="text-primary text-center">User Details</h1>
            </div>
            <div id="section1">
            <div class="row">
            <div class="col-md-4">
                <div class="form-inline">
                    <asp:Label runat="server" Text="Label">First Name:  </asp:Label>
                    <asp:TextBox ID="txtFirstName" runat="server" class="form-control"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-default" OnClick="btnSearch_Click"/>
                </div>
            </div>
            <div class="col-md-4 form-inline">
            <asp:Label ID="Label2" runat="server" Text="Label">Last Name: </asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" Class="form-control"></asp:TextBox>
                <asp:Button ID="btnLastSearch" runat="server" Text="Search" class="btn btn-default form-control" OnClick="btnLastSearch_Click"/>
            </div>
            <div class="col-md-4 form-inline">
                <asp:Label ID="Label1" runat="server" Text="Label">Department: </asp:Label>
                <asp:DropDownList ID="dDList" runat="server" DataSourceID="SqlDataSource1" DataTextField="dept" DataValueField="dept" Class="form-control"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CMMSConnectionString %>" SelectCommand="SELECT [dept] FROM [deprtmt]"></asp:SqlDataSource>
            </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="Label3" runat="server" Text="Label">Address: </asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Class="form-control" ></asp:TextBox>
                </div>
                <div class="col-md-4">                 
                            <asp:Label ID="Label4" runat="server" Text="Label">Mobile Number: </asp:Label>
                            <div class="form-inline">
                                <i class="fa fa-phone"></i>
                                <asp:TextBox ID="txtMobilePhone" runat="server" Class="form-control"></asp:TextBox>
                            </div>                                         
                </div>
                <div class="col-md-4">
                     <asp:Label ID="Label5" runat="server" Text="Label">Username: </asp:Label>
                     <asp:TextBox ID="txtUname" runat="server" Class="form-control"></asp:TextBox> 
                </div>
            </div>
            </div>
            <div id="buttons">
                <asp:Button ID="Button1" runat="server" Text="Save" class="btn btn-success" OnClick="Button1_Click"/>
                <asp:Button ID="Button2" runat="server" Text="Update" class="btn btn-warning" OnClick="Button2_Click"/>
                <asp:Button ID="Button3" runat="server" Text="Delete" class="btn btn-danger" OnClick="Button3_Click"/>
                <asp:Button ID="Button4" runat="server" Text="Clear" class="btn btn-primary" OnClick="Button4_Click"/>
            </div>
            <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
