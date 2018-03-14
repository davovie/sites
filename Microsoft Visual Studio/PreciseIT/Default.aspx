 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Precise IT Affairs ! Welcome</title> 
    <meta name="viewport" content="width=device-width initial-scale=1" />
    <link href="css/Style.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <nav class="navbar navbar-inverse">
                 <div class="container-fluid" >
                    <div class="navbar-header">
                              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                              </button>
                            <h1 class="navbar-brand"><span class="highlight">Precise</span><a href="#"> IT Affairs</a></h1>
                            <div class="collapse navbar-collapse" id="myNavbar">
                                 <ul class="nav navbar-nav pull-right">
                                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                 </ul>
                            </div>
                    </div>
                </div>
            </nav>
        <div class ="jumbotron" id="info-display">
                <h1>Affordable Proffessional IT Services</h1>
                <p>jdkfjsdkfhokdhkndf njasndfokhsdkfhoidajf  njsnhdfokhsdfoihsdhfiods  bjusdhfi  ahioashoifhjs usdhbfcushd busdbciudsHB</p>
        </div>
        
        
        <div class ="newsletter">
                <h1>Subscribe to our Newsletter</h1>
                <div class ="form">
                    <input type ="email" placeholder="Enter Email" />
                    <asp:Button class="Button1" runat="server" Text="Submit" />
                </div>
        </div>
        
        <div class="container" id="content">
            <h1 class="txt"> What we do </h1>
            <div class="row">
                <div class ="col-xs-4">
                    <img src="images/Pos.jpg"  width: 157px  height: 95px;  />
                    <h3>Desktop Applicatons</h3>
                    <p>We design destop applications like Retail Pos, School Mgt and more</p>
                </div>
                <div class ="col-xs-4">
                    <img src="images/Pos.jpg" />
                    <h3>Web Applicatons</h3>
                    <p>We design Web applications like Retail Pos, School Mgt and more</p>
                </div>
                <div class ="col-xs-4">
                    <img src="images/Pos.jpg" class="auto-style1" />
                    <h3>Mobile Applicatons</h3>
                    <p>We design Mobile applications like Retail Pos, School Mgt and more</p>
                </div>
            </div>
        </div>
        <footer >
            <p>Precise IT Affairs, CopyRight &copy; 2017</p>
        </footer>
        </div>
    </form>
</body>
</html>
