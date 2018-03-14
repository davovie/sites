<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
       
                            
                            <label>Number</label>
                            <input type="type" id="t1"  />
                               <input type="button" id="bi" value="insert" onclick="insert();"/>
                                 <label>Date</label>
                            <input type="text" id="t2" />
                            <label>Prepared By</label>
                            <asp:TextBox ID="txtPrepareby" class="form-control" Width="17%" placeholder="Enter Name" runat="server"></asp:TextBox>
                            
    </div>
    </form>
    <script type="text/javascript">
    function insert(){ 
    var name = document.getElementById("ti").value;
     var city = document.getElementById("t2").value;
     
     var xmlhttp = new XMLHttpRequest();
     xmlhttp.open("GET", "insert.aspx?nm=" + name + "&ct=" + city, false );
     xmlhttp.send(null)
      
      alert("Inserted");
    }
</script>
</body>
</html>
