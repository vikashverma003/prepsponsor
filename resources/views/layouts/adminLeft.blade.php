	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{url('/admin/dashboard')}}">
		<div class="sidebar-brand-icon rotate-n-15">
		  <i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">PREPSPONSOR <sup></sup></div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item active">
		<a class="nav-link" href="{{url('/admin/dashboard')}}">
		  <i class="fas fa-fw fa-tachometer-alt"></i>
		  <span>Dashboard</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">
		CREATE TEAM
		</div>
		<li class="nav-item active">
			<a class="nav-link" href="{{url('/admin/teams')}}">
		  <i class="fa fa-users" aria-hidden="true"></i>
		  <span>TEAM</span></a>
		</li>

		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">
		CREATE Sponsor
		</div>
<li class="nav-item active">
			<a class="nav-link" href="{{url('/admin/sponsors')}}">
		  <i class="fa fa-users" aria-hidden="true"></i>
		  <span>Sponsor</span></a>
		</li>
						<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">
		Whois data
		</div>
<li class="nav-item active">
			<a class="nav-link" href="{{url('/admin/whois_list')}}">
		  <i class="fa fa-users" aria-hidden="true"></i>
		  <span>Whois data</span></a>
		</li>
				<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">
		Zerobounce Check
		</div>
<li class="nav-item active">
			<a class="nav-link" href="{{url('/admin/zerobounce_check')}}">
		  <i class="fa fa-users" aria-hidden="true"></i>
		  <span>Zerobounce Test</span></a>
		</li>

		<div class="sidebar-heading">
		Manage Packages
		</div>
<li class="nav-item active">
			<a class="nav-link" href="{{url('/admin/package')}}">
		  <i class="fa fa-users" aria-hidden="true"></i>
		  <span>packages</span></a>
		  <a class="nav-link" href="{{url('/admin/teams_package')}}">
		  <i class="fa fa-users" aria-hidden="true"></i>
		  <span>Teams packages</span></a>
		</li>


		<div class="sidebar-heading">
		Transactions
		</div>
<li class="nav-item active">
			<a class="nav-link" href="{{url('/admin/teamsTransaction')}}">
		  <i class="fa fa-users" aria-hidden="true"></i>
		  <span>Transactions</span></a>
		</li>
		<div class="sidebar-heading">
		Launch compaign
		</div>
<li class="nav-item active">
			<a class="nav-link" href="{{url('/admin/emailCompaign')}}">
		  <i class="fa fa-users" aria-hidden="true"></i>
		  <span>Launch compaign</span></a>
		</li>
		
		<div class="sidebar-heading">
		System Email Logs
		</div>
<li class="nav-item active">
			<a class="nav-link" href="{{url('/admin/teams_logs')}}">
		  <i class="fa fa-users" aria-hidden="true"></i>
		  <span>System Email Logs</span></a>
		</li>
		
		<div class="sidebar-heading">
		 Logs
		</div>
<li class="nav-item active">
			<a class="nav-link" href="{{url('/log-viewer/logs')}}">
		  <i class="fa fa-users" aria-hidden="true"></i>
		  <span>Logs</span></a>
		</li>



		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>
    </ul>