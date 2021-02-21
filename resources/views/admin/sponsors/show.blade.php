@extends('layouts.admin')
@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <i class="fa fa-file-text-o"></i> Sponsors View
        </h1>
        <ol class="breadcrumb">
          
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
    <div id='user-user-entry'>
    </div>
  <div class="row">
    <div class="col-md-7">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Sponsors Info</h3>
                       
                    </div>
                    <div class="box-body with-border info-table" style="overflow-y: auto;">
                        <table border = "1" cellpadding = "5" cellspacing = "5" class="post-table">

         <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Trip Advisor Email</td>
              <td>{{$data->trip_advisor_email}}</td>
         </tr>

      <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Yellow Pages Email</td>
              <td>{{$data->yellow_pages_email}}</td>
         </tr>
     <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Whois Email</td>
            <td>{{$data->whoIs_email}}</td>
         </tr>
     <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Manually Email</td>
            <td>{{$data->manually_email}} </td>
         </tr>
     <tr>
       
       <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Team Id</td>
          <td>{{$data->team_id}}</td>
         </tr>

         <?php
         $id = $data['team_id'];
         ?>

          <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Unsubscribe Date</td>
          <td>{{$data->unsubscribe_date}}</td>
         </tr>

          <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Sponsorship Tier</td>
          <td>{{$data->sponsorship_tier}}</td>
         </tr>

          <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Sponsorship Amount</td>
          <td>{{$data->sponsorship_amount}}</td>
         </tr>

          <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Sponsorship Date</td>
          <td>{{$data->sponsorship_date}}</td>
         </tr>

         <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Edit sponsors</td>
           <td><a href="{{url('/admin/sponsors/')}}/{{$data->id}}/edit">Edit </a></td>  
         </tr>
         <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Delete sponsors</td>
            <td><a href="{{url('/admin/sponsors/')}}/{{$data->id}}/delete">Delete </a></td>
         </tr>

         <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Created_at</td>
          <td>{{$data->created_at}}</td>
         </tr>

         <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Updated_at</td>
          <td>{{$data->updated_at}}</td>
         </tr>

         <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Sponsorship url</td>
          <td><a href="{{url('/admin/selectPackage/')}}/{{$data->team_id}}">sponsorship url</a></td>
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