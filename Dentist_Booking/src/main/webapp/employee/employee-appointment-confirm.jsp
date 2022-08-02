<%--
   Document   : employee-appointment-confirm
   Created on : May 21, 2022, 12:53:17 PM
   Author     : hieunguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/patient-dashboard.html  30 Nov 2019 04:12:16 GMT -->
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

        <!-- Main CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/employee/assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        -->                <script src="<%=request.getContextPath()%>/employee/assets/js/html5shiv.min.js"></script>
        <script src="<%=request.getContextPath()%>/employee/assets/js/respond.min.js"></script><!--
<![endif]-->

    </head>
    <body>

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <jsp:include flush="true" page="header.jsp"></jsp:include>
                <!-- /Header -->

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
                                <h2 class="breadcrumb-title">Appointments checkin <h2>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        <!-- /Breadcrumb -->

                                        <!-- Page Content -->
                                        <div class="content">
                                            <div class="container-fluid">

                                                <div class="row">

                                                    <!-- Profile Sidebar -->

                                                    <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                                                        <!-- Search Filter -->
                                                        <div class="card">
                                                            <div class="card-body pt-0">

                                                                <!-- Tab Menu -->
                                                                <nav class="user-tabs mb-4">
                                                                    <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                                                        <li class="nav-item">
                                                                            <a class="nav-link active" href="#sidebarTab" data-toggle="tab">Sidebar</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" href="#filterTab" data-toggle="tab">Filter</a>
                                                                        </li>
                                                                    </ul>
                                                                </nav>
                                                                <!-- /Tab Menu -->

                                                                <!-- Tab Content -->
                                                                <div class="tab-content pt-0">

                                                                    <!-- Appointment Tab -->
                                                                    <div id="sidebarTab" class="tab-pane fade show active">
                                                                    <jsp:include flush="true" page="profile-sidebar.jsp"></jsp:include>
                                                                    </div>
                                                                    <div id="filterTab" class="tab-pane fade show">
                                                                        <div class="card search-filter">
                                                                            <div class="card-header">
                                                                                <h4 class="card-title mb-0">Search Filter</h4>
                                                                            </div>
                                                                            <div class="card-body">
                                                                                <div class="filter-widget">
                                                                                    <div class="cal-icon">
                                                                                        <input type="text" class="form-control datetimepicker" placeholder="Search appointments">
                                                                                    </div>			
                                                                                </div>
                                                                                <div class="filter-widget">
                                                                                    <h4>Time</h4>
                                                                                    <div>
                                                                                        <label class="custom_check">
                                                                                            <input type="checkbox" name="gender_type" checked>
                                                                                            <span class="checkmark"></span> Today
                                                                                        </label>
                                                                                    </div>
                                                                                    <div>
                                                                                        <label class="custom_check">
                                                                                            <input type="checkbox" name="gender_type">
                                                                                            <span class="checkmark"></span> Tomorrow
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="filter-widget">
                                                                                    <h4>Select Status</h4>
                                                                                    <div>
                                                                                        <label class="custom_check">
                                                                                            <input type="checkbox" name="select_specialist" checked>
                                                                                            <span class="checkmark"></span> Cancelled
                                                                                        </label>
                                                                                    </div>
                                                                                    <div>
                                                                                        <label class="custom_check">
                                                                                            <input type="checkbox" name="select_specialist" checked>
                                                                                            <span class="checkmark"></span> Confirm
                                                                                        </label>
                                                                                    </div>
                                                                                    <div>
                                                                                        <label class="custom_check">
                                                                                            <input type="checkbox" name="select_specialist">
                                                                                            <span class="checkmark"></span> Pending
                                                                                        </label>
                                                                                    </div>

                                                                                </div>
                                                                                <div class="btn-search">
                                                                                    <button type="button" class="btn btn-block">Search</button>
                                                                                </div>	
                                                                            </div>  
                                                                        </div>  
                                                                    </div>

                                                                    <!-- Tab Content -->

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /Search Filter -->

                                                    </div>
                                                    <!-- / Profile Sidebar -->

                                                    <div class="col-md-7 col-lg-8 col-xl-9">
                                                    <c:if test="${requestScope.CHECKIN_ALERT_FAILLED != null}">
                                                        <!--alert=============-->
                                                        <div class="toast"  data-autohide="true" data-delay="3000">
                                                            <div class="toast-header bg-danger-light">
                                                                <strong class="mr-auto text-danger-light">Checkin Section</strong>
                                                                <button type="button" class="text-danger ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                                            </div>
                                                            <div class="toast-body">
                                                                <p class="text-danger">${requestScope.CHECKIN_ALERT_FAILLED}</p>
                                                            </div>
                                                        </div>
                                                        <!--alert=============-->
                                                    </c:if>

                                                    <c:if test="${requestScope.CHECKIN_ALERT_SUCCESS != null}">
                                                        <!--alert=============-->
                                                        <div class="toast"  data-autohide="true" data-delay="3000">
                                                            <div class="toast-header bg-success-light">
                                                                <strong class="mr-auto text-success-light">Checkin Section</strong>
                                                                <button type="button" class="text-success ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                                            </div>
                                                            <div class="toast-body">
                                                                <p class="text-success">${requestScope.CHECKIN_ALERT_SUCCESS}</p>
                                                            </div>
                                                        </div>
                                                        <!--alert=============-->
                                                    </c:if>


                                                    <c:if test="${requestScope.CHECKOUT_FAILLED != null}">
                                                        <!--alert=============-->
                                                        <div class="toast"  data-autohide="true" data-delay="3000">
                                                            <div class="toast-header bg-danger-light">
                                                                <strong class="mr-auto text-danger-light">Checkout Section</strong>
                                                                <button type="button" class="text-danger ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                                            </div>
                                                            <div class="toast-body">
                                                                <p class="text-danger">${requestScope.CHECKOUT_FAILLED}</p>
                                                            </div>
                                                        </div>
                                                        <!--alert=============-->
                                                    </c:if>

                                                    <c:if test="${requestScope.CHECKOUT_SUCCESS != null}">
                                                        <!--alert=============-->
                                                        <div class="toast"  data-autohide="true" data-delay="3000">
                                                            <div class="toast-header bg-success-light">
                                                                <strong class="mr-auto text-success-light">Checkout Section</strong>
                                                                <button type="button" class="text-success ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                                            </div>
                                                            <div class="toast-body">
                                                                <p class="text-success">${requestScope.CHECKOUT_SUCCESS}</p>
                                                            </div>
                                                        </div>
                                                        <!--alert=============-->
                                                    </c:if>

                                                    <div class="card">
                                                        <div class="card-body pt-0">

                                                            <!-- Tab Menu -->
                                                            <nav class="user-tabs mb-4">
                                                                <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                                                    <li class="nav-item">
                                                                        <a class="nav-link ${requestScope.CHECKIN_ALERT_SUCCESS == null && requestScope.CHECKOUT_FAILLED == null ? "active":""}" href="#Checkin" data-toggle="tab">Checkin</a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a class="nav-link ${requestScope.CHECKIN_ALERT_SUCCESS != null || requestScope.CHECKOUT_FAILLED != null ? "active":""}" href="#Checkout" data-toggle="tab">In Process</a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a class="nav-link" href="#Cancelled" data-toggle="tab">Finished Appt</a>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                            <!-- /Tab Menu -->

                                                            <!-- Tab Content -->
                                                            <div class="tab-content pt-0">

                                                                <!-- Appointment Tab -->
                                                                <div id="Checkin" class="tab-pane fade show ${requestScope.CHECKIN_ALERT_SUCCESS == null && requestScope.CHECKOUT_FAILLED == null ? "active":""}">
                                                                    <div class="card card-table mb-0">
                                                                        <div class="card-body">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-center mb-0">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>Appt ID</th>
                                                                                            <th>Customer</th>
                                                                                            <th>Dentist</th>
                                                                                            <th>Appt Booking Date</th>                                    
                                                                                            <th>Status</th>
                                                                                            <th></th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_LIST}">
                                                                                            <tr>
                                                                                                <td>${list.id}</td>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="#" class="avatar avatar-sm mr-2">
                                                                                                            <img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/customer/${list.customer.image}" alt="User Image">
                                                                                                        </a>
                                                                                                        <a href="#"> ${list.customer.personalName}<span>Customer</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="#" class="avatar avatar-sm mr-2">
                                                                                                            <img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/dentist/${list.dentist.image}" alt="User Image">
                                                                                                        </a>
                                                                                                        <a href="#"> ${list.dentist.personalName}<span>${list.dentist.speciality}</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>${list.meetingDate}</td>
                                                                                                <c:if test="${list.status == 1}">
                                                                                                    <td><span class="badge badge-pill bg-success-light">Book Success</span></td>
                                                                                                </c:if>

                                                                                                <c:if test="${list.status == 1}">
                                                                                                    <td class="text-right">
                                                                                                        <div class="table-action">

                                                                                                            <a
                                                                                                                href="#"
                                                                                                                class="btn btn-sm bg-info-light btn-block"                           
                                                                                                                data-toggle="modal"
                                                                                                                data-target="#${list.id}"
                                                                                                                >
                                                                                                                <i class="far fa-eye" ></i>  View detail
                                                                                                            </a>
                                                                                                        </div>
                                                                                                    </td>
                                                                                                </c:if>
                                                                                            </tr>
                                                                                        </c:forEach>

                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div id="Checkout" class="tab-pane fade show ${requestScope.CHECKIN_ALERT_SUCCESS != null || requestScope.CHECKOUT_FAILLED != null ? "active":""}">
                                                                    <div class="card card-table mb-0">
                                                                        <div class="card-body">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-center mb-0">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>ID</th>
                                                                                            <th>Customer</th>
                                                                                            <th>Dentist</th>
                                                                                            <th>Appt Booking Date</th>                                    
                                                                                            <th>Payment</th>
                                                                                            <th>Status</th>
                                                                                            <th></th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_CHECKOUT_LIST}">
                                                                                            <tr>
                                                                                                <td>${list.id}</td>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="#" class="avatar avatar-sm mr-2">
                                                                                                            <img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/customer/${list.customer.image}" alt="User Image">
                                                                                                        </a>
                                                                                                        <a href="#"> ${list.customer.personalName}<span>Customer</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="#" class="avatar avatar-sm mr-2">
                                                                                                            <img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/dentist/${list.dentist.image}" alt="User Image">
                                                                                                        </a>
                                                                                                        <a href="#"> ${list.dentist.personalName}<span>${list.dentist.speciality}</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>${list.meetingDate}</td>
                                                                                                <c:if test="${list.paymentConfirm == 1}">
                                                                                                    <td><span class="badge badge-pill bg-success-light">Purchased</span></td>
                                                                                                </c:if>
                                                                                                <c:if test="${list.paymentConfirm == 0}">
                                                                                                    <td><span class="badge badge-pill bg-danger-light">Unpaid</span></td>
                                                                                                </c:if>
                                                                                                <td><span class="badge badge-pill bg-success-light">In Checkin</span></td>

                                                                                                <td class="text-right">
                                                                                                    <div class="table-action">

                                                                                                        <a
                                                                                                            href="#"
                                                                                                            class="btn btn-sm bg-info-light btn-block"                           
                                                                                                            data-toggle="modal"
                                                                                                            data-target="#${list.id}"
                                                                                                            >
                                                                                                            <i class="far fa-eye" ></i>  View detail
                                                                                                        </a>
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </c:forEach>

                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div id="Cancelled" class="tab-pane fade show">
                                                                    <div class="card card-table mb-0">
                                                                        <div class="card-body">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-center mb-0">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>ID</th>
                                                                                            <th>Customer</th>
                                                                                            <th>Dentist</th>
                                                                                            <th>Appt Booking Date</th>                                    
                                                                                            <th>Status</th>
                                                                                            <th></th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_FINISH_LIST}">
                                                                                            <c:if test="${list.status == 3}">
                                                                                                <tr>
                                                                                                    <td>${list.id}</td>
                                                                                                    <td>
                                                                                                        <h2 class="table-avatar">
                                                                                                            <a href="#" class="avatar avatar-sm mr-2">
                                                                                                                <img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/customer/${list.customer.image}" alt="User Image">
                                                                                                            </a>
                                                                                                            <a href="#"> ${list.customer.personalName}<span>Customer</span></a>
                                                                                                        </h2>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <h2 class="table-avatar">
                                                                                                            <a href="#" class="avatar avatar-sm mr-2">
                                                                                                                <img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/dentist/${list.dentist.image}" alt="User Image">
                                                                                                            </a>
                                                                                                            <a href="#"> ${list.dentist.personalName}<span>${list.dentist.speciality}</span></a>
                                                                                                        </h2>
                                                                                                    </td>
                                                                                                    <td>${list.meetingDate}</td>
                                                                                                    <c:if test="${list.status == 3}">
                                                                                                        <td><span class="badge badge-pill bg-success-light">Finished</span></td>
                                                                                                    </c:if>

                                                                                                    
                                                                                                        <td class="text-right">
                                                                                                            <div class="table-action">

                                                                                                                <a
                                                                                                                    href="#"
                                                                                                                    class="btn btn-sm bg-info-light btn-block"                           
                                                                                                                    data-toggle="modal"
                                                                                                                    data-target="#${list.id}"
                                                                                                                    >
                                                                                                                    <i class="far fa-eye" ></i>  View detail
                                                                                                                </a>
                                                                                                            </div>
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
                                                                <!-- /Billing Tab -->

                                                            </div>
                                                            <!-- Tab Content -->

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

                                    <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_LIST}">                                        
                                        <div class="modal fade custom-modal" id="${list.id}">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">${list.id} - Appointment Details</h5>
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
                                                                            <span class="title">Appointment Date</span>
                                                                            <span class="text">${list.meetingDate}</span>
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <div class="text-right">
                                                                                <button
                                                                                    type="button"
                                                                                    class="btn bg-success-light btn-sm"
                                                                                    id="topup_status"
                                                                                    >
                                                                                    Dentist Confirmed
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <span class="title">Dentist Note:</span>
                                                                <span class="text">${list.dentistNote}</span>
                                                            </li>
                                                            <li>
                                                                <span class="title">Customer Symptom:</span>
                                                                <span class="text">${list.customerSymptom}</span>
                                                            </li>

                                                            <li>
                                                                <span class="text">
                                                                    <c:set var="appointmentIdApplied" value=""/>
                                                                    <c:forEach var="appointment" items="${EMPLOYEE_APPOINTMENT_DETAIL_LIST}">
                                                                        <c:if test="${appointment.key.id == list.id}">
                                                                            <c:set var="appointmentIdApplied" value="${appointment.value}"/>
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
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>


                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <a
                                                                    href="<%=request.getContextPath()%>/UpdateAppointmentStatusController?appointmentID=${list.id}"
                                                                    class="btn btn-sm bg-success-light btn-block"
                                                                    >
                                                                    <i class="fas fa-check"></i> Checkin
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_CHECKOUT_LIST}">                                        
                                        <div class="modal fade custom-modal" id="${list.id}">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">${list.id} - Appointment Details</h5>
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
                                                                            <span class="title">Appointment Date</span>
                                                                            <span class="text">${list.meetingDate}</span>
                                                                        </div>

                                                                        <c:if test="${list.paymentConfirm == 0}">
                                                                            <div class="col-md-6">
                                                                                <div class="text-right">
                                                                                    <button
                                                                                        type="button"
                                                                                        class="btn bg-danger-light btn-sm"
                                                                                        id="topup_status"
                                                                                        >
                                                                                        Unpaid
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${list.paymentConfirm == 1}">
                                                                            <div class="col-md-6">
                                                                                <div class="text-right">
                                                                                    <button
                                                                                        type="button"
                                                                                        class="btn bg-success-light btn-sm"
                                                                                        id="topup_status"
                                                                                        >
                                                                                        Purchased
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <span class="title">Dentist Note:</span>
                                                                <span class="text">${list.dentistNote}</span>
                                                            </li>
                                                            <li>
                                                                <span class="title">Customer Symptom:</span>
                                                                <span class="text">${list.customerSymptom}</span>
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
                                                                                                <c:set var="total" scope="request" value="${total+appointmentSlot.service.price}"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>


                                                                            </c:forEach>
                                                                            <li>
                                                                                <button
                                                                                    type="button"
                                                                                    class="btn bg-success-light btn-sm"
                                                                                    style="font-weight: 500; font-size: 18px"
                                                                                    >
                                                                                    Price: ${total}$
                                                                                </button>
                                                                            </li>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <a
                                                                    href="<%=request.getContextPath()%>/EmployeeInvoiceDetail?appointmentId=${list.id}"

                                                                    class="btn btn-sm bg-success-light btn-block"
                                                                    >
                                                                    <i class="fas fa-check"></i> View Invoice

                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
<c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_FINISH_LIST}">                                        
                                        <div class="modal fade custom-modal" id="${list.id}">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">${list.id} - Appointment Details</h5>
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
                                                                            <span class="title">Appointment Date</span>
                                                                            <span class="text">${list.meetingDate}</span>
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <div class="text-right">
                                                                                <button
                                                                                    type="button"
                                                                                    class="btn bg-success-light btn-sm"
                                                                                    id="topup_status"
                                                                                    >
                                                                                    FINISHED
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <span class="title">Dentist Note:</span>
                                                                <span class="text">${list.dentistNote}</span>
                                                            </li>
                                                            <li>
                                                                <span class="title">Customer Symptom:</span>
                                                                <span class="text">${list.customerSymptom}</span>
                                                            </li>

                                                            <li>
                                                                <span class="text">
                                                                    <c:set var="appointmentIdApplied" value=""/>
                                                                    <c:forEach var="appointment" items="${EMPLOYEE_APPOINTMENT_DETAIL_LIST}">
                                                                        <c:if test="${appointment.key.id == list.id}">
                                                                            <c:set var="appointmentIdApplied" value="${appointment.value}"/>
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
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>


                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </span>
                                                            </li>
                                                            
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                    <!-- jQuery -->
                                    <script src="<%=request.getContextPath()%>/employee/assets/js/jquery.min.js"></script>

                                    <!-- Bootstrap Core JS -->
                                    <script src="<%=request.getContextPath()%>/employee/assets/js/popper.min.js"></script>
                                    <script src="<%=request.getContextPath()%>/employee/assets/js/bootstrap.min.js"></script>

                                    <!-- Sticky Sidebar JS -->
                                    <script src="<%=request.getContextPath()%>/employee/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
                                    <script src="<%=request.getContextPath()%>/employee/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>
                                    <script>
                                        $(document).ready(function () {
                                            $('.toast').toast('show');
                                        });
                                    </script>
                                    <!--                                     Custom JS -->
                                    <script src="<%=request.getContextPath()%>/employee/assets/js/script.js"></script>

                                    </body>

                                    <!-- doccure/patient-dashboard.html  30 Nov 2019 04:12:16 GMT -->
                                    </html>
