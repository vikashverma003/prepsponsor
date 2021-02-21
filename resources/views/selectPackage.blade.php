<!DOCTYPE html> 
<html lang="en"> 
<head> 
<title>Packages Information</title> 
<meta charset="utf-8"> 
<meta name="viewport"
content="width=device-width, initial-scale=1"> 
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> 
<script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"> 
</script> 
<script src= 
"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"> 

</script>
<script src="https://kit.fontawesome.com/108b681151.js"></script>
<style>
.conatiner {
    width: 1170px;
    margin: 0px auto;
}
.package button {
    background: transparent;
    border: none;
   display: inline-block;
    background: #2d4ec3;
    color: #fff;
    padding: 6px 20px;
    text-align: center;
}
table.table.table-bordered.package thead {
    border-top: 1px solid #000;
}
.package button a{
  color: #fff;
}
table.table.table-bordered.package th {
    background: #ddd;
  border-bottom: none !important;
}
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
    border: 1px solid #000;
}
.reject-btn {
    text-align: center;
}
.reject-btn a {
    background: red;
    color: #fff;
    display: inline-block;
    padding: 10px 20px;
    margin-top: 20px;
}
</style> 
</head> 
<body> 
  
<nav class="navbar navbar-inverse navbar-fixed-top"> 
<div class="container-fluid"> 
    <div class="navbar-header"> 
    <a class="navbar-brand" href="#">SponsorsPackages</a> 
    </div> 
</div> 
</nav> 
<div class="conatiner">
  <br><br><br>
<h2>Package For Sponsors</h2>
  <p class="select-package">Please select the package for the sponsorhip</p> 
  <p>Funding youth organizations like ours is important for improving the life experience and skills of our youth members -- your sponsorship allows us to provide valuable services to these kids and their families.
  Plus, your support will be recognized, helping you grow your business.  Please select which sponsorship option fits best for giving you the recognition of your valuable contribution:
  </p>           
  
  <table class="table table-bordered package">
    <thead>
      <tr>

        <th>Tier</th>
        <th>Description</th>
        <th>Amount</th>
        <th>Status</th>
        <th>Select</th>
        
      </tr>
    </thead>
    <tbody>
      
        @foreach($package as $packages)
        <tr>
        <td>{{$packages->tier_name}}</td>
        <td>{{$packages->description}}</td>
        <td>{{$packages->Total}}</td>
        <td>{{$packages->active}}</td>
    
        <td><button type="button"><a href='{{url("/admin/addmoney/stripe")}}/{{$id}}/{{$sponsor_id}}'>Select</a></button></td>
         </tr>
        @endforeach
       
                  
    </tbody>	
  </table>
  <div class="reject-btn"><a href="{{url("/admin/addmoney/stripeDonation")}}/{{$id}}/{{$sponsor_id}}"> Click Here to Reject
Sponsorship Request
 </a></div> 
 <!-- <div class="reject-btn"><a href="#"> Click Here to Reject
Sponsorship Request
 </a></div>-->
</div>
  
</body> 
</html> 