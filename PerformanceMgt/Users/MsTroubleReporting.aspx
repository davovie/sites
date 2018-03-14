<%@ Page Language="C#" MasterPageFile="~/LongMaster.master" AutoEventWireup="true" CodeFile="MsTroubleReporting.aspx.cs" EnableEventValidation="false" Inherits="MsTroubleReporting" Title="Trouble Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        
        .container .container{
            margin : 0px;
            padding : 0px;
            width:auto;
            height: auto;
         
        }
               .one {
           
           float: left;
            height: 45px;
            width: 50%;
         
        }

        .two {
             
           float: left;
             margin-bottom: 5px;
            height: 45px;
            width: 50%;
          padding: 5px 0px 0px 5px;
        }
        .three {
          clear: both;
           
            height: 285px;
            width:100%;
            margin-bottom: 10px;
            margin-top:0px;
           
        }
         .container .panel-success {
            height: auto;
            
             
        }
        
         .three .panel-success {
           margin-top: 5px;
           
        }
         .panel-body{
            
              padding: 0px;
              margin : 0px;
         }
        .row
        {
        	height: 40px;
        	
              padding: 0px;
              margin : 0px;
        }

        .col-md-9 {
            height: 40px;
            margin-bottom: 0px;
        }
    </style>
    <link href="../Styles/bootstrap.css" rel="stylesheet" />
    <script src="Styles/bootstrap.js"></script>
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
    <div class="container ">
    <div class="panel panel-success">
           <div class="panel-heading">
            <h3 class="panel-title">TROUBLE AND REPAIR REPORT</h3>
                            <p class="panel-title">OMOTOSHO ELECTRIC ENERGY COMPANY LIMITED</p>
        </div>
        <div class="panel-body">
                           
             <div class="form-inline">
             <div class="one">
                        <div class="panel panel-success">
                <div class="panel-heading">
            <h3 class="panel-title">TROUBLE REPORT</h3>
        </div>
        </div> 
             </div>
             
              <div class="two">
              
           <label>NUMBER</label>
                            <asp:TextBox ID="txtTransID" class="form-control" placeholder="Enter No" Width="66%" runat="server"></asp:TextBox>
                             <asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-primary" OnClick="Button1_Click1" />
       </div>
             </div>
             
                   
        <hr />
      
                        <div class="form-group">
                             <div class="form-inline">
                           <label>To</label>
                            <asp:DropDownList ID="ddlApproval" Width="22%" class="form-control" runat="server" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged1"></asp:DropDownList>
                            <label>Dept</label>
                             <asp:DropDownList ID="ddlDept" Width="16%" class="form-control" runat="server" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged1"></asp:DropDownList>
                                 
                            <label>Location</label>
                            <asp:TextBox ID="txtLocate1" Width="47%" class="form-control" placeholder="Enter Location" runat="server"></asp:TextBox>
                            <hr />
                                 <label>Date</label>
                            <asp:TextBox ID="txtTransDate" class="form-control" Width="18%" runat="server"></asp:TextBox>
                            
                           <label>Station</label>
                            <asp:TextBox ID="txtStation" Width="25%" class="form-control" placeholder="Enter Station" runat="server"></asp:TextBox>
                            
                             <label>Location of Trouble</label>
                            <asp:TextBox ID="TextBox1" Width="24%" class="form-control" placeholder="Enter Location" runat="server"></asp:TextBox>
                             <hr />
                              <label>Apparatus in Trouble</label>
                            <asp:TextBox ID="txtApparatus" class="form-control" placeholder="Enter Apparatus" Width="82%" runat="server"></asp:TextBox>
                                     </div>
                <hr />
                             <div class="form-inline">
                            <label>Fault Code</label>
                            <asp:TextBox ID="txtFaultCode" class="form-control" placeholder="Code" Width="10%" runat="server"></asp:TextBox>
                
                            <label>Fault Description</label>
                            <asp:TextBox ID="txtDes" class="form-control" placeholder="Enter Fault Description" Width="58%" runat="server"></asp:TextBox>
                           <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary" OnClick="btnSearch_Click1" />
                                  </div>
            <hr />
            <div class="form-inline">
                             <asp:DropDownList ID="ddlDes" Width="99%" class="form-control" runat="server"  
                    AutoPostBack="True"  
                    onselectedindexchanged="ddlDept_SelectedIndexChanged" >
                </asp:DropDownList>
           
                </div>
                
                   <hr />       
              <div class="row">
             <div class="col-md-2">
             </div>
             
              <div class="col-md-10">
               <div class="form-group">
               <div class="form-inline">
           <label>NANE OF EMPLOYEE REPORTING TROUBLE</label>
           <asp:TextBox ID="txtPrepareby" class="form-control" Width="55%" placeholder="Enter Name" runat="server"></asp:TextBox>             
       </div>
             </div>
             </div>
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
               

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:performgtConnectionString %>"
                            SelectCommand="SELECT [dept] FROM [dept]"></asp:SqlDataSource>

    </span></asp:Content>

