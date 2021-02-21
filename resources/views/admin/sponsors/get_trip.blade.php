@extends('layouts.admin')
@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <i class="fa fa-file-text-o"></i> TripAdvisor Data
        </h1>
        <ol class="breadcrumb">
          
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
    <div id='user-user-entry'>
    </div>
  <div class="row">
    <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title"></h3>
                       
                    </div>
                    <div class="box-body with-border info-table" style="overflow-y: auto;">
                        <table border = "1" cellpadding = "5" cellspacing = "5" class="post-table">    
      <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> City</td>
              <td>{{$get_trip_data->city}}</td>
         </tr>
		 
		  <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Business Name</td>
              <td>{{$get_trip_data->business_name?$get_trip_data->business_name:''}}</td>
         </tr>
     <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Latitude</td>
            <td>{{$get_trip_data->latitude !=''?$get_trip_data->latitude:'not found'}}</td>
         </tr>
     <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Longitude</td>
            <td>{{$get_trip_data->longitude !=''?$get_trip_data->longitude:'not found'}}</td>
         </tr>
     <tr>
       
       <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Phone</td>
          <td>{{$get_trip_data->phone}}</td>
         </tr>
		@if(!empty($additional_data->location)) <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Address</td>
          <td>{{$additional_data->location->address1}}</td>
         </tr>
		 @endif
		@if(!empty($additional_data->location)) <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> City</td>
          <td>{{$additional_data->location->city !=''?$additional_data->location->city:''}}
		  </td>
         </tr>
		  @endif
		 @if(!empty($additional_data->location))<tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Reviews Count</td>
          <td>{{$additional_data->review_count}}</td>
         </tr>@endif
		 
		 @if(!empty($additional_data->location))<tr> 
            <td><i class="fas fa-long-arrow-alt-right"></i> Rating </td>
          <td>{{$additional_data->rating}}</td>
         </tr>@endif
		  @if(!empty($additional_data->location))<tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Images </td>
          <td> <img style="height:50px;" src="{{$additional_data->image_url}}" /></td>
         </tr>@endif
		 
		 <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Email</td>
          <td>{{$get_trip_data->email?$get_trip_data->email:'not found'}}</td>
         </tr>
           <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Source</td>
          <td>{{$get_trip_data->source?$get_trip_data->source:'www.tripadvisor.com'}}</td>
         </tr>
   
      </table>
                    </div>
                </div>
            </div>
     <!-- <div class="col-md-5">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Images</h3>
                        
                    </div>
                    <div class="box-body with-border" style="overflow-y: auto;">
              <div class="image-gallery">
              
              
              <div class="image-gallery">
             
                
                <div class="inner-image"> 
                  
                </div>
                  
                
              <div class="inner-image"> 
                <img src="http://3.13.112.197/admin/public/themes/admin/assets/img/dummy.png">
              </div>
                  
              </div>
              
          
              </div>
                    </div>
                </div>
            </div> -->
  </div>
   
    
    
    
    
    
  </section>
</div>
@endsection