<%@page import="com.fptproject.SWP391.model.Promotion"%>
<%@page import="java.util.List"%>
<%@page import="com.fptproject.SWP391.error.PromotionError"%>
<!DOCTYPE html>
<html lang="en">
    
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/invoice-report.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:53 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Invoice Report Page</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
		
		<!-- Datatables CSS -->
		<link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">
		
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
							<div class="col-sm-12">
								<h3 class="page-title">Promotion Management</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Promotion Management</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">

						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<a class="btn btn-sm bg-success-light pull-right"
											style="margin-bottom: 20px;"
											data-toggle="modal" href="#add_dentist">
												<i class="fe fe-plus"></i> Add new Promotion
									</a>
                                                                        <form action="../admin/AdminSearchPromotionController" method="post"
											style="margin-bottom: 20px; margin-right: 20px;"
											data-toggle="modal">
                                                                                <input type="text" name="search" />
                                                                                <input type="submit" name="Search" value="Search" style="background-color: lightgreen; color: white; font-weight: bold"/>
                                                                        </form>                
									<div class="table-responsive">
										
										<table class="datatable table table-hover table-center mb-0">
											
											<thead>
												
												<tr>
											
													<th>ID</th>
													<th>Promotion Name</th>
													<th style="width: 180px;">Short Description</th>		
													<th>Discount Percentage</th>
                                                                                                        <th>Expired Date</th>
													<th class="text-center">Status</th>
													<th class="text-right">Actions</th>
												</tr>
											</thead>
											<tbody>
                                                                                                <% 
                                                                                                    List<Promotion> promotionList = (List<Promotion>) request.getAttribute("LIST_PROMOTION");
                                                                                                    if(promotionList!=null){
                                                                                                        for( Promotion promotion : promotionList ){
                                                                                                %>
												<tr>
													<td><a><%= promotion.getId() %></td>
													<td>
														<h2 class="table-avatar">
															<a  class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= promotion.getImage()%>" alt="Promotion Image"></a>
															<a><%= promotion.getPromotionName()%> </a>
														</h2>
													</td>

													<td><span class="d-inline-block text-truncate" style="width: 180px;">
														<%= promotion.getShortDescription()%>
													  </span></td>
                                                                                                        
                                                                                                        <td style="text-align: center"><a><%= (int) (promotion.getDiscountPercentage() * 100) %> %</td>
                                                                                                        <td ><a><%= promotion.getExpiredDate() %></td>
													<td class="text-center">
                                                                                                            <% if( promotion.getStatus() == 1){ %>
														<span class="badge badge-pill bg-success inv-badge">Available</span>
                                                                                                            <% }else{  %>
                                                                                                                <span class="badge badge-pill bg-danger inv-badge">Unavailable</span>
                                                                                                            <% } %>
													</td>
													<td class="text-right">
														<div class="actions">
                                                                                                                    <%
                                                                                                                        if(promotion.getStatus()== 1){
                                                                                                                    %>
															<a data-toggle="modal" href="#edit_invoice_report" class="btn btn-sm bg-warning-light mr-2">
																<i class="fe fe-pencil"></i> Edit
															</a>
															<a class="btn btn-sm bg-danger-light" data-toggle="modal" href="#delete_modal">
																<i class="fe fe-trash"></i> Delete
															</a>
                                                                                                                    <%
                                                                                                                        }
                                                                                                                    %>
														</div>
													</td>
												</tr>
                                                                                                <%
                                                                                                        }
                                                                                                    }
                                                                                                %>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>			
					</div>
					
				</div>			
			</div>
			<!-- /Page Wrapper -->
			
			<!-- Edit Details Modal -->
			<div class="modal fade" id="edit_invoice_report" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Edit Promotion</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form>
								<div class="row form-row">
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Promotion's Name</label>
											<input type="text" class="form-control" value="#INV-0001">
										</div>
									</div>

									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Description</label>
											<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Promotion Image</label>
											<input type="file"  class="form-control">
										</div>
									</div>
									
									<div class="col-12 col-sm-6" style="margin-bottom: 20px;">
										<div class="dropdown">
											<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											  Status
											</button>
											<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
											  <a class="dropdown-item" href="#">Activate</a>
											  <a class="dropdown-item" href="#">Deactivate</a>
											</div>
										  </div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-block">Save Changes</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /Edit Details Modal -->
			<!-- Add Promotion Modal -->
                        <%
                            PromotionError error = (PromotionError) request.getAttribute("PROMOTION_ERROR");
                            if(error == null){
                                error = new PromotionError();
                            }
                            String successMessage = (String) request.getAttribute("SUCCESS");
                            if(successMessage == null){
                                successMessage = "";
                            }

                        %>
			<div class="modal fade" id="add_dentist" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Add new Promotion</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="../admin/AdminCreatePromotionController" method="POST">
								<div class="row form-row">
									
                                                                        <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Promotion Name</label>
											<input class="form-control" name="promotionName" id="exampleFormControlTextarea1" >
										</div>
									</div>
									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Long Description</label>
											<textarea class="form-control" name="longDescription" id="exampleFormControlTextarea1" rows="3"></textarea>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Short Description</label>
											<textarea class="form-control" name="shortDescription" id="exampleFormControlTextarea1" rows="3"></textarea>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Discount Percentage</label>
											<input type="number" class="form-control" name="discountPercentage" step="0.01" min="0.01" max="1" required=""/>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Expired Date</label>
											<input type="date" class="form-control" name="expiredDate" required=""/>
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Image</label>
											<input type="file" class="form-control" name="image" accept="image/*" required=""/><br>
										</div>
									</div>
									
									
								</div>
								<button type="submit" class="btn btn-primary btn-block">Add new</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /Edit Details Modal -->
		
			<!-- Delete Modal -->
			<div class="modal fade" id="delete_modal" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
					<!--	<div class="modal-header">
							<h5 class="modal-title">Delete</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>-->
						<div class="modal-body">
							<div class="form-content p-2">
								<h4 class="modal-title">Delete</h4>
								<p class="mb-4">Are you sure want to delete?</p>
								<button type="button" class="btn btn-primary">Save </button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /Delete Modal -->
        </div>
		<!-- /Main Wrapper -->
		
		<!-- jQuery -->
        <script src="assets/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		
		<!-- Datatables JS -->
		<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="assets/plugins/datatables/datatables.min.js"></script>
		
		<!-- Custom JS -->
		<script  src="assets/js/script.js"></script>
		
    </body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/invoice-report.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:53 GMT -->
</html>