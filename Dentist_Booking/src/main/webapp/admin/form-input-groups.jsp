<!DOCTYPE html>
<html lang="en">
    
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/form-input-groups.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:54 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Form Input Groups</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
		
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
	
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Header -->
            <div class="header">
			
				<!-- Logo -->
                <div class="header-left">
                    <a href="index.jsp" class="logo">
						<img src="assets/img/logo.png" alt="Logo">
					</a>
					<a href="index.jsp" class="logo logo-small">
						<img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
					</a>
                </div>
				<!-- /Logo -->
				
				<a href="javascript:void(0);" id="toggle_btn">
					<i class="fe fe-text-align-left"></i>
				</a>
				
				<div class="top-nav-search">
					<form>
						<input type="text" class="form-control" placeholder="Search here">
						<button class="btn" type="submit"><i class="fa fa-search"></i></button>
					</form>
				</div>
				
				<!-- Mobile Menu Toggle -->
				<a class="mobile_btn" id="mobile_btn">
					<i class="fa fa-bars"></i>
				</a>
				<!-- /Mobile Menu Toggle -->
				
				<!-- Header Right Menu -->
				<ul class="nav user-menu">

					<!-- Notifications -->
					<li class="nav-item dropdown noti-dropdown">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<i class="fe fe-bell"></i> <span class="badge badge-pill">3</span>
						</a>
						<div class="dropdown-menu notifications">
							<div class="topnav-dropdown-header">
								<span class="notification-title">Notifications</span>
								<a href="javascript:void(0)" class="clear-noti"> Clear All </a>
							</div>
							<div class="noti-content">
								<ul class="notification-list">
									<li class="notification-message">
										<a href="#">
											<div class="media">
												<span class="avatar avatar-sm">
													<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/doctors/doctor-thumb-01.jpg">
												</span>
												<div class="media-body">
													<p class="noti-details"><span class="noti-title">Dr. Ruby Perrin</span> Schedule <span class="noti-title">her appointment</span></p>
													<p class="noti-time"><span class="notification-time">4 mins ago</span></p>
												</div>
											</div>
										</a>
									</li>
									<li class="notification-message">
										<a href="#">
											<div class="media">
												<span class="avatar avatar-sm">
													<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/patients/patient1.jpg">
												</span>
												<div class="media-body">
													<p class="noti-details"><span class="noti-title">Charlene Reed</span> has booked her appointment to <span class="noti-title">Dr. Ruby Perrin</span></p>
													<p class="noti-time"><span class="notification-time">6 mins ago</span></p>
												</div>
											</div>
										</a>
									</li>
									<li class="notification-message">
										<a href="#">
											<div class="media">
												<span class="avatar avatar-sm">
													<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/patients/patient2.jpg">
												</span>
												<div class="media-body">
												<p class="noti-details"><span class="noti-title">Travis Trimble</span> sent a amount of $210 for his <span class="noti-title">appointment</span></p>
												<p class="noti-time"><span class="notification-time">8 mins ago</span></p>
												</div>
											</div>
										</a>
									</li>
									<li class="notification-message">
										<a href="#">
											<div class="media">
												<span class="avatar avatar-sm">
													<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/patients/patient3.jpg">
												</span>
												<div class="media-body">
													<p class="noti-details"><span class="noti-title">Carl Kelly</span> send a message <span class="noti-title"> to his doctor</span></p>
													<p class="noti-time"><span class="notification-time">12 mins ago</span></p>
												</div>
											</div>
										</a>
									</li>
								</ul>
							</div>
							<div class="topnav-dropdown-footer">
								<a href="#">View all Notifications</a>
							</div>
						</div>
					</li>
					<!-- /Notifications -->
					
					<!-- User Menu -->
					<li class="nav-item dropdown has-arrow">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<span class="user-img"><img class="rounded-circle" src="assets/img/profiles/avatar-01.jpg" width="31" alt="Ryan Taylor"></span>
						</a>
						<div class="dropdown-menu">
							<div class="user-header">
								<div class="avatar avatar-sm">
									<img src="assets/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle">
								</div>
								<div class="user-text">
									<h6>Ryan Taylor</h6>
									<p class="text-muted mb-0">Administrator</p>
								</div>
							</div>
							<a class="dropdown-item" href="profile.jsp">My Profile</a>
							<a class="dropdown-item" href="settings.jsp">Settings</a>
							<a class="dropdown-item" href="login.jsp">Logout</a>
						</div>
					</li>
					<!-- /User Menu -->
					
				</ul>
				<!-- /Header Right Menu -->
				
            </div>
			<!-- /Header -->
		<!-- Sidebar -->
            <jsp:include flush="true" page="sidebar.jsp"></jsp:include>
			<!-- /Sidebar -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">
					
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col">
								<h3 class="page-title">Input Groups</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Input Groups</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Basic Examples</h4>
								</div>
								<div class="card-body">
									<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-2">Group Left</label>
											<div class="col-lg-10">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text" id="basic-addon1">@</span>
													</div>
													<input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-form-label col-lg-2">Group Right</label>
											<div class="col-lg-10">
												<div class="input-group">
													<input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
													<div class="input-group-append">
														<span class="input-group-text" id="basic-addon2">@example.com</span>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-form-label col-lg-2">URL Example</label>
											<div class="col-lg-10">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">https://</span>
													</div>
													<input type="text" class="form-control">
												</div>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-form-label col-lg-2">Group with Price</label>
											<div class="col-lg-10">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">$</span>
													</div>
													<input type="text" class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">.00</span>
													</div>
												</div>
											</div>
										</div>

										<div class="form-group row mb-0">
											<label class="col-form-label col-lg-2">Group with Price (Left)</label>
											<div class="col-lg-10">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">$</span>
													</div>
													<div class="input-group-prepend">
														<span class="input-group-text">0.00</span>
													</div>
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Sizing</h4>
								</div>
								<div class="card-body">
									<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-2">Input Group Large</label>
											<div class="col-lg-10">
												<div class="input-group input-group-lg">
													<div class="input-group-prepend">
														<span class="input-group-text" id="sizing-addon1">@</span>
													</div>
													<input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon1">
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-form-label col-lg-2">Input Group Default</label>
											<div class="col-lg-10">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text" id="sizing-addon2">@</span>
													</div>
													<input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2">
												</div>
											</div>
										</div>
										<div class="form-group row mb-0">
											<label class="col-form-label col-lg-2">Input Group Small</label>
											<div class="col-lg-10">
												<div class="input-group input-group-sm">
													<div class="input-group-prepend">
														<span class="input-group-text" id="sizing-addon3">@</span>
													</div>
													<input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon3">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Checkbox and Radio Addons</h4>
								</div>
								<div class="card-body">
									<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-2">Checkbox</label>
											<div class="col-lg-10">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">
															<input type="checkbox">
														</span>
													</div>
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
										<div class="form-group row mb-0">
											<label class="col-form-label col-lg-2">Radio</label>
											<div class="col-lg-10">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">
															<input type="radio">
														</span>
													</div>
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Multiple Addons</h4>
								</div>
								<div class="card-body">
									<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-2">Radio and Text Addons</label>
											<div class="col-lg-10">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">
															<input type="checkbox">
														</span>
													</div>
													<div class="input-group-prepend">
														<span class="input-group-text">$</span>
													</div>
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
										<div class="form-group row mb-0">
											<label class="col-form-label col-lg-2">Two Addons</label>
											<div class="col-lg-10">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">$</span>
													</div>
													<div class="input-group-prepend">
														<span class="input-group-text">0.00</span>
													</div>
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Buttons with dropdowns</h4>
								</div>
								<div class="card-body">
									<form action="#">
										<div class="form-group row">
											<label class="col-form-label col-lg-2">Radio and Text Addons</label>
											<div class="col-lg-10">
												<div class="input-group">
													<div class="input-group-prepend">
														<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">Action</button>
														<div class="dropdown-menu">
															<a class="dropdown-item" href="#">Action</a>
															<a class="dropdown-item" href="#">Another action</a>
															<a class="dropdown-item" href="#">Something else here</a>
															<div role="separator" class="dropdown-divider"></div>
															<a class="dropdown-item" href="#">Separated link</a>
														</div>
													</div>
													<input type="text" class="form-control" placeholder="Left dropdown">
												</div>
											</div>
										</div>

										<div class="form-group row mb-0">
											<label class="col-form-label col-lg-2">Two Addons</label>
											<div class="col-lg-10">
												<div class="input-group">
													<input type="text" class="form-control" placeholder="Right dropdown">
													<div class="input-group-append">
														<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">Action</button>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="#">Action</a>
															<a class="dropdown-item" href="#">Another action</a>
															<a class="dropdown-item" href="#">Something else here</a>
															<div role="separator" class="dropdown-divider"></div>
															<a class="dropdown-item" href="#">Separated link</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				
				</div>			
			</div>
			<!-- /Main Wrapper -->
		
        </div>
		<!-- /Main Wrapper -->
		
		<!-- jQuery -->
        <script src="assets/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		
		<!-- Custom JS -->
		<script  src="assets/js/script.js"></script>
		
    </body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/form-input-groups.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:54 GMT -->
</html>