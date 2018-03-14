<%@ Page Language="C#" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />  
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Users: Online Retail POS</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
</head>
<body>
    <%-- Navigation Section --%>
    <div>
           <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo">Users Accounts- Online Retail POS</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="/maintain.aspx"><i class="material-icons">navigate_before</i></a></li>
                    <li><a href="/Default.aspx">Home</a></li>                    
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <li><a href="#">Navbar Link</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
           </nav>
        </div>

    <%-- Page Content Area --%>
    <div class="container">
        <h3 class="center orange-text">Users Account Information</h3>
         <a class="btn-floating btn-large waves-effect waves-light orange modal-trigger" href="#users"><i class="material-icons">add</i></a>
        <div class="row">
            <form id="user_acc" runat="server">
            <div id="users" class="modal">
                <div class="modal-content">
                    <h4 class="center deep-orange-text">Add New User</h4>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="user_fname" type="text" class="validate"/>
                            <label for="user_firstname">First Name: </label>
                        </div>
                        <div class="input-field col s6">
                            <input id="user_lname" type="text" class="validate"/>
                            <label for="user_lastname">Surname: </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="uname" type="text" class="validate"/>
                            <label for="uname">Username: </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="pword" type="password" class="validate"/>
                            <label for="pword">Password: </label>
                        </div>
                        <div class="input-field col s6">
                            <input id="pword1" type="password" class="validate"/>
                            <label for="rpword">Retype Password: </label>
                        </div>
                    </div>
                </div>
            
            <div class="modal-footer">
                <a href="#!" class="modal-action modal-close waves-effect waves-green btn">Save</a>
                <a href="#!" class="modal-action modal-close waves-effect waves-green btn">Clear</a>
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

        $(document).ready(function () {
            // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
            $('.modal').modal();
        });

    </script>
</body>
</html>
