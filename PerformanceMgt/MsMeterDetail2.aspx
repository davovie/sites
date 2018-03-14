<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" EnableEventValidation = "false" CodeFile="MsMeterDetail2.aspx.cs" Inherits="MsMeterDetail" Title="Dept Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .style4
        {
            width: 797px;
        }
                
        .style1
        {
            width: 501px;
            height: 104px;
        }
                        
        .style6
        {
            width: 4px;
        }
        .style7
        {
            width: 78px;
            font-weight: bold;
            font-size: large;
        }
        .style8
    {
        width: 100%;
    }
        .style9
    {
        width: 222px;
    }
        .style10
        {
            width: 2px;
        }
        .style11
        {
            width: 78px;
        }
        .style15
        {
            width: 312px;
        }
        .style16
        {
            width: 238px;
        }
        .style17
        {
            font-weight: bold;
            font-size: large;
        }
        #one
        {
        	float:left;
        	border: 2px solid white;
        	height :185px;
        	
        	   width: 50%;
        	     margin-top: 0px;
        	    
        }
        #two
        {
        	float:left;
        	border: 2px solid white;
        	height :185px;
        	
        	   width: 50%; 
        	    margin-top: 0px;
        	    
        }
        .panel-success {
            height: 290px;
        }
        .panel-success .panel-success{
            height: 180px;
            margin-top: 0px;
             margin-bottom: 16px;
            
        }
        .panel-footer
        {
        	 
        	   padding-top: 5px;
        }
        </style>
         <script src="Styles/bootstrap.js"></script>
    <link href="Styles/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="panel panel-success">
        <div class="panel-heading">
    <h3 class="panel-title">Maintain Meter Details</h3>
    </div>
    <div class="panel-body">
     <div id="one">
     <div class="panel panel-success">
    <div class="panel-body">
       <div class="form-group">
                 <label>Meter No</label>
                <asp:TextBox ID="txtMeterNo" class="form-control" placeholder="Enter Meter No" runat="server" Height="25px" Width="140px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtMeterNo" ErrorMessage="*" 
                    ToolTip="Meter No  cannot be empty"></asp:RequiredFieldValidator>
                     <label>Meter No</label>
                <asp:TextBox ID="txtStation" class="form-control" placeholder="Enter Meter No" runat="server" Height="25px" Width="140px"></asp:TextBox>
           <label>Meter No</label>
 <asp:TextBox ID="txtTransformer" class="form-control" placeholder="Enter Meter No" runat="server" Height="25px" Width="140px" 
                    style="font-size: medium"></asp:TextBox>
            
 </div>
 </div>
 </div>
 
</div>
<div id="two">
  <div class="panel panel-success">
    <div class="panel-body">
  <div class="form-group">
 <label>Meter No</label>
       <asp:TextBox ID="txtCtRatio" class="form-control" placeholder="Enter Meter No" runat="server" Height="25px" Width="140px"></asp:TextBox>
            <label>Meter No</label>
                <asp:TextBox ID="txtVoltage" class="form-control" placeholder="Enter Meter No" runat="server" Height="25px" Width="140px"></asp:TextBox>
             <label>Meter No</label>
                <asp:TextBox ID="txtMf" class="form-control" placeholder="Enter Meter No" runat="server" Height="25px" Width="140px"></asp:TextBox>
             
            
 </div>           
  </div> 
</div>
 </div>
 
 <div class="panel-footer active">
                <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success" onclick="btnSave_Click" />
                <asp:Button ID="btnDelete" Text="Delete" class="btn btn-danger" runat="server" onclick="btnDelete_Click" />
                <asp:Button ID="btnClear" Text="Clear" class="btn btn-warning" runat="server" onclick="btnSave1_Click" />
                </div>
 </div>
 </div>
 
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource1" 
                ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="7" 
               OnSelectedIndexChanged="OnSelectedIndexChanged" 
                OnRowDataBound="OnRowDataBound" Width="780px">
                <RowStyle BackColor="#E3EAEB" />
                <Columns>
                    <asp:BoundField DataField="meterno" HeaderText="meterno" 
                        SortExpression="meterno" >
                    </asp:BoundField>
                    <asp:BoundField DataField="station" HeaderText="station" 
                        SortExpression="station" >
                    </asp:BoundField>
                    <asp:BoundField DataField="transformer" HeaderText="transformer" 
                        SortExpression="transformer" />
                    <asp:BoundField DataField="voltage" HeaderText="voltage" 
                        SortExpression="voltage" />
                    <asp:BoundField DataField="ctratio" HeaderText="ctratio" 
                        SortExpression="ctratio" />
                    <asp:BoundField DataField="mf" HeaderText="mf" SortExpression="mf" />
                </Columns>
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#99CC00" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#99CC00" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:Label ID="lblSave" runat="server" ForeColor="Red"></asp:Label>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                
                SelectCommand="SELECT [meterno], [station], [transformer], [voltage], [ctratio], [mf] FROM [meterdetail]">
            </asp:SqlDataSource>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</asp:Content>










