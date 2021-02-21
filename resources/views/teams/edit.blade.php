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

			@if ($errors->any())
   				 <div class="alert alert-danger">
       				 <ul>
           				 @foreach ($errors->all() as $error)
               				 <li>{{ $error }}</li>
            			@endforeach
        			</ul>
    			</div>
			@endif		 
            <div class="box-header with-border">
               <h3 class="box-title">Edit GROUP</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
          <!--  <form role="form" action="{{url('/admin/teams/{$team_data->id}/update')}}" method="post" enctype="multipart/form-data"> -->

          	<form role="form" action="{{url('/admin/teams/')}}/{{$team_data->id}}" method="post" enctype="multipart/form-data">

			@csrf
			<input type="hidden" name="_method" value="PUT">

               <div class="box-body">
				<div class="form-group">
				  <div class="row">
				  <div class="col-md-6">
					<label>Group Type</label>
					<select name="grouptype" class="form-control select2" style="width: 100%;">
					  <option value="One team" selected="selected">One team</option>
					  <option value="Entire travel club" >Entire travel club</option>
					  <option value="League" >League</option>
					  <option value="Entire school athletic department" >Entire school athletic department</option>
					  <option value="School band" >School band</option>
					</select>
				  </div>

				  <div class="col-md-6">
					<label>Group Name:</label>

					<div class="input-group">
					  
					  <input type="text" class="form-control" name="group_name" placeholder="group name" value = "{{$team_data->group_name}}" data-mask>
					</div>
					<!-- /.input group -->
				  </div>


				  <div class="col-md-6">
					<label>Address:</label>

					<div class="input-group">
					  
					  <input type="text" class="form-control" name="address" placeholder="address" value = "{{$team_data->address}}" data-mask>
					</div>
					<!-- /.input group -->
				  </div>
				  
				  <div class="col-md-6">
					<label>Phone:</label>

					<div class="input-group">
					  <div class="input-group-addon">
						<i class="fa fa-phone"></i>
					  </div>
					  <input type="number" class="form-control" name="phone" placeholder="(999) 999-9999" value = "{{$team_data->phone}}" data-mask>
					</div>
					<!-- /.input group -->
				  </div>
				  </div>
				</div>
			   
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="exampleInputEmail1">Email address</label>
				 <input type="email" class="form-control" name="email" id="exampleInputEmail1" placeholder="Enter Email" value = "{{$team_data->email}}">
				 </div>
				
				<div class="col-md-6">
				 <label for="main_activity">Group’s Main Activity</label>
				 <input type="text" class="form-control" name="main_activity" id="" placeholder="Group’s Main Activity" value = "{{$team_data->main_activity}}">
				  </div>
				 </div>
				</div>
				
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="first_name">First Name</label>
				 <input type="text" class="form-control" name="first_name" id="first_name" placeholder="First Name" value = "{{$team_data->first_name}}">
				 </div>
				
				 <div class="col-md-6">
				 <label for="last_name">Last Name</label>
				 <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Last Name" value = "{{$team_data->last_name}}">
				  </div>
				 </div>
				</div>
                  
				  
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="title">Title</label>
				 <input type="text" class="form-control" name="title" id="title" placeholder="Title" value = "{{$team_data->title}}" >
				 </div>
				
				 <div class="col-md-6">
				 <label for="website_fb_page">Website / FB page link</label>
				 <input type="text" class="form-control" name="website_fb_page" id="website_fb_page" placeholder="Your Group’s Website or Facebook Page" value = "{{$team_data->website_fb_page}}">
				  </div>
				 </div>
				</div>
				
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="member_participants">Number of Member</label>
				 <input type="text" class="form-control" name="member_participants" id="member_participants" placeholder="Number of Member" value = "{{$team_data->member_participants}}">
				 </div>
				
				 <div class="col-md-6">
				 <label for="mail_add_groupname">Mailing Address For Groupname</label>
				 <input type="email" class="form-control" name="mail_add_groupname" id="mail_add_groupname" placeholder="Mailing Address For Groupname" value = "{{$team_data->mail_add_groupname}}">
				 </div>				 
				 </div>
				</div>			
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