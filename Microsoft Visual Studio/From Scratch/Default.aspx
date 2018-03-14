<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainSection1" Runat="Server">

    <div class="container-fluid">
    <div id="carousel1" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carousel1" data-slide-to="0" class="active"></li>
      <li data-target="#carousel1" data-slide-to="1"></li>
      <li data-target="#carousel1" data-slide-to="2"></li>
      <li data-target="#carousel1" data-slide-to="2"></li>
      <li data-target="#carousel1" data-slide-to="2"></li>
      <li data-target="#carousel1" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="item active"><img src="images/plcmt1.jpg" alt="First slide image" class="center-block image-fill">
        <div class="carousel-caption">
          <h3>Women's Knit Wear</h3>
        </div>
      </div>
      <div class="item"><img src="images/plcmt2.jpg" alt="Second slide image" class="center-block image-fill">
        <div class="carousel-caption">
          <h3>Women's Knit Wear</h3>
        </div>
      </div>
      <div class="item"><img src="images/plcmt3.jpg" alt="Third slide image" class="center-block image-fill">
        <div class="carousel-caption">
          <h3>Babies & Children</h3>
        </div>
      </div>
      <div class="item"><img src="images/plcmt4.jpg" alt="Third slide image" class="center-block image-fill">
        <div class="carousel-caption">
          <h3>Babies & Children</h3>
        </div>
      </div>
      <div class="item"><img src="images/plcmt5.jpg" alt="Third slide image" class="center-block image-fill">
        <div class="carousel-caption">
          <h3>Babies & Children</h3>
        </div>
      </div>
      <div class="item"><img src="images/plcmt6.jpg" alt="Third slide image" class="center-block image-fill">
        <div class="carousel-caption">
          <h3>Babies & Children</h3>
        </div>
      </div>
    </div>
    <a class="left carousel-control" href="#carousel1" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a><a class="right carousel-control" href="#carousel1" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a></div>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainSection2" runat="server">
    <div class="container">
    <article>
    <h1>Kieni's Fashion</h1>
    <h2>Do you want to look good and stylish yet comfortable ?<br/>
    We've got just what you need.<br/>
    Check out these galleries </h2>
  </article>
    <div class="row">
    <div class="col-md-4">
      <div class="thumbnail"><img src="images/gallery/Ladies/thumbnail/Lace Dress (Front).jpg" alt="Thumbnail Image 1" class="image-fill">
        <div class="caption">
          <h3>Ladies' Wears</h3>
             <p><a href="Women's_Wear.html" class="btn btn-primary" role="button">Enter Gallery</a></p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail"><img src="images/gallery/Gents/thumbnail/sleeveless vest-wine.JPG" alt="Thumbnail Image 1" class="image-fill">
        <div class="caption">
          <h3>Men's Fashion</h3>
             <p><a href="Men's_Wear.html" class="btn btn-primary" role="button">Enter Gallery</a></p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail"><img src="images/gallery/kids/SWEATER SETS/thumbnail/DSCN0314.JPG" alt="Thumbnail Image 1" class="image-fill">
        <div class="caption">
          <h3>Babies & Children</h3>
             <p><a href="Babies'_Wear.html" class="btn btn-primary" role="button">Enter Gallery</a></p>
        </div>
      </div>
    </div>
  </div>

</asp:Content>

