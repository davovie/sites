<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 175px;
        }
        .style2
        {
           margin-left:150px;
        }
        .style3
        {
            height: 175px;
            width: 53px;
        }
        .style4
        {
            width: 53px;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
    
    <div class="container">
  <div class="header">
      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
  <div class="sidebar1">
  <div id="nav">
    <ul>
      <li><a href="#">Link one</a></li>
      <li><a href="#">Link two</a></li>
      <li><a href="#">Link three</a></li>
      <li><a href="#">Link four</a></li>
    </ul>
</div>
    <div class="aside">
      <p> The above links demonstrate a basic navigational structure using an unordered list styled with CSS. Use this as a starting point and modify the properties to produce your own unique look. If you require flyout menus, create your own using a Spry menu, a menu widget from Adobe's Exchange or a variety of other javascript or CSS solutions.</p>
      <p>If you would like the navigation along the top, simply move the ul to the top of the page and recreate the styling.</p>
    </div>
  <!-- end .sidebar1 --></div>
  <div class="content">
         <h2 class="style2">Login Form</h2>
         
       <table width="312" align="center">
         <tr>
           <td class="style3">&nbsp;</td>
           <td width="144" class="style1">
                     </td>
         </tr>
         
               <tr>
           <td class="style4">Name:</td>
           <td>
               <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                   </td>
         </tr>
         <tr>
           <td class="style4"><label for="password">Password:</label></td>
           <td>
               <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
             </td>
         </tr>
         <tr>
           <td class="style4">&nbsp;</td>
           <td>
               <asp:Button ID="Button1" runat="server" Text="Button" />
             </td>
         </tr>
       </table>
         </div>
          
  <div class="footer">
    <p>This footer contains the declaration position:relative; to give Internet Explorer 6 hasLayout for the footer and cause it to clear correctly. If you're not required to support IE6, you may remove it.</p>
     
  </div>
   </div> 
    </form>
</body>
</html>
