﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer.aspx.cs" Inherits="customer" %>

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
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    <div>
           <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo">Customers - Online Retail POS</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="/maintain.aspx"><i class="material-icons">navigate_before</i></a></li>
                    <li><a href="/Default.aspx">Home</a></li>                    
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <li><a href="/maintain.aspx"><i class="material-icons">navigate_before</i></a></li>
                    <li><a href="/Default.aspx">Home</a></li> 
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
           </nav>
        </div>
    <div class="container">
        <h3 class="center orange-text">Customer Update Information</h3>
        <div class="container">
            <div class="row">
                <form id="customer_info" class="row" runat="server">
                    <div class="row">
                        <div class="input-field col s4">
                            <input id="customer_id" type="text" class="validate"/>
                            <label for="customer_id">Customer ID: </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s4">
                            <input id="customer_fname" type="text" class="validate"/>
                            <label for="customer_firstname">First Name: </label>
                        </div>
                        <div class="input-field col s4">
                            <input id="customer_mname" type="text" class="validate"/>
                            <label for="customer_middlename">Middle Name: </label>
                        </div>
                        <div class="input-field col s4">
                            <input id="customer_lname" type="text" class="validate"/>
                            <label for="customer_lastname">Surname: </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="customer_cmpy" type="text" class="validate"/>
                            <label for="customer_cmpy">Customer Company Name: </label>
                        </div>
                        <div class="input-field col s6">
                            <input id="customer_addrss" type="text" class="validate"/>
                            <label for="customer_addrss">Customer Company Address: </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">phone</i>
                            <input id="phone1" type="text" class="validate"/>
                            <label for="mobile_contact">Mobile: </label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix">dialer_sip</i>
                            <input id="phone2" type="text" class="validate"/>
                            <label for="work_contact">Telephone: </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="website" type="text" class="validate"/>
                            <label for="company_website">Company Website: </label>
                        </div>
                        <div class="input-field col s6">
                            <input id="email" type="text" class="validate"/>
                            <label for="company_email">Company Email: </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="contact_person" type="text" class="validate"/>
                            <label for="Contact_name">Company Contact Person: </label>
                        </div>
                        <div class="input-field col s6">
                            <input id="contact_person_mobile" type="text" class="validate"/>
                            <label for="contact_number">Contact Phone Number: </label>
                        </div>
                    </div>                  
                    <div class="center">
                        <button class="btn waves-effect waves-light green darken-2" type="submit" name="action">Save
                            <i class="material-icons left">save</i>
                        </button>
                        
                        <button class="btn waves-effect waves-light red darken-4" type="submit" name="delete">Delete
                            <i class="material-icons right">delete</i>
                        </button>
                        
                        <button class="btn waves-effect waves-light" type="reset" name="reset">Reset
                            <i class="material-icons right">restore</i>
                        </button>
                    </div>
                </form>
            </div>
            </div>
    </div>
          <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
</body>
</html>