<%-- 
    Document   : patient-dashboard
    Created on : May 21, 2022, 12:26:54 PM
    Author     : hieunguyen
--%>

<%@page import="com.fptproject.SWP391.model.Feedback"%>
<%
    session = request.getSession();
    if (session == null) {
        response.sendRedirect("../login.jsp");
        return;
    }%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.fptproject.SWP391.model.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Customer customer = (Customer) session.getAttribute("Login_Customer");
        if (customer == null || customer.equals("")) {
            response.sendRedirect("../login.jsp");
            return;
        }
    %>
    <!-- doccure/patient-dashboard.html  30 Nov 2019 04:12:16 GMT -->

    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <!-- another fontawsome -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/fontawesome.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

        <!-- Favicons -->
        <link href="<%=request.getContextPath()%>/customerassets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/plugins/fontawesome/css/all.min.css">
        <!-- Datatables CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/plugins/datatables/datatables.min.css">
        <!-- Main CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        --><script src="<%=request.getContextPath()%>/customer/assets/js/html5shiv.min.js"></script>
        <script src="<%=request.getContextPath()%>/customer/assets/js/respond.min.js"></script><!--
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
                            <!-- Notification canceled appointment --> 
                            <div class="col-md-7 col-lg-8 col-xl-9">
                            <c:if test="${param.cancelMsg != null}">
                                <div class="toast" data-autohide="true" data-delay="10000">
                                    <div class="toast-header bg-danger-light">
                                        <strong class="mr-auto text-danger">Notification</strong>
                                        <button type="button" class="text-info ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                    </div>
                                    <div class="toast-body">
                                        <p class="text-danger">${param.cancelMsg}</p>
                                    </div>
                                </div>
                            </c:if>
                            <!-- /Notification canceled appointment --> 

                            <!-- Notification Upcoming Appointment -->      
                                <%
                                    Appointment appointment = (Appointment) request.getAttribute("Appointment_Noti");
                                    if (appointment != null && appointment.getStatus()== 1) {
                                %>
                                <div class="toast" data-autohide="false">
                                    <div class="toast-header bg-info-light">
                                        <strong class="mr-auto text-info">Notification</strong>
                                        <button type="button" class="text-info ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                    </div>
                                    <div class="toast-body">
                                        <p class="text-info "> You have an incoming appointment with </br> <span class="font-weight-bold"> <%= appointment.getDentist().getPersonalName() %> </span> in <span class="font-weight-bold"> <%= appointment.getMeetingDate() %> </span> </p>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            <!-- / Notification Upcoming Appointment -->   
                            <div class="card">
                                <div class="card-body pt-0">

                                    <!-- Tab Menu -->
                                    <nav class="user-tabs mb-4">
                                        <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                            <li class="nav-item">
                                                <a class="nav-link ${active == 'process' ? "active":""}" href="#pat_appointments" data-toggle="tab">On Progress Appt</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link ${active == 'finish' ? "active":""}" href="#pat_finished" data-toggle="tab">Finished Appt</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link ${active == 'overdue' ? "active":""}" href="#pat_overdue" data-toggle="tab"><span class="med-records">Overdue Appt</span></a>
                                            </li>
                                        </ul>
                                    </nav>
                                    <!-- /Tab Menu -->

                                    <%
                                        String successMessage = (String) request.getAttribute("SUCCESS");
                                        if (successMessage != null) {
                                    %>

                                    <div class="toast"  data-autohide="true" data-delay="10000">
                                        <div class="toast-header bg-success-light">
                                            <strong class="mr-auto text-success-light">Message</strong>
                                            <button type="button" class="text-success ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                        </div>
                                        <div class="toast-body">
                                            <p class="text-success"><%= successMessage%></p>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <!-- Tab Content -->
                                    <div class="tab-content pt-0">

                                        <!-- Appointment Tab -->
                                        <div id="pat_appointments" class="tab-pane fade  ${active == 'process' ? "show active":""}">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table datatable table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th>Dentist</th>
                                                                    <th>Date</th>
                                                                    <th>Symptom</th>
                                                                    <th>Status</th>
                                                                    <th class="text-center">Action</th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach var="list" items="${APPOINTMENT_LIST}">
                                                                    <c:if test="${ (list.status == 1 || list.status == 2) && (list.meetingDate.toString() >= NOW)}">
                                                                        <tr>
                                                                            <td>
                                                                                <h2 class="table-avatar">
                                                                                    <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                        <img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/dentist/${list.dentist.image}" alt="User Image">
                                                                                    </a>
                                                                                    <a>${list.dentist.personalName} <span>${list.dentist.role}</span></a>
                                                                                </h2>
                                                                            </td>
                                                                            <td>${list.meetingDate} </td>
                                                                            <td>${list.customerSymptom}</td>
                                                                            <!--status (APPOINTMENT): 0 is cancel, 1 is book success, 2 is checkin, 3 is complete appointment-->
                                                                            <c:if test="${list.status == 1}">
                                                                                <td><span class="badge badge-pill bg-info-light">Book Success</span></td>
                                                                            </c:if>
                                                                            <c:if test="${list.status == 2}">
                                                                                <td><span class="badge badge-pill bg-success-light">In checkin</span></td>
                                                                            </c:if>
                                                                            <td class="text-center">
                                                                                <a class="btn btn-sm bg-danger-light" href="appointment/cancel?appointmentId=${list.id}&bookTime=${list.bookTime}&bookDate=${list.bookDate}" data-toggle="modal" data-target="#cancel_modal" onclick="cancelAppointment(this)" >
                                                                                    <i class="fas fa-ban"></i> Cancel
                                                                                </a>
                                                                                <c:if test="${(list.paymentConfirm == 0)}">    
                                                                                    <a href="AppointmentCheckoutController?appointmentID=${list.id}&dentistID=${list.dentist.id}" class="btn btn-sm bg-primary-light">
                                                                                        <i class="fas fa-money-check"></i> Pay
                                                                                    </a>
                                                                                </c:if>
                                                                                <a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#view${list.id}">
                                                                                    <i class="far fa-eye"></i>
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
                                        <!-- /Appointment Tab -->


                                        <c:if test="${requestScope.APPOINTMENT_LIST != null}">
                                            <!-- Book Finished Tab -->
                                            <div id="pat_overdue" class="tab-pane fade ${active == 'overdue' ? "show active":""}">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table datatable table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Dentist</th>
                                                                        <th>Date</th>
                                                                        <th>Symptom</th>
                                                                        <th>Status</th>
                                                                        <th class="text-center">Action</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <c:forEach var="list" items="${APPOINTMENT_LIST}">
                                                                        <c:if test="${list.status == 1 && list.meetingDate.toString() < NOW }">
                                                                            <tr>
                                                                                <td>
                                                                                    <h2 class="table-avatar">
                                                                                        <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                            <img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/dentist/${list.dentist.image}" alt="User Image">
                                                                                        </a>
                                                                                        <a href="doctor-profile.html">${list.dentist.personalName} <span>${list.dentist.role}</span></a>
                                                                                    </h2>
                                                                                </td>
                                                                                <td>${list.meetingDate} </td>
                                                                                <td>${list.customerSymptom}</td>
                                                                                <!--status (APPOINTMENT): 0 is cancel, 1 is book success, 2 is checkin, 3 is complete appointment-->
                                                                                ${list.status == 1 && list.meetingDate.toString() < NOW  ? "<td><span class=\"badge badge-pill bg-purple-light\">Overdue</span></td>":""}

                                                                                <!--Feedback-->
                                                                                <td class="text-center">
                                                                                    <c:if test="${list.status == 3}">
                                                                                        <c:set var ="check" value="${0}"/>
                                                                                        <c:forEach var="listFeedback" items = "${FEEDBACKLIST}">
                                                                                            <c:if test="${listFeedback.appointmentId == list.id}">
                                                                                                <c:set var = "check" value="${check + 1}"/>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                        <c:if test="${check == 0}" >
                                                                                            <a class="btn btn-sm bg-success-light" href="../customer/Feedback" data-toggle="modal" data-target="#${list.id}">
                                                                                                <i class="fas fa-pen"></i> Feedback
                                                                                            </a>
                                                                                        </c:if>           
                                                                                    </c:if>

                                                                                    <c:if test="${list.status == 1 && list.meetingDate.toString() >= NOW}">
                                                                                        <a class="btn btn-sm bg-danger-light" href="appointment/cancel?appointmentId=${list.id}&bookTime=${list.bookTime}&bookDate=${list.bookDate}" data-toggle="modal" data-target="#cancel_modal" onclick="cancelAppointment(this)" >
                                                                                            <i class="fas fa-ban"></i> Cancel
                                                                                        </a>
                                                                                    </c:if>


                                                                                    <!--dentist_confirm: 0 is not done yet, 1 is done-->

                                                                                    <c:if test="${list.paymentConfirm == 0  && list.status == 1 && list.meetingDate.toString() >= NOW}">
                                                                                        <a href="AppointmentCheckoutController?appointmentID=${list.id}&dentistID=${list.dentist.id}" class="btn btn-sm bg-primary-light">
                                                                                            <i class="fas fa-money-check"></i> Pay
                                                                                        </a>
                                                                                    </c:if>

                                                                                    <a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#view${list.id}">
                                                                                        <i class="far fa-eye"></i>
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
                                            <!-- /Finished Tab -->
                                        </c:if>
                                        <c:if test="${requestScope.APPOINTMENT_LIST != null}">
                                            <!-- Book Finished Tab -->
                                            <div id="pat_finished" class="tab-pane fade ${active == 'finish' ? "show active":""}">
                                                <div class="card card-table mb-0">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table datatable table-hover table-center mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Dentist</th>
                                                                        <th>Date</th>
                                                                        <th>Symptom</th>
                                                                        <th>Status</th>
                                                                        <th class="text-center">Action</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <c:forEach var="list" items="${APPOINTMENT_LIST}">
                                                                        <c:if test="${list.status == 3}">
                                                                            <tr>
                                                                                <td>
                                                                                    <h2 class="table-avatar">
                                                                                        <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
                                                                                            <img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/dentist/${list.dentist.image}" alt="User Image">
                                                                                        </a>
                                                                                        <a href="doctor-profile.html">${list.dentist.personalName} <span>${list.dentist.role}</span></a>
                                                                                    </h2>
                                                                                </td>
                                                                                <td>${list.meetingDate} </td>
                                                                                <td>${list.customerSymptom}</td>
                                                                                <!--status (APPOINTMENT): 0 is cancel, 1 is book success, 2 is checkin, 3 is complete appointment-->
                                                                                ${ list.status == 3 ? "<td><span class=\"badge badge-pill bg-success-light\">Finished</span></td>":""}

                                                                                <!--Feedback-->
                                                                                <td class="text-center">
                                                                                    <c:if test="${list.status == 3}">
                                                                                        <c:set var ="check" value="${0}"/>
                                                                                        <c:forEach var="listFeedback" items = "${FEEDBACKLIST}">
                                                                                            <c:if test="${listFeedback.appointmentId == list.id}">
                                                                                                <c:set var = "check" value="${check + 1}"/>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                        <c:if test="${check == 0}" >
                                                                                            <a class="btn btn-sm bg-success-light" href="../customer/Feedback" data-toggle="modal" data-target="#${list.id}">
                                                                                                <i class="fas fa-pen"></i> Feedback
                                                                                            </a>
                                                                                        </c:if>           
                                                                                    </c:if>
                                                                                    <!--dentist_confirm: 0 is not done yet, 1 is done-->



                                                                                    <a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#view${list.id}">
                                                                                        <i class="far fa-eye"></i>
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
                                            <!-- /Finished Tab -->
                                        </c:if>



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
            <!-- Feedback Modal -->     
        <c:forEach var="list" items="${APPOINTMENT_LIST}">
            <div class="modal fade" aria-hidden="true" role="dialog" id="${list.id}">
                <div class="modal-dialog modal-dialog-centered" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Write a review for <strong>Dr.${list.dentist.personalName}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="<%= request.getContextPath()%>/customer/Feedback" method="post">
                                <div class="row form-row">
                                    <input type="hidden" name="appointment_id" value="${list.id}"/>
                                    <div class="col-12 col-sm-12">
                                        <div class="form-group">
                                            <h6>Review</h6>
                                            <div class="posit">
                                                <div class="rating">                                 
                                                    <input type="radio" name="star" id="star-1" value="5"><label for="star-1"></label>
                                                    <input type="radio" name="star" id="star-2" value="4"><label for="star-2"></label>
                                                    <input type="radio" name="star" id="star-3" value="3"><label for="star-3"></label>
                                                    <input type="radio" name="star" id="star-4" value="2"><label for="star-4"></label>
                                                    <input type="radio" name="star" id="star-5" value="1"><label for="star-5"></label>
                                                </div>
                                            </div></br>
                                            <h6 >Your review</h6>
                                            <textarea type="text" class="form-control" name="feedbackText" rows="3"></textarea></br>

                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block" ><strong>Submit Review</button>
                            </form>
                        </div>
                    </div> 
                </div>
            </div>
        </c:forEach>
        <!-- /Feedback Modal -->         
        <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_LIST}">
            <div class="modal fade custom-modal" id="view${list.id}">
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
                                                <span class="text font-weight-normal">${list.meetingDate}</span>
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
                                    <span class="title">Dentist Note:</span>
                                    <span class="text font-weight-normal">${list.dentistNote}</span>
                                </li>
                                <li>
                                    <span class="title">Customer Symptom:</span>
                                    <span class="text font-weight-normal">${list.customerSymptom}</span>
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
                                                                    <span class="text font-weight-normal">${appointmentSlot.service.serviceName}</span>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="text">
                                                                        <span class="title">Slot</span>
                                                                        <span class="text font-weight-normal">Slot ${appointmentSlot.slot}</span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="text">
                                                                        <span class="title">Price</span>
                                                                        <span class="text font-weight-normal">${appointmentSlot.service.price}$</span>
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
        <!-- /Main Wrapper -->
        <div class="modal fade" id="cancel_modal" aria-hidden="true" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document" >
                <div class="modal-content text-center">
                    <div class="modal-body">
                        <div class="form-content p-2">
                            <p class="mb-4">Are you sure want to cancel this appointment?</p>
                            <a id="linkCancel" href="" class="btn btn-warning">Cancel</a>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="<%=request.getContextPath()%>/customer/assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="<%=request.getContextPath()%>/customer/assets/js/popper.min.js"></script>
        <script src="<%=request.getContextPath()%>/customer/assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="<%=request.getContextPath()%>/customer/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="<%=request.getContextPath()%>/customer/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Datatables JS -->
        <script src="<%=request.getContextPath()%>/customer/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="<%=request.getContextPath()%>/customer/assets/plugins/datatables/datatables.min.js"></script>

        <script>
            $(document).ready(function () {
                $('.toast').toast('show');
            });
            var cancelAppointment = function (elm) {
                var linkCancel = document.getElementById('linkCancel');
                linkCancel.href = elm.href;
            };  
        </script>

        <script>
            $(document).ready(function () {
                $('.datatable').DataTable({
                    "bFilter": false,
                    "bLengthChange": false,
                });
            });
        </script>

        <!-- font awessome kit-->
        <script src="https://kit.fontawesome.com/8027e367a1.js" crossorigin="anonymous"></script>
        <!<!-- style for dentist rating -->
        <style>
            .rating{
                display: flex;
                margin-bottom: -20px;
                transform: translate(-50%, -50%) rotateY(180deg);
            }
            .rating input{
                display: none;
            }
            .rating label{
                display: block;
                cursor: pointer;
                width: 20px;
            }
            .rating label:before{
                content: '\f005';
                font-family: fontAwesome;
                position: relative;
                display: block;
                font-size: 18px;
                color: #d3d3d3;
            }
            .rating label:after{
                content: '\f005';
                font-family: fontAwesome;
                position: absolute;
                display: block;
                font-size: 18px;
                color: #FFD700;
                top: 0;
                opacity: 0;
                transition: .5s;
                text-shadow: 0 2px 5px rgba(0,0,0,.5);
            }
            .rating label:hover:after,
            .rating label:hover ~ label:after,
            .rating input:checked ~ label:after{
                opacity: 1;
            }
            .posit{
                margin-left: -270px;
                margin-top: 22px;
            }
        </style>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/patient-dashboard.html  30 Nov 2019 04:12:16 GMT -->

</html>