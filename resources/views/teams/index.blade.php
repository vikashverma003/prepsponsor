<?php

	//echo"<pre>"; print_r($data); die;
?>

@extends('layouts.admin')
@section('content')

	<div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">GROUP LISTING</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">TEAMS</h6>
			  <h6 class="m-0 font-weight-bold text-primary right" style="float:right;"><a href="{{url('/admin/teams/create/')}}"><i class="fa fa-user-plus" aria-hidden="true"></i>CREATE TEAM</a></h6>
            </div>

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>GroupID</th>
                      <th>Group Name</th>
                      <th>Group Type</th>
                      <th>Group Activity</th>
                      <th>All content</th>
                      <th>Sponsors Page</th>
                    </tr>
                  </thead>
                  <tbody>
				    @foreach($data['teams'] as $d)
                    <tr>
                      <td>123{{$d->id}}</td>
                      <td>{{$d->group_name}}</td>
                      <td>{{$d->grouptype}}</td>
                      <td>{{$d->main_activity}}</td>
                      <!-- <td><a href="/presponsor/admin/teams/{{$d->id}}/edit">Edit</a></td> -->
                      <!--<td><a href="{{url('/admin/teams/')}}/{{$d->id}}/edit">edit</a></td>  
                      <td><a href="{{url('/admin/teams/')}}/{{$d->id}}/delete">Delete</a></td> -->
                      <td><a href="{{url('/admin/teams/')}}/{{$d->id}}/show">Admin Url</a></td>
                      <td><a href="/admin/allSponsors/{{$d->member_participants}}/{{$d->address}}">Sponsors </a></td>

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