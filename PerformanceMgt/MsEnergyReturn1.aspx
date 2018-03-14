<%@ Page Language="C#" MasterPageFile="~/LongerMaster.master" AutoEventWireup="true"  CodeFile="MsEnergyReturn1.aspx.cs"  EnableEventValidation = "false" Inherits="MsEnergyReturn1" Title="Energy Return" %>

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
            width: 103px;
        }
        .style29
        {
            width: 728px;
        }
        .style31
        {
            width: 1px;
            height: 18px;
        }
        .style32
        {
            font-weight: bold;
            font-size: large;
            width: 103px;
            height: 18px;
        }
        .style34
        {
            width: 728px;
            height: 18px;
        }
        .style36
        {
            width: 4px;
            height: 18px;
        }
        .style38
        {
            width: 192px;
            height: 18px;
        }
        .style39
        {
            width: 192px;
        }
        .style41
        {
            height: 18px;
            width: 123px;
        }
        .style42
        {
            width: 123px;
        }
        .style44
        {
            width: 1px;
            height: 20px;
        }
        .style45
        {
            font-weight: bold;
            font-size: large;
            width: 103px;
            height: 20px;
        }
        .style46
        {
            width: 192px;
            height: 20px;
        }
        .style50
        {
            width: 4px;
            height: 20px;
        }
        .style51
        {
        }
        .style53
        {
            width: 2px;
            height: 18px;
        }
        .style54
        {
            width: 100%;
        }
        .style55
        {
            font-size: large;
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
     
   <table cellpadding="2" cellspacing="1" >
        <tr>
            <td class="style14">
               </td>
            <td class="style28">
                Trans No</td>
            <td class="style39" width="25">
                <asp:TextBox ID="txtTransID" runat="server" Height="25px" Width="91px">00000002</asp:TextBox>
               
                <span class="style8"></span>
                <asp:TextBox ID="txtSnNo" runat="server" Enabled="False" Height="25px" 
                    Width="40px"></asp:TextBox>
                            </td>
            <td class="style51">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" 
                    Height="30px" style="font-weight: 700" Width="70px" />
                            </td>
            <td class="style29">
                <asp:Button ID="btnNew" runat="server" Height="30px" onclick="btnNew_Click" 
                    Text="New" Width="70px" />
                </td>
            <td class="style42">
                <span class="style8">
                <asp:TextBox ID="txtMeterNo" runat="server" Height="25px" Width="145px" 
                    TabIndex="1">IMP98445320</asp:TextBox>
                </span>
                </td>
            <td class="style6">
                </td>
        </tr>
        <tr>
            <td class="style14">
                </td>
            <td class="style28">
                <span class="style8">Trans Date</span></td>
            <td class="style39">
                <asp:DropDownList ID="ddlDay" runat="server" Height="30px" AutoPostBack="True" 
                    onselectedindexchanged="ddlDay_SelectedIndexChanged">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlMonth" runat="server" Height="30px" 
                    AutoPostBack="True">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlYear" runat="server" Height="30px" AutoPostBack="True">
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                    <asp:ListItem>2021</asp:ListItem>
                    <asp:ListItem>2022</asp:ListItem>
                    <asp:ListItem>2023</asp:ListItem>
                    <asp:ListItem>2024</asp:ListItem>
                    <asp:ListItem>2025</asp:ListItem>
                    <asp:ListItem>2026</asp:ListItem>
                    <asp:ListItem>2027</asp:ListItem>
                    <asp:ListItem>2028</asp:ListItem>
                    <asp:ListItem>2029</asp:ListItem>
                    <asp:ListItem>2030</asp:ListItem>
                </asp:DropDownList>
                            </td>
            <td class="style51" colspan="2" rowspan="4" valign="top">
                <asp:Panel ID="Panel1" runat="server">
                    <table class="style54">
                        <tr>
                            <td class="style7">
                                Mf</td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtMf" runat="server" Height="25px" Width="100px"></asp:TextBox>
                                </span>
                            </td>
                            <td class="style55">
                                </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                Previous Imp</td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtPreviousI" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
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
                            <td class="style55">
                                <b>Present Imp</b></td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtPresentI" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                            </td>
                            <td class="style55">
                                <b>Present Exp</b></td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtPresentE" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style55">
                                <b>Diff</b></td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtDiffI" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                            </td>
                            <td>
                                <b>Diff</b></td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtDiff1" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                            </td>
            <td class="style42">
                <asp:TextBox ID="txtTransDate" runat="server" Width="131px"></asp:TextBox>
                            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style44">
                </td>
            <td class="style45">
                Station</td>
            <td class="style46">
                <span class="style8">
                <asp:TextBox ID="txtStation" runat="server" Height="25px" Width="145px" 
                    TabIndex="4"></asp:TextBox>
                
                </span>
                            </td>
            <td rowspan="4" class="style42">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
                    ForeColor="#333333" GridLines="None" PageSize="2" Width="260px">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="transdate" HeaderText="transdate" 
                            SortExpression="transdate" >
                        </asp:BoundField>
                        <asp:BoundField DataField="meterno" HeaderText="meterno" 
                            SortExpression="meterno" />
                        <asp:BoundField DataField="importps" HeaderText="importps" 
                            SortExpression="importps" />
                        <asp:BoundField DataField="exportps" HeaderText="exportps" 
                            SortExpression="exportps" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
            <td class="style50">
                </td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style28">
                <span class="style8">
                Meter No</span></td>
            <td class="style39">
                <asp:DropDownList ID="ddlMeterNo" runat="server" 
                   AutoPostBack="True" onselectedindexchanged="ddlMeterNo_SelectedIndexChanged">
                </asp:DropDownList>
                            </td>
            <td class="style6">
                </td>
        </tr>
        <tr>
            <td class="style14">
                </td>
            <td class="style28">
                <span class="style8">
                Transformer</span></td>
            <td class="style39">
                <span class="style8">
                <asp:TextBox ID="txtTransformer" runat="server" Height="25px" Width="145px" 
                    TabIndex="2"></asp:TextBox>
                </span>
                            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style28">
                <span class="style8">
                C.T Ratio</span></td>
            <td class="style39">
                <span class="style8">
                <asp:TextBox ID="txtCtRatio" runat="server" Height="25px" Width="145px"></asp:TextBox>
                </span>
                            </td>
            <td class="style51" colspan="2">
                <asp:Button ID="btnAdd" runat="server" Height="30px" Text="Save" 
                    Width="70px" onclick="btnAdd_Click" />
                            <asp:Button ID="btnUpdate1" runat="server" Height="30px" 
                    onclick="btnUpdate1_Click" Text="Update" Width="70px" />
                <asp:Button ID="btnDelete1" runat="server" Height="30px" 
                    onclick="btnDelete1_Click" Text="Delete" Width="70px" />
                <asp:Button ID="btnClear1" runat="server" Height="30px" Text="Clear" 
                    Width="70px" />
                            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style31">
                </td>
            <td class="style32">
                <span class="style8">Voltage</span></td>
            <td class="style38">
                <asp:TextBox ID="txtVoltage" runat="server" Height="25px" Width="145px"></asp:TextBox>
                <span class="style8"></span></td>
            <td class="style53">
                            </td>
            <td class="style34">
                            </td>
            <td class="style41">
                &nbsp;</td>
            <td class="style36">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                </td>
            <td class="style28">
                </td>
            <td class="style39">
                </td>
            <td class="style51">
                </td>
            <td class="style29">
                &nbsp;</td>
            <td class="style42">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    
                    
                    SelectCommand="SELECT TOP (2) transdate, meterno, importps, exportps FROM energydetail WHERE (meterno = @meterno) AND (transdate = (SELECT MAX(transdate) AS transdate FROM energydetail AS energydetail_1))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtMeterNo" Name="meterno" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
            <td class="style6">
                </td>
        </tr>
        <tr>
            <td class="style14">
                </td>
            <td class="style28">
                </td>
            <td class="style39">
                </td>
            <td class="style51">
                </td>
            <td class="style29">
                </td>
            <td class="style42">
                </td>
            <td class="style6">
                </td>
        </tr>
        <tr>
            <td class="style23" colspan="7" height="30" width="1080">
                </td>
        </tr>
        <tr>
            <td class="style14">
                </td>
            <td class="style7" colspan="5">
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
                        <asp:BoundField DataField="exportps" HeaderText="exportps" 
                            SortExpression="exportps" />
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
            <td colspan="4">
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
            <td class="style23" colspan="7">
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
                    
         SelectCommand="SELECT [snno], [transno], [transdate], [station], [meterno], [transformer], [ctratio], [mf], [voltage], [importps], [exportps] FROM [energydetail] WHERE ([transno] = @transno) ORDER BY [snno]">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtTransID" Name="transno" PropertyName="Text" 
                 Type="String" />
         </SelectParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
         SelectCommand="SELECT [importps] FROM [energydetail]"></asp:SqlDataSource>
        </asp:Content>

