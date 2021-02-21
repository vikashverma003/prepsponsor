@extends('layouts.admin')
@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <i class="fa fa-file-text-o"></i> Team View
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
                        <h3 class="box-title">Team Info</h3>
                       
                    </div>
                    <div class="box-body with-border info-table" style="overflow-y: auto;">
                        <table border = "1" cellpadding = "5" cellspacing = "5" class="post-table">    
      <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Zipcode</td>
              <td>{{$data->address}}</td>
         </tr>
		 
		  <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Group Name</td>
              <td>{{$data->group_name}}</td>
         </tr>
     <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Username</td>
            <td>{{$data->first_name}}</td>
         </tr>
     <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Contact Name</td>
            <td>{{$data->first_name}} {{$data->last_name}}</td>
         </tr>
     <tr>
       
       <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Contact Email</td>
          <td>{{$data->email}}</td>
         </tr>
     <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Team Member Names</td>
                @if (!empty($data->team_members))
               <td>
		     <ul>
                 @foreach(json_decode($data->team_members, true) as $info) 
               <li>{{$info['firstName']}}</li>
               @endforeach
			   </ul>
               </td>
               @else
                  <td><option>No additional members</option></td>
                @endif
         </tr>
     <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Mailing address for the organization
</td>
           <td>{{$data->mailing_address}}</td>
         </tr>
		 <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i> Costum Email</td>
           <td>{{$data->mail_add_groupname}}</td>
         </tr>
		 
     <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Website</td>
          <td>{{$data->website_fb_page}}</td>
         </tr>
     <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Participant Number</td>
          <td>{{$data->member_participants}}</td>
         </tr>
     <!-- <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Sponsor Page</td>
               <td><a href="#">Sponsor Page</a></td>
         </tr> -->
          <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Admin Page</td>
             <td>Admin Page</td>
         </tr>
          <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Max Sponsorship</td>
             <td>Max Sponsorship</td>
         </tr>
          <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Current Raised Funds</td>
            <td>Current Raised Funds</td>
         </tr>
          <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Email Launch Timestamp</td>
            <td>Email Launch Timestamp</td>
         </tr>
          <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Total Number of Yelp Listings Searched</td>
            <td>Total Number of Yelp Listings Searched</td>
         </tr>

         <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Number of Emails Sent</td>
             <td>Number of Emails Sent</td>
         </tr>
         <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Edit Team</td>
           <td><a href="{{url('/admin/teams/')}}/{{$data->id}}/edit">Edit </a></td>  
         </tr>
         <tr>
            <td><i class="fas fa-long-arrow-alt-right"></i>Delete Team</td>
            <td><a href="{{url('/admin/teams/')}}/{{$data->id}}/delete">Delete </a></td>
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