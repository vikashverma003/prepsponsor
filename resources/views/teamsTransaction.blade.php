@extends('layouts.admin')
@section('content')

	<div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">SPONSORS PAYMENT LISTING</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>PaymentID</th>
                      <th>Sponsor Name</th>
                      <th>Sponsor Amount</th>
                    <!--  <th>TeamId</th> -->
                      <th>Group Type</th>
                      <th>Group Main Activity</th>
                    </tr>
                  </thead>
                        <tbody>
                  @foreach($sponsor_payment as $d)
                    <tr>
                      <td>{{$d->id}}</td>
                      <td>{{$d->business_name}}</td>
                      <td>{{$d->amount}}</td>
                     <!--  <td>{{$d->team_id}}</td> -->
                       <td>{{$d->grouptype}}</td>
                       <td>{{$d->main_activity}}</td>
                    </tr>
                    @endforeach
                  </tbody> 
                </table>
              </div>
            </div>
          </div>

        </div>

@endsection