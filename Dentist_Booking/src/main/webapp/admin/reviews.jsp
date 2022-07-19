<%@page import="com.fptproject.SWP391.model.Employee"%>
<%@page import="com.fptproject.SWP391.model.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="com.fptproject.SWP391.model.Appointment"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%@page import="com.fptproject.SWP391.model.Customer"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Employee admin = (Employee) session.getAttribute("Login_Employee");
        if (admin == null || !admin.getRole().equals("ADMIN")){
            response.sendRedirect("/dentalclinic/login.jsp");
            return;
        }
    %>
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/reviews.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:52 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Reviews Page</title>
		
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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/css/style.css" />
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
								<h3 class="page-title">Reviews</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Reviews</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
                                         <%
                                             String successMessage = (String)request.getAttribute("SUCCESS");
                                             String fromRate = (String)request.getAttribute("FROM_RATE");
                                             String toRate = (String)request.getAttribute("TO_RATE");
                                             if(successMessage!=null){
                                         %>
					 <!--alert=============-->
                                                        <div class="toast"  data-autohide="true" data-delay="3000">
                                                            <div class="toast-header bg-success-light">
                                                                <strong class="mr-auto text-success-light">Message</strong>
                                                                <button type="button" class="text-success ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                                            </div>
                                                            <div class="toast-body">
                                                                <p class="text-success"><%= successMessage %></p>
                                                            </div>
                                                        </div>
                                        <!--alert=============-->
                                        <%
                                            }
                                        %>
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
                                                                                <form action="../admin/AdminSearchFeedbackController" method="post"style="margin-bottom: 20px; margin-right: 20px;" data-toggle="modal">
                                                                                        <span style="font-size: 18px; font-weight: bold">From</span>
                                                                                        <input type="number" placeholder="rate" name="fromRate" value="<%= fromRate %>" min="0" max="5" step="0.1" />
                                                                                        <span style="font-size: 18px; font-weight: bold">To</span>
                                                                                        <input type="number" placeholder="rate" name="toRate" value="<%= toRate %>" min="0" max="5" step="0.1" />
                                                                                        <input type="submit" name="Search" value="Search" style="background-color: lightgreen; color: white; font-weight: bold"/>
                                                                                </form>
										<table class="datatable table table-hover table-center mb-0">
											<thead>
												<tr>
                                                                                                        <th>ID</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>Rating</th>
													<th>Comment</th>
													<th class="text-center">Status</th>
													<th class="text-right">Actions</th>
												</tr>
											</thead>
											<tbody>
                                                                                        <%
                                                                                            HashMap<String,Customer> customerMap = (HashMap<String,Customer>)request.getAttribute("CUSTOMER_MAP");
                                                                                            HashMap<String,Dentist> dentistMap = (HashMap<String,Dentist>)request.getAttribute("DENTIST_MAP");
                                                                                            HashMap<String,Appointment> appointmentMap = (HashMap<String,Appointment>)request.getAttribute("APPOINTMENT_MAP");
                                                                                            List<Feedback> feebackList = (List<Feedback>) request.getAttribute("LIST_FEEDBACK");
                                                                                            if(feebackList!=null && customerMap!=null & dentistMap!=null && appointmentMap!=null){
                                                                                                for(Feedback feedback : feebackList){
                                                                                        %>    
												<tr>
                                                                                                        <td><%= feedback.getId() %></td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= customerMap.get(appointmentMap.get(feedback.getAppointmentId()).getCustomerId()).getImage() %>" alt="User Image"></a>
                                                                                                                        <a href="profile.jsp"><%= customerMap.get(appointmentMap.get(feedback.getAppointmentId()).getCustomerId()).getPersonalName() %></a>
														</h2>
													</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= dentistMap.get(appointmentMap.get(feedback.getAppointmentId()).getDentistId()).getImage() %>" alt="User Image"></a>
															<a href="profile.jsp"><%= dentistMap.get(appointmentMap.get(feedback.getAppointmentId()).getDentistId()).getPersonalName()%></a>
														</h2>
													</td>
													
													<td>
														<i class="fe fe-star text-warning"></i><%= feedback.getDentistRating() %>
													</td>
													
													<td>
														<span class="d-inline-block text-truncate" style="width: 350px;">
                                                                                                                    <%= feedback.getDentistMessage() %>
                                                                                                                </span> 
													</td>
                                                                                                        <td>
                                                                                                        <% if(feedback.getStatus() == 1){ %>
                                                                                                            <span class="badge badge-pill bg-success inv-badge">Available</span>
                                                                                                        <% }else{%>
                                                                                                            <span class="badge badge-pill bg-danger inv-badge">Unavailable</span>
                                                                                                        <% }%>
                                                                                                        </td>
													<td class="text-right">
                                                                                                            <% if(feedback.getStatus() == 1){ %>
														<div class="actions">
                                                                                                                        <a class="btn btn-sm bg-primary-light" data-toggle="modal" href="#<%= feedback.getId() %>">
																<i class="fe fe-book"></i> Detail
															</a>
                                                                                                                                <a style="margin-left: 6px"></a>
															<a class="btn btn-sm bg-danger-light" data-toggle="modal" href="#delete_modal" onclick="deleteID('<%= feedback.getId() %>')">
																<i class="fe fe-trash"></i> Delete
															</a>
															
														</div>
                                                                                                            <% }else{ %>
                                                                                                                <div class="actions">
                                                                                                                        <a class="btn btn-sm bg-primary-light" data-toggle="modal" href="#<%= feedback.getId() %>">
																<i class="fe fe-book"></i> Detail
															</a>
															
														</div>
                                                                                                            <% } %>
                                                                                                              
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
                                                                <form action="../admin/AdminDeleteFeedbackController" method="POST">
                                                                    <input type="hidden" name="feedbackID" id="feedback_id_delete"/>
                                                                    <input type="hidden" name="fromRate" value="<%= fromRate %>"/>
                                                                    <input type="hidden" name="toRate" value="<%= toRate %>"/>
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
							<div style="text-align: center" class="form-content p-2">
                                                                <h4 style="text-align: center" class="modal-title">Restore</h4>
								<p style="text-align: center" class="mb-4">Are you sure want to restore?</p>
                                                                <form action="../admin/AdminRestoreFeedbackController" method="POST">
                                                                    <input type="hidden" name="feedbackID" id="feedback_id_restore"/>
                                                                    <input type="hidden" name="fromRate" value="<%= fromRate %>"/>
                                                                    <input type="hidden" name="toRate" value="<%= toRate %>"/>
                                                                    <button type="submit" class="btn btn-primary">Restore</button>
                                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                                </form>
							</div>
						</div>
					</div>
				</div>
			</div>
                        
		<!-- /Restore Modal -->
                
		<!-- View Detail Modal -->
                        <% 
                            if(feebackList!=null && customerMap!=null & dentistMap!=null && appointmentMap!=null){
                                for( Feedback feedback : feebackList ){
                        %>
                         <div class="modal fade custom-modal" id="<%= feedback.getId() %>">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Feedback Details</h5>
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
                                                                <span class="title">Feedback ID:</span>
                                                                <span class="text"><%= feedback.getId()%></span>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="text-right">
                                                                <% if( feedback.getStatus() == 1){ %>
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
                                                    <span class="title">Customer Name:</span>
                                                    <span class="text"><%= customerMap.get(appointmentMap.get(feedback.getAppointmentId()).getCustomerId()).getPersonalName() %></span>
                                                </li>
                                                <li>
                                                    <span class="title">Dentist Name:</span>
                                                    <span class="text"><%= dentistMap.get(appointmentMap.get(feedback.getAppointmentId()).getDentistId()).getPersonalName()%></span>
                                                </li>
                                                <li>
                                                    <span class="title"> Rating:</span>
                                                    <span class="text">
                                                        <i class="fe fe-star text-warning"></i><%= feedback.getDentistRating() %>
                                                    </span>
                                                </li>
                                                <li>
                                                    <span class="title">Comment:</span>
                                                    <span class="text">
                                                        <%= feedback.getDentistMessage() %>
                                                    </span>
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
                <!-- View Detail Modal -->
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
            var deleteID = function(id) {
                var deleteid = document.getElementById('feedback_id_delete');
                deleteid.value = id.toString();
            };
        </script>
        <script>
            var restoreID = function(id) {
                var restoreid = document.getElementById('feedback_id_restore');
                restoreid.value = id.toString();
            };
        </script>
        <script>
            $(document).ready(function () {
                $('.toast').toast('show');
            });
        </script>
    </body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/reviews.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:52 GMT -->
</html>