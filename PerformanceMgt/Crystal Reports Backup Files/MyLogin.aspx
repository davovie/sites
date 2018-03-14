<%@ Page Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="MyLogin.aspx.cs" Inherits="MyLogin" Title="Login Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .style4
        {
            width: 397px;
        }
                
        .style1
        {
            width: 397px;
        }
        .style3
        {
        }
        .style5
        {
            width: 57px;
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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style4">
        <tr>
            <td style="background-color: #99CC00; text-align: center; font-weight: 700; font-size: xx-large;">
                Login</td>
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
                Username</td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" Height="25px" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                Password</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" Height="25px" Width="200px" 
                    CausesValidation="True" TextMode="Password"></asp:TextBox>
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
                <asp:Button ID="btnLogin" runat="server" Text="Login" ForeColor="Black" 
                    Height="30px" style="font-weight: 700" Width="70px" 
                    onclick="btnLogin_Click" />
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style3" colspan="2">
                <asp:Label ID="lblinfo" runat="server" Text="Label" style="color: #FF3300"></asp:Label>
            </td>
            <td class="style6">
                &nbsp;</td>
        </tr>
    </table>

     
</asp:Content>

