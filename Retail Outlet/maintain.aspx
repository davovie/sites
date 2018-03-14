<%@ Page Language="C#" AutoEventWireup="true" CodeFile="maintain.aspx.cs" Inherits="maintain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" /> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Maintain - Online Retail POS</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo">Maintain - Online Retail POS</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="/Default.aspx">Home</a></li>
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <li><a href="#">Navbar Link</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
           </nav>
        </div>

        <div class="container">
        <div class="row center">
        <div class="col s12 m4">
            <a href="company_info.aspx">
               <div class="icon-block">
                <h2 class="center light-blue-text"><i class="material-icons">home</i></h2>
                <h6 class="center">Company Info</h6>
               </div>
            </a>
        </div>

        <div class="col s12 m4">
          <a href="/users.aspx">
              <div class="icon-block">
                <h2 class="center light-blue-text"><i class="material-icons">group</i></h2>
                <h6 class="center">Users</h6>
              </div>
          </a>
        </div>

        <div class="col s12 m4">
            <a href="customer.aspx">
                <div class="icon-block">
                    <h2 class="center light-blue-text"><i class="material-icons">person_add</i></h2>
                    <h6 class="center">Customers</h6>
                </div>
            </a>
        </div>
        </div>

        <div class="row center">
        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">report</i></h2>
            <h6 class="center">Staff Record</h6>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>
            <h6 class="center">Stock Record</h6>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">help</i></h2>
            <h6 class="center">Vendor</h6>
          </div>
        </div>
      </div>

      <div class="row center">
        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">report</i></h2>
            <h6 class="center">Chart of Account</h6>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>
            <h6 class="center">Service Record</h6>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">help</i></h2>
            <h6 class="center">Stock Category</h6>
          </div>
        </div>
      </div>
    </div>
    </form>
</body>
</html>
