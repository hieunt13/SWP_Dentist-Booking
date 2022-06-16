<%@page import="com.fptproject.SWP391.error.ServiceError"%>
<%@page import="java.util.List"%>
<%@page import="com.fptproject.SWP391.model.Service"%>
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
                <link rel="stylesheet" href="../customer/assets/css/style.css" />
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
            <jsp:include flush="true" page="header.jsp"></jsp:include>
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
								<h3 class="page-title">Service Management</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Service Management</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					<%
                                            ServiceError error = (ServiceError) request.getAttribute("SERVICE_ERROR");
                                            if(error == null){
                                                error = new ServiceError();
                                            }
                                            String successMessage = (String) request.getAttribute("SUCCESS");
                                            if(successMessage == null){
                                                successMessage = "";
                                            }
                                            String errorMessage = (String) request.getAttribute("ERROR");
                                            if(errorMessage == null){
                                                errorMessage = "";
                                            }
                                            String search = (String) request.getAttribute("SEARCH");
                                            if(search == null){
                                                search = "";
                                            }
                                        %>
                                        <p style="color: red; font-weight: bold"><%= error.getServiceNameError() %></p>
                                        <p style="color: red; font-weight: bold"><%= error.getPromotionIdError()%></p>
                                        <p style="color: red; font-weight: bold"><%= error.getShortDescriptionError() %></p>
                                        <p style="color: red; font-weight: bold"><%= error.getLongDescriptionError() %></p>
                                        <p style="color: springgreen; font-weight: bold"><%= successMessage%></p>
                                        <p style="color: red; font-weight: bold"><%= errorMessage%></p>
					<div class="row">

						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<a class="btn btn-sm bg-success-light pull-right"
											style="margin-bottom: 20px;"
											data-toggle="modal" href="#add_dentist">
												<i class="fe fe-plus"></i> Add new Service
                                                                        </a>
                                                                        <form action="../admin/AdminSearchServiceController" method="post"
											style="margin-bottom: 20px; margin-right: 20px;"
											data-toggle="modal">
                                                                                <input type="text" name="search" value="<%= search %>"/>
                                                                                <input type="submit" name="Search" value="Search" style="background-color: lightgreen; color: white; font-weight: bold"/>
                                                                        </form>              
									<div class="table-responsive">
										
										<table class="datatable table table-hover table-center mb-0">
											
											<thead>
												
												<tr>
											
													<th>Service ID</th>
													<th>Promotion ID</th>
													<th>Service Name</th>
													
													<th>Price</th>
													<th style="width: 250px;">Short Description</th>
													<th class="text-center">Status</th>
													<th class="text-right">Actions</th>
												</tr>
											</thead>
											<tbody>
                                                                                                <% 
                                                                                                    List<Service> serviceList = (List<Service>) request.getAttribute("LIST_SERVICE");
                                                                                                    if(serviceList!=null){
                                                                                                        for( Service service : serviceList ){
                                                                                                %>
												<tr>
                                                                                                        <td><a><%= service.getId() %></a></td>
                                                                                                        <td><a><%= service.getPromotionId() %></a></td>
													
													<td>
														<h2 class="table-avatar">
															<a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= service.getImage() %>" alt="Service Image"></a>
															<a><%= service.getServiceName()%></a>
														</h2>
													</td>
													<td>
														<h2 class="table-avatar">
															<a><%= service.getPrice() %>$ </a>
														</h2>
													</td>
													<td><span class="d-inline-block text-truncate" style="width: 210px;">
														<%= service.getShortDescription()%>
													  </span></td>
				
													<td class="text-center">
                                                                                                            <% if( service.getStatus() == 1){ %>
														<span class="badge badge-pill bg-success inv-badge">Available</span>
                                                                                                            <% }else{  %>
                                                                                                                <span class="badge badge-pill bg-danger inv-badge">Unavailable</span>
                                                                                                            <% } %>
													</td>
													<td class="text-right">
														<div class="actions">
                                                                                                                    <%
                                                                                                                        if(service.getStatus()== 1){
                                                                                                                    %>
															<a data-toggle="modal"  href="#<%= service.getId() %>2" class="btn btn-sm bg-primary-light mr-0">
																<i class="fe fe-book"></i> Detail
															</a>
                                                                                                                        <a data-toggle="modal" style="margin-left: 8px;" href="#<%= service.getId() %>" class="btn btn-sm bg-warning-light mr-2">
																<i class="fe fe-pencil"></i> Edit
															</a>
															<a class="btn btn-sm bg-danger-light" data-toggle="modal" href="#delete_modal" onclick="deleteID('<%= service.getId() %>')">
																<i class="fe fe-trash"></i> Delete
															</a>
                                                                                                                    <%
                                                                                                                        }else{
                                                                                                                    %>
                                                                                                                        <a data-toggle="modal"  href="#<%= service.getId() %>2" class="btn btn-sm bg-primary-light mr-0">
																<i class="fe fe-book"></i> Detail
															</a>
                                                                                                                        <a style="margin-right: 66px"></a>
                                                                                                                       
                                                                                                                        <a class="btn btn-sm bg-success-light" data-toggle="modal" href="#restore_modal" onclick="restoreID('<%= service.getId() %>')">
																<i class="fe fe-trash"></i> Restore
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

        </div>
		<!-- /Main Wrapper -->
        
        <!-- Edit Details Modal -->
                        <% 
                         
                            if(serviceList!=null){
                                for( Service service : serviceList ){
                         %>
			<div class="modal fade" id="<%= service.getId() %>" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Edit Service</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="../admin/AdminUpdateServiceController" enctype="multipart/form-data" method="POST">
								<div class="row form-row">
                                                                        <input type="hidden" name="id" value="<%= service.getId() %>"/>
									<div class="col-12 col-sm-7">
										<div class="form-group">
											<label>Service's Name</label>
                                                                                        <input type="text" class="form-control" name="serviceName" value="<%= service.getServiceName() %>" minlength="2" maxlength="30">
										</div>
									</div>
									<div class="col-12 col-sm-5">
										<div class="form-group">
											<label>Promotion ID</label>
											<input type="text" class="form-control" name="promotionId" value="<%= service.getPromotionId()%>">
										</div>
									</div>
									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Short Description</label>
											<textarea class="form-control" name="shortDescription" id="exampleFormControlTextarea1" rows="3" minlength="10" maxlength="60"><%= service.getShortDescription()%></textarea>
										</div>
									</div>
									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Long Description</label>
											<textarea class="form-control" name="longDescription" id="exampleFormControlTextarea1" rows="3" minlength="40" maxlength="1000"><%= service.getLongDescription()%> </textarea>
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Price</label>
                                                                                        <input type="number" class="form-control" name="price" value="<%= service.getPrice()%>" step="1" min="1" required="">
										</div>
									</div>
                                                                        <div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Image</label>
                                                                                        <input type="hidden" name="currentImage" value="<%= service.getImage() %>"/>
                                                                                        <input type="file" class="form-control" name="image" accept="image/*" id="file"  onchange="loadFile(event,'<%= service.getId().toLowerCase() %>')" >
										</div>
									</div>
                                                                        <div class="col-12 col-sm-12">
                                                                                <div class="form-group">
                                                                                        <figure style="display: inline-block">
                                                                                            <img class="avatar-img rounded-circle" src="<%= service.getImage() %>"  title="Current Avatar" width="230" />
                                                                                            <figcaption style="text-align: center">Current Avatar</figcaption>
                                                                                        </figure>
                                                                                            <figure style="display: inline-block" >
                                                                                            <span><img class="avatar-img rounded-circle"  id="<%= service.getId().toLowerCase() %>" width="230" /></span>
                                                                                            <figcaption style="text-align: center">New Avatar</figcaption>
                                                                                        </figure>
                                                                                </div>
                                                                        </div>        
									
								</div>
								<button type="submit" name="updateService" class="btn btn-primary btn-block">Save Change</button>
							</form>
						</div>
					</div>
				</div>
			</div>
                        <%
                                }
                            }
                        %>
	<!-- /Edit Details Modal -->        
        <!-- Add Service Modal -->
			<div class="modal fade" id="add_dentist" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Add new service</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="../admin/AdminCreateServiceController" enctype="multipart/form-data" method="POST">
								<div class="row form-row">
									<div class="col-12 col-sm-7">
										<div class="form-group">
											<label>Service's Name</label>
                                                                                        <input type="text" class="form-control" name="serviceName" minlength="2" maxlength="30">
										</div>
									</div>
									<div class="col-12 col-sm-5">
										<div class="form-group">
											<label>Promotion ID</label>
											<input type="text" class="form-control" name="promotionId">
										</div>
									</div>
									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Short Description</label>
											<textarea class="form-control" name="shortDescription" id="exampleFormControlTextarea1" rows="3" minlength="10" maxlength="60"></textarea>
										</div>
									</div>
									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Long Description</label>
											<textarea class="form-control" name="longDescription" id="exampleFormControlTextarea1" rows="3" minlength="40" maxlength="1000"></textarea>
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Price</label>
                                                                                        <input type="number" class="form-control" name="price" step="1" min="1" required="">
										</div>
									</div>
                                                                        <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Image</label>
                                                                                        <input type="file" class="form-control" name="image" accept="image/*" id="file2" onchange="loadFileC(event)" required=""><br>
                                                                                        <span><img class="avatar-img rounded-circle"  id="output2" width="230" /></span>
										</div>
									</div>
									
								</div>
								<button type="submit" class="btn btn-primary btn-block">Add new</button>
							</form>
						</div>
					</div>
				</div>
			</div>
	<!-- /Add Service Modal -->    
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
                                                                <form action="../admin/AdminDeleteServiceController" method="POST">
                                                                    <input type="hidden" name="serviceID" id="service_id_delete"/>
                                                                    <input type="hidden" name="search" value="<%= search %>"/>
                                                                    <button type="submit" class="btn btn-primary">Delete</button>
                                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                                </form>
							</div>
						</div>
					</div>
				</div>
			</div>
	<!-- /Delete Modal -->
        <!-- Restore Modal -->
			<div class="modal fade" id="restore_modal" aria-hidden="true" role="dialog">
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
								<h4 style="text-align: center" class="modal-title">Restore</h4>
								<p style="text-align: center" class="mb-4">Are you sure want to restore?</p>
                                                                <form style="text-align: center" action="../admin/AdminRestoreServiceController" method="POST">
                                                                    <input type="hidden" name="serviceID" id="service_id_restore"/>
                                                                    <input type="hidden" name="search" value="<%= search %>"/>
                                                                    <button type="submit" class="btn btn-primary">Restore</button>
                                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                                </form>
							</div>
						</div>
					</div>
				</div>
			</div>
	<!-- /Restore Modal --> 
	<!-- Show Detail Modal -->
                        <% 
                         
                            if(serviceList!=null){
                                for( Service service : serviceList ){
                        %>
                        <div class="modal fade custom-modal" id="<%= service.getId() %>2">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button
                                                type="button"
                                                class="close"
                                                data-dismiss="modal"
                                                aria-label="Close"
                                                >
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="info-details">
                                                <li>
                                                    <div class="details-header">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <span class="title">Service ID</span>
                                                                <span class="text"><%= service.getId()%></span>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="text-right">
                                                            <% if( service.getStatus() == 1){ %>
                                                                    <button
                                                                        type="button"
                                                                        class="btn bg-success-light btn-sm"
                                                                        id="topup_status"
                                                                        >
                                                                        <span>Available</span>
                                                                    </button>
                                                            <% }else{  %>
                                                                    <button
                                                                        type="button"
                                                                        class="btn bg-danger-light btn-sm"
                                                                        id="topup_status"
                                                                        >        
                                                                        <span>Unavailable</span>
                                                                    </button>    
                                                            <% } %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <span class="title">Service Name:</span>
                                                    <span class="text"><%= service.getServiceName() %></span>
                                                </li>
                                                <li>
                                                    <span class="title">Promotion ID:</span>
                                                    <span class="text"><%= service.getPromotionId()%></span>
                                                </li>
                                                <li>
                                                    <span class="title">Short Description:</span>
                                                    <span class="text"
                                                          ><%= service.getShortDescription()%></span
                                                    >
                                                </li>
                                                <li>
                                                    <span class="title">Long Description:</span>
                                                    <span class="text"
                                                          ><%= service.getLongDescription()%></span
                                                    >
                                                </li>
                                                <li>
                                                    <span class="title">Price</span>
                                                    <span class="text">$<%= service.getPrice()%></span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <%
                                }
                            }
                        %>
        <!-- Show Detail Modal -->
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
        
        <script>
            var loadFile = function(event,id) {
                var image = document.getElementById(id.toString());
                image.src = URL.createObjectURL(event.target.files[0]);
            };
        </script>
        <script>
            var loadFileC = function(event) {
                var image2 = document.getElementById('output2');
                image2.src = URL.createObjectURL(event.target.files[0]);
            };
        </script>
        <script>
            var deleteID = function(id) {
                var deleteid = document.getElementById('service_id_delete');
                deleteid.value = id.toString();
            };
        </script>
        <script>
            var restoreID = function(id) {
                var restoreid = document.getElementById('service_id_restore');
                restoreid.value = id.toString();
            };
        </script>
    </body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/invoice-report.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:53 GMT -->
</html>