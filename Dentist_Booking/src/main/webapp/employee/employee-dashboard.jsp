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
        <link href="<%=request.getContextPath()%>/employee/assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/employee/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/employee/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/employee/assets/plugins/fontawesome/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/employee/assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>-->             
        <script src="<%=request.getContextPath()%>/employee/assets/js/html5shiv.min.js"></script>
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



                                <div class="row">
                                    <div class="col-md-12">
                                        <h4 class="mb-4">Patient  Feedback  Confirm</h4>
                                        <span class="mb-4" style="color: #00cc52">${SUCCESS}</span>
                                        <span class="mb-4" style="color: red">${FAIL}</span>
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
                                                                            <td class="text-left">
                                                                                ${list.status == 1 ? "<span class=\"badge badge-pill bg-warning-light\">Pending</span>":""} 
                                                                                ${list.status == 2 ? "<span class=\"badge badge-pill bg-success-light\">Accepted</span>":""}
                                                                                ${list.status == 0 ? "<span class=\"badge badge-pill bg-danger-light\">Rejected</span>":""}
                                                                            </td>
                                                                            <td class="text-left">
                                                                                <div class="table-action">
                                                                                    <a
                                                                                        href="#"
                                                                                        class="btn btn-sm bg-info-light btn-block"                           
                                                                                        data-toggle="modal"
                                                                                        data-target="#${list.id}"
                                                                                        >
                                                                                        <i class="far fa-eye" ></i>
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
        <c:forEach var="feedback_detail" items="${FEEDBACK_LIST}">
            <div class="modal fade custom-modal" id="${feedback_detail.id}">
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
                                                <span class="title">Feedback ID:${feedback_detail.id}</span>
                                                <span class="text">Appointment: ${feedback_detail.appointmentId}</span>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="text-right">
                                                    <c:if test="${feedback_detail.status == 1}">
                                                        <button
                                                            type="button"
                                                            class="btn bg-warning-light btn-sm"
                                                            id="topup_status"
                                                            >
                                                            Pending       
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${feedback_detail.status == 2}">
                                                        <button
                                                            type="button"
                                                            class="btn bg-success-light btn-sm"
                                                            id="topup_status"
                                                            >
                                                            Accepted       
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${feedback_detail.status == 0}">
                                                        <button
                                                            type="button"
                                                            class="btn bg-danger-light btn-sm"
                                                            id="topup_status"
                                                            >
                                                            Rejected       
                                                        </button>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <span class="title">Rating</span>
                                    <span class="text">${feedback_detail.dentistRating}<i class="fas fa-star filled"></i></span>
                                </li>
                                <li>
                                    <span class="title">Message</span>
                                    <span class="text"
                                          >${feedback_detail.dentistMessage}</span
                                    >
                                </li>
                                <li>
                                    <c:if test="${feedback_detail.status == 1}">
                                        <a href="<%=request.getContextPath()%>/FeedbackStatusController?appointmentID=${feedback_detail.id}&status=2"
                                           class="btn btn-success">
                                            Accept
                                        </a>
                                        <a href="<%=request.getContextPath()%>/FeedbackStatusController?appointmentID=${feedback_detail.id}&status=0" 
                                           class="btn btn-danger">
                                            Reject
                                        </a>
                                    </c:if>
                                    <c:if test="${feedback_detail.status == 0}">
                                        <a href="<%=request.getContextPath()%>/FeedbackStatusController?appointmentID=${feedback_detail.id}&status=2"
                                           class="btn btn-success">
                                            Accept
                                        </a>
                                    </c:if>
                                    <c:if test="${feedback_detail.status == 2}">
                                        <a href="<%=request.getContextPath()%>/FeedbackStatusController?appointmentID=${feedback_detail.id}&status=0" 
                                           class="btn btn-danger">
                                            Reject
                                        </a>
                                    </c:if>

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

        <!-- Circle Progress JS -->
        <script src="<%=request.getContextPath()%>/employee/assets/js/circle-progress.min.js"></script>

        <!-- Custom JS -->
        <script src="<%=request.getContextPath()%>/employee/assets/js/script.js"></script>
        <script>
            var cancelAppointment = function (elm) {
                var linkCancel = document.getElementById('linkCancel');
                linkCancel.href = elm.href;
            };
        </script>
    </body>

    <!-- doccure/doctor-dashboard.html  30 Nov 2019 04:12:09 GMT -->
</html>
