<%@ Page Language="C#" MasterPageFile="~/Admin/ALongMaster.master" AutoEventWireup="true" EnableEventValidation = "false" CodeFile="MsApproval.aspx.cs" Inherits="MsApproval" Title="Approval Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
   
        #one
        {
        	border: 2px solid #99CC00;
        	height :105px;
        	margin :5px;
        	padding :5px;
        }
        #two
        {
        	border: 2px solid #99CC00;
        	min-height :100px;
        	margin :5px;
        	padding :5px;
        }
        .style9
        {
            font-size: x-large;
        }
        </style>
    <script src="../Styles/bootstrap.js"></script>
    <link href="../Styles/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="panel panel-success">
        <div class="panel-heading">
    <h3 class="panel-title">Maintain Approval Authority</h3>
    </div>
        
    <div class="panel-body">
    <div class="form-group">
        <label>Approval Code</label>
           <asp:TextBox ID="txtApprvCode" class="form-control" placeholder="Enter Code" runat="server"></asp:TextBox>
         
      
        </div>
        <div class="form-group">
        <label>Description</label>
            <asp:TextBox ID="txtDesign" class="form-control" placeholder="Enter Description" runat="server"></asp:TextBox>
        </div>
        
        <div class="panel-footer active">
            
            <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save" onclick="btnSave_Click" />
                <asp:Button ID="btnUpdate" class="btn btn-info" runat="server" Text="Update" onclick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Delete" onclick="btnDelete_Click" />
                <asp:Button ID="btnClear" class="btn btn-warning" runat="server" Text="Clear" onclick="btnClear_Click" />
   </div>
        <hr />
        <asp:Label ID="lblSave" runat="server" ForeColor="Red"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource2" 
                ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="6" 
               OnSelectedIndexChanged="OnSelectedIndexChanged" 
                OnRowDataBound="OnRowDataBound" Width="772px" 
        DataKeyNames="apprvcode">
                <RowStyle BackColor="#E3EAEB" />
                <Columns>
                    <asp:BoundField DataField="apprvcode" HeaderText="Approval Code" ReadOnly="True" 
                        SortExpression="apprvcode" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="design" HeaderText="Designation" 
                        SortExpression="design" >
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
       
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
    SelectCommand="SELECT [apprvcode], [design] FROM [approval]">
</asp:SqlDataSource>
</asp:Content>




