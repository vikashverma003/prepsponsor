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
            <form role="form" action="{{url('/admin/sponsors')}}" method="post" enctype="multipart/form-data">
			@csrf
                <div class="box-body">
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="exampleInputEmail1">Sponsor Name</label>
				 <input type="text" class="form-control" name="sponsor_name" id="Sponsor" placeholder="Sponsor Name">
				 </div>
				
				<div class="col-md-6">
				 <label for="main_activity">Category</label>
				 <input type="text" class="form-control" name="category" id="category" placeholder="category name">
				  </div>
				 </div>
				</div>

				 <div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="exampleInputEmail1">Yelp Website</label>
				 <input type="text" class="form-control" name="yelp_website" id="yelp_website" placeholder="yelp Website">
				 </div>  
				
				<div class="col-md-6">
				 <label for="main_activity">Yelp Address</label>
				 <input type="text" class="form-control" name="yelp_address" id="" placeholder="yelp address">
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
				 <label for="member_participants">Manual Email</label>
				 <input type="email" class="form-control" name="manually_email" id="manually_email" placeholder="manually_email">
				 </div>
				
				 <div class="col-md-6">
				 <label for="mail_add_groupname">Team Id</label>
				 <input type="text" class="form-control" name="team_id" id="team_id" placeholder="teams_id">
				 </div>
				 
				 </div>
				</div>

				<!-- <div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="member_participants">Unsubscribe Date</label>
				 <input type="date" class="form-control" name="unsubscribe_date" id="unsubscribe_date" placeholder="unsubscribe_date">
				 </div>
				
				 <div class="col-md-6">
				 <label for="mail_add_groupname">Sponsorship Tier</label>
				 <input type="text" class="form-control" name="sponsorship_tier" id="sponsorship_tier" placeholder="sponsorship_tier">
				 </div>
				 
				 </div>
				</div>


				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="member_participants">Sponsorship Amount</label>
				 <input type="text" class="form-control" name="sponsorship_amount" id="sponsorship_amount" placeholder="sponsorship_amount">
				 </div>
				
				 <div class="col-md-6">
				 <label for="mail_add_groupname">Sponsorship Date</label>
				 <input type="date" class="form-control" name="sponsorship_date" id="sponsorship_date" placeholder="sponsorship_date">
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