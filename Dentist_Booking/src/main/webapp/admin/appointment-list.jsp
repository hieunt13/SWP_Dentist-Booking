<%@page import="com.fptproject.SWP391.model.AppointmentDetail"%>
<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@page import="com.fptproject.SWP391.model.Appointment"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/appointment-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:46 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Appointment List Page</title>
		
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
								<h3 class="page-title">Appointments</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Appointments</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					<div class="row">
                                                <%
                                                    String successMessage = (String) request.getAttribute("SUCCESS");
                                                    if(successMessage == null){
                                                        successMessage = "";
                                                    }
                                                    
                                                    String fromDate = (String) request.getAttribute("FROM_DATE");
                                                    if(fromDate == null){
                                                        fromDate = "";
                                                    }
                                                    
                                                    String toDate = (String) request.getAttribute("TO_DATE");
                                                    if(toDate == null){
                                                        toDate = "";
                                                    }
                                                %>
                                                <%= successMessage %><% if (!successMessage.equals("")) %><br><%;%>
						<div class="col-md-12">
							<!-- Recent Orders -->
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
                                                                                <form action="../admin/AdminSearchAppointmentController" method="post"style="margin-bottom: 20px; margin-right: 20px;" data-toggle="modal">
                                                                                        <span style="font-size: 18px; font-weight: bold">From</span>
                                                                                        <input type="date" name="fromDate" value="<%= fromDate %>" />
                                                                                        <span style="font-size: 18px; font-weight: bold">To</span>
                                                                                        <input type="date" name="toDate" value="<%= toDate %>" />
                                                                                        <input type="submit" name="Search" value="Search" style="background-color: lightgreen; color: white; font-weight: bold"/>
                                                                                </form>
										<table class="datatable table table-hover table-center mb-0">
											<thead>
												<tr>
													<th>ID</th>
													<th>Customer</th>
													<th>Dentist</th>
													<th>Apointment date</th>
                                                                                                        <th class="text-center">Status</th>
                                                                                                        <th class="text-center">Dentist confirm</th>
                                                                                                        <th class="text-center">Payment Confirm</th>
													<th class="text-right">Action</th>
												</tr>
											</thead>
											<tbody>
                                                                                                <% 
                                                                                                    HashMap<String,Customer> customerMap = (HashMap<String,Customer>)request.getAttribute("CUSTOMER_MAP");
                                                                                                    HashMap<String,Dentist> dentistMap = (HashMap<String,Dentist>)request.getAttribute("DENTIST_MAP");
                                                                                                    HashMap<String,List<AppointmentDetail>> appointmentDetailMap = (HashMap<String,List<AppointmentDetail>>)request.getAttribute("APPOINTMENTDETAIL_MAP");
                                                                                                    List<Appointment> appointmentList = (List<Appointment>) request.getAttribute("LIST_APPOINTMENT");
                                                                                                    if(appointmentList!=null && customerMap!=null && dentistMap!=null){
                                                                                                        for( Appointment appointment : appointmentList ){
                                                                                                %>
												<tr>
													<td>
														<a><%= appointment.getId() %></a>
													</td>
                                                                                                        <td>
                                                                                                                <h2 class="table-avatar">
                                                                                                                    <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= customerMap.get(appointment.getCustomerId()).getImage() %>" alt="User Image"></a>
                                                                                                                    <a  style="color: #000"><%= customerMap.get(appointment.getCustomerId()).getPersonalName()%> </a>
                                                                                                                </h2>    
                                                                                                        </td>
													<td>
														<h2 class="table-avatar">
															<a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= dentistMap.get(appointment.getDentistId()).getImage() %>" alt="User Image"></a>
															<a><%= dentistMap.get(appointment.getDentistId()).getPersonalName()%></a>
														</h2>
													</td>
                                                                                                        <td><%= appointment.getMeetingDate()%><span class="text-primary d-block"><% for(AppointmentDetail appointmentDetail : appointmentDetailMap.get(appointment.getId())){ %>Slot <%= appointmentDetail.getSlot() %> <%}%></span></td>
                                                                                                        <td class="text-center">
                                                                                                            <% if(appointment.getStatus() == 1){ %>
                                                                                                                <span  class="badge-pill bg-success inv-badge" style="font-weight: bold; font-size: 12px ">Success</span>
                                                                                                            <%}else if(appointment.getStatus() == 2){%>
                                                                                                                <span class="badge-pill bg-warning inv-badge" style="font-weight: bold; font-size: 12px ">Checkin</span>
                                                                                                            <%}else if(appointment.getStatus() == 3){ %>
                                                                                                                <span class="badge-pill bg-success inv-badge" style="font-weight: bold; font-size: 12px ">Complete</span>
                                                                                                            <%}else{%>
                                                                                                                <span class="badge-pill bg-danger inv-badge" style="font-weight: bold; font-size: 12px ">Cancelled</span>
                                                                                                            <%}%>
													</td>
                                                                                                        <td class="text-center">
                                                                                                            <% if(appointment.getDentistConfirm()== 1){ %>
                                                                                                                <span  class="badge-pill bg-success inv-badge" style="font-weight: bold; font-size: 12px ">Done</span>
                                                                                                            <%}else{%>
                                                                                                                <span class="badge-pill bg-warning inv-badge" style="font-weight: bold; font-size: 12px ">Processing</span>
                                                                                                            <%}%>
													</td>
                                                                                                        <td class="text-center">
                                                                                                            <% if(appointment.getPaymentConfirm()== 1){ %>
                                                                                                                <span  class="badge-pill bg-success inv-badge" style="font-weight: bold; font-size: 12px ">Paid</span>
                                                                                                            <%}else{%>
                                                                                                                <span class="badge-pill bg-warning inv-badge" style="font-weight: bold; font-size: 12px ">Unpaid</span>
                                                                                                            <%}%>
													</td>
													<td class="text-right">
                                                                                                                <a data-toggle="modal" style="margin-left: 40px" href="#<%= appointment.getId() %>" class="btn btn-sm bg-primary-light mr-0">
																<i class="fe fe-book"></i> Detail
                                                                                                                </a>
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
							<!-- /Recent Orders -->
							
						</div>
					</div>
				</div>			
			</div>
			<!-- /Page Wrapper -->
		
        </div>
		<!-- /Main Wrapper -->

                <!-- View Detail Modal -->
            <% 
                HashMap<String,String> serviceMap = (HashMap<String,String>)request.getAttribute("SERVICE_MAP");
                if(appointmentList!=null && serviceMap!=null){
                    for( Appointment appointment : appointmentList ){
            %>
             <div class="modal fade custom-modal" id="<%= appointment.getId() %>">
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
                                                    <span class="title">ID:</span>
                                                    <span class="text"><%= appointment.getId() %></span>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="text-right">
                                                    <% if(appointment.getStatus() == 2){ %>
                                                        <button
                                                            type="button"
                                                            class="btn bg-success-light btn-sm"
                                                            id="topup_status"
                                                            >
                                                                <span>Accepted</span>
                                                        </button>
                                                    <% }else if(appointment.getStatus() == 1){  %>
                                                        <button
                                                            type="button"
                                                            class="btn bg-warning-light btn-sm"
                                                            id="topup_status"
                                                            >        
                                                            <span>Pending</span>
                                                        </button>
                                                    <% }else if(appointment.getStatus() == 3){%>
                                                        <button
                                                            type="button"
                                                            class="btn bg-success-light btn-sm"
                                                            id="topup_status"
                                                            >
                                                                <span>Finished</span>
                                                        </button>
                                                    <% }else{ %>
                                                        <button
                                                            type="button"
                                                            class="btn bg-warning-light btn-sm"
                                                            id="topup_status"
                                                            >        
                                                            <span>Pending</span>
                                                        </button>
                                                    <%}%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="title">Customer:</span>
                                        <span class="text"><%= customerMap.get(appointment.getCustomerId()).getPersonalName()%> (<%= appointment.getCustomerId() %>)</span>
                                    </li>
                                    <li>
                                        <span class="title">Dentist:</span>
                                        <span class="text"><%= dentistMap.get(appointment.getDentistId()).getPersonalName()%> (<%= appointment.getDentistId()%>)</span>
                                    </li>
                                    <li>
                                        <span class="title">Meeting Date:</span>
                                        <span class="text"><%= appointment.getMeetingDate() %></span>
                                    </li>
                                    <li>
                                        <span class="title">Service:</span>
                                        <% for(AppointmentDetail appointmentDetail : appointmentDetailMap.get(appointment.getId()) ){ %>
                                            <span class="text"><%= serviceMap.get(appointmentDetail.getServiceId()) %></span>
                                        <%}%>
                                    </li>
                                    <li>
                                        <span class="title">Slot:</span>
                                            <span class="text"><% for(AppointmentDetail appointmentDetail : appointmentDetailMap.get(appointment.getId()) ){ %><%= appointmentDetail.getSlot() %> <%}%></span>
                                    </li>
                                    <li>
                                        <span class="title">Dentist Confirm:</span><br>
                                        <% if(appointment.getDentistConfirm()== 1){ %>
                                            <span  class="btn bg-warning-light btn-sm" style="font-weight: bold; font-size: 12px;margin-top: 5px">Pending</span>
                                        <%}else if(appointment.getDentistConfirm() == 2){%>
                                            <span class="btn bg-success-light btn-sm" style="font-weight: bold; font-size: 12px;margin-top: 5px">Accepted</span>
                                        <%}else{%>
                                            <span class="btn bg-danger-light btn-sm" style="font-weight: bold; font-size: 12px;margin-top: 5px">Cancelled</span>
                                        <%}%>
                                    </li>
                                    <li>
                                        <span class="title">Payment Confirm:</span><br>
                                        <% if(appointment.getPaymentConfirm()== 1){ %>
                                            <span class="btn bg-success-light btn-sm" style="font-weight: bold; font-size: 12px;margin-top: 5px">Paid</span>
                                        <%}else{%>
                                            <span  class="btn bg-warning-light btn-sm" style="font-weight: bold; font-size: 12px;margin-top: 5px">Unpaid</span>
                                        <%}%>
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
                <!-- /View Detail Modal -->
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
                                                    <form action="../admin/AdminDeleteAppointmentController" method="POST">
                                                        <input type="hidden" name="appointmentID" id="appointment_id_delete"/>
                                                        <button type="submit"  class="btn btn-primary" > Delete </button>
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                    </form>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </div>
                <!-- /Delete Modal -->
                
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
                var deleteid = document.getElementById('appointment_id_delete');
                deleteid.value = id.toString();
            };
        </script>	
    </body>
    
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/appointment-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:49 GMT -->
</html>