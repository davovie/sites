<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" CodeFile="MsTroubleCheck.aspx.cs" EnableEventValidation="false" Inherits="MsTroubleCheck" Title="Trouble Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
       

       
    </style>
    <link href="../Styles/bootstrap.css" rel="stylesheet" />
    <script src="../Styles/bootstrap.js"></script>
    <script src="../Styles/jquery-3.2.1.js"></script>
    <link href="../Styles/jquery-ui.css" rel="stylesheet" />
    <script src="../Styles/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id$=txtTransDate]").datepicker({

                showOn: 'both',
                buttonText: 'Date',
                dateFormat: 'dd/mm/yy'
            });
        });
</script>
    <script type="text/javascript">
        $(function () {
            $("[id$=txtCertDate]").datepicker({
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
            <h3 class="panel-title">Trouble Checking</h3>
        </div>
        <div class="panel-body">
            
                
                        <div class="form-group">
                             <div class="form-inline">
                            <label>Number</label>
                            <asp:TextBox ID="txtTransID" class="form-control" placeholder="Enter Trans No" Width="17%" runat="server"></asp:TextBox>
                             <asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-primary" OnClick="Button1_Click1" />
                                 <label>Date</label>
                            <asp:TextBox ID="txtTransDate" class="form-control" Width="18%" runat="server"></asp:TextBox>
                                 <label>Apparatus</label>
                            <asp:TextBox ID="txtApparatus" class="form-control" placeholder="Enter Apparatus" Width="26%" runat="server"></asp:TextBox>
                          
                           
                <hr />
                             <div class="form-inline">
                            
                            <label>Fault Description</label>
                                
                            <asp:TextBox ID="txtDes" class="form-control" placeholder="Enter Fault Description" Width="84%" runat="server"></asp:TextBox>
                                  
                         
            <hr />     
                </div>
                                  <label>Reason</label>
                            <asp:TextBox ID="txtReason" class="form-control" placeholder=" Reason" Width="100%" runat="server"></asp:TextBox>
                               
                            <label>Work Done</label>
                            <asp:TextBox ID="txtWorkdn" class="form-control" placeholder="Work Description" Width="100%" runat="server"></asp:TextBox>
                             <hr />
                            <div class="form-inline">
                            <label>Certified By</label>
                            <asp:TextBox ID="txtCertify" class="form-control" placeholder="Enter Name" Width="15%" runat="server"></asp:TextBox>
                            <label>Date</label>
                            <asp:TextBox ID="txtCertDate" class="form-control"  Width="20%" runat="server"></asp:TextBox>
                                 <asp:Label ID="lblSave" class="form-control"  runat="server" Width="42%" Text="Label" ForeColor="Red"></asp:Label>
                            </div>
                       
                    </div>
                       
            </div>
        
        
        <div class="panel-footer active">
            <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save" OnClick="btnSave_Click" />
            <asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
            <asp:Button ID="btnUpdate" class="btn btn-info" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnClear" class="btn btn-warning" runat="server" Text="Clear" OnClick="btnClear_Click" />
        </div>
    </div>
<hr />


    
                    
                                          
                               
                                       
                   

                

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
                <td valign="top" align="left">
                    <span class="style8">

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>"
                            SelectCommand="SELECT [dept] FROM [dept]"></asp:SqlDataSource>

    </span></asp:Content>

