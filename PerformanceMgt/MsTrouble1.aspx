<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" CodeFile="MsTrouble1.aspx.cs"  EnableEventValidation = "false" Inherits="MsTrouble1" Title="Trouble Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
              #one
        {
        	border: 2px solid #99CC00;
        	height :210px;
        	margin :5px;
        	padding :5px;
        }
        #two
        {
        	border: 2px solid #99CC00;
        	min-height :20px;
        	margin :5px;
        	padding :5px;
        }
        #three
        {
        	border: 2px solid #99CC00;
        	min-height :100px;
        	margin :5px;
        	padding :5px;
        }
        #four
        {
        }
        .style14
        {
            width: 420px;
        }
        .style15
        {
            font-size: x-large;
            width: 700px;
        }
        .style16
        {
            width: 100px;
            height: 28px;
        }
        .style17
        {
            width: 92px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table class="style4">
        <tr>
            <td style="background-color: #99CC00; text-align: center; font-weight: 700; " 
                class="style15">
                Trouble Input Form</td>
        </tr>
     </table>
     <div id="one">
   <table cellpadding="1" cellspacing="1" class="style1">
        <tr>
            <td class="style7">
                Trans No</td>
            <td colspan="3">
                <asp:TextBox ID="txtTransID" runat="server" Height="22px" Width="110px" 
                    MaxLength="8"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" 
                    Height="30px" style="font-weight: 700" Width="70px" />
                <asp:Button ID="btnNew" runat="server" Height="30px" onclick="btnNew_Click" 
                    Text="New" Width="60px" />
&nbsp;<span class="style8">Date&nbsp;&nbsp;                 <asp:DropDownList ID="ddlDay" runat="server" Height="30px" AutoPostBack="True" 
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
                    AutoPostBack="True" onselectedindexchanged="ddlMonth_SelectedIndexChanged">
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
                <asp:DropDownList ID="ddlYear" runat="server" Height="30px" AutoPostBack="True" 
                    onselectedindexchanged="ddlYear_SelectedIndexChanged">
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
                                            &nbsp;</span></td>
        </tr>
        <tr>
            <td class="style7">
                Dept</td>
            <td colspan="3">
                <span class="style8">
                <asp:DropDownList ID="ddlDept" runat="server" 
                    style="font-weight: 700; font-size: medium" DataSourceID="SqlDataSource4" 
                    DataTextField="dept" DataValueField="dept" TabIndex="3" Height="30px">
                </asp:DropDownList>
                
                Location </span>
                <asp:TextBox ID="txtLocate" runat="server" Height="22px" Width="450px" 
                    TabIndex="4"></asp:TextBox>
                            </td>
        </tr>
        <tr>
            <td class="style7">
                <span class="style8">
                
                Location</span></td>
            <td colspan="3">
                <span class="style8">
                <asp:DropDownList ID="ddlStation" runat="server" 
                    style="font-weight: 700; font-size: medium" DataSourceID="SqlDataSource1" 
                    DataTextField="dept" DataValueField="dept" TabIndex="3" Height="30px">
                </asp:DropDownList>
                
                Station&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtLocate1" runat="server" Height="22px" Width="450px" 
                    TabIndex="4"></asp:TextBox>
                </span>
                            </td>
        </tr>
        <tr>
            <td class="style7">
                Fault ID
            <td class="style10">
                <asp:TextBox ID="txtFaultCode" runat="server" Height="22px" Width="600px" 
                    TabIndex="1"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="Search" Height="30px" style="font-weight: 700" Width="70px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                Apparatus</td>
            <td colspan="3">
                <asp:TextBox ID="txtDes" runat="server" Height="22px" Width="600px" 
                    TabIndex="2"></asp:TextBox>
                <asp:Button ID="btnLook" runat="server" onclick="btnLook_Click" Text="Search" 
                    Height="30px" style="font-weight: 700" Width="70px" />
            </td>
        </tr>
        <tr>
            <td class="style7">
                Description</td>
            <td colspan="3">
                <asp:TextBox ID="txtDes0" runat="server" Height="22px" Width="600px" 
                    TabIndex="2"></asp:TextBox>
            </td>
        </tr>
        </table>
         <table class="style11">
             <tr>
                 <td class="style17">
                     &nbsp;</td>
                 <td>
            <asp:Label ID="lblSave" runat="server" ForeColor="Red"></asp:Label>
                 </td>
                 <td>
                     &nbsp;</td>
             </tr>
         </table>
        </div>
        <div id="two">
                    <asp:DropDownList ID="ddlDes" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlDes_SelectedIndexChanged" Width="770px">
                    </asp:DropDownList>
                   </div>      
                   
        
     <div id="three">
   <table cellpadding="1" cellspacing="1" class="style1">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style12">
                Reason</td>
            <td class="style14">
                <asp:TextBox ID="txtReason" runat="server" Height="22px" Width="650px" 
                    TabIndex="5"></asp:TextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style12">
                Work Done</td>
            <td class="style14">
                <asp:TextBox ID="txtWorkdn" runat="server" Height="50px" Width="650px" 
                    TabIndex="6" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style12">
                Certified</td>
            <td class="style8">
                <asp:TextBox ID="txtCertify" runat="server" Height="22px" Width="440px" 
                    TabIndex="7"></asp:TextBox>
            &nbsp;&nbsp; Date:
                <asp:DropDownList ID="ddlDay0" runat="server" Height="30px" AutoPostBack="True" 
                    onselectedindexchanged="ddlDay0_SelectedIndexChanged">
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
                <span class="style8">&nbsp;<asp:DropDownList ID="ddlMonth0" runat="server" AutoPostBack="True"
                    Height="30px" onselectedindexchanged="ddlMonth0_SelectedIndexChanged">
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
                                            </span>
                <asp:DropDownList ID="ddlYear0" runat="server" Height="30px" 
                    AutoPostBack="True" onselectedindexchanged="ddlYear0_SelectedIndexChanged">
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
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style3">
                
                                <asp:TextBox ID="txtDate0" runat="server" ontextchanged="txtDate0_TextChanged" 
                                    Width="96px"></asp:TextBox>
                
            </td>
            <td class="style14">
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
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        </table>
        </div>       
        
     <div id="four">
        <table cellpadding="0" cellspacing="0" class="style11">
            <tr>
                <td class="style13" valign="top">
                   
                    <table class="style16">
                        <tr>
                            <td>
                                <span class="style8">
                                <asp:TextBox ID="txtDate" runat="server" 
                    Width="122px" TabIndex="8" ontextchanged="txtDate_TextChanged" Height="22px"></asp:TextBox>
                    </span>
                            </td>
                        </tr>
                    </table>
                    &nbsp; 
                    </span>
        <br />
        
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                        SelectCommand="SELECT [faultcode], [des] FROM [fault] WHERE ([des] = @des)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtDes" Name="des" PropertyName="Text" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    SelectCommand="SELECT [dept] FROM [dept]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                       SelectCommand="SELECT faultcode, des FROM fault" FilterExpression="des LIKE '{0}%' OR Des= NULL">
                    <FilterParameters>
                    <asp:ControlParameter Name="des" ControlID="txtDes" PropertyName="Text" />
                    </FilterParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                <span class="style8">
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    SelectCommand="SELECT [dept] FROM [dept]"></asp:SqlDataSource>
                
                </span>
                </td>
            </tr>
     </table>
     </div>
        </asp:Content>

