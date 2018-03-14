<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" EnableEventValidation = "false"  CodeFile="MsUsers.aspx.cs" Inherits="MsUsers" Title="Register Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="Styles/bootstrap.js"></script>
    <link href="Styles/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="panel panel-success">
        <div class="panel-heading">
    <h3 class="panel-title">Maintain User</h3>
    </div>
        
    <div class="panel-body">
        <div class="form-group">
        <label>First Name</label>
            <asp:TextBox ID="txtFName" class="form-control" placeholder="Enter Description" runat="server"></asp:TextBox>
        
        <label>Last Name</label>
            <asp:TextBox ID="txtLName" class="form-control" placeholder="Enter Description" runat="server"></asp:TextBox>
       
        <label>Username</label>
            <asp:TextBox ID="txtUserName" class="form-control" placeholder="Enter Description" runat="server"></asp:TextBox>
        
        <label>Password</label>
            <asp:TextBox ID="txtPassword" class="form-control" placeholder="Enter Description" runat="server"></asp:TextBox>
        
        <label>Confirm Password</label>
            <asp:TextBox ID="txtPassword1" class="form-control" placeholder="Enter Description" runat="server"></asp:TextBox>
       
                <hr />
         <div class="form-inline">
         <label>Dept</label>
         <asp:DropDownList ID="ddlDept" class="form-control" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="dept" DataValueField="dept" 
                    AutoPostBack="True"  >
                </asp:DropDownList>
           
        <label>Status</label>
            <asp:DropDownList ID="ddlStatus" class="form-control" runat="server">
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>SuperUser</asp:ListItem>
                    <asp:ListItem>User</asp:ListItem>
                </asp:DropDownList>
       
        
        <asp:TextBox ID="txtUserNo" runat="server" Height="25px" Width="40px"></asp:TextBox>
             <asp:Label ID="lblSave" class="form-control"  runat="server" Width="52%" Text="Label"></asp:Label>
           
        </div>
    </div>
        <div class="panel-footer active">
            <asp:Button ID="btnRegister" class="btn btn-success" runat="server" Text="Register" onclick="btnRegister_Click" />
                <asp:Button ID="btnUpdate" class="btn btn-info" runat="server" Text="Update" onclick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Delete" onclick="btnDelete_Click" />
                <asp:Button ID="btnClear" class="btn btn-warning" runat="server" Text="Clear" onclick="btnClear_Click" />
     
 </div>
        <hr />
 <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource6" 
                        ForeColor="#333333" GridLines="None" PageSize="2" Width="768px" OnSelectedIndexChanged="OnSelectedIndexChanged" 
                OnRowDataBound="OnRowDataBound">
                        <RowStyle BackColor="#E3EAEB" />
                        <Columns>
                            <asp:BoundField DataField="userno" HeaderText="User No" InsertVisible="False" 
                                ReadOnly="True" SortExpression="userno" />
                            <asp:BoundField DataField="lname" HeaderText="L Name" SortExpression="lname" />
                            <asp:BoundField DataField="fname" HeaderText="F Name" SortExpression="fname" />
                            <asp:BoundField DataField="username" HeaderText="User Name" 
                                SortExpression="username" />
                            <asp:BoundField DataField="password" HeaderText="Password" 
                                SortExpression="password" DataFormatString="*" />
                            <asp:BoundField DataField="dept" HeaderText="Dept" SortExpression="dept" />
                            <asp:BoundField DataField="status" HeaderText="Status" 
                                SortExpression="status" />
                        </Columns>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#99CC00" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#99CC00" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
</div>    
         </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    SelectCommand="SELECT [dept] FROM [dept]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    SelectCommand="SELECT [dept] FROM [dept]"></asp:SqlDataSource>
   <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    SelectCommand="SELECT [status] FROM [user]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                        
                        SelectCommand="SELECT [userno], [lname], [fname], [username], [password], [dept], [status] FROM [user]">
                    </asp:SqlDataSource>

     
</asp:Content>

