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
               <h3 class="box-title">Edit Packages</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="/presponsor/admin/editPackage/{{$spo->id}}/update" method="post" enctype="multipart/form-data">
			@csrf
                <div class="box-body">
				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="exampleInputEmail1">Tier_Name</label>
				 <input type="text" class="form-control" name="tier_name" id="tier_name" placeholder="participants" value={{$spo->tier_name}}>
				 </div> 
				
				<div class="col-md-6">
				 <label for="main_activity">Active</label>
				 <input type="text" class="form-control" name="active" id="active" placeholder="active" value={{$spo->active}}>
				  </div>
				 </div>
				</div>


				<div class="form-group">
				 <div class="row">
				 <div class="col-md-6">
				 <label for="member_participants">Description</label>
				 <input type="text" class="form-control" name="description" id="description" placeholder="description" value={{$spo->description}}>
				 </div>
				
				 <div class="col-md-6">
				 <label for="mail_add_groupname">Sponsor_amount</label>
				 <input type="text" class="form-control sp_name" name="sponsor_amount" id="sponsor_amount" placeholder="sp_amount"  value={{$spo->sponsor_amount}}>
				 </div>
				 
				 </div>
				</div>

				<div class="form-group">
				 <div class="row">

				 <div class="col-md-6">
				 <label for="member_participants">Slot Available</label>
				 <input type="text" class="form-control sp_name" name="slot_available" id="slot_available" placeholder="slot_available" value={{$spo->slot_available}}>
				 </div>

				 <div class="col-md-6">
				 <label for="member_participants">Total</label>
				 <input type="text" class="form-control" name="total" id="total" placeholder="total"value={{$spo->Total}}>
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




<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
	
$(document).ready(function(){

$(".sp_name").on("change keyup", function(){

	// alert(24);
var slot_available = $("#slot_available").val();

var sponsor_amount = $("#sponsor_amount").val();

var totalincome = parseInt(slot_available) * parseInt(sponsor_amount);

$("#total").val(totalincome);
 

});


});


</script>


@endsection		 