<?php

	//echo"<pre>"; print_r($data); die;
?>

@extends('layouts.admin')
@section('content')

	<div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Zerobounce Test</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">TEAMS</h6>
            </div>
			@if (session('er_status'))
                  <div class="alert alert-danger">{!! session('er_status') !!}</div>
                @endif
                @if (session('su_status'))
                  <div class="alert alert-success">{!! session('su_status') !!}</div>
            @endif

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>GroupID</th>
                      <th>Group Name</th>
                      <th>Group Type</th>
                      <th>Group Activity</th>
                      <th>Sponsors Page</th>
					  <th>All content</th>
                    </tr>
                  </thead>
                  <tbody>
				    @foreach($data['teams'] as $d)
                    <tr>
                      <td>123{{$d->id}}</td>
                      <td>{{$d->group_name}}</td>
                      <td>{{$d->grouptype}}</td>
                      <td>{{$d->main_activity}}</td>
                      <td><a href="/admin/allSponsors/{{$d->member_participants}}/{{$d->address}}">Sponsors </a></td>
                      <td><a href="{{url('/admin/zerobounce_validation/')}}/{{$d->id}}">validate emails</a></td>
                    </tr>
                    @endforeach
                  </tbody>
                </table>
				
              </div>
			 <div class="team-data" style="margin-left:361px;"><?php echo $data['teams']->links(); ?></div>
            </div>
          </div>

        </div>

@endsection