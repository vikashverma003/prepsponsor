@extends('layouts.admin')
@section('content')

<section class="content">
   <div class="row">
      <!-- left column -->
      <div class="col-md-8">
         <div class="box box-primary">
		 
		 
			@if(Session::has('success'))
			<div class="alert alert-success">
				{{ Session::get('success') }}
				@php
					Session::forget('success');
				@endphp
			</div>
			@endif
		 
            <div class="box-header with-border">
               <h3 class="box-title">CREATE SPONSOR</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="{{url('/admin/sponsor_view/store/')}}" method="post" enctype="multipart/form-data">
			@csrf
                <div class="box-body">
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="exampleInputEmail1">Sponsor Name</label>
				 <input type="text" class="form-control" name="business_name" id="business_name" placeholder="Sponsor Name">
				 </div>				
				<div class="col-md-6">
				 <label for="main_activity">city</label>
				 <input type="text" class="form-control" name="city" id="city" placeholder="city">
				  </div>
				 </div>
				</div>

				 <div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="exampleInputEmail1">Zipcode</label>
				 <input type="number" class="form-control" name="location" id="location" placeholder="location">
				 </div>  
				
				<div class="col-md-6">
				 <label for="main_activity">phone</label>
				 <input type="text" class="form-control" name="phone" id="phone" placeholder="phone">
				  </div>
				 </div>
				</div>

          <!-- <input type="hidden" class="form-control" name="lat" id="" placeholder="lat">
           <input type="hidden" class="form-control" name="lng" id="" placeholder="lng">

				 <div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="first_name">Trip Advisor Email</label>
				 <input type="text" class="form-control" name="trip_advisor_email" id="trip_advisor_email" placeholder="trip advisor email">
				 </div>
				
				 <div class="col-md-6">
				 <label for="last_name">Yellow Page Email</label>
				 <input type="text" class="form-control" name="yellow_page_email" id="yellow_page_email" placeholder="yellow page email">
				  </div>
				 </div>
				</div>
                  
				  
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="title">Website email</label>
				 <input type="text" class="form-control" name="website_email" id="website_email" placeholder="website email">
				 </div>
				
				 <div class="col-md-6">
				 <label for="website_fb_page">Whois Email</label>
				 <input type="email" class="form-control" name="whoIs_email" id="whoIs_email" placeholder="whois email">
				  </div>
				 </div>
				</div> -->
				
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="member_participants">Email</label>
				 <input type="email" class="form-control" name="email" id="email" placeholder="email" required>
				 </div>
				
				 <!--<div class="col-md-6">
				 <label for="mail_add_groupname">Team Id</label>
				 <input type="text" class="form-control" name="team_id" id="team_id" placeholder="teams_id">
				 </div> -->
				 
				 <div class="col-md-6">
				 <label for="member_participants">Address</label>
				 <input type="text" class="form-control" name="address" id="address" placeholder="address">
				 </div>
				 
				 </div>
				</div>
				<!-- <div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="member_participants">Address</label>
				 <input type="text" class="form-control" name="address" id="address" placeholder="address">
				 </div>
				 </div>
				</div> -->

               <!-- /.box-body -->
               <div class="box-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</section>
@endsection		 