<%-- 
    Document   : dentist-dashboard
    Created on : May 21, 2022, 12:38:22 PM
    Author     : hieunguyen
--%>

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

                                

                                <div class="row">
                                    <div class="col-md-12">
                                        <h4 class="mb-4">Patient  Feedback  Confirm</h4>
                                        <div class="appointment-tab">

                                            <div class="tab-content">

                                                <!-- Upcoming Appointment Tab -->
                                                <div class="tab-pane show active">
                                                    <div class="card card-table mb-0">
                                                        <div class="card-body">
                                                            <div class="table-responsive">
                                                                <table class="table table-hover table-center mb-0">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>FeedbackID</th>
                                                                            <th>Appt ID</th>
                                                                            <th>Dentist Rating</th>
                                                                            <th>Dentist Message</th>
                                                                            <th>Status</th>
                                                                            <th></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach var="list" items="${FEEDBACK_LIST}">
                                                                        <tr>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="#">${list.id} </a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${list.appointmentId}</td>
                                                                            <td>${list.dentistRating}</td>
                                                                            <td>${list.dentistMessage}</td>
                                                                            <td class="text-center">${list.status}</td>
                                                                            <td class="text-right">
                                                                                <div class="table-action">
                                                                                    <a href="javascript:void(0);" class="btn btn-sm bg-info-light">
                                                                                        <i class="far fa-eye"></i> View
                                                                                    </a>

                                                                                    <a href="<%=request.getContextPath()%>/FeedbackStatusController?appointmentID=${list.appointmentId}"
                                                                                       class="btn btn-sm bg-success-light">
                                                                                        <i class="fas fa-check"></i> Accept
                                                                                    </a>
                                                                                    <a href="<%=request.getContextPath()%>/FeedbackStatusController?appointmentID=${list.appointmentId}" class="btn btn-sm bg-danger-light">
                                                                                        <i class="fas fa-times"></i> Reject
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
