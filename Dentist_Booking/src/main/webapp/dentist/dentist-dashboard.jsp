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
            response.sendRedirect("../login.jsp");
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

                                <div class="row">
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
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <h4 class="mb-4">Patient Appoinment</h4>
                                        <div class="appointment-tab">

                                            <!-- Appointment Tab -->
                                            <ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded">
                                                <li class="nav-item">
                                                    <a class="nav-link active" href="#upcoming-appointments" data-toggle="tab">Upcoming</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#today-appointments" data-toggle="tab">Today</a>
                                                </li> 
                                            </ul>
                                            <!-- /Appointment Tab -->
                                        <jsp:useBean id="now" class="java.util.Date"/>
                                        <div class="tab-content">

                                            <!-- Upcoming Appointment Tab -->
                                            <div class="tab-pane show active" id="upcoming-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Patient Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th>Patient Symptom</th>
                                                                        <th>Status</th>
                                                                        <!--                                                                                     <th class="text-center">Paid Amount</th>-->
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach var="list" items="${APPOINTMENT_LIST_DASHBOARD}" >
                                                                        <tr>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="patient-profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${list.customer.image}" alt="User Image"></a>
                                                                                    <a href="patient-profile.html">${list.customer.personalName} <span>${list.customer.id}</span></a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${list.meetingDate}</td>
                                                                            <td>${list.customerSymptom}</td>
                                                                            <!--                                                                            <td>New Patient</td>
                                                                                                                                                        <td class="text-center">$150</td>-->
                                                                            <!--                                                                            <td class="text-right">
                                                                                                                                                            <div class="table-action">
                                                                                                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                                                                                                    <i class="far fa-eye"></i> View
                                                                                                                                                                </a>
                                                                            
                                                                                                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-success-light">
                                                                                                                                                                    <i class="fas fa-check"></i> Accept
                                                                                                                                                                </a>
                                                                                                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
                                                                                                                                                                    <i class="fas fa-times"></i> Cancel
                                                                                                                                                                </a>
                                                                                                                                                            </div>
                                                                                                                                                        </td>-->

                                                                            ${list.status == 1 && list.meetingDate >= now ? "<td><span class=\"badge badge-pill bg-info-light\">Book Success</span></td>":""} 
                                                                            ${list.status == 0 ? "<td><span class=\"badge badge-pill bg-danger-light\">Canceled</span></td>":""} 
                                                                            ${list.status == 2 ? "<td><span class=\"badge badge-pill bg-warning-light\">Checkin</span></td>":""}
                                                                            ${list.status == 3 ? "<td><span class=\"badge badge-pill bg-success-light\">Finished</span></td>":""}
                                                                            ${list.status == 1 && list.meetingDate < now  ? "<td><span class=\"badge badge-pill bg-purple-light\">Overdue</span></td>":""}

                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>		
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Upcoming Appointment Tab -->

                                            <!-- Today Appointment Tab -->
                                            <div class="tab-pane" id="today-appointments">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Patient Name</th>
                                                                        <th>Appointment Date</th>
                                                                        <th>Patient Symptom</th>
                                                                        <th>Status</th>
                                                                        <!--                                                                            <th>Type</th>
                                                                                                                                                    <th class="text-center">Paid Amount</th>-->
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach var="list" items="${APPOINTMENT_LIST_DASHBOARD}" >
                                                                        <tr>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="patient-profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${list.customer.image}" alt="User Image"></a>
                                                                                    <a href="patient-profile.html">${list.customer.personalName} <span>${list.customer.id}</span></a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${list.meetingDate}</td>
                                                                            <td>${list.customerSymptom}</td>
                                                                            <!--                                                                            <td>New Patient</td>
                                                                                                                                                        <td class="text-center">$150</td>-->
                                                                            <!--                                                                            <td class="text-right">
                                                                                                                                                            <div class="table-action">
                                                                                                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                                                                                                    <i class="far fa-eye"></i> View
                                                                                                                                                                </a>
                                                                            
                                                                                                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-success-light">
                                                                                                                                                                    <i class="fas fa-check"></i> Accept
                                                                                                                                                                </a>
                                                                                                                                                                <a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
                                                                                                                                                                    <i class="fas fa-times"></i> Cancel
                                                                                                                                                                </a>
                                                                                                                                                            </div>
                                                                                                                                                        </td>-->

                                                                            ${list.status == 1 && list.meetingDate >= now ? "<td><span class=\"badge badge-pill bg-info-light\">Book Success</span></td>":""} 
                                                                            ${list.status == 0 ? "<td><span class=\"badge badge-pill bg-danger-light\">Canceled</span></td>":""} 
                                                                            ${list.status == 2 ? "<td><span class=\"badge badge-pill bg-warning-light\">Checkin</span></td>":""}
                                                                            ${list.status == 3 ? "<td><span class=\"badge badge-pill bg-success-light\">Finished</span></td>":""}
                                                                            ${list.status == 1 && list.meetingDate < now  ? "<td><span class=\"badge badge-pill bg-purple-light\">Overdue</span></td>":""}
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>		
                                                        </div>	
                                                    </div>	
                                                </div>	
                                            </div>
                                            <!-- /Today Appointment Tab -->

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

    </body>

    <!-- doccure/doctor-dashboard.html  30 Nov 2019 04:12:09 GMT -->
</html>
