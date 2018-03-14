 function userValid() {
var FName,LName, con, username;
FName = document.getElementById("txtFName").value;
//LName= document.getElementById("txtLName").value;
//username = document.getElementById("txtUserName").value;
//con = document.getElementById("txtPassword").value;
//EmailId = document.getElementById("txtmail").value;
//emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id
if (FName == "" ) 
{
    alert("Enter All Fields");
    return false;
}
}