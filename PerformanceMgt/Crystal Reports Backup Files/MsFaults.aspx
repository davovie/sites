<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" EnableEventValidation = "false" CodeFile="MsFaults.aspx.cs" Inherits="MsFaults" Title="Faults Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .style4
        {
            width: 797px;
        }
                
        .style1
        {
            width: 496px;
            height: 100px;
        }
        .style3
        {
            width: 82px;
        }
        .style7
        {
            width: 82px;
            font-weight: bold;
            font-size: large;
        }
        .style8
        {
            width: 101%;
        }
        .style9
        {
            width: 453px;
        }
         #one
        {
        	border: 2px solid #99CC00;
        	height :120px;
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
        .style10
        {
            width: 605px;
        }
        </style>
    <script src="Styles/bootstrap.js"></script>
    <link href="Styles/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="panel panel-success">
        <div class="panel-heading">
    <h3 class="panel-title">Maintain Fault</h3>
    </div>
        
    <div class="panel-body">
    <div class="form-group">
        <label>Fault Code</label>
           <asp:TextBox ID="txtFaultCode" class="form-control" placeholder="Enter Code" runat="server"></asp:TextBox>
  
        <label>Description</label>
            <asp:TextBox ID="txtDes" class="form-control" placeholder="Enter Description" runat="server"></asp:TextBox>
        </div>
        
        <div class="panel-footer active">
            
            <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save" onclick="btnSave_Click" />
                <asp:Button ID="btnUpdate" class="btn btn-info" runat="server" Text="Update" onclick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Delete" onclick="btnDelete_Click" />
                <asp:Button ID="btnClear" class="btn btn-warning" runat="server" Text="Clear" onclick="btnClear_Click" />
   </div>
        <hr />
     
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="1" DataSourceID="SqlDataSource2" 
                ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="12" 
               OnSelectedIndexChanged="OnSelectedIndexChanged" 
                OnRowDataBound="OnRowDataBound" Width="774px" 
        DataKeyNames="faultcode">
                <RowStyle BackColor="#E3EAEB" />
                <Columns>
                    <asp:BoundField DataField="faultcode" HeaderText="Fault Code" ReadOnly="True" 
                        SortExpression="faultcode" >
                        <HeaderStyle HorizontalAlign="Center" Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="des" HeaderText="Fault Description" 
                        SortExpression="Fault Description" >
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
    

            <asp:Label ID="lblSave" runat="server" ForeColor="Red"></asp:Label>
      
    </div>
        </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
    SelectCommand="SELECT [faultcode], [des] FROM [fault]">
</asp:SqlDataSource>
</asp:Content>




