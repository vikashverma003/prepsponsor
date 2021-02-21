@extends('layouts.admin')
@section('content')

	<div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">PACKAGE LISTING</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Package</h6>
			  <h6 class="m-0 font-weight-bold text-primary right" style="float:right;"><a href="{{url('/admin/package/create/')}}"><i class="fa fa-user-plus" aria-hidden="true"></i>Create package</a></h6>
            </div>

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Participants</th>
                      <th>Diamond</th>
                      <th>Platinum</th>
                      <th>Gold</th>
                      <th>Silver</th>
                       <th>Edit Package</th>
                        <th>Delete Package</th>

                      
                    </tr>
                  </thead>
           

                
                        <tbody>
            @foreach($package as $d)
                    <tr>
                      <td>{{$d->participants}}</td>
                      <td>{{$d->diamond}}</td>
                      <td>{{$d->platinum}}</td>
                      <td>{{$d->gold}}</td>
                      <td>{{$d->silver}}</td>
                      
            
           <td><a href="{{url('/admin/package/')}}/{{$d->id}}/edit">Edit </a></td>  
            <td><a href="{{url('/admin/package/')}}/{{$d->id}}/delete">Delete </a></td>
      
                    </tr>
                    @endforeach
                  </tbody> 
                </table>
              </div>
            </div>
          </div>

        </div>

@endsection