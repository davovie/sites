<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Precise IT Affairs ! Services</title> 
    <meta name="viewport" content="width=device-width" />
    <link href="css/Style.css" rel="stylesheet" />
    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    .Button1{
        height: 35px;
        width: 75px;
    background:lime;
    color :#ffffff;
    padding : 0 20px 0 20px;
    border : 0px;
    margin-top: 8px;
}
    ul#services li{
        list-style : none;
        padding : 20px;
        border :#cccccc solid 1px;
        margin-bottom: 5px;
        background:#e6e6e6;
    }
    #main-col h1{
        
         margin-bottom: 0px;
         padding: 0 0  0 35px;
    }
 aside#sidebar{
    margin-top: 70px;
   
}
   #sidebar .dark{

margin-top: 0px;
padding : 0 0 0 15px;
    }
   #t1,#t2,#t3{
     
       width: 90%;
   }
    #main-col{
       
    }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="header" >
            <div class="container">
                <div id="branding">
                    <h1><span class="highlight">Precise</span> IT Affairs</h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="Default.aspx">Home</a></li>
                        <li><a href="About.aspx">About</a></li>
                        <li class="current"><a href="Services.aspx">Services</a></li>
                    </ul>
                </nav>
            </div>
        </div>
       
        <section id ="newsletter">
            <div class ="container">
                <h1>Subscribe to our Newsletter</h1>
                <div class ="form">
                    <input type ="email" placeholder="Enter Email" />
                    <asp:Button class="Button1" runat="server" Text="Submit" />
                </div>
            </div>
        </section>
        <section id ="main">
            <div class ="container">
              <article id="main-col">
                  <h1 class="page-tittle">Our Services</h1>
                  <ul id="services">
                      <li>
                          <h3>Desktop Application Design</h3>
                          <p>
                         jdkfjsdkfhokdhkndf njasndfokhsdkfhoidajf  njsnhdfokhsdfoihsdhfiods  bjusdhfi  ahioashoifhjs usdhbfcushd busdbciudsHB
                        </p>
                          <p>
                         Pricing: N50,000.00 to N150,000.00 
                        </p>
                      </li>
                        <li>
                          <h3>Web Site Design</h3>
                          <p>
                         jdkfjsdkfhokdhkndf njasndfokhsdkfhoidajf  njsnhdfokhsdfoihsdhfiods  bjusdhfi  ahioashoifhjs usdhbfcushd busdbciudsHB
                        </p>
                          <p>
                         Pricing: N80,000.00 to N150,000.00 
                        </p>
                      </li>
                        <li>
                          <h3>Web Application Design</h3>
                          <p>
                         jdkfjsdkfhokdhkndf njasndfokhsdkfhoidajf  njsnhdfokhsdfoihsdhfiods  bjusdhfi  ahioashoifhjs usdhbfcushd busdbciudsHB
                        </p>
                          <p>
                         Pricing: N150,000.00 and Above
                        </p>
                      </li>
                  </ul>
                     
              </article>
                <aside id="sidebar">
                    <div class="dark">
                        <h3>Get a Quote</h3>
                       <div class ="quote">
                        
                           <table cellpadding="0" cellspacing="0" class="auto-style1">
                               <tr>
                                   <td>Name</td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:TextBox ID="t1" runat="server"></asp:TextBox>
                                   </td>
                               </tr>
                               <tr>
                                   <td>Email</td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:TextBox ID="t2" runat="server"></asp:TextBox>
                                   </td>
                               </tr>
                               <tr>
                                   <td>Message</td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:TextBox ID="t3" runat="server" TextMode="MultiLine"></asp:TextBox>
                                   </td>
                               </tr>
                           </table>
                        
                       </div>
                        <asp:Button class="Button1" runat="server" Text="Submit" />
                        </div>
                </aside>
            </div>
        </section>
        <footer >
            <p>Precise IT Affairs, CopyRight &copy; 2017</p>
        </footer>
    </form>
</body>
</html>
