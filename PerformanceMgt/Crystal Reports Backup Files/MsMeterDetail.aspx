<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" EnableEventValidation = "false" CodeFile="MsMeterDetail.aspx.cs" Inherits="MsMeterDetail" Title="Dept Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
         #one
        {
        	float:left;
        	border: 2px solid white;
        	height :197px;
        	
        	   width: 50%;
        	     margin-top: 0px;
        	    }
        #two
        {
        	float:left;
        	border: 2px solid white;
        	height :197px;
        	   width: 50%; 
        	    margin-top: 0px;
        	    }
        .panel-success {
            height: 320px;
            margin-top: 0px;
        }
        .panel-success .panel-success{
            height: 195px;
         
            }
        .panel-footer
        {
        	
        	   padding: 5px;
        	   
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
                <asp:TextBox ID="txtMeterNo" class="form-control" placeholder="Enter Meter No" runat="server" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtMeterNo" ErrorMessage="*" 
                    ToolTip="Meter No  cannot be empty"></asp:RequiredFieldValidator>
                     <label>Station</label>
                <asp:TextBox ID="txtStation" class="form-control" placeholder="Enter Station" runat="server" ></asp:TextBox>
           <label>Transformer</label>
 <asp:TextBox ID="txtTransformer" class="form-control" placeholder="Enter Transformer" runat="server" ></asp:TextBox>
            
 </div>
 </div>
 </div>
 
</div>
<div id="two">
  <div class="panel panel-success">
    <div class="panel-body">
  <div class="form-group">
 <label>C T Ratio</label>
       <asp:TextBox ID="txtCtRatio" class="form-control" placeholder="Enter txtC T Ratio" runat="server" ></asp:TextBox>
            <label>Voltage</label>
                <asp:TextBox ID="txtVoltage" class="form-control" placeholder="Enter Voltage" runat="server" ></asp:TextBox>
             <label>M F</label>
                <asp:TextBox ID="txtMf" class="form-control" placeholder="Enter M F" runat="server" ></asp:TextBox>
             
            
 </div>           
  </div> 
</div>
 </div>
 
 <div class="panel-footer active">
 <hr />
                <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success" onclick="btnSave_Click" />
                <asp:Button ID="btnDelete" Text="Delete" class="btn btn-danger" runat="server" onclick="btnDelete_Click" />
                <asp:Button ID="btnClear" Text="Clear" class="btn btn-warning" runat="server" onclick="btnSave1_Click" />
                </div>
 </div>
 </div>
       
   
  
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="1" DataSourceID="SqlDataSource1" 
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










