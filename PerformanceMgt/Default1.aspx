<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default1.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 911px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td class="style2">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Height="26px" onclick="Button1_Click" 
                        Text="Button" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                        CellPadding="3" CellSpacing="1" DataKeyNames="faultcode" 
                        DataSourceID="SqlDataSource10" GridLines="None" PageSize="5" Width="543px">
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="faultcode" HeaderText="faultcode" ReadOnly="True" 
                                SortExpression="faultcode" />
                            <asp:BoundField DataField="des" HeaderText="des" SortExpression="des" />
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
                        SelectCommand="SELECT faultcode, des FROM fault" FilterExpression="des LIKE '{0}%'">
                    <FilterParameters>
                    <asp:ControlParameter Name="des" ControlID="TextBox1" PropertyName="Text" />
                    </FilterParameters>

                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
