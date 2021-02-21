@extends('layouts.admin1')
@section('content')
	<div>
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
		</div>
<div class="wrapper">

            <form role="form" id="form" action="{{url('/admin/teams')}}" method="post" enctype="multipart/form-data">
            	@csrf
            	<div id="wizard">
            		<!-- SECTION 1 -->
	                <h4></h4>
	                <section>
	                	<div class="form-row">
	                    	<label for="">
			                    		What Type of Group You are Representing 
			                </label>
			                <div class="form-holder">
			                    	<select name="grouptype" class="form-control select2" style="width: 100%;">
									  <option value="One team" selected="selected">One team</option>
									  <option value="Entire travel club" >Entire travel club</option>
									  <option value="League" >League</option>
									  <option value="Entire school athletic department" >Entire school athletic department</option>
									  <option value="School band" >School band</option>
									</select>
									<i class="zmdi zmdi-caret-down"></i>
			                </div>
			            </div>
			              <div class="form-row">
	                    	<label for="">
	                    		Other - What activity does your organization do?
	                    	</label>
	                    	<input type="text" class="form-control" name="other_main_activity" id="" placeholder="Group’s Main Activity">
	                    </div>
		
	                    <div class="form-row">
	                    	<label for="">
	                    	What is the name of your organization?
	                    	</label>
	                    	<input type="text" class="form-control" name="group_name" placeholder="group name">
	                    </div>

	                    <div class="form-row">
	                    	<label for="">
	                    		Group’s Main Activity
	                    	</label>
							<br/>
	                    	<!--<input type="text" class="form-control" name="main_activity" id="" placeholder="Group’s Main Activity"> -->
							 <div class="form-holder">
								<select name="main_activity" class="form-control select2" style="width: 100%;">
								<option value="">select activity</option>
								<option value="Aquatics">Aquatics</option>
								<option value="Band">Band</option>
								<option value="Baseball">Baseball</option>
								<option value="Basketball">Basketball</option>
								<option value="Cheer/Dance">Cheer/Dance</option>
								<option value="CC/Track">CC/Track</option>
								<option value="Football">Football</option>
								<option value="Hockey">Hockey</option>
								<option value="Lacrosse">Lacrosse</option>
								<option value="Soccer">Soccer</option>
								<option value="Tennis">Tennis</option>
								<option value="Volleyball">Volleyball </option>
								<option value="Other">Other </option>
								
								</select>
								<i class="zmdi zmdi-caret-down"></i>
							</div>
							
	                    </div>
	                      <div class="form-row">
	                    	<label for="">
	                    		Mailing address for the Organisation:
	                    	</label>
	                    	<input type="text" class="form-control" name="mailing_address" id="exampleInputEmail1" placeholder="enter mailing address">
	                    </div>		

	                      <div class="form-row">
	                    	<label for="">
	                    		Zipcode:*
	                    	</label>
	                    	<input type="number" class="form-control" name="address" placeholder="Only US(zipcode) like 90001">
	                    </div>


	                      <div class="form-row">
	                    	<label for="">
	                    	In this year’s group, how many youth/student participants do you estimate will be enrolled?
	                    	</label>
	                    	<input type="text" class="form-control" name="member_participants" id="member_participants" placeholder="Number of Member">
	                    </div>	
	                </section>
	                
					<!-- SECTION 2 -->
	                <h4></h4>
	                <section>
	                	<h3>Contact Information</h3><br>
	                	<h5>Who is the primary point-of-contact for managing raised funds?</h5><br><br>
	                	<div class="form-row form-group">
	                    	<div class="form-holder">
	                    		<label for="">
	                    		First Name 
		                    	</label>
	                    		<input type="text" class="form-control" name="first_name" id="first_name" placeholder="First Name" required>
	                    	</div>
	                    	<div class="form-holder">
	                    		<label for="">
	                    		Last Name 
		                    	</label>
	                    		<input type="text" class="form-control" name="last_name" id="last_name" placeholder="Last Name">
	                    	</div>
	                    </div>
	                     <div class="form-row">
	                    	<label for="">
	                    		Email:
	                    	</label>
	                    	<input type="email" class="form-control" name="email" id="exampleInputEmail1" placeholder="Enter Email">
	                    </div>

	                	<div class="form-row">
	                    	<label for="">
	                    		Phone:
	                    	</label>
	                    	<div class="input-group-addon">
						       <i class="fa fa-phone"></i>
					        </div>
	                    	<input type="number" class="form-control" name="phone" placeholder="(999) 999-9999" >
	                    </div>

	                    <div class="form-row">
	                    	<label for="">
	                    		Facebook Page
	                    	</label>
	                    	<input type="text" class="form-control" name="website_fb_page" id="website_fb_page" placeholder="Your Group’s Website or Facebook Page">
	                    </div>

	                </section>

	                <!-- SECTION 3 -->
	                <h4></h4>
	                <section>
	                	<h3>Set Your Sponsorship Tiers</h3><br>
	                    <p style="width:800px; height:50px;">Set your sponsorship levels & value below! Successfully sponsored organization have four tiers like below to maximize contributions. Please customize your own group’s sponsorship options and fill in the description of what you are providing each sponsor (see example descriptions at
                        bottom for ideas!).
                        </p>
						
				            <div class="card-body" style="width:800px; height:600px;">
				              <div class="table-responsive">
				                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				                  <thead>
				                    <tr>
				                      <th>Tier Name</th>
				                      <th>Active</th>
				                      <th>Description</th>
				                      <th>Sponsor Amount</th>
				                      <th>Slot Available</th>
				                      <th>Total</th>
				                      <th>Select</th>
				                   
				                      
				                    </tr>
				                  </thead>
				                  <tbody>
				                  	
				                  	@foreach($spo as $sp)

				                    <tr>
				                    <td>{{$sp->tier_name}}</td>
				                    <td>{{$sp->active}}</td>
				                    <td>{{$sp->description}}</td>
				                    <td>{{$sp->sponsor_amount}}</td>
				                    <td>{{$sp->slot_available}}</td>
				                    

				                    <td>{{$sp->Total}}</td>
				                    <td><input type="checkbox" name="data" value="{{$sp->tier_name}}"></td>	

				                    <td><a href="{{url('/admin/editPackage/')}}/{{$sp->id}}">Edit Package</a></td>	

				                    </tr>
				                   @endforeach
				                   
				                  </tbody>

				                </table>
				              </div>
				              <p>Here are some examples of sponsorship tiers</p>
				              <p>As the exclusive Diamond sponsor, your business will get its logo on team jerseys as well as a full page ad in our spring tournament booklet which
								is viewed by 5000 participants. Also, we will send out an email about your company (including a coupon or other time-sensitive offer) to our entire
								membership database 2x per year (your choice). Your logo will be placed prominently on our website so that every family in our township will
								know of your generosity in supporting our local travel club.
								</p> 
								<p>At the end of your sponsorship campaign you will receive the net proceeds (%amount% less 15% transaction fee).</p>
								<p>Before clicking the CONFIRM button, please read the Sponsorship Agreement
								<p class="step-third-checkbox">	
								<input type="checkbox" name="agree" data-toggle="modal" data-target="#myModal">
								 I have read and accepted the terms and conditions.</p>

								  <!-- Trigger the modal with a button -->
  <!-- Trigger the modal with a button -->
   <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Sponsorship Agreement</h4>
        </div>
        <div class="modal-body">
         <h5> TERMS OF AGREEMENT:</h5>
		<div>6. In the event of a dispute arising that the parties themselves cannot resolve, the parties agree to refer the matter to an independent
		arbitrator appointed by mutual agreement.</div>
		<div>7. If the parties cannot agree on an arbitrator, or both parties do not agree with the decision of the arbitrator appointed, the agreement
		may be terminated in the following manner:
		a) If the breach is one that can be rectified, then the non-breaching party can request in writing that the breach be rectified in 14 days. If
		the breach is not rectified within that time, the non-breaching party may terminate the Agreement immediately;
		b) If the breach is one that cannot be rectified, the non-breaching party may terminate the Agreement by giving 14 days written notice of
		their intention to terminate.
		c) If either party goes into liquidation, is wound up, dissolved (except for the purpose of reconstruction or amalgamation), enters into a
		scheme of arrangement or is placed under official management or in receivership, the other party may terminate the Agreement by giving
		14 days written notice of their intention to terminate under the clause.
		d) In the event of a termination under this Agreement, each party’s rights and liabilities will cease immediately but the termination shall
		not affect a party’s rights arising out of a breach of this agreement by the other party.</div>
		<div>8. Where one party is unable to carry out its obligations under this agreement due to circumstances beyond its control or which it could
		not have prevented, those obligations are suspended whilst those circumstances continue, provided the other party is notified and the first
		party uses its best endeavours to overcome the circumstances preventing its obligations from being carried out.</div>
		<div>9. Each party shall indemnify the other against any claims arising from any breach of the agreement by either party.</div>
		10. The terms and conditions of this agreement shall not be disclosed to any third parties without the prior written consent of both
		parties.
		11. The rights of either party under this agreement shall not be transferable or assignable either in whole or in part.

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	                </section>

	                <!-- SECTION 4 -->
	                <h4></h4>
	                <section>

						<div class="form-group add_member" >
						<div class="input_fields_wrap">
						<button class="add_field_button"><i class="fa fa-plus" aria-hidden="true">Add another staff member</i></button>

	                	<div class="form-row form-group">
	                    	<div class="form-holder">
	                    		<label for="">
	                    		First Name 
		                    	</label>
	                    		<input type="text" class="form-control" name="member_firstname[]" id="member_firstname" placeholder="First Name">
	                    	</div>
	                    	<div class="form-holder">
	                    		<label for="">
	                    		Last Name 
		                    	</label>
	                    		<input type="text" class="form-control" name="member_lastname[]" id="member_lastname" placeholder="Last Name">
	                    	</div>
	                    </div>	
	                    
	                     <div class="form-row">
	                    	<label for="">
	                    		Email address:
	                    	</label>
	                    	<input type="email" class="form-control" name="member_email[]" id="member_email" placeholder="Email Address">
	                    </div>	
	                    </div>
					</div>					
	                </section>

               <div class="box-footer " style="display:none;">
                  <button type="submit" class="btn btn-primary submit-form">Submit</button>
               </div>
            	</div>
        </form>
</div>

@endsection		 