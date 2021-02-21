<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Admin Panel') }}</title>

    <!-- Custom fonts for this template-->
	   <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->

	<link href="{{ asset('public/admin/vendor/fontawesome-free/css/all.min.css') }}" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
    <!-- Styles -->
    <link href="{{ asset('public/admin/css/sb-admin-2.min.css') }}" rel="stylesheet">
    <link href="{{ asset('public/admin/vendor/datatables/dataTables.bootstrap4.min.css') }}" rel="stylesheet">
    <link href="{{ asset('public/admin/css/dist/css/AdminLTE.min.css') }}" rel="stylesheet">
	<!-- Styles -->
       <link href="{{ asset('public/css/custom.css') }}" rel="stylesheet">
	
	

  <!--   <link href="{{ asset('public/colorlib/css/style.css') }}" rel="stylesheet"> -->
     <link href="{{ asset('public/colorlib/css/style.css') }}" rel="stylesheet">
  <link href="{{ asset('public/colorlib/fonts/material-design-iconic-font/css/material-design-iconic-font.css')}}" rel="stylesheet">

   <!-- for modal -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="//maps.google.com/maps/api/js?key='AIzaSyDxh4KtxvOSFufYZDUJAWsG8VP5G1ASoO0'"></script>



<!-- for the jquery validation -->

</head>
<body id="page-top">
    <div id="wrapper">
		<!-- Sidebar -->
		@include('layouts.adminLeft')
		<!-- End of Sidebar -->
  
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<main class="">
				<!-- Topbar -->
				@include('layouts.navbar')
			
				@yield('content')
				</main>
			</div>
			<!-- End of Main Content -->
			<!-- Footer -->
			@include('layouts.footer')
			<!-- End of Footer -->
		</div>
    </div>
	
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

	  <!-- Logout Modal-->
	  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
			  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">×</span>
			  </button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				<a class="btn btn-primary" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
					{{ __('Logout') }}
				</a>
				<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
					@csrf
				</form>	
			</div>
		  </div>
		</div>
	  </div>

	 <script src="{{ asset('public/colorlib/js/jquery-3.3.1.min.js')}}"></script> 
     <script src="{{ asset('public/colorlib/js/jquery.steps.js')  }}"></script>
     <script src="{{ asset('public/colorlib/js/main.js') }}"></script>

	<script src="{{ asset('public/admin/js/custom.js') }}"></script>
			<script src="{{ asset('public/admin/js/custom1.js') }}"></script>



	
</body>
</html>
