<%-- 
    Document   : dentist-dashboard
    Created on : May 21, 2022, 12:38:22 PM
    Author     : hieunguyen
--%>

<%@page import="com.fptproject.SWP391.model.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/doctor-dashboard.html  30 Nov 2019 04:12:03 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link href="<%=request.getContextPath()%>/employee/assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/employee/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/employee/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/employee/assets/plugins/fontawesome/css/all.min.css">
        <!-- Datatables CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/employee/assets/plugins/datatables/datatables.min.css">
        <!-- Main CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/employee/assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
-->             <script src="<%=request.getContextPath()%>/employee/assets/js/html5shiv.min.js"></script>
                <script src="<%=request.getContextPath()%>/employee/assets/js/respond.min.js"></script><!--
        <![endif]-->

    </head>
    <body>

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!--Header-->
            <jsp:include flush="true" page="header.jsp"></jsp:include>
                <!--/Header-->

                <!-- Breadcrumb -->
                <div class="breadcrumb-bar">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-12 col-12">
                                <nav aria-label="breadcrumb" class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Employee Dashboard</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->

                <!-- Page Content -->
                <div class="content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

                                <!-- Profile Side Bar -->
                            <jsp:include flush="true" page="profile-sidebar.jsp"></jsp:include>
                                <!-- /Profile Side Bar -->

                            </div>

                            <div class="col-md-7 col-lg-8 col-xl-9">
                            <%
                                int todayAppointmentCount = (int) request.getAttribute("TODAY_APPOINTMENT_COUNT");
                                int weekAppointmentCount = (int) request.getAttribute("WEEK_APPOINTMENT_COUNT");
                                int patientCount = (int) request.getAttribute("PATIENT_COUNT");
                                String activePanel = (String)request.getAttribute("ACTIVE_PANEL");
                                if(activePanel==null){
                                    activePanel = "today";
                                }
                            %>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card dash-card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-12 col-lg-4">
                                                    <div class="dash-widget dct-border-rht">
                                                        <div class="circle-bar circle-bar1">
                                                            <div class="circle-graph1" data-percent="50">
                                                                <img src="<%=request.getContextPath()%>/employee/assets/img/icon-01.png" class="img-fluid" alt="patient">
                                                            </div>
                                                        </div>
                                                        <div class="dash-widget-info">
                                                            <h6>Patient</h6>
                                                            <h3><%= patientCount%></h3>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 col-lg-4">
                                                    <div class="dash-widget dct-border-rht">
                                                        <div class="circle-bar circle-bar2">
                                                            <div class="circle-graph2" data-percent="50">
                                                                <img src="<%=request.getContextPath()%>/employee/assets/img/icon-03.png" class="img-fluid" alt="Patient">
                                                            </div>
                                                        </div>
                                                        <div class="dash-widget-info">
                                                            <h6>This week Appointments</h6>
                                                            <h3><%= weekAppointmentCount%></h3>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 col-lg-4">
                                                    <div class="dash-widget">
                                                        <div class="circle-bar circle-bar3">
                                                            <div class="circle-graph3" data-percent="50">
                                                                <img src="<%=request.getContextPath()%>/employee/assets/img/icon-03.png" class="img-fluid" alt="Patient">
                                                            </div>
                                                        </div>
                                                        <div class="dash-widget-info">
                                                            <h6>Today Appoinments</h6>
                                                            <h3><%= todayAppointmentCount%></h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                String successMessage = (String)request.getAttribute("SUCCESS");
                                if (successMessage!=null && !successMessage.isEmpty()) {
                            %>
                            <!--alert=============-->
                            <div class="toast"  data-autohide="true" data-delay="9000">
                                <div class="toast-header bg-success-light">
                                    <strong class="mr-auto text-success-light">Success Message</strong>
                                    <button type="button" class="text-success ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                </div>
                                <div class="toast-body">
                                    <p class="text-success"><%= successMessage%></p>
                                </div>
                            </div>
                            <!--alert=============-->
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="mb-4">Patient Appoinment</h4>
                                    <div class="appointment-tab">

                                        <!-- Appointment Tab -->
                                        <ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded">
                                            <li class="nav-item">
                                                <a class="nav-link <% if(activePanel.equals("today")){%>active<%}%>" href="#today-appointments" data-toggle="tab">Today</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link <% if(activePanel.equals("week")){%>active<%}%>" href="#week-appointments" data-toggle="tab">Weekly</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#before-appointments" data-toggle="tab">Archive</a>
                                            </li> 
                                        </ul>
                                        <!-- /Appointment Tab -->

                                        <div class="tab-content">
                                            <%
                                                HashMap<String, Customer> customerMap = (HashMap<String, Customer>) request.getAttribute("CUSTOMER_MAP");
                                                HashMap<String, Dentist> dentistMap = (HashMap<String, Dentist>) request.getAttribute("DENTIST_MAP");
                                                List<Appointment> todayAppointmentList = (List<Appointment>) request.getAttribute("LIST_TODAY_APPOINTMENT");
                                                List<Appointment> weekAppointmentList = (List<Appointment>) request.getAttribute("LIST_WEEK_APPOINTMENT");
                                                List<Appointment> beforeAppointmentList = (List<Appointment>) request.getAttribute("LIST_BEFORE_APPOINTMENT");
                                            %>
                                            <!-- Today Appointment Tab -->
                                            <div class="tab-pane <% if(activePanel.equals("today")){%>show active<%}%>" id="today-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="datatable table table-hover table-center mb-0" >
                                                                <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>Patient Name</th>
                                                                        <th>Dentist Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th>Status</th>
                                                                        <th class="text-right">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        if (todayAppointmentList != null && customerMap != null && dentistMap != null) {
                                                                            for (Appointment todayAppointment : todayAppointmentList) {
                                                                    %>
                                                                    <tr>
                                                                        <td><%= todayAppointment.getId()%></td>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= request.getContextPath() %>/customer/<%= customerMap.get(todayAppointment.getCustomerId()).getImage()%>" alt="User Image"></a>
                                                                                <a ><%= customerMap.get(todayAppointment.getCustomerId()).getPersonalName()%></a>
                                                                            </h2>
                                                                        </td>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= request.getContextPath() %>/dentist/<%= dentistMap.get(todayAppointment.getDentistId()).getImage()%>" alt="User Image"></a>
                                                                                <a><%= dentistMap.get(todayAppointment.getDentistId()).getPersonalName()%></a>
                                                                            </h2>
                                                                        </td>
                                                                        <td><%= todayAppointment.getMeetingDate()%></td>
                                                                        <td>
                                                                            <% if (todayAppointment.getStatus() == 1) { %>
                                                                            <span  class="badge-pill bg-success inv-badge" style="font-weight: bold; font-size: 12px ">Success</span>
                                                                            <%} else if (todayAppointment.getStatus() == 2) {%>
                                                                            <span class="badge-pill bg-warning inv-badge" style="font-weight: bold; font-size: 12px ">Checkin</span>
                                                                            <%} else if (todayAppointment.getStatus() == 3) { %>
                                                                            <span class="badge-pill bg-success inv-badge" style="font-weight: bold; font-size: 12px ">Complete</span>
                                                                            <%} else {%>
                                                                            <span class="badge-pill bg-danger inv-badge" style="font-weight: bold; font-size: 12px ">Cancelled</span>
                                                                            <%}%>
                                                                        </td>
                                                                        <td class="text-right">
                                                                            <div class="actions">
                                                                                <a class="btn btn-sm bg-danger-light" data-toggle="modal" href="#delete_modal" onclick="deleteID('<%= todayAppointment.getId()%>','today')" >
                                                                                    <i class="fa fa-trash"></i> Delete
                                                                                </a>
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
                                            <!-- /Today Appointment Tab -->

                                            <!-- Before Appointment Tab -->
                                            <div class="tab-pane" id="before-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="datatable table table-hover table-center mb-0" >
                                                                <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>Patient Name</th>
                                                                        <th>Dentist Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th class="text-right">Status</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        if (beforeAppointmentList != null && customerMap != null && dentistMap != null) {
                                                                            for (Appointment beforeApppointment : beforeAppointmentList) {
                                                                    %>
                                                                    <tr>
                                                                        <td><%= beforeApppointment.getId()%></td>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="customer/<%= customerMap.get(beforeApppointment.getCustomerId()).getImage()%>" alt="User Image"></a>
                                                                                <a><%= customerMap.get(beforeApppointment.getCustomerId()).getPersonalName()%></a>
                                                                            </h2>
                                                                        </td>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="dentist/<%= dentistMap.get(beforeApppointment.getDentistId()).getImage()%>" alt="User Image"></a>
                                                                                <a><%= dentistMap.get(beforeApppointment.getDentistId()).getPersonalName()%></a>
                                                                            </h2>
                                                                        </td>
                                                                        <td><%= beforeApppointment.getMeetingDate()%></td>
                                                                        <td>
                                                                            <% if (beforeApppointment.getStatus() == 1) { %>
                                                                            <span  class="badge-pill bg-success inv-badge" style="font-weight: bold; font-size: 12px ">Success</span>
                                                                            <%} else if (beforeApppointment.getStatus() == 2) {%>
                                                                            <span class="badge-pill bg-warning inv-badge" style="font-weight: bold; font-size: 12px ">Checkin</span>
                                                                            <%} else if (beforeApppointment.getStatus() == 3) { %>
                                                                            <span class="badge-pill bg-success inv-badge" style="font-weight: bold; font-size: 12px ">Complete</span>
                                                                            <%} else {%>
                                                                            <span class="badge-pill bg-danger inv-badge" style="font-weight: bold; font-size: 12px ">Cancelled</span>
                                                                            <%}%>
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
                                            <!-- /Before Appointment Tab -->

                                            <!-- Week Appointment Tab -->
                                            <div class="tab-pane <% if(activePanel.equals("week")){%>show active<%}%>" id="week-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="datatable table table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>Patient Name</th>
                                                                        <th>Dentist Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th>Status</th>
                                                                        <th class="text-right" >Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <%
                                                                        if (weekAppointmentList != null && customerMap != null && dentistMap != null) {
                                                                            for (Appointment weekAppointment : weekAppointmentList) {
                                                                    %>
                                                                    <tr>
                                                                        <td><%= weekAppointment.getId()%></td>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="customer/<%= customerMap.get(weekAppointment.getCustomerId()).getImage()%>" alt="User Image"></a>
                                                                                <a><%= customerMap.get(weekAppointment.getCustomerId()).getPersonalName()%></a>
                                                                            </h2>
                                                                        </td>
                                                                        <td>
                                                                            <h2 class="table-avatar">
                                                                                <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="dentist/<%= dentistMap.get(weekAppointment.getDentistId()).getImage()%>" alt="User Image"></a>
                                                                                <a><%= dentistMap.get(weekAppointment.getDentistId()).getPersonalName()%></a>
                                                                            </h2>
                                                                        </td>
                                                                        <td><%= weekAppointment.getMeetingDate()%></td>
                                                                        <td>
                                                                            <% if (weekAppointment.getStatus() == 1) { %>
                                                                            <span  class="badge-pill bg-success inv-badge" style="font-weight: bold; font-size: 12px ">Success</span>
                                                                            <%} else if (weekAppointment.getStatus() == 2) {%>
                                                                            <span class="badge-pill bg-warning inv-badge" style="font-weight: bold; font-size: 12px ">Checkin</span>
                                                                            <%} else if (weekAppointment.getStatus() == 3) { %>
                                                                            <span class="badge-pill bg-success inv-badge" style="font-weight: bold; font-size: 12px ">Complete</span>
                                                                            <%} else {%>
                                                                            <span class="badge-pill bg-danger inv-badge" style="font-weight: bold; font-size: 12px ">Cancelled</span>
                                                                            <%}%>
                                                                        </td>
                                                                        <td class="text-right">
                                                                            <div class="actions">
                                                                                <a class="btn btn-sm bg-danger-light" data-toggle="modal" href="#delete_modal" onclick="deleteID('<%= weekAppointment.getId()%>','week')" >
                                                                                    <i class="fa fa-trash"></i> Delete
                                                                                </a>
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
                                            <!-- /Week Appointment Tab -->

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

            </div>		
            <!-- /Page Content -->

            <!-- Footer -->                            
            <jsp:include flush="true" page="footer.jsp"></jsp:include>                
                <!-- /Footer -->

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
                                <h4 class="modal-title text-center">Cancel</h4>
                                <p class="text-center">Are you sure want to cancel?</p>
                                <form class="text-center" action="<%= request.getContextPath()%>/EmployeeDeleteAppointmentController" method="POST">
                                <input type="hidden" name="appointmentID" id="appointment_id_delete"/>
                                <input type="hidden" name="activePanel" id="active_panel"/>
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
        <script src="<%=request.getContextPath()%>/employee/assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="<%=request.getContextPath()%>/employee/assets/js/popper.min.js"></script>
        <script src="<%=request.getContextPath()%>/employee/assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="<%=request.getContextPath()%>/employee/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="<%=request.getContextPath()%>/employee/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Circle Progress JS -->
        <script src="<%=request.getContextPath()%>/employee/assets/js/circle-progress.min.js"></script>

        <!-- Datatables JS -->
        <script src="<%=request.getContextPath()%>/employee/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="<%=request.getContextPath()%>/employee/assets/plugins/datatables/datatables.min.js"></script>

        <!-- Custom JS --> 
        <script src="<%=request.getContextPath()%>/employee/assets/js/script.js"></script>

        <script>
            $(document).ready(function () {
                $('.datatable').DataTable({
                    "bFilter": false,
                    "bLengthChange": false,
                });
            });
        </script>
        <script>
            var deleteID = function (id,active) {
                var deleteid = document.getElementById('appointment_id_delete');
                deleteid.value = id.toString();
                var activepanel = document.getElementById('active_panel');
                activepanel.value = active.toString();
            };
        </script>
        <script>
            $(document).ready(function () {
                $('.toast').toast('show');
            });
        </script>
    </body>

    <!-- doccure/doctor-dashboard.html  30 Nov 2019 04:12:09 GMT -->
</html>
