﻿<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" CodeFile="MsTroubleReporting.aspx.cs" EnableEventValidation="false" Inherits="MsTroubleReporting" Title="Trouble Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
       .panel-success .panel-body
       {
       
       	height: 330px;
       	}

       
    </style>
    <link href="Styles/bootstrap.css" rel="stylesheet" />
    <script src="Styles/bootstrap.js"></script>
    <script src="Styles/jquery-3.2.1.js"></script>
    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <script src="Styles/jquery-ui.js"></script>
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
            <h3 class="panel-title">Trouble Reporting</h3>
        </div>
        <div class="panel-body">
            
                
                        <div class="form-group">
                             <div class="form-inline">
                            <label>Trans No</label>
                            <asp:TextBox ID="txtTransID" class="form-control" placeholder="Enter Trans No" Width="17%" runat="server"></asp:TextBox>
                             <asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-primary" OnClick="Button1_Click1" />
                                 <label>Date</label>
                            <asp:TextBox ID="txtTransDate" class="form-control" Width="20%" runat="server"></asp:TextBox>
                            <label>Prepared By</label>
                            <asp:TextBox ID="txtPrepareby" class="form-control" Width="20%" placeholder="Enter Name" runat="server"></asp:TextBox>
                                 <hr />
                            <label>Dept</label>
                            <asp:DropDownList ID="ddlDept"  Width="22%" class="form-control" runat="server"  
                      onselectedindexchanged="ddlDept_SelectedIndexChanged" >
                </asp:DropDownList>
                            <label>Location</label>
                            <asp:TextBox ID="txtLocate1" class="form-control" placeholder="Enter Location" runat="server"></asp:TextBox>
                            <label>Station</label>
                            <asp:TextBox ID="txtStation"  Width="33%" class="form-control" placeholder="Enter Station" runat="server"></asp:TextBox>
                            </div>                     
                <hr />
                             <div class="form-inline">
                            <label>Fault Code</label>
                            <asp:TextBox ID="txtFaultCode" class="form-control" placeholder="Enter Fault Code" Width="17%" runat="server"></asp:TextBox>
                
                                 <label>Apparatus</label>
                            <asp:TextBox ID="txtApparatus" class="form-control" placeholder="Enter Apparatus" Width="62%" runat="server"></asp:TextBox>
                          <hr />
                             <div class="form-inline">
                            <label>Fault Description</label>
                                
                            <asp:TextBox ID="txtDes" class="form-control" placeholder="Enter Fault Description" Width="74%" runat="server"></asp:TextBox>
                                  <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary" OnClick="btnSearch_Click1" />
                           </div>
            <hr />
                                 <asp:DropDownList ID="ddlDes" Width="100%" class="form-control" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlDes_SelectedIndexChanged"></asp:DropDownList>
                                   
                </div>
                               <hr /> 
                                 <asp:Label ID="lblSave" class="form-control"  runat="server" Width="42%" Text="Label" ForeColor="Red"></asp:Label>
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

