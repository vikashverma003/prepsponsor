@extends('layouts.admin')
@section('content')

	<div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Teams Package</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Package</h6>
            </div>

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      
                      <th>Tier name</th>
                      <th>Status</th>
                      <th>Description</th>
                      <th>Amount</th>
                       <th>Slot</th>
                       <th>Total</th>
					   <th>Edit</th>

                      
                    </tr>
                  </thead>
           

                
                        <tbody>
            @foreach($package as $d)
                    <tr>
                      
                      <td>{{$d->tier_name}}</td>
                      <td>{{$d->active}}</td>
                      <td>{{$d->description}}</td>
                      <td>{{$d->sponsor_amount}}</td>
                      <td>{{$d->slot_available}}</td>
                      <td>{{$d->Total}}</td>
                      
            
           <td><a href="{{url('/admin/teams_package/')}}/{{$d->id}}/edit">Edit </a></td>  
      
                    </tr>
                    @endforeach
                  </tbody> 
                </table>
              </div>
            </div>
          </div>

        </div>

@endsection