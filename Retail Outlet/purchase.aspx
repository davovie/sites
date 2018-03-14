<%@ Page Language="C#" AutoEventWireup="true" CodeFile="purchase.aspx.cs" Inherits="purchase" %>

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
    <style type="text/css">
        .auto-style1 {
            width: 64px;
        }
        .auto-style2 {
            width: 131px;
        }
        .auto-style3 {
            width: 884px;
        }
        .auto-style4 {
            width: 85px;
        }
        .auto-style5 {
            width: 137px;
        }
    </style>
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
                    <li><a href="/payment.aspx">Transaction - payments</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
           </nav>
        </div>
    <div class="container">
        <h3 class="center orange-text">Purchase Transaction</h3>
        <div class="container">           
            <div class="row">                
                <form id="purchase_transaction" class="row" runat="server">
                    <div class="center">
                        <asp:LinkButton CssClass="btn waves-effect waves-light green darken-2" runat="server" Text="Save" ID="purchase_Save">Save
                            <i class="material-icons left">save</i>
                        </asp:LinkButton>
                        <asp:LinkButton CssClass="btn waves-effect waves-light red darken-2" runat="server" Text="Delete" ID="purchaseDelete">Delete
                            <i class="material-icons left">delete</i>
                        </asp:LinkButton>
                        <asp:LinkButton CssClass="btn waves-effect waves-light blue darken-2" runat="server" Text="Reset" ID="purchaseReset">Reset
                            <i class="material-icons right">restore</i>
                        </asp:LinkButton>
                    </div>
                    <div class="row">
                        <div class="col s5">
                                <div class="row">
                                    <div class="input-field col s9 m6">

                                        <input id="inv_date" type="text" class="datepicker" runat="server"/>
                                        <label for="inv_date">Invoice Date</label>
                                    </div>
                                    <div class="input-field col s3 m6" >
                                        <input id="inv_no" type="text" class="validate"/>
                                        <label for="inv_No">Inv No </label>
                                    </div>
                                </div>
                        </div>
                <div class="col s1">
                    
                </div>
                <div class="col s6">
                    <div class="row">
                                    <div class="input-field col s4">
                                        <input id="sup_ID" type="text" class="validate"/>
                                        <label for="sys_No">Supplier ID </label>
                                    </div>
                                    <div class="input-field col s8">
                                        <input id="sup_name" type="text" class="validate"/>
                                        <label for="sup_name">Supplier Name </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col s12">
                                        <input id="sup_addr" type="text" class="validate"/>
                                        <label for="sup_addr">Address</label>
                                    </div>                               
                                </div>
                </div>
            </div>
                    <div class="row">
                        <div class="input-field col s2">
                            <input id="stk_code" type="text" class="validate"/>
                            <label for="stk_code">Code </label>
                        </div>
                        <div class="input-field col s4">
                            <input id="stk_desc" type="text" class="validate"/>
                            <label for="stk_desc">Stock Description </label>
                        </div>
                        <div class="input-field col s2">
                            <input placeholder="0" id="stk_qty" type="text" class="validate"/>
                            <label for="stk_qty">Quantity </label>
                        </div>
                        <div class="input-field col s2">
                            <input placeholder="0.00" id="unt_prc" type="text" class="validate"/>
                            <label for="unt_prc">Unit Price</label>
                        </div>
                        <div class="input-field col s2">
                            <input placeholder="0.00" id="amt" type="text" class="validate"/>
                            <label for="amt">Amount</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s3">

                        </div>
                        <div class="input-field col s3">
                            <input id="serial_no" type="text" class="validate"/>
                            <label for="serial_no">S/N </label>
                        </div>
                    </div>
                    <div class="row">
                        <asp:GridView ID="purchseView" runat="server">

                        </asp:GridView>                           
                    </div>
                    <div class="row">
                        <div class="input-field col s2 push-s10">
                            <input placeholder="0.00" id="totl_amt" type="text" class="validate"/>
                            <label for="totl_amt">Total Amount</label>
                        </div>
                        <div class="input-field col s2 push-s5">
                            <input placeholder="0.00" id="amt_paid" type="text" class="validate"/>
                            <label for="amtPaid">Amount paid</label>
                        </div>
                        <div class="input-field col s2">
                            <input placeholder="0.00" id="balance" type="text" class="validate"/>
                            <label for="balance">balance</label>
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
</body>
</html>
