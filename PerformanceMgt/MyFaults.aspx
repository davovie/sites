<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" CodeFile="MyFaults.aspx.cs" Inherits="MsFaults" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .style4
        {
            width: 648px;
        }
                
        .style1
        {
            width: 648px;
        }
        .style3
        {
            width: 74px;
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
            width: 74px;
            font-weight: bold;
            font-size: large;
        }
        .style8
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style4">
        <tr>
            <td style="background-color: #99CC00; text-align: center; font-weight: 700; font-size: xx-large;">
                Maintain Faults</td>
        </tr>
     </table>
     
   <table cellpadding="2" cellspacing="3" class="style1">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                Fault ID</td>
            <td>
                <asp:TextBox ID="txtFaultCode" runat="server" Height="25px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtFaultCode" ErrorMessage="Please Enter a Fault Code">*</asp:RequiredFieldValidator>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                Description</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="faultcode" 
                    DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" 
                    OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" 
                    PageSize="3" Width="525px">
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:BoundField DataField="faultcode" HeaderText="Fault Code" ReadOnly="True" 
                            SortExpression="faultcode">
                            <HeaderStyle HorizontalAlign="Center" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="des" HeaderText="Descrition" 
                            SortExpression="Description">
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
                                
                <asp:TextBox ID="txtDes" runat="server" Height="25px" Width="425px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtDes" ErrorMessage="Please Enter a Fault Description ">*</asp:RequiredFieldValidator>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" 
                    onclick="btnSave_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" 
                    onclick="btnClear_Click" />
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        </table>

     
    <table cellpadding="0" cellspacing="0" class="style8">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="lblSave" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
    </table>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    SelectCommand="SELECT [faultcode], [des] FROM [fault]"></asp:SqlDataSource>
     
</asp:Content>

