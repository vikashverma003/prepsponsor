@extends('layouts.admin')
@section('content')

<section class="content">
   <div class="row">
      <!-- left column -->
      <div class="col-md-8">
         <div class="box box-primary">
		 
            <div class="box-header with-border">
               <h3 class="box-title">Teams Package</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="{{url('/admin/teams_package')}}/{{$package_edit->id}}/update" method="post" enctype="multipart/form-data">
			@csrf
			<input type="hidden" method="put">
                <div class="box-body">
				

				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="exampleInputEmail1">Tier Name</label>
				 <input type="text" class="form-control" name="tier_name" id="tier_name" value="{{$package_edit->tier_name}}" placeholder="participants">
				 </div> 
				
				<div class="col-md-6">
				 <label for="main_activity">Status</label>
				 <input type="text" class="form-control" name="active" id="active" value="{{$package_edit->active}}" placeholder="diamond">
				  </div>
				 </div>
				</div>


				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="member_participants">Description</label>
				 <input type="text" class="form-control" name="description" id="description" value="{{$package_edit->description}}" placeholder="platinum">
				 </div>
				
				 <div class="col-md-6">
				 <label for="mail_add_groupname">Sponsor Amount</label>
				 <input type="text" class="form-control" name="sponsor_amount" id="sponsor_amount" value="{{$package_edit->sponsor_amount}}" placeholder="gold">
				 </div>
				 
				 </div>
				</div>

				<div class="form-group">
				 <div class="row">

				 <div class="col-md-6">
				 <label for="member_participants">Slot Available</label>
				 <input type="text" class="form-control" name="slot_available" id="slot_available" value="{{$package_edit->slot_available}}" placeholder="silver">
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