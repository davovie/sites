<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" CodeFile="MyTrouble.aspx.cs" Inherits="MyTrouble" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .style4
        {
            width: 593px;
        }
                
        .style1
        {
            width: 595px;
        }
        .style3
        {
            width: 148px;
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
            width: 148px;
            font-weight: bold;
            font-size: large;
        }
        .style8
    {
        font-size: large;
        font-weight: bold;
    }
        .style9
        {
            width: 405px;
        }
        .style10
        {
            width: 212px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table class="style4">
        <tr>
            <td style="background-color: #99CC00; text-align: center; font-weight: 700; font-size: xx-large;">
                Trouble Input Form</td>
        </tr>
     </table>
     
   <table cellpadding="1" cellspacing="1" class="style1">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                Trans No</td>
            <td colspan="3">
                <asp:TextBox ID="txtTransID" runat="server" Height="25px" Width="92px"></asp:TextBox>
&nbsp;<span class="style8">Trans Date </span></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                Fault ID</td>
            <td class="style10">
                <asp:TextBox ID="txtFaultCode" runat="server" Height="25px" Width="212px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="Search" />
            </td>
            <td>
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                Description</td>
            <td colspan="3">
                <asp:TextBox ID="txtDes" runat="server" Height="25px" Width="421px"></asp:TextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                Station</td>
            <td colspan="3">
                &nbsp;<span class="style8"><asp:DropDownList ID="ddlSation" runat="server" 
                    style="font-weight: 700; font-size: medium" DataSourceID="SqlDataSource4" 
                    DataTextField="dept" DataValueField="dept">
                </asp:DropDownList>
                
                Location</span>
                <asp:TextBox ID="txtLocate" runat="server" Height="25px" Width="231px"></asp:TextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                Reason</td>
            <td colspan="3">
                <asp:TextBox ID="txtReason" runat="server" Height="25px" Width="421px"></asp:TextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                Work Done</td>
            <td colspan="3">
                <asp:TextBox ID="txtWorkdn" runat="server" Height="25px" Width="421px"></asp:TextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                Certified By</td>
            <td colspan="3">
                <asp:TextBox ID="txtCertify" runat="server" Height="25px" Width="421px"></asp:TextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td colspan="3">
                <asp:Button ID="btnSave" runat="server" Text="Save" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" 
                    onclick="btnSave_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" />
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                    SelectCommand="SELECT [dept] FROM [dept]"></asp:SqlDataSource>
</asp:Content>

