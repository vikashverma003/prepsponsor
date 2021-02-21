@extends('layouts.admin')
@section('content')
	<div class="container-fluid">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">SPONSORS</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">TEAMS</h6>
			  <h6 class="m-0 font-weight-bold text-primary right" style="float:right;"><!-- <a href="{{url('/admin/sponsors/create/')}}"><i class="fa fa-user-plus" aria-hidden="true"></i>CREATE SPONSOR</a>--></h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Sponsor Name</th>
                      <th>Yelp Address</th>
                      <th>Phone</th>
					   <th>Email</th>
					   <th>TripAdvisor Data</th>
					    <th>Yellowpage Data</th>
                    </tr>
                  </thead>
                   <tbody>
                    @foreach($data as $d)
                     <tr>
                      <!-- <td>{{$d->sponsor_name}}</td>
                       <td>{{$d->yelp_address}}</td>
                       <td>{{$d->manually_email}}</td> -->
                       <td>{{$d->business_name}}</td>
                       <td>{{$d->city}}</td>
                       <td>{{$d->phone}}</td>
					   <td>{{$d->email}}</td>
					   <td><a href="{{url('/admin/sponsors/')}}/{{$d->id}}/get_trip">Tripadvisor </a></td>
					   <td><a href="{{url('/admin/sponsors/')}}/{{$d->id}}/get_yellow_page">Yellowpage</a></td>


					   
                     </tr>
                     @endforeach
                  </tbody> 
                </table>
              </div>
            </div>
          </div>
        </div>
@endsection