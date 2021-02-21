@extends('layouts.admin')
@section('content')
	<div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Launch Compaign</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Compaign</h6>
			<p class="check-log" style="margin-left: 999px;"><button type="button"><a href="{{url('/log-viewer/logs')}}">Check Logs</a></button></p>
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
                      <th>Group Email</th>
                      <th>Group Name</th>
                      <th>Group Type</th>
                      <th>Group Activity</th>
                      <th>Sponsors Page</th>
                      <th>Start Compaign</th>
                      <th>Logs</th>
                    </tr>
                  </thead>
                  <tbody>
				    @foreach($data as $d)
                    <tr>
                      <td>{{$d->mail_add_groupname}}</td>
                      <td>{{$d->group_name}}</td>
                      <td>{{$d->grouptype}}</td>
                      <td>{{$d->main_activity}}</td>
                      <!-- <td><a href="/presponsor/admin/allSponsors/{{$d->member_participants}}/{{$d->address}}">Sponsors </a></td> -->                      
					  <td><a href="{{url('/admin/allSponsors')}}/{{$d->member_participants}}/{{$d->address}}">Sponsors </a></td>
                      <!--<td><a href="{{url('/admin/teams/')}}/{{$d->id}}/startEmailCompaign">Start</a></td> -->
                      <td><a href="{{url('/admin/teams/')}}/{{$d->id}}/startEmailCompaign">Start</a></td>
                      <td><a href="{{url('/admin/check_logs/')}}/{{$d->id}}">logs</a></td>
                    </tr>
                    @endforeach
                  </tbody>
                </table>
              </div>
			  <div class="campaign-data" style="margin-left:361px;"><?php echo $data->links(); ?></div>

            </div>
          </div>

        </div>

@endsection