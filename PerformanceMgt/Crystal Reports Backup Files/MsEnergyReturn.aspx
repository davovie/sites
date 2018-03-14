<%@ Page Language="C#" MasterPageFile="~/LongerMaster.master" AutoEventWireup="true" CodeFile="MsEnergyReturn.aspx.cs" EnableEventValidation="false" Inherits="MsEnergyReturn2" Title="Energy Return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="EnergyReturn.css" rel="stylesheet" type="text/css" />
    <style>
        .left{
border: 1px solid white;
height: 195px;
width: 33%;
float: left;
        }
        .mid{
border: 1px solid white;
height: 195px;
width: 33%;
float: left;
        }
        .right{
border: 1px solid white;
height: 195px;
width: 33%;
float: left;

        }
        #contain{
      margin-bottom: 5px;
        }
        .panel-success {
            height: 245px;
          
          
        }
        .panel-success .panel-success{
            height: 195px;
            margin-left: 3px;
            margin-top: 3px;
            }
        .panel-footer
        {
        	
        }
    </style>
    <script src="Styles/bootstrap.js"></script>
    <link href="Styles/bootstrap.css" rel="stylesheet" />
     <script src="Styles/jquery-3.2.1.js"></script>
    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <script src="Styles/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id$=txtTransDate]").datepicker({

                showOn: 'both',
                buttonText: 'Date',
                dateFormat: 'dd/mm/yy'
            });
        });
</script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Energy Import and Export</h3>
                    </div>
    <div class="left">
     <div class="panel panel-success">
                    <div class="panel-body">
                        <div class="form-group">
                            <label>Trans No</label>
                             <div class="form-inline">
                            <asp:textbox id="txtTransID" class="form-control" placeholder="Enter Description" Width="58%" runat="server"></asp:textbox>
                            <asp:textbox id="txtSnNo" class="form-control" width="60px" runat="server" 
                                     ReadOnly="True"></asp:textbox>
                            <asp:button id="btnSeach" runat="server" class="btn btn-success" text="Search" onclick="btnSeach_Click" />
                                 </div>
                            <label>Trans Date</label>
                            <div class="form-inline">
                            <asp:textbox id="txtTransDate" class="form-control" placeholder="Enter Description" runat="server"></asp:textbox>
                        </div>
                            <label>Meter No</label>
                            <asp:dropdownlist id="ddlMeterNo" class="form-control" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="ddlMeterNo_SelectedIndexChanged1">
                     </asp:dropdownlist>
                           
                            </div>


                        </div>
                    </div>
                </div>
            
   
    <div class="mid">
        <div class="panel panel-success">
                   
                    <div class="panel-body">
                        <div class="form-group">
                            
                            <label>Previous Import</label>
                            <asp:textbox id="txtPreviousI" class="form-control" Width="100%" runat="server">0</asp:textbox>
                       
                            <label>Present Import</label>
                            <asp:textbox id="txtPresentI" class="form-control" Width="100%"  runat="server">0</asp:textbox>
                        
                            <label>Diff</label>
                            <asp:textbox id="txtDiffI" class="form-control" Width="100%" runat="server">0</asp:textbox>
                        
                            
                    </div>

                </div>
            </div>
        </div>
        
    <div class="right">
         <div class="panel panel-success">
                                        <div class="panel-body">
                        <div class="form-group">
                            <label>Previous Export</label>
                            <asp:textbox id="txtPreviousE" class="form-control" Width="100%" runat="server">0</asp:textbox>

                            <label>Present Export</label>
                            <asp:textbox id="txtPresentE" class="form-control" Width="100%" runat="server">0</asp:textbox>
                        
                        <label>Diff</label>
                        <asp:textbox id="txtDiffE" class="form-control" Width="100%" runat="server">0</asp:textbox>
                            </div>    
                        </div>
                        </div>
                        </div>
                        </div>
                                       <div class="panel-footer">
                        <asp:button id="btnAdd" runat="server" class="btn btn-success" text="Save" onclick="btnAdd_Click" />
                    <asp:button id="btnUpdate1" class="btn btn-info" runat="server" onclick="btnUpdate1_Click" text="Update" width="70px" />
                    <asp:button id="btnDelete1" class="btn btn-danger" runat="server" onclick="btnDelete1_Click" text="Delete" width="70px" />
                    <asp:button id="btnNew" class="btn btn-success warning" runat="server"  text="New" onclick="btnNew_Click" />
                    <asp:button id="btnClear1" class="btn btn-success warning" runat="server"  text="Clear" onclick="btnClear1_Click" />
      <asp:Label ID="lblSave" runat="server" ForeColor="Red"></asp:Label>
       </div>
       <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
                    ForeColor="#333333" PageSize="5"  OnSelectedIndexChanged="OnSelectedIndexChanged" 
                OnRowDataBound="OnRowDataBound" Width="1130px" 
                    style="font-size: small" GridLines="None">
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:BoundField DataField="snno" HeaderText="snno" InsertVisible="False" 
                            ReadOnly="True" SortExpression="snno" />
                        <asp:BoundField DataField="transno" HeaderText="transno" 
                            SortExpression="transno" />
                        <asp:BoundField DataField="transdate" HeaderText="transdate" 
                            SortExpression="transdate" />
                        <asp:BoundField DataField="meterno" HeaderText="meterno" 
                            SortExpression="meterno" />
                        <asp:BoundField DataField="importpv" HeaderText="importpv" 
                            SortExpression="importpv" />
                        <asp:BoundField DataField="importps" HeaderText="importps" 
                            SortExpression="importps" />
                        <asp:BoundField DataField="diff" HeaderText="diff" SortExpression="diff" />
                        <asp:BoundField DataField="exportpv" HeaderText="exportpv" 
                            SortExpression="exportpv" />
                        <asp:BoundField DataField="exportps" HeaderText="exportps" 
                            SortExpression="exportps" />
                        <asp:BoundField DataField="diff1" HeaderText="diff1" SortExpression="diff1" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
         
       
  

     <div id="contain">
          </div>
    <hr />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    
                    
                    
        SelectCommand="SELECT [snno], [transno], [transdate], [meterno], [importpv], [importps], [diff], [exportpv], [exportps], [diff1] FROM [energydetail] WHERE ([transno] = @transno) ORDER BY [snno]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTransID" Name="transno" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                            </td>
                        </tr>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
         SelectCommand="SELECT [importps] FROM [energydetail]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    
         
         SelectCommand="SELECT [snno], [transno], [transdate], [meterno], [importpv], [importps], [diff], [exportpv], [exportps], [diff1] FROM [energydetail] WHERE ([transno] = @transno)">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtTransID" Name="transno" PropertyName="Text" 
                 Type="String" />
         </SelectParameters>
                </asp:SqlDataSource>
</asp:Content>

