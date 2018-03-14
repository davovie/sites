<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" CodeFile="MsRouter.aspx.cs" EnableEventValidation="false" Inherits="MsRouter" Title="Trouble Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style4 {
            width: 798px;
        }

        .style1 {
            width: 595px;
        }

        .style5 {
            width: 13px;
        }

        .style6 {
            width: 4px;
        }

        .style8 {
            font-size: large;
            font-weight: bold;
        }

        .style9 {
            width: 405px;
        }

        .style10 {
            width: 212px;
        }

        .style11 {
            width: 100%;
        }

        .style12 {
            width: 103px;
            font-weight: bold;
            font-size: large;
        }

        .style13 {
            width: 270px;
        }

        #one {
            border: 2px solid #99CC00;
            height: 185px;
            margin: 5px;
            padding: 5px;
        }

        #two {
            border: 2px solid #99CC00;
            min-height: 20px;
            margin: 5px;
            padding: 5px;
        }

        #three {
            border: 2px solid #99CC00;
            min-height: 100px;
            margin: 5px;
            padding: 5px;
        }

        #four {
        }

        .style14 {
            width: 420px;
        }

        .style15 {
            font-size: x-large;
        }

        .style16 {
            width: 100px;
        }

        .style17 {
            width: 92px;
        }

        .style18 {
            width: 565px;
            font-weight: bold;
            font-size: large;
        }

        .style21 {
            width: 103px;
        }

        .style22 {
            width: 593px;
            font-weight: bold;
            font-size: large;
        }

        /*.one {
            border: 2px solid red;
           float: left;
            height: 217px;
            width: 48%;
           margin-bottom: 0px;
           margin-right: 5px;
        }

        .two {
           float: left;
            border: 2px solid red;
            height: 220px;
            width: 48%;
          margin-bottom: 0px;
        }
        .three {
          clear: both;
            border: 2px solid blue;
            height: 285px;
            width:100%;
            margin-bottom: 10px;
            margin-top:0px;
           
        }
         .panel-success {
            height: 770px;
             padding-bottom: 260px;
        }
        .panel-success .panel-success{
            height: auto;
            margin-bottom: 0px;
             padding-bottom: 0px;
        }
         .three .panel-success {
           margin-top: 5px;
        }*/
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
            <h3 class="panel-title">Router Transaction</h3>
        </div>
        <div class="panel-body">
            
                
                        <div class="form-group">
                             <div class="form-inline">
                            <label>Router No</label>
                            <asp:TextBox ID="txtTransID" class="form-control" placeholder="Enter Router No" Width="17%" runat="server"></asp:TextBox>
                             <asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-primary" OnClick="Button1_Click1" />
                                 <label>Date</label>
                            <asp:TextBox ID="txtTransDate" class="form-control" Width="18%" runat="server"></asp:TextBox>
                            <label>Prepared By</label>
                            <asp:TextBox ID="txtPrepareby" class="form-control" Width="22%" placeholder="Enter Name" runat="server"></asp:TextBox>
                                 <hr />
                            <label>Dept</label>
                                 <asp:DropDownList ID="ddlDept" Width="22%" class="form-control" runat="server" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged1"></asp:DropDownList>
                           
                            <label>Location</label>
                            <asp:TextBox ID="txtLocate1" class="form-control" placeholder="Enter Location" runat="server"></asp:TextBox>
                            <label>Station</label>
                            <asp:TextBox ID="txtStation" Width="33%" class="form-control" placeholder="Enter Station" runat="server"></asp:TextBox>
                            </div>                     
                <hr />
                             <div class="form-inline">
                            <label>Fault Code</label>
                            <asp:TextBox ID="txtFaultCode" class="form-control" placeholder="Enter Fault Code" Width="17%" runat="server"></asp:TextBox>
                
                            <label>Fault Description</label>
                            <asp:TextBox ID="txtDes" class="form-control" placeholder="Enter Fault Description" Width="47%" runat="server"></asp:TextBox>
                           <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary" OnClick="btnSearch_Click1" />
                                  </div>
            <hr />
            <div class="form-inline">
                             <asp:DropDownList ID="ddlDes" Width="99%" class="form-control" runat="server"  
                    AutoPostBack="True"  
                    onselectedindexchanged="ddlDept_SelectedIndexChanged" >
                </asp:DropDownList>
           
                </div>
                                  <label>Reason</label>
                            <asp:TextBox ID="txtReason" class="form-control" placeholder=" Voltage" Width="100%" runat="server"></asp:TextBox>
                               
                            <label>Work Done</label>
                            <asp:TextBox ID="txtWorkdn" class="form-control" placeholder="Work Description" Width="100%" runat="server"></asp:TextBox>
                             <hr />
                            <div class="form-inline">
                            <label>Certified By</label>
                            <asp:TextBox ID="txtCertify" class="form-control" placeholder="Enter Name" Width="55%" runat="server"></asp:TextBox>
                            <label>Date</label>
                            <asp:TextBox ID="txtCertDate" class="form-control"  Width="20%" runat="server"></asp:TextBox>
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

