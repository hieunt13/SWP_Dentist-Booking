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
        <link href="assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
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
                                                        <!-- /Search Filter -->
                                                    </div>
                                                    <!-- / Profile Sidebar -->

                                                    <div class="col-md-7 col-lg-8 col-xl-9">
                                                        <div class="card">
                                                            <div class="card-body pt-0">

                                                                <!-- Tab Menu -->
                                                                <nav class="user-tabs mb-4">
                                                                    <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                                                        <li class="nav-item">
                                                                            <a class="nav-link active" href="#Checkin" data-toggle="tab">Pending Appt</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" href="#Checkout" data-toggle="tab">Checkout & Billing</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" href="#Cancelled" data-toggle="tab">Cancelled Appt</a>
                                                                        </li>
                                                                    </ul>
                                                                </nav>
                                                                <!-- /Tab Menu -->

                                                                <!-- Tab Content -->
                                                                <div class="tab-content pt-0">

                                                                    <!-- Appointment Tab -->
                                                                    <div id="Checkin" class="tab-pane fade show active">
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
                                                                                                <th>Dentist Confirm</th>
                                                                                                <th></th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                        <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_LIST}">
                                                                                            <tr>
                                                                                                <td>${list.id}</td>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                                            <img class="avatar-img rounded-circle" src=${list.customer.image} alt="User Image">
                                                                                                        </a>
                                                                                                        <a href="doctor-profile.html"> ${list.customer.personalName}<span>Customer</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                                            <img class="avatar-img rounded-circle" src=${list.dentist.image} alt="User Image">
                                                                                                        </a>
                                                                                                        <a href="doctor-profile.html"> ${list.dentist.personalName}<span>${list.dentist.speciality}</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>${list.meetingDate}</td>
                                                                                                <c:if test="${list.dentistConfirm == 2}">
                                                                                                    <td><span class="badge badge-pill bg-success-light">Confirmed</span></td>
                                                                                                </c:if>
                                                                                                <c:if test="${list.dentistConfirm == 1}">
                                                                                                    <td><span class="badge badge-pill bg-warning-light">Pending</span></td>
                                                                                                </c:if>
                                                                                                <c:if test="${list.dentistConfirm == 2}">
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
                                                                <div id="Checkout" class="tab-pane fade show">
                                                                    <div class="card card-table mb-0">
                                                                        <div class="card-body">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-hover table-center mb-0">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>Tab2 ID</th>
                                                                                            <th>Customer</th>
                                                                                            <th>Dentist</th>
                                                                                            <th>Appt Booking Date</th>                                    
                                                                                            <th>Payment</th>
                                                                                            <th>Dentist Confirm</th>
                                                                                            <th></th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_CHECKOUT_LIST}">
                                                                                            <tr>
                                                                                                <td>${list.id}</td>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                                            <img class="avatar-img rounded-circle" src=${list.customer.image} alt="User Image">
                                                                                                        </a>
                                                                                                        <a href="doctor-profile.html"> ${list.customer.personalName}<span>Customer</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                                            <img class="avatar-img rounded-circle" src=${list.dentist.image} alt="User Image">
                                                                                                        </a>
                                                                                                        <a href="doctor-profile.html"> ${list.dentist.personalName}<span>${list.dentist.speciality}</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>${list.meetingDate}</td>
                                                                                                <c:if test="${list.paymentConfirm == 1}">
                                                                                                    <td><span class="badge badge-pill bg-success-light">Purchased</span></td>
                                                                                                </c:if>
                                                                                                <c:if test="${list.paymentConfirm == 0}">
                                                                                                    <td><span class="badge badge-pill bg-danger-light">Unpaid</span></td>
                                                                                                </c:if>
                                                                                                <td><span class="badge badge-pill bg-success-light">Confirmed</span></td>

                                                                                                <td class="text-right">
                                                                                                    <div class="table-action">

                                                                                                        <a
                                                                                                            href="#"
                                                                                                            class="btn btn-sm bg-info-light btn-block"                           
                                                                                                            data-toggle="modal"
                                                                                                            data-target="#confirmPurchase"
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
                                                                                            <th>Tab2 ID</th>
                                                                                            <th>Customer</th>
                                                                                            <th>Dentist</th>
                                                                                            <th>Appt Booking Date</th>                                    
                                                                                            <th>Dentist Confirm</th>
                                                                                            <th></th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_CANCELLED_LIST}">
                                                                                            <tr>
                                                                                                <td>${list.id}</td>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                                            <img class="avatar-img rounded-circle" src=${list.customer.image} alt="User Image">
                                                                                                        </a>
                                                                                                        <a href="doctor-profile.html"> ${list.customer.personalName}<span>Customer</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                                            <img class="avatar-img rounded-circle" src=${list.dentist.image} alt="User Image">
                                                                                                        </a>
                                                                                                        <a href="doctor-profile.html"> ${list.dentist.personalName}<span>${list.dentist.speciality}</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>${list.meetingDate}</td>
                                                                                                <c:if test="${list.dentistConfirm == 1}">
                                                                                                    <td><span class="badge badge-pill bg-success-light">Accepted</span></td>
                                                                                                </c:if>
                                                                                                <c:if test="${list.dentistConfirm == 0}">
                                                                                                    <td><span class="badge badge-pill bg-danger-light">Rejected</span></td>
                                                                                                </c:if> 

                                                                                                <td class="text-right">
                                                                                                    <div class="table-action">
                                                                                                        <a
                                                                                                            href="#"
                                                                                                            class="btn btn-sm bg-info-light btn-block"                           
                                                                                                            data-toggle="modal"
                                                                                                            data-target="#confirmPurchase"
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
                                                        <h5 class="modal-title">${list.id} - Promotion Details</h5>
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
                                                                    href="#"
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


                                    <!-- jQuery -->
                                    <script src="assets/js/jquery.min.js"></script>

                                    <!-- Bootstrap Core JS -->
                                    <script src="assets/js/popper.min.js"></script>
                                    <script src="assets/js/bootstrap.min.js"></script>

                                    <!-- Sticky Sidebar JS -->
                                    <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
                                    <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

                                    <!-- Custom JS -->
                                    <script src="assets/js/script.js"></script>

                                    </body>

                                    <!-- doccure/patient-dashboard.html  30 Nov 2019 04:12:16 GMT -->
                                    </html>
