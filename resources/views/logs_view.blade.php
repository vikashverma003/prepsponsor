@extends('layouts.admin')
@section('content')

	<div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Logs listing</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Teams Custom Email</th>
                      <th>Sponsor Custom Email</th>
                    <!--  <th>TeamId</th> -->
                      <th>Teams Real Email</th>
                      <th>Sponsor Real Email</th>
                    </tr>
                  </thead>
                        <tbody>
            @foreach($campaign_data as $d)
                    <tr>
                      <td>{{$d->teams_custom_email}}</td>
                      <td>{{$d->sponsors_custom_email}}</td>
                      <td>{{$d->teams_real_email}}</td>
                     <!--  <td>{{$d->team_id}}</td> -->
                       <td>{{$d->sponsors_real_email}}</td>
                       
                    </tr>
                    @endforeach
                  </tbody> 
                </table>
              </div>
            </div>
          </div>

        </div>

@endsection