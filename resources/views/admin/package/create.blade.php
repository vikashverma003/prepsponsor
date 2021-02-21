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
               <h3 class="box-title">CREATE Package</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="{{url('/admin/package')}}" method="post" enctype="multipart/form-data">
			@csrf
			<input type="hidden" method="put">
                <div class="box-body">
				

				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="exampleInputEmail1">Participants</label>
				 <input type="text" class="form-control" name="participants" id="participants" placeholder="participants">
				 </div> 
				
				<div class="col-md-6">
				 <label for="main_activity">Diamond</label>
				 <input type="text" class="form-control" name="diamond" id="" placeholder="diamond">
				  </div>
				 </div>
				</div>


				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="member_participants">Platinum</label>
				 <input type="text" class="form-control" name="platinum" id="platinum" placeholder="platinum">
				 </div>
				
				 <div class="col-md-6">
				 <label for="mail_add_groupname">Gold</label>
				 <input type="text" class="form-control" name="gold" id="gold" placeholder="gold">
				 </div>
				 
				 </div>
				</div>

				<div class="form-group">
				 <div class="row">

				 <div class="col-md-6">
				 <label for="member_participants">Silver</label>
				 <input type="text" class="form-control" name="silver" id="silver" placeholder="silver">
				 </div>
				</div></div>
				
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