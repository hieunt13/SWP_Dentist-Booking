<%-- 
    Document   : dentist-dashboard
    Created on : May 21, 2022, 12:38:22 PM
    Author     : hieunguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
    <%
        
        Dentist dentist = (Dentist) session.getAttribute("Login_Dentist");
        if (dentist == null || dentist.equals("")) {
            response.sendRedirect("/dentalclinic/login.jsp");
            return;
        }
    %>
    <!-- doccure/doctor-dashboard.html  30 Nov 2019 04:12:03 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- Datatables CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/plugins/datatables/datatables.min.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        -->                <script src="<%=request.getContextPath()%>/dentist/assets/js/html5shiv.min.js"></script>
        <script src="<%=request.getContextPath()%>/dentist/assets/js/respond.min.js"></script><!--
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
                                <h2 class="breadcrumb-title">Dentist Dashboard</h2>
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

                                <!--                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="card dash-card">
                                                                            <div class="card-body">
                                                                                <div class="row">
                                                                                    <div class="col-md-12 col-lg-4">
                                                                                        <div class="dash-widget dct-border-rht">
                                                                                            <div class="circle-bar circle-bar1">
                                                                                                <div class="circle-graph1" data-percent="75">
                                                                                                    <img src="assets/img/icon-01.png" class="img-fluid" alt="patient">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="dash-widget-info">
                                                                                                <h6>Total Patient</h6>
                                                                                                <h3>1500</h3>
                                                                                                <p class="text-muted">Till Today</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                
                                                                                    <div class="col-md-12 col-lg-4">
                                                                                        <div class="dash-widget dct-border-rht">
                                                                                            <div class="circle-bar circle-bar2">
                                                                                                <div class="circle-graph2" data-percent="65">
                                                                                                    <img src="assets/img/icon-02.png" class="img-fluid" alt="Patient">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="dash-widget-info">
                                                                                                <h6>Today Patient</h6>
                                                                                                <h3>160</h3>
                                                                                                <p class="text-muted">06, Nov 2019</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                
                                                                                    <div class="col-md-12 col-lg-4">
                                                                                        <div class="dash-widget">
                                                                                            <div class="circle-bar circle-bar3">
                                                                                                <div class="circle-graph3" data-percent="50">
                                                                                                    <img src="assets/img/icon-03.png" class="img-fluid" alt="Patient">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="dash-widget-info">
                                                                                                <h6>Appoinments</h6>
                                                                                                <h3>85</h3>
                                                                                                <p class="text-muted">06, Apr 2019</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                                <!-- end of statistic -->
                            <c:if test="${param.Msg != null}">
                                <div class="toast" data-autohide="true" data-delay="10000">
                                    <div class="toast-header bg-danger-light">
                                        <strong class="mr-auto text-danger">Notification</strong>
                                        <button type="button" class="text-danger ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                    </div>
                                    <div class="toast-body">
                                        <p class="text-danger">${param.Msg}</p>
                                    </div>
                                </div>
                            </c:if>
                            <!-- Notification Appointment -->    
                            <c:if test="${not empty NOTIFICATION}">
                                <div class="toast" data-autohide="true" data-delay="3500">
                                    <div class="toast-header bg-info-light">
                                        <strong class="mr-auto text-info">Notification</strong>
                                        <button type="button" class="text-info ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                    </div>
                                    <div class="toast-body">                             
                                        <p class="text-info "> ${NOTIFICATION} </p>
                                    </div>
                                </div>
                            </c:if>
                            <!-- / Notification Appointment -->   
                            <div class="row">
                                <div class="col-md-12">
                                    <!--                                        <h4 class="mb-4">Patient Appoinment</h4>-->
                                    <div class="appointment-tab">

                                        <!-- Appointment Tab -->
                                        <ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded">
                                            <li class="nav-item">
                                                <a class="nav-link ${active == 'today' ? "active":""}" href="#today-appointments" data-toggle="tab">Today</a>
                                            </li> 
                                            <li class="nav-item">
                                                <a class="nav-link ${active == 'upcomming' ? "active":""}" href="#upcoming-appointments" data-toggle="tab">Upcoming</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link ${active == 'archived' ? "active":""}" href="#finished-appointments" data-toggle="tab">Archived</a>
                                            </li> 
                                        </ul>
                                        <!-- /Appointment Tab -->


                                        <div class="tab-content">

                                            <!-- Today Appointment Tab -->
                                            <div class="tab-pane ${active == 'today' ? "show active":""}" id="today-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table datatable table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr class="text-left">
                                                                        <th>ID</th>
                                                                        <th>Patient Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th>Status</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="text-left">
                                                                    <c:forEach var="list" items="${APPOINTMENT_LIST_DASHBOARD}" >
                                                                        <c:if test = "${list.meetingDate == NOW.toString() && (list.status == 1 || list.status == 2 || list.status == 3)}">
                                                                            <tr>
                                                                                <td>${list.id}</td>
                                                                                <td>
                                                                                    <h2 class="table-avatar">
                                                                                        <a href="#" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="/dentalclinic/customer/${list.customer.image}" alt="User Image"></a>
                                                                                        <a href="#">${list.customer.personalName} <span>${list.customer.id}</span></a>
                                                                                    </h2>
                                                                                </td>
                                                                                <td>${list.meetingDate}</td>
                                                                                ${list.status == 1 && list.meetingDate.toString() >= NOW.toString() ? "<td><span class=\"badge badge-pill bg-info-light\">Book Success</span></td>":""} 
                                                                                ${list.status == 0 ? "<td><span class=\"badge badge-pill bg-danger-light\">Canceled</span></td>":""} 
                                                                                ${list.status == 2 ? "<td><span class=\"badge badge-pill bg-warning-light\">Checkin</span></td>":""}
                                                                                ${list.status == 3 ? "<td><span class=\"badge badge-pill bg-success-light\">Finished</span></td>":""}
                                                                                ${list.status == 1 && list.meetingDate.toString() < NOW.toString() ? "<td><span class=\"badge badge-pill bg-purple-light\">Overdue</span></td>":""}
                                                                                <td>
                                                                                    <a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#detail${list.id}">
                                                                                        <i class="far fa-eye"></i> View
                                                                                    </a>
                                                                                    <c:url var="bookAppointment" value="${request.contextPath}/dentist/AppointmentController/booking">
                                                                                        <c:param name="dentistId" value="${list.dentistId}"></c:param>
                                                                                        <c:param name="customerId" value="${list.customerId}"></c:param>
                                                                                    </c:url>
                                                                                    <c:if test = "${list.status > 1}">
                                                                                        <a class="btn btn-sm bg-purple-light" href="${bookAppointment}">
                                                                                            <i class="fas fa-calendar-alt"></i> Book
                                                                                        </a>
                                                                                    </c:if>  
                                                                                    <c:if test = "${list.dentistConfirm == 0 && list.status == 2}">
                                                                                        <a href="#" data-toggle="modal" data-target="#note${list.id}" class="btn btn-sm bg-primary-light">
                                                                                            <i class="fas fa-check"></i> Complete
                                                                                        </a>     
                                                                                    </c:if>    
                                                                                </td>
                                                                            </tr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>		
                                                        </div>
                                                    </div>	
                                                </div>
                                            </div>
                                            <!-- /Today Appointment Tab -->

                                            <!-- Upcoming Appointment Tab -->
                                            <div class="tab-pane ${active == 'upcomming' ? "show active":""}" id="upcoming-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table datatable table-hover table-center mb-0">
                                                                <thead class="text-left">
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>Patient Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th>Status</th>
                                                                        <th class="text-center">Action</th>
                                                                    </tr>
                                                                </thead class="text-left">
                                                                <tbody>
                                                                    <c:forEach var="list" items="${APPOINTMENT_LIST_DASHBOARD}" >
                                                                        <c:if test = "${list.meetingDate.toString() > NOW.toString() && list.status == 1}">
                                                                            <tr>
                                                                                <td>${list.id}</td>
                                                                                <td>
                                                                                    <h2 class="table-avatar">
                                                                                        <a href="#" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="/dentalclinic/customer/${list.customer.image}" alt="User Image"></a>
                                                                                        <a href="#">${list.customer.personalName} <span>${list.customer.id}</span></a>
                                                                                    </h2>
                                                                                </td>
                                                                                <td>${list.meetingDate}</td>
                                                                                ${list.status == 1 && list.meetingDate.toString() >= NOW.toString() ? "<td><span class=\"badge badge-pill bg-info-light\">Book Success</span></td>":""} 
                                                                                ${list.status == 0 ? "<td><span class=\"badge badge-pill bg-danger-light\">Canceled</span></td>":""} 
                                                                                ${list.status == 2 ? "<td><span class=\"badge badge-pill bg-warning-light\">Checkin</span></td>":""}
                                                                                ${list.status == 3 ? "<td><span class=\"badge badge-pill bg-success-light\">Finished</span></td>":""}
                                                                                ${list.status == 1 && list.meetingDate.toString() < NOW.toString() ? "<td><span class=\"badge badge-pill bg-purple-light\">Overdue</span></td>":""}
                                                                                <td class="text-center">
                                                                                    <a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#detail${list.id}">
                                                                                        <i class="far fa-eye"></i> View
                                                                                    </a>
                                                                                </td>
                                                                            </tr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>		
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Upcoming Appointment Tab -->

                                            <!-- Finished Appointment Tab -->
                                            <div class="tab-pane ${active == 'archived' ? "show active":""}" id="finished-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table datatable table-hover table-center mb-0">
                                                                <thead class="text-left">
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>Patient Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th>Status</th>
                                                                        <th class="text-center">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="text-left">
                                                                    <c:forEach var="list" items="${APPOINTMENT_LIST_DASHBOARD}" >
                                                                        <c:if test = "${(list.status == 3 && list.meetingDate.toString() < NOW.toString()) || (list.status == 1 && list.meetingDate.toString() < NOW.toString())}">
                                                                            <tr>
                                                                                <td>${list.id}</td>
                                                                                <td>
                                                                                    <h2 class="table-avatar">
                                                                                        <a href="#" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="/dentalclinic/customer/${list.customer.image}" alt="User Image"></a>
                                                                                        <a href="#">${list.customer.personalName} <span>${list.customer.id}</span></a>
                                                                                    </h2>
                                                                                </td>
                                                                                <td>${list.meetingDate}</td>
                                                                                ${list.status == 1 && list.meetingDate.toString() >= NOW.toString() ? "<td><span class=\"badge badge-pill bg-info-light\">Book Success</span></td>":""} 
                                                                                ${list.status == 0 ? "<td><span class=\"badge badge-pill bg-danger-light\">Canceled</span></td>":""} 
                                                                                ${list.status == 2 ? "<td><span class=\"badge badge-pill bg-warning-light\">Checkin</span></td>":""}
                                                                                ${list.status == 3 ? "<td><span class=\"badge badge-pill bg-success-light\">Finished</span></td>":""}
                                                                                ${list.status == 1 && list.meetingDate.toString() < NOW.toString() ? "<td><span class=\"badge badge-pill bg-purple-light\">Overdue</span></td>":""}
                                                                                <td class="text-center">
                                                                                    <a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#detail${list.id}">
                                                                                        <i class="far fa-eye"></i> View
                                                                                    </a>
                                                                                </td>
                                                                            </tr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>		
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Finished Appointment Tab -->
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
            </div>
            <!-- /Main Wrapper -->

            <!-- Dentist Note Modal -->
        <c:forEach var="listApp" items="${APPOINTMENT_LIST_DASHBOARD}">
            <div class="modal fade custom-modal" id="note${listApp.id}">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Dentist Note for the Patient</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="../dentist/DentistNote" method="post">
                                <div class="row form-row">
                                    <input type="hidden" name="appointment_id" value="${listApp.id}"/>
                                    <input type="hidden" name="id" value="${listApp.id}"/>
                                    <input type="hidden" name="confirm" value="confirm"/>
                                    <div class="col-12 col-sm-12">
                                        <div class="form-group">
                                            <textarea type="text" class="form-control" name="note" rows="3" minlength="10" maxlength="1000"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block" >Send</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- /Dentist Note Modal -->  

        <!<!-- View Detail -->
        <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_LIST}">
            <div class="modal fade custom-modal" id="detail${list.id}">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">${list.id} - Appointment Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            <ul class="info-details">
                                <li>
                                    <div class="details-header">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <span class="title">Appointment Date</span>
                                                <span class="text">${list.meetingDate}</span>
                                            </div>

                                            <c:if test="${list.paymentConfirm == 0}">
                                                <div class="col-md-6">
                                                    <div class="text-right">
                                                        <button type="button" class="btn bg-danger-light btn-sm" id="topup_status">
                                                            Unpaid
                                                        </button>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${list.paymentConfirm == 1}">
                                                <div class="col-md-6">
                                                    <div class="text-right">
                                                        <button type="button" class="btn bg-success-light btn-sm" id="topup_status">
                                                            Paid
                                                        </button>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <c:if test="${not empty list.dentistNote}">
                                        <span class="title">Dentist Note:</span>
                                        <span class="text">${list.dentistNote}</span>
                                    </c:if>
                                </li>
                                <li>
                                    <c:if test="${not empty list.customerSymptom}">
                                        <span class="title">Customer Symptom:</span>
                                        <span class="text">${list.customerSymptom}</span>
                                    </c:if>
                                </li>

                                <li>
                                    <span class="text">
                                        <c:set var="appointmentIdApplied" value=""/>

                                        <c:forEach var="appointment" items="${EMPLOYEE_APPOINTMENT_DETAIL_LIST}">
                                            <c:if test="${appointment.key.id == list.id}">
                                                <c:set var="appointmentIdApplied" value="${appointment.value}"/>
                                                <c:set var="total" scope="request" value="${0}"/>
                                                <c:forEach var="appointmentSlot" items="${appointment.value}">
                                                    <li>
                                                        <div class="details-header">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <span class="title">Service Name</span>
                                                                    <span class="text">${appointmentSlot.service.serviceName}</span>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="text">
                                                                        <span class="title">Slot</span>
                                                                        <span class="text">Slot ${appointmentSlot.slot}</span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="text">
                                                                        <span class="title">Price</span>
                                                                        <span class="text">${appointmentSlot.service.price}$</span>
                                                                    </div>
                                                                    <c:set var="total" scope="request" value="${total+appointmentSlot.service.price}" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>


                                                </c:forEach>
                                                <li>
                                                    <button type="button" class="btn bg-success-light btn-sm" style="font-weight: 500; font-size: 18px">
                                                        Price: ${total}$
                                                    </button>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </span>
                                </li>
                                <li>
                                    <c:if test="${list.paymentConfirm == 0 && list.dentistConfirm == 2 && list.status == 2}">
                                        <a href="AppointmentCheckoutController?appointmentID=${list.id}&dentistID=${list.dentist.id}" class="btn btn-sm bg-success-light btn-block">
                                            <i class="fas fa-money-check"></i> Pay

                                        </a>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!<!-- /View Detail -->
        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Circle Progress JS -->
        <script src="assets/js/circle-progress.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

        <!-- Datatables JS -->
        <script src="<%=request.getContextPath()%>/customer/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="<%=request.getContextPath()%>/customer/assets/plugins/datatables/datatables.min.js"></script>

        <script>
            $(document).ready(function () {
                $('.toast').toast('show');
            });
            $(document).ready(function () {
                $('.datatable').DataTable({
                    "bFilter": false,
                    "bLengthChange": false,
                });
            });
        </script>

    </body>

    <!-- doccure/doctor-dashboard.html  30 Nov 2019 04:12:09 GMT -->
</html>
