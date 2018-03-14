<%@ Page Language="C#" MasterPageFile="~/LongerMaster.master" AutoEventWireup="true" CodeFile="TroubleGridView.aspx.cs" Inherits="TroubleGridView" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="width: 1047px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="transid" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" Width="1043px" AllowPaging="True" PageSize="10">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:BoundField DataField="transid" HeaderText="transid" ReadOnly="True" 
                    SortExpression="transid" />
                <asp:BoundField DataField="transdate" HeaderText="transdate" 
                    SortExpression="transdate" />
                <asp:BoundField DataField="des" HeaderText="des" SortExpression="des" />
                <asp:BoundField DataField="reason" HeaderText="reason" 
                    SortExpression="reason" />
                <asp:BoundField DataField="workdn" HeaderText="workdn" 
                    SortExpression="workdn" />
                <asp:BoundField DataField="certify" HeaderText="certify" 
                    SortExpression="certify" />
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>" 
            
            SelectCommand="SELECT [transid], [transdate], [des], [reason], [workdn], [certify] FROM [trouble] ORDER BY [transid]">
        </asp:SqlDataSource>
    </p>
</asp:Content>

