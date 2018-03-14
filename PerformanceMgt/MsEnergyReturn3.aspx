<%@ Page Language="C#" MasterPageFile="~/LongerMaster.master" AutoEventWireup="true"  CodeFile="MsEnergyReturn3.aspx.cs"  EnableEventValidation = "false" Inherits="MsEnergyReturn" Title="Energy Return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .style4
        {
            width: 1048px;
        }
                
        .style1
        {
            width: 103%;
        }
        .style5
        {
        width: 13px;
    }
        
        .style6
        {
            width: 4px;
        }
        .style7
        {
            font-weight: bold;
            font-size: large;
        }
        .style8
    {
        font-size: large;
        font-weight: bold;
    }
        .style11
        {
            width: 96%;
        }
        .style3
        {
            width: 98px;
        }
        .style13
        {
            width: 270px;
        }
        .style14
        {
            width: 1px;
        }
        .style20
        {
            width: 864px;
        }
        .style23
        {
            background-color: #99CC00;
        }
        .style24
        {
            background-color: #66FF33;
        }
        .style26
        {
            width: 631px;
        }
        .style27
        {
            font-size: x-large;
        }
        .style28
        {
            font-weight: bold;
            font-size: large;
            width: 73px;
        }
#one
{
	border: 2px solid #99CC00;
	width:360px;
	float:left;
	height:285px
}
#two
{
	border: 2px solid #99CC00;
	float :left;
	margin-left:1px;
	width:320px;
	height:285px
}
#three
{
	border: 2px solid #99CC00;
	width:345px;
	margin-left:690px;
	height:50px
} 
#four
{
	border: 2px solid #99CC00;
	width:345px;
	margin-left:690px;
	height:230px;
	margin-top:3px;
}         
        .style31
        {
            width: 100%;
        }
        .style32
        {
            font-weight: bold;
            font-size: large;
            width: 92px;
            height: 22px;
        }
        .style33
        {
            height: 22px;
            width: 20px;
        }
        .style34
        {
            height: 22px;
            width: 241px;
        }
        .style35
        {
            width: 241px;
        }
        .style36
        {
            width: 20px;
        }
    </style>
    
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <table class="style4">
        <tr>
            <td style="background-color: #99CC00; text-align: center; font-weight: 700; " 
                width="1050" class="style27">
                Energy Return Form</td>
        </tr>
     </table>
    
      <div id="one">
          <table class="style31">
              <tr>
                  <td>
                      &nbsp;</td>
                                <td class="style7">
                Trans No</td>
                                <td>
                <asp:TextBox ID="txtTransID" runat="server" Height="25px" Width="120px">00000002</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td class="style7">
                Station</td>
                                <td>
                <span class="style8">
                <asp:TextBox ID="txtStation" runat="server" Height="25px" Width="120px" 
                    TabIndex="4"></asp:TextBox>
                </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                <span class="style8">Voltage</span></td>
                                <td>
                <asp:TextBox ID="txtVoltage" runat="server" Height="25px" Width="120px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <span class="style8">
                                    Meter No</span></td>
                                <td>
                                    <span class="style8">
                <asp:TextBox ID="txtMeterNo" runat="server" Height="25px" Width="145px" 
                    TabIndex="1"></asp:TextBox>
                </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <span class="style8">
                                    Transformer</span></td>
                                <td>
                                    <span class="style8">
                <asp:TextBox ID="txtTransformer" runat="server" Height="25px" Width="88px" 
                    TabIndex="2"></asp:TextBox>
                </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <span class="style8">
                                    C. T Ratio</span></td>
                                <td>
                                    <span class="style8">
                <asp:TextBox ID="txtCtRatio" runat="server" Height="25px" Width="100px"></asp:TextBox>
                </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <span class="style8">M. F</span></td>
                                <td>
                                    <span class="style8">
                <asp:TextBox ID="txtMf" runat="server" Height="25px" Width="145px"></asp:TextBox>
                                    </span>
                                </td>
                            </tr>
                        </table>
                    </div>
     <div id="two">
     <table class="style54">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style7">
                                Previous Imp</td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtPreviousI" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style7">
                                Present Imp</td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtPresentI" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style62">
                                </td>
                            <td class="style7">
                                Diff</td>
                            <td class="style62">
                                <span class="style8">
                                <asp:TextBox ID="txtDiffI" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td class="style7">
                                Previous Exp</td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtPreviousE" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td class="style60">
                                <b class="style7">Present Exp</b></td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtPresentE" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td class="style7">
                                Diff</td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtDiffE" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                                            </td>
                        </tr>
                        </table>
     
     </div>
     <div id="three">
         <table cellpadding="0" cellspacing="0">
             <tr>
                 <td class="style33">
                     </td>
                 <td class="style32">
                     Trans Date</td>
                                <td class="style34">
                                    <asp:TextBox ID="txtTransDate" runat="server" Width="103px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                        Height="20px" ImageUrl="~/images/calender.jpeg" onclick="ImageButton1_Click" 
                                        ToolTip="Click to see calender" Width="25px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style36">
                                    </td>
                                <td ="style30">
                                    </td>
                                <td class="style35">
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                                        BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                                        DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                                        ForeColor="#003399" Height="200px" Width="220px" 
                                        onselectionchanged="Calendar1_SelectionChanged1" style="z-index: 1">
                                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                        <WeekendDayStyle BackColor="#CCCCFF" />
                                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                        <OtherMonthDayStyle ForeColor="#999999" />
                                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                                            Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                    </asp:Calendar>
                                </td>
                            </tr>
                            </table>
                    </div>
                    <div id="four">
                    
                        <table class="style31">
                            <tr>
                                <td>
                            <asp:TextBox ID="txtDate" runat="server" Width="80px" style="z-index: -1" ></asp:TextBox>
                            
                            <asp:TextBox ID="MyDateTextBox" runat="server" style="z-index: -1"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    
                    </div>
   <table cellpadding="2" cellspacing="1" class="style1">
        <tr>
            <td class="style23" colspan="4" height="30" width="1080">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style7" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource12" 
                    ForeColor="#333333" GridLines="None" PageSize="5"  OnSelectedIndexChanged="OnSelectedIndexChanged" 
                OnRowDataBound="OnRowDataBound" Width="957px" 
                    style="font-size: small">
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:BoundField DataField="snno" HeaderText="snno" InsertVisible="False" 
                            ReadOnly="True" SortExpression="snno" />
                        <asp:BoundField DataField="transno" HeaderText="transno" 
                            SortExpression="transno" />
                        <asp:BoundField DataField="transdate" HeaderText="transdate" 
                            SortExpression="transdate" />
                        <asp:BoundField DataField="station" HeaderText="station" 
                            SortExpression="station" />
                        <asp:BoundField DataField="meterno" HeaderText="meterno" 
                            SortExpression="meterno" />
                        <asp:BoundField DataField="transformer" HeaderText="transformer" 
                            SortExpression="transformer" />
                        <asp:BoundField DataField="ctratio" HeaderText="ctratio" 
                            SortExpression="ctratio" />
                        <asp:BoundField DataField="mf" HeaderText="mf" 
                            SortExpression="mf" />
                        <asp:BoundField DataField="voltage" HeaderText="voltage" 
                            SortExpression="voltage" />
                        <asp:BoundField DataField="importps" HeaderText="importps" 
                            SortExpression="importps" />
                        <asp:BoundField DataField="importpv" HeaderText="importpv" 
                            SortExpression="importpv" />
                        <asp:BoundField DataField="exportps" HeaderText="exportps" 
                            SortExpression="exportps" />
                        <asp:BoundField DataField="exportpv" HeaderText="exportpv" 
                            SortExpression="exportpv" />
                        <asp:BoundField DataField="diff" HeaderText="diff" SortExpression="diff" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style28">
                &nbsp;</td>
            <td class="style20">
               <div>
                   <table cellpadding="0" cellspacing="0" class="style11">
                       <tr>
                           <td>
                               &nbsp;</td>
                           <td>
                               &nbsp;</td>
                           <td class="style26">
                               <span>
                <asp:Button ID="btnSave" runat="server" Text="Save" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" 
                    onclick="btnSave_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" 
                    onclick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" 
                    onclick="btnDelete_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" 
                    onclick="btnClear_Click" />
                               </span></td>
                           <td class="style7">
                               Totals</td>
                           <td class="style7">
                               &nbsp;</td>
                           <td>
                               &nbsp;</td>
                           <td>
                               <asp:TextBox ID="txtTotImport" runat="server" Width="80px"></asp:TextBox>
                           </td>
                           <td>
                               <asp:TextBox ID="txtTotExport" runat="server" Width="80px" 
                                   style="margin-left: 0px"></asp:TextBox>
                           </td>
                           <td>
                               <asp:TextBox ID="txtTotDiff" runat="server" Width="80px"></asp:TextBox>
                           </td>
                       </tr>
                   </table>
                </div>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23" colspan="4">
                <span class="style23">&nbsp; </span>
            </td>
        </tr>
        </table>
        
        <table cellspacing="0" class="style11">
            <tr>
                <td>    
     
   <table cellpadding="1" cellspacing="1" class="style1">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style3">
                <span class="style24"></span></td>
            <td>
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        </table>
        
                    </td>
            </tr>
     </table>
        
        
     
        <table cellpadding="0" cellspacing="0" class="style11">
            <tr>
                <td class="style13" valign="top">
                    <span class="style8">&nbsp;&nbsp;&nbsp;&nbsp; 
                </span>
        <br />
        
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
     </table>
     <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    SelectCommand="SELECT * FROM [energydetail] WHERE ([transno] = @transno)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTransID" Name="transno" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
         SelectCommand="SELECT [importps] FROM [energydetail]"></asp:SqlDataSource>
        </asp:Content>

