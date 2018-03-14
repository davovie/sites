<%@ Page Language="C#" MasterPageFile="~/LongerMaster.master" AutoEventWireup="true"  CodeFile="MsEnergyReturn2.aspx.cs"  EnableEventValidation = "false" Inherits="MsEnergyReturn2" Title="Energy Return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="EnergyReturn.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
        .style4
        {
            width: 1048px;
        }
                
        .style1
        {
            width: 103%;
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
            width: 99%;
        }
        .style23
        {
            background-color: #99CC00;
        }
        .style27
        {
            font-size: x-large;
        }
        .style54
        {
            width: 98%;
        }
        .style55
        {
            font-weight: bold;
            font-size: large;
            width: 93px;
        }
        .style56
        {
            width: 93px;
        }
        .style57
        {
            width: 14px;
        }
        .style58
        {
            font-weight: bold;
            font-size: large;
            width: 14px;
        }
        .style59
        {
            font-weight: bold;
            font-size: large;
            width: 116px;
        }
        .style60
        {
            width: 116px;
        }
        .style62
        {
            height: 29px;
        }
        .style63
        {
            font-weight: bold;
            font-size: large;
            width: 116px;
            height: 29px;
        }
        .style64
        {
            width: 100%;
        }
        .style65
        {
            width: 65px;
        }
        .style66
        {
            width: 75px;
        }
        .style67
        {
            width: 77px;
        }
        .style68
        {
            width: 80px;
        }
        .style69
        {
            font-weight: bold;
            font-size: large;
            width: 80px;
        }
        .style72
        {
            width: 321px;
        }
        .style73
        {
            width: 60px;
        }
        .style74
        {
            width: 8px;
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
            <td height="30" width="1080">
                <div id="one">
                    <table class="style54">
                        <tr>
                            <td class="style57">
                                </td>
                            <td class="style55">
                Trans No</td>
                            <td>
                <asp:TextBox ID="txtTransID" runat="server" Height="25px" Width="91px">00000002</asp:TextBox>
               
                <asp:TextBox ID="txtSnNo" runat="server" Height="25px" 
                    Width="40px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" 
                    Height="30px" style="font-weight: 700" Width="70px" />
               
                            </td>
                        </tr>
                        <tr>
                            <td class="style57">
                                </td>
                            <td class="style56">
                <span class="style8">Trans Date</span></td>
                                            <td>
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
                  onselectedindexchanged="ddlMonth_SelectedIndexChanged"  AutoPostBack="True">
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
                <asp:DropDownList ID="ddlYear" runat="server" Height="30px" AutoPostBack="True" onselectedindexchanged="ddlYear_SelectedIndexChanged">
                    <asp:ListItem>2015</asp:ListItem>
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
                                        </tr>
                                        <tr>
  </td>
                                            <td class="style58">
                                                </td>
                                            <td class="style7">
                                                Station</td>
                                                <td>
                <span class="style8">
                <asp:TextBox ID="txtStation" runat="server" Height="25px" Width="145px" 
                    TabIndex="4"></asp:TextBox>
                
                </span>
                                </td>
                                        </tr>
                                        <tr>
                                            <td class="style57">
                                                </td>
                                            <td class="style56">
                <span class="style8">
               
                Meter No</span></td>
                            <td>
                <asp:DropDownList ID="ddlMeterNo" runat="server" 
                   AutoPostBack="True" onselectedindexchanged="ddlMeterNo_SelectedIndexChanged">
                </asp:DropDownList>
                                </td>
                        </tr>
                        <tr>
                            <td class="style57">
                                </td>
                            <td class="style56">
                <span class="style8">
                Transformer</span></td>
                                            <td>
                <span class="style8">
                <asp:TextBox ID="txtTransformer" runat="server" Height="25px" Width="145px" 
                    TabIndex="2"></asp:TextBox>
                </span>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td class="style57">
                                                &nbsp;</td>
                                            <td class="style56">
                <span class="style8">
                C.T Ratio</span></td>
                            <td>
                <span class="style8">
                <asp:TextBox ID="txtCtRatio" runat="server" Height="25px" Width="145px"></asp:TextBox>
                </span>
                                            </td>
                        </tr>
                        <tr>
                            <td class="style57">
                                &nbsp;</td>
                            <td class="style56">
                <span class="style8">Voltage</span></td>
                            <td>
                <asp:TextBox ID="txtVoltage" runat="server" Height="25px" Width="145px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style57">
                                &nbsp;</td>
                            <td class="style55">
                                Mf</td>
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
                &nbsp;
                <asp:Button ID="btnNew" runat="server" Height="30px" onclick="btnNew_Click" 
                    Text="New" Width="70px" />
                            &nbsp;<asp:TextBox ID="txtTransDate" runat="server" Width="101px"></asp:TextBox>
                            &nbsp;<span class="style8"><asp:TextBox ID="txtMeterNo" runat="server" Width="92px" 
                    TabIndex="1">IMP98445320</asp:TextBox>
                </span>
                            </td>
                        </tr>
                    </table>
                    <table class="style54">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style59">
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
                            <td class="style59">
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
                            <td class="style63">
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
                            <td class="style59">
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
                                <b>Present Exp</b></td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtPresentE" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td class="style59">
                                Diff</td>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtDiffE" runat="server" Height="25px" Width="100px">0</asp:TextBox>
                                </span>
                                            </td>
                        </tr>
                        </table>
                                    <table class="style64">
                                        <tr>
                                            <td>
                <asp:Button ID="btnAdd" runat="server" Height="30px" Text="Save" 
                    Width="70px" onclick="btnAdd_Click" />
                            <asp:Button ID="btnUpdate1" runat="server" Height="30px" 
                    onclick="btnUpdate1_Click" Text="Update" Width="70px" />
                <asp:Button ID="btnDelete1" runat="server" Height="30px" 
                    onclick="btnDelete1_Click" Text="Delete" Width="70px" />
                <asp:Button ID="btnClear1" runat="server" Height="30px" Text="Clear" 
                    Width="70px" onclick="btnClear1_Click" />
                                            </td>
                                        </tr>
                                    </table>
                </div>
                <div id="three">
                    <table class="style64">
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
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
                        </tr>
                        <tr>
                            <td>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    
                    
                    SelectCommand="SELECT TOP (2) transdate, meterno, importps, exportps FROM energydetail WHERE (meterno = @meterno) AND (transdate = (SELECT MAX(transdate) AS transdate FROM energydetail AS energydetail_1))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtMeterNo" Name="meterno" PropertyName="Text" 
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
                    </table>
                                </div>
                
                </td>
        </tr>
        <tr>
               
            <td class="style7">
             <div id="four">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource12" 
                    ForeColor="#333333" GridLines="None" PageSize="5"  OnSelectedIndexChanged="OnSelectedIndexChanged" 
                OnRowDataBound="OnRowDataBound" Width="1022px" 
                    style="font-size: small">
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
                        <asp:BoundField DataField="diff" HeaderText="diff" 
                            SortExpression="diff" />
                        <asp:BoundField DataField="exportpv" HeaderText="exportpv" 
                            SortExpression="exportpv" />
                        <asp:BoundField DataField="exportps" HeaderText="exportps" 
                            SortExpression="exportps" />
                        <asp:BoundField DataField="diff1" HeaderText="diff1" 
                            SortExpression="diff1" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                 </div>
            </td>
           
        </tr>
        <tr>
            <td>
               <div>
               <div id="five">
                   <table cellpadding="1" cellspacing="0" class="style11">
                       <tr>
                           <td class="style74">
                              </td>
                           <td>
                               </td>
                           <td class="style72">
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
                
                               </span>
                               <asp:Button ID="btnClear" runat="server" Height="30px" onclick="btnClear_Click" 
                                   Text="Clear" Width="70px" style="font-weight: 700" />
                           </td>
                           <td class="style69">
                               <asp:TextBox ID="txtTotImportPv" runat="server" style="text-align:right"  
                                   Width="85px">0</asp:TextBox>
                           </td>
                           <td class="style68">
                               <asp:TextBox ID="txtTotImportPs" runat="server" Width="95px" 
                                   style="text-align:right">0</asp:TextBox>
                           </td>
                           <td class="style67">
                               <asp:TextBox ID="txtTotDiffI" runat="server" 
                                   style="text-align:right"                                                                                                                                                                             
                                   Width="95px">0</asp:TextBox>
                           </td>
                           <td class="style66">
                               <asp:TextBox ID="txtTotExportPv" runat="server" style="text-align:right" 
                                   Width="95px">0</asp:TextBox>
                           </td>
                           <td class="style65">
                               <asp:TextBox ID="txtTotExportPs" runat="server" style="text-align:right" 
                                   Width="95px">0</asp:TextBox>
                           </td>
                           <td class="style73">
                               <asp:TextBox ID="txtTotDiffE" runat="server" style="text-align:right" 
                                   Width="95px">0</asp:TextBox>
                           </td>
                           <td>
                               </td>
                               </div>
                       </tr>
                   </table>
                </div>
            </td>
        </tr>
        <tr>
            <td class="style23">
                <span class="style23">&nbsp; </span>
            </td>
        </tr>
        </table>
        
        </asp:Content>

