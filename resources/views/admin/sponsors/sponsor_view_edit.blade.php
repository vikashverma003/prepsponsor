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
            <form role="form" action="{{url('/admin/sponsor_view/sponsor_view_update/')}}/{{$sponsor_data->id}}" method="post" enctype="multipart/form-data">
			@csrf
                <div class="box-body">
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="exampleInputEmail1">Sponsor Name</label>
				 <input type="text" class="form-control" name="business_name" value="{{$sponsor_data->business_name}}" id="business_name" placeholder="Sponsor Name">
				 </div>
				
				<div class="col-md-6">
				 <label for="main_activity">city</label>
				 <input type="text" class="form-control" name="city" value="{{$sponsor_data->city}}" id="city" placeholder="city">
				  </div>
				 </div>
				</div>

				 <div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="exampleInputEmail1">location</label>
				 <input type="text" class="form-control" name="location" value="{{$sponsor_data->location}}" id="location" placeholder="location">
				 </div>  
				
				<div class="col-md-6">
				 <label for="main_activity">phone</label>
				 <input type="text" class="form-control" name="phone" value="{{$sponsor_data->phone}}" id="phone" placeholder="phone">
				  </div>
				 </div>
				</div>
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="member_participants">Email</label>
				 <input type="email" class="form-control" name="email" value="{{$sponsor_data->email}}" id="email" placeholder="email">
				 </div>
				
				<!--<div class="col-md-6">
				 <label for="mail_add_groupname">Team Id</label>
				 <input type="text" class="form-control" name="team_id" value="{{$sponsor_data->team_id}}" id="team_id" placeholder="teams_id">
				 </div> -->
				 <div class="col-md-6">
				 <label for="member_participants">Address</label>
				 <input type="text" class="form-control" name="address" value="{{$sponsor_data->address}}" id="address" placeholder="address">
				 </div>
				 
				 </div>
				</div>
				<!--<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="member_participants">Address</label>
				 <input type="text" class="form-control" name="address" value="{{$sponsor_data->address}}" id="address" placeholder="address">
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