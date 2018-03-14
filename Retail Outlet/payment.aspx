<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />  
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Customers: Online Retail POS</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
</head>
<body>
    <div>
           <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo">Purchase - Online Retail POS</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="/maintain.aspx"><i class="material-icons">navigate_before</i></a></li>
                    <li><a href="/Default.aspx">Home</a></li>                    
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <li><a href="/Default.aspx">Home</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
           </nav>
        </div>
    <div class="container">
        <h3 class="center orange-text">Receipt & Payment Transaction</h3>
        <div class="container">           
            <div class="row">                
                <form id="recptPay_trnsctn" class="row" runat="server">
                    <%-- Button at page top --%>
                    <div class="center">
                        <asp:LinkButton CssClass="btn waves-effect waves-light green darken-2" runat="server" Text="Save" ID="pymtSave">Save
                            <i class="material-icons left">save</i>
                        </asp:LinkButton>
                        <asp:LinkButton CssClass="btn waves-effect waves-light red darken-2" runat="server" Text="Delete" ID="pymtDelete">Delete
                            <i class="material-icons left">delete</i>
                        </asp:LinkButton>
                        <asp:LinkButton CssClass="btn waves-effect waves-light blue darken-2" runat="server" Text="Reset" ID="pymtReset">Reset
                            <i class="material-icons right">restore</i>
                        </asp:LinkButton>
                        <asp:LinkButton CssClass="btn waves-effect waves-light yellow darken-2" Text="Transfer" ID="pymntTxfr" runat="server">Transfer

                        </asp:LinkButton>
                    </div> <!--end of button section-->

                    <%-- Form content Section --%>
                    <div class="row">
                        <div class="input-field col s3">
                            <asp:TextBox ID="trnsctn_no" runat="server" type="text" CssClass="validate"></asp:TextBox>
                            <label for="trans_no">Trans No.</label>
                        </div>
                        <div class="input-field col s3">
                            <asp:TextBox ID="trnsctn_date" runat="server" type="text" CssClass="datepicker"></asp:TextBox>
                            <label for="trans_date">Trans Date </label>
                        </div>
                        <div class="input-field col s6">                                       
                            <asp:TextBox ID="beneficiary" runat="server" type="text" CssClass="validate"></asp:TextBox>
                            <label for="beneficiary">Beneficiary</label>                                  
                        </div>
                     </div>
                    <div class="row">
                        <div class="col s12">
                            <label for="paymtMode">Payment Mode</label>
                            <asp:DropDownList ID="pymtMode" runat="server" CssClass="dropdown-button btn"></asp:DropDownList>                     
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s3">
                            <asp:TextBox ID="trnsAcct" runat="server" type="text" CssClass="validate"></asp:TextBox>
                            <label for="trnsAccount">From Account</label>
                        </div>
                        <div class="input-field col s2">
                            <asp:TextBox ID="AcctType" runat="server" type="text" CssClass="validate"></asp:TextBox>
                            <label for="AcctType">Account Type</label>
                        </div>
                        <div class="input-field col s1">
                            <asp:TextBox ID="AcctType1" runat="server" type="text" CssClass="validate"></asp:TextBox>
                        </div>
                        <div class="input-field col s3">
                            <asp:TextBox ID="TextBox1" runat="server" type="text" CssClass="validate"></asp:TextBox>
                            <label for="rscvAccount">To Account</label>
                        </div>
                        <div class="input-field col s3">
                            <asp:TextBox ID="narrtn" runat="server" type="text" CssClass="validate"></asp:TextBox>
                            <label for="narrtn">Narration</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s3">
                            <asp:TextBox ID="balPmtDate" runat="server" type="text" CssClass="datepicker"></asp:TextBox>
                            <label for="balPmtDate">Bal Payment Date </label>
                        </div>
                        <div class="input-field col s2 push-s1">
                            <asp:TextBox ID="amtPd" runat="server" type="text" CssClass="validate" placeholder="0.00"></asp:TextBox>
                            <label for="amtPd">Amt Pd</label>
                        </div>
                        <div class="input-field col s2 push-s1">
                            <asp:TextBox ID="bal" runat="server" type="text" CssClass="validate" placeholder="0.00"></asp:TextBox>
                            <label for="bal">Balance</label>
                        </div>
                        <div class="input-field col s2 push-s1">
                            <asp:TextBox ID="balAmtPd" runat="server" type="text" CssClass="validate" placeholder="0.00"></asp:TextBox>
                            <label for="balAmtPd">BalAmtPd </label>
                        </div>
                        <div class="input-field col s2 push-s1">
                            <asp:TextBox ID="tot_Amt" runat="server" type="text" CssClass="validate" placeholder="0.00"></asp:TextBox>
                            <label for="tot_Amt">Total Amt </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <asp:GridView ID="GridView1" runat="server">

                            </asp:GridView>
                        </div>
                    </div>
                </form>
            </div>
            </div>
    </div>
                  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
    <script>
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15, // Creates a dropdown of 15 years to control year,
            today: 'Today',
            clear: 'Clear',
            close: 'Ok',
            closeOnSelect: false // Close upon selecting a date,
        });
    </script>
    <script>
        $('.dropdown-button').dropdown({
            inDuration: 300,
            outDuration: 225,
            constrainWidth: false, // Does not change width of dropdown to that of the activator
            hover: true, // Activate on hover
            gutter: 0, // Spacing from edge
            belowOrigin: false, // Displays dropdown below the button
            alignment: 'left', // Displays dropdown with edge aligned to the left of button
            stopPropagation: false // Stops event propagation
        }
        );
    </script>
</body>
</html>
