<%-- 
    Document   : patient-dashboard
    Created on : May 21, 2022, 12:26:54 PM
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
                                        <li class="breadcrumb-item"><a href="../customer/index.jsp">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Dashboard</h2>
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
                        <jsp:include flush="true" page="profile-sidebar.jsp"></jsp:include>
                            <!-- / Profile Sidebar -->

                            <div class="col-md-7 col-lg-8 col-xl-9">
                                <div class="card">
                                    <div class="card-body pt-0">

                                        <!-- Tab Menu -->
                                        <nav class="user-tabs mb-4">
                                            <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                                <li class="nav-item">
                                                    <a class="nav-link active" href="#pat_appointments" data-toggle="tab">Appointments</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#pat_prescriptions" data-toggle="tab">Prescriptions</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#pat_medical_records" data-toggle="tab"><span class="med-records">Medical Records</span></a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#pat_billing" data-toggle="tab">Billing</a>
                                                </li>
                                            </ul>
                                        </nav>
                                        <!-- /Tab Menu -->

                                        <!-- Tab Content -->
                                        <div class="tab-content pt-0">


                                        <c:if test="${requestScope.APPOINTMENT_LIST != null}">
                                            <!-- Appointment Tab -->
                                            <div id="pat_appointments" class="tab-pane fade show active">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Doctor</th>
                                                                        <th>Appt Date</th>
                                                                        <th>Dentist Note</th>
                                                                        <th>Symptom</th>
                                                                        <th>Status</th>
                                                                        <th>Payment</th>
                                                                        <th>Dentist</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <c:forEach var="list" items="${APPOINTMENT_LIST}">
                                                                        <tr>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                        <img class="avatar-img rounded-circle" src=${list.dentist.image} alt="User Image">
                                                                                    </a>
                                                                                    <a href="doctor-profile.html">${list.dentist.personalName} <span>${list.dentist.role}</span></a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${list.meetingDate} </td>
                                                                            <td>${list.dentistNote}</td>
                                                                            <td>${list.customerSymptom}</td>
                                                                            <c:if test="${list.status == 1}">
                                                                                <td><span class="badge badge-pill bg-warning-light">Pending</span></td>
                                                                            </c:if>
                                                                            <c:if test="${list.status == 0}">
                                                                                <td><span class="badge badge-pill bg-danger-light">Cancelled</span></td>
                                                                            </c:if>
                                                                            <c:if test="${list.status == 2}">
                                                                                <td><span class="badge badge-pill bg-success-light">Confirmed</span></td>
                                                                            </c:if>
                                                                            <c:if test="${list.paymentConfirm == 0}">
                                                                                <td><span class="badge badge-pill bg-danger-light">Unpaid</span></td>
                                                                            </c:if>
                                                                            <c:if test="${list.paymentConfirm == 1}">
                                                                                <td><span class="badge badge-pill bg-danger-light">Purchased</span></td>
                                                                            </c:if>
                                                                            <c:if test="${list.dentistConfirm == 1}">
                                                                                <td><span class="badge badge-pill bg-warning-light">Waiting</span></td>
                                                                            </c:if>
                                                                            <c:if test="${list.dentistConfirm == 0}">
                                                                                <td><span class="badge badge-pill bg-danger-light">Rejected</span></td>
                                                                            </c:if>
                                                                            <c:if test="${list.dentistConfirm == 2}">
                                                                                <td><span class="badge badge-pill bg-success-light">Accepted</span></td>
                                                                            </c:if>
                                                                            <td class="text-right">
                                                                                <div class="table-action">
                                                                                    <c:if test="${list.paymentConfirm == 0 && list.dentistConfirm == 1}">
                                                                                        <a href="AppointmentCheckoutController?appointmentID=${list.id}&dentistID=${list.dentistId}" class="btn btn-sm bg-primary-light">
                                                                                            <i class="fas fa-money-check"></i> Checkout
                                                                                        </a>
                                                                                    </c:if>
                                                                                    <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                        <i class="far fa-eye"></i> View
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
                                            <!-- /Appointment Tab -->
                                        </c:if>

                                        <!-- Prescription Tab -->
                                        <div class="tab-pane fade" id="pat_prescriptions">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th>Date </th>
                                                                    <th>Name</th>									
                                                                    <th>Created by </th>
                                                                    <th></th>
                                                                </tr>     
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>14 Nov 2019</td>
                                                                    <td>Prescription 1</td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-01.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Ruby Perrin <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>13 Nov 2019</td>
                                                                    <td>Prescription 2</td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Darren Elder <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>12 Nov 2019</td>
                                                                    <td>Prescription 3</td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-03.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Deborah Angel <span>Cardiology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>11 Nov 2019</td>
                                                                    <td>Prescription 4</td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-04.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Sofia Brient <span>Urology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>10 Nov 2019</td>
                                                                    <td>Prescription 5</td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-05.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Marvin Campbell <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>9 Nov 2019</td>
                                                                    <td>Prescription 6</td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-06.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Katharine Berthold <span>Orthopaedics</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>8 Nov 2019</td>
                                                                    <td>Prescription 7</td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-07.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Linda Tobin <span>Neurology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>7 Nov 2019</td>
                                                                    <td>Prescription 8</td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-08.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Paul Richard <span>Dermatology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>6 Nov 2019</td>
                                                                    <td>Prescription 9</td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-09.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. John Gibbs <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>5 Nov 2019</td>
                                                                    <td>Prescription 10</td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-10.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Olga Barlow <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>	
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Prescription Tab -->

                                        <!-- Medical Records Tab -->
                                        <div id="pat_medical_records" class="tab-pane fade">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th>ID</th>
                                                                    <th>Date </th>
                                                                    <th>Description</th>
                                                                    <th>Attachment</th>
                                                                    <th>Created</th>
                                                                    <th></th>
                                                                </tr>     
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><a href="javascript:void(0);">#MR-0010</a></td>
                                                                    <td>14 Nov 2019</td>
                                                                    <td>Dental Filling</td>
                                                                    <td><a href="#">dental-test.pdf</a></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-01.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Ruby Perrin <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="javascript:void(0);">#MR-0009</a></td>
                                                                    <td>13 Nov 2019</td>
                                                                    <td>Teeth Cleaning</td>
                                                                    <td><a href="#">dental-test.pdf</a></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Darren Elder <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="javascript:void(0);">#MR-0008</a></td>
                                                                    <td>12 Nov 2019</td>
                                                                    <td>General Checkup</td>
                                                                    <td><a href="#">cardio-test.pdf</a></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-03.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Deborah Angel <span>Cardiology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="javascript:void(0);">#MR-0007</a></td>
                                                                    <td>11 Nov 2019</td>
                                                                    <td>General Test</td>
                                                                    <td><a href="#">general-test.pdf</a></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-04.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Sofia Brient <span>Urology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="javascript:void(0);">#MR-0006</a></td>
                                                                    <td>10 Nov 2019</td>
                                                                    <td>Eye Test</td>
                                                                    <td><a href="#">eye-test.pdf</a></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-05.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Marvin Campbell <span>Ophthalmology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="javascript:void(0);">#MR-0005</a></td>
                                                                    <td>9 Nov 2019</td>
                                                                    <td>Leg Pain</td>
                                                                    <td><a href="#">ortho-test.pdf</a></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-06.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Katharine Berthold <span>Orthopaedics</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="javascript:void(0);">#MR-0004</a></td>
                                                                    <td>8 Nov 2019</td>
                                                                    <td>Head pain</td>
                                                                    <td><a href="#">neuro-test.pdf</a></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-07.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Linda Tobin <span>Neurology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="javascript:void(0);">#MR-0003</a></td>
                                                                    <td>7 Nov 2019</td>
                                                                    <td>Skin Alergy</td>
                                                                    <td><a href="#">alergy-test.pdf</a></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-08.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Paul Richard <span>Dermatology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="javascript:void(0);">#MR-0002</a></td>
                                                                    <td>6 Nov 2019</td>
                                                                    <td>Dental Removing</td>
                                                                    <td><a href="#">dental-test.pdf</a></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-09.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. John Gibbs <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="javascript:void(0);">#MR-0001</a></td>
                                                                    <td>5 Nov 2019</td>
                                                                    <td>Dental Filling</td>
                                                                    <td><a href="#">dental-test.pdf</a></td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-10.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Olga Barlow <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>  	
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Medical Records Tab -->

                                        <!-- Billing Tab -->
                                        <div id="pat_billing" class="tab-pane fade">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th>Invoice No</th>
                                                                    <th>Doctor</th>
                                                                    <th>Amount</th>
                                                                    <th>Paid On</th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <a href="invoice-view.html">#INV-0010</a>
                                                                    </td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-01.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Ruby Perrin <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>$450</td>
                                                                    <td>14 Nov 2019</td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="invoice-view.html" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <a href="invoice-view.html">#INV-0009</a>
                                                                    </td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Darren Elder <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>$300</td>
                                                                    <td>13 Nov 2019</td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="invoice-view.html" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <a href="invoice-view.html">#INV-0008</a>
                                                                    </td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-03.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Deborah Angel <span>Cardiology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>$150</td>
                                                                    <td>12 Nov 2019</td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="invoice-view.html" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <a href="invoice-view.html">#INV-0007</a>
                                                                    </td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-04.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Sofia Brient <span>Urology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>$50</td>
                                                                    <td>11 Nov 2019</td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="invoice-view.html" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <a href="invoice-view.html">#INV-0006</a>
                                                                    </td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-05.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Marvin Campbell <span>Ophthalmology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>$600</td>
                                                                    <td>10 Nov 2019</td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="invoice-view.html" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <a href="invoice-view.html">#INV-0005</a>
                                                                    </td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-06.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Katharine Berthold <span>Orthopaedics</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>$200</td>
                                                                    <td>9 Nov 2019</td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="invoice-view.html" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <a href="invoice-view.html">#INV-0004</a>
                                                                    </td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-07.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Linda Tobin <span>Neurology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>$100</td>
                                                                    <td>8 Nov 2019</td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="invoice-view.html" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <a href="invoice-view.html">#INV-0003</a>
                                                                    </td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-08.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Paul Richard <span>Dermatology</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>$250</td>
                                                                    <td>7 Nov 2019</td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="invoice-view.html" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <a href="invoice-view.html">#INV-0002</a>
                                                                    </td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-09.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. John Gibbs <span>Dental</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>$175</td>
                                                                    <td>6 Nov 2019</td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="invoice-view.html" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <a href="invoice-view.html">#INV-0001</a>
                                                                    </td>
                                                                    <td>
                                                                        <h2 class="table-avatar">
                                                                            <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                <img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-10.jpg" alt="User Image">
                                                                            </a>
                                                                            <a href="doctor-profile.html">Dr. Olga Barlow <span>#0010</span></a>
                                                                        </h2>
                                                                    </td>
                                                                    <td>$550</td>
                                                                    <td>5 Nov 2019</td>
                                                                    <td class="text-right">
                                                                        <div class="table-action">
                                                                            <a href="invoice-view.html" class="btn btn-sm bg-info-light">
                                                                                <i class="far fa-eye"></i> View
                                                                            </a>
                                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                                <i class="fas fa-print"></i> Print
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
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
