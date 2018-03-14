<%@ Page Language="C#" MasterPageFile="~/Admin/ALongMaster.master" AutoEventWireup="true" EnableEventValidation = "false" CodeFile="MsDept.aspx.cs" Inherits="MsDept" Title="Dept Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <script src="../Styles/bootstrap.js"></script>
    <link href="../Styles/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="panel panel-success">
        <div class="panel-heading">
    <h3 class="panel-title">Maintain Department</h3>
    </div>
        
    <div class="panel-body">
    <div class="form-group">
        <label>Dept Code</label>
           
         <asp:DropDownList ID="ddlDept" class="form-control" runat="server"  
                     DataSourceID="SqlDataSource1" DataTextField="DEPTcode" 
                    DataValueField="DEPTcode" 
                    onselectedindexchanged="ddlDept_SelectedIndexChanged" >
                </asp:DropDownList>
        </div>
        <div class="form-group">
        <label>Departments</label>
            <asp:TextBox ID="txtDept" class="form-control" placeholder="Enter Description" runat="server"></asp:TextBox>
        </div>
        
        <div class="panel-footer active">
             <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Save"  onclick="btnSave_Click" />
            <asp:Button ID="btnUpdate" class="btn btn-default" runat="server"  onclick="btnUpdate_Click" Text="Update" Width="70px" />
                <asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Delete" ForeColor="Black"  onclick="btnDelete_Click" />
                <asp:Button ID="btnClear" class="btn btn-default" runat="server" Text="Clear" ForeColor="Black" onclick="btnClear_Click" />
   </div>
         <asp:Label ID="lblSave" runat="server" ForeColor="Red"></asp:Label>
 
        <hr />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource1" 
                ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="7" 
               OnSelectedIndexChanged="OnSelectedIndexChanged" 
                OnRowDataBound="OnRowDataBound" Width="770px">
                <RowStyle BackColor="#E3EAEB" />
                <Columns>
                    <asp:BoundField DataField="DEPTcode" HeaderText="Dept Code" ReadOnly="True" 
                        SortExpression="DEPTcode" InsertVisible="False" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DEPT" HeaderText="Department" SortExpression="DEPT" >
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
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
                SelectCommand="SELECT [DEPTcode], [DEPT] FROM [dept]">
            </asp:SqlDataSource>
      
          
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
     

     
</asp:Content>










