<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%
        
        Dentist dentist = (Dentist) session.getAttribute("Login_Dentist");
        if (dentist == null || dentist.equals("")) {
            response.sendRedirect("/dentalclinic/login.jsp");
            return;
        }
    %>

<%@page import="com.fptproject.SWP391.model.DentistAvailableTime"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/schedule-timings.html  30 Nov 2019 04:12:09 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link href="<%=request.getContextPath()%>/dentist/assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dentist/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dentist/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css">

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dentist/assets/plugins/select2/css/select2.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dentist/assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        -->                
        <script src="<%=request.getContextPath()%>/dentist/assets/js/html5shiv.min.js"></script>
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
                                        <li class="breadcrumb-item active" aria-current="page">Schedule Timings</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Schedule Timings</h2>
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
                        <c:if test="${param.ErrorMsg != null}">
                            <div class="col-md-7 col-lg-8 col-xl-9">
                                <div class="toast" data-autohide="true" data-delay="3000">
                                    <div class="toast-header bg-info-light">
                                        <strong class="mr-auto text-info">Notification</strong>
                                        <button type="button" class="text-info ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                                    </div>
                                    <div class="toast-body">
                                        <p class="text-info "> ${param.ErrorMsg}</p>
                                    </div>
                                </div>
                            </c:if>                        
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Update available slot</h4>
                                            <div class="profile-box">
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <div>               
                                                            Time Slot Duration:
                                                            <h5>90 minutes</h5>
                                                        </div>
                                                    </div>
                                                </div>     
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card schedule-widget mb-0">
                                                            <!-- Schedule Header -->
                                                            <div class="schedule-header">

                                                                <!-- Schedule Nav -->
                                                                <div class="schedule-nav">
                                                                    <ul class="nav nav-tabs nav-justified">                                                                            
                                                                        <li class="nav-item">
                                                                            <a class="nav-link ${activeDay == 'monday' ? "active" : ""}" data-toggle="tab" href="#slot_monday">Monday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link ${activeDay == 'tuesday' ? "active" : ""}" data-toggle="tab" href="#slot_tuesday">Tuesday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link ${activeDay == 'wednesday' ? "active" : ""}" data-toggle="tab" href="#slot_wednesday">Wednesday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link ${activeDay == 'thursday' ? "active" : ""}" data-toggle="tab" href="#slot_thursday">Thursday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link ${activeDay == 'fridayday' ? "active" : ""}" data-toggle="tab" href="#slot_friday">Friday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link ${activeDay == 'saturday' ? "active" : ""}" data-toggle="tab" href="#slot_saturday">Saturday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link ${activeDay == 'sunday' ? "active" : ""}" data-toggle="tab" href="#slot_sunday">Sunday</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <!-- /Schedule Nav -->
                                                            </div>
                                                            <!-- /Schedule Header -->

                                                            <!-- Schedule Content -->
                                                            <div class="tab-content schedule-cont">

                                                                <!-- Monday Slot -->
                                                                <div id="slot_monday" class="tab-pane fade ${activeDay == 'monday' ? "show active" : ""}">

                                                                    <!-- Button Add slot -->
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot_monday"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>

                                                                    <c:set var="row" value="0"/>
                                                                    <c:forEach var="count" items="${mondaySchedule}">
                                                                        <c:set var="row" value="${row+1}"/>
                                                                    </c:forEach>
                                                                    <c:if test="${row == 0}">
                                                                        <p class="text-muted mb-0">Not Available</p>
                                                                    </c:if>

                                                                    <!-- /Button Add slot -->

                                                                    <!-- Slot List -->
                                                                    <div class="doc-times" >
                                                                        <c:set var="deleteSlot" value="" />
                                                                        <c:forEach var="DentistAvailiableTime" items="${mondaySchedule}">
                                                                            <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                                <div class="doc-slot-list">
                                                                                    7:00 am - 8:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Monday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                                <div class="doc-slot-list">
                                                                                    8:45 am - 10:15 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Monday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                                <div class="doc-slot-list">
                                                                                    10:30 am - 12:00 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Monday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                                <div class="doc-slot-list">
                                                                                    13:00 am - 14:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Monday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                                <div class="doc-slot-list">
                                                                                    15:00 am - 16:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Monday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                                <div class="doc-slot-list">
                                                                                    17:00 am - 18:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Monday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <!-- /Slot List -->
                                                                </div>
                                                                <!-- /Monday Slot -->

                                                                <!-- Tuesday Slot -->

                                                                <div id="slot_tuesday" class="tab-pane fade ${activeDay == 'tuesday' ? "show active" : ""}">

                                                                    <!-- Button Add slot -->
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot_tuesday"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>

                                                                    <c:set var="row" value="0"/>
                                                                    <c:forEach var="count" items="${tuesdaySchedule}">
                                                                        <c:set var="row" value="${row+1}"/>
                                                                    </c:forEach>
                                                                    <c:if test="${row == 0}">
                                                                        <p class="text-muted mb-0">Not Available</p>
                                                                    </c:if>
                                                                    <!-- /Button Add slot -->

                                                                    <!-- Slot List -->
                                                                    <div class="doc-times">
                                                                        <c:forEach var="DentistAvailiableTime" items="${tuesdaySchedule}">
                                                                            <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                                <div class="doc-slot-list">
                                                                                    7:00 am - 8:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Tuesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                                <div class="doc-slot-list">
                                                                                    8:45 am - 10:15 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Tuesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                                <div class="doc-slot-list">
                                                                                    10:30 am - 12:00 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Tuesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                                <div class="doc-slot-list">
                                                                                    13:00 am - 14:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Tuesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                                <div class="doc-slot-list">
                                                                                    15:00 am - 16:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Tuesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                                <div class="doc-slot-list">
                                                                                    17:00 am - 18:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Tuesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>

                                                                    <!-- /Slot List -->

                                                                </div>
                                                                <!-- /Tuesday Slot -->

                                                                <!-- Wednesday Slot -->
                                                                <div id="slot_wednesday" class="tab-pane fade ${activeDay == 'wednesday' ? "show active" : ""}">

                                                                    <!-- Button Add slot -->

                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot_wednesday"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>

                                                                    <c:set var="row" value="0"/>
                                                                    <c:forEach var="count" items="${wednesdaySchedule}">
                                                                        <c:set var="row" value="${row+1}"/>
                                                                    </c:forEach>
                                                                    <c:if test="${row == 0}">
                                                                        <p class="text-muted mb-0">Not Available</p>
                                                                    </c:if>

                                                                    <!-- /Button Add slot -->

                                                                    <!-- Slot List -->
                                                                    <div class="doc-times">
                                                                        <c:forEach var="DentistAvailiableTime" items="${wednesdaySchedule}">
                                                                            <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                                <div class="doc-slot-list">
                                                                                    7:00 am - 8:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Wednesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                                <div class="doc-slot-list">
                                                                                    8:45 am - 10:15 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Wednesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                                <div class="doc-slot-list">
                                                                                    10:30 am - 12:00 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Wednesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                                <div class="doc-slot-list">
                                                                                    13:00 am - 14:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Wednesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                                <div class="doc-slot-list">
                                                                                    15:00 am - 16:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Wednesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                                <div class="doc-slot-list">
                                                                                    17:00 am - 18:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Wednesday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <!-- /Slot List -->
                                                                </div>
                                                                <!-- /Wednesday Slot -->

                                                                <!-- Thursday Slot -->
                                                                <div id="slot_thursday" class="tab-pane fade ${activeDay == 'thursday' ? "show active" : ""}">


                                                                    <!-- Button Add slot -->
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot_thursday"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>

                                                                    <c:set var="row" value="0"/>
                                                                    <c:forEach var="count" items="${thursdaySchedule}">
                                                                        <c:set var="row" value="${row+1}"/>
                                                                    </c:forEach>
                                                                    <c:if test="${row == 0}">
                                                                        <p class="text-muted mb-0">Not Available</p>
                                                                    </c:if>
                                                                    <!-- /Button Add slot -->

                                                                    <!-- Slot List -->
                                                                    <div class="doc-times">
                                                                        <c:forEach var="DentistAvailiableTime" items="${thursdaySchedule}">
                                                                            <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                                <div class="doc-slot-list">
                                                                                    7:00 am - 8:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Thursday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                                <div class="doc-slot-list">
                                                                                    8:45 am - 10:15 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Thursday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                                <div class="doc-slot-list">
                                                                                    10:30 am - 12:00 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Thursday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                                <div class="doc-slot-list">
                                                                                    13:00 am - 14:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Thursday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                                <div class="doc-slot-list">
                                                                                    15:00 am - 16:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Thursday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                                <div class="doc-slot-list">
                                                                                    17:00 am - 18:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Thursday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <!-- /Slot List -->                                                              
                                                                </div>
                                                                <!-- /Thursday Slot -->

                                                                <!-- Friday Slot -->
                                                                <div id="slot_friday" class="tab-pane fade ${activeDay == 'friday' ? "show active" : ""}">

                                                                    <!-- Button Add slot -->
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot_friday"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>

                                                                    <c:set var="row" value="0"/>
                                                                    <c:forEach var="count" items="${fridaySchedule}">
                                                                        <c:set var="row" value="${row+1}"/>
                                                                    </c:forEach>
                                                                    <c:if test="${row == 0}">
                                                                        <p class="text-muted mb-0">Not Available</p>
                                                                    </c:if>

                                                                    <!-- /Button Add slot -->

                                                                    <!-- Slot List -->
                                                                    <div class="doc-times">
                                                                        <c:forEach var="DentistAvailiableTime" items="${fridaySchedule}">
                                                                            <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                                <div class="doc-slot-list">
                                                                                    7:00 am - 8:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Friday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                                <div class="doc-slot-list">
                                                                                    8:45 am - 10:15 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Friday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                                <div class="doc-slot-list">
                                                                                    10:30 am - 12:00 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Friday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                                <div class="doc-slot-list">
                                                                                    13:00 am - 14:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Friday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                                <div class="doc-slot-list">
                                                                                    15:00 am - 16:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Friday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                                <div class="doc-slot-list">
                                                                                    17:00 am - 18:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Friday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <!-- /Slot List -->
                                                                </div>
                                                                <!-- /Friday Slot -->

                                                                <!-- Saturday Slot -->
                                                                <div id="slot_saturday" class="tab-pane fade ${activeDay == 'saturday' ? "show active" : ""}">

                                                                    <!-- Button Add slot -->
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot_saturday"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>

                                                                    <c:set var="row" value="0"/>
                                                                    <c:forEach var="count" items="${saturdaySchedule}">
                                                                        <c:set var="row" value="${row+1}"/>
                                                                    </c:forEach>
                                                                    <c:if test="${row == 0}">
                                                                        <p class="text-muted mb-0">Not Available</p>
                                                                    </c:if>

                                                                    <!-- /Button Add slot -->

                                                                    <!-- Slot List -->
                                                                    <div class="doc-times">
                                                                        <c:forEach var="DentistAvailiableTime" items="${saturdaySchedule}">
                                                                            <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                                <div class="doc-slot-list">
                                                                                    7:00 am - 8:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Saturday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                                <div class="doc-slot-list">
                                                                                    8:45 am - 10:15 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Saturday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                                <div class="doc-slot-list">
                                                                                    10:30 am - 12:00 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Saturday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                                <div class="doc-slot-list">
                                                                                    13:00 am - 14:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Saturday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                                <div class="doc-slot-list">
                                                                                    15:00 am - 16:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Saturday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                                <div class="doc-slot-list">
                                                                                    17:00 am - 18:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Saturday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <!-- /Slot List -->
                                                                </div>
                                                                <!-- /Saturday Slot -->

                                                                <!-- Sunday Slot -->
                                                                <div id="slot_sunday" class="tab-pane fade ${activeDay == 'sunday' ? "show active" : ""}">


                                                                    <!-- Button Add slot -->
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot_sunday"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>

                                                                    <c:set var="row" value="0"/>
                                                                    <c:forEach var="count" items="${sundaySchedule}">
                                                                        <c:set var="row" value="${row+1}"/>
                                                                    </c:forEach>
                                                                    <c:if test="${row == 0}">
                                                                        <p class="text-muted mb-0">Not Available</p>
                                                                    </c:if>

                                                                    <!-- /Button Add slot -->

                                                                    <!-- Slot List -->
                                                                    <div class="doc-times">
                                                                        <c:forEach var="DentistAvailiableTime" items="${sundaySchedule}">

                                                                            <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                                <div class="doc-slot-list">
                                                                                    7:00 am - 8:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Sunday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                                <div class="doc-slot-list">
                                                                                    8:45 am - 10:15 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Sunday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                                <div class="doc-slot-list">
                                                                                    10:30 am - 12:00 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Sunday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                                <div class="doc-slot-list">
                                                                                    13:00 am - 14:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Sunday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                                <div class="doc-slot-list">
                                                                                    15:00 am - 16:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Sunday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                                <div class="doc-slot-list">
                                                                                    17:00 am - 18:30 am
                                                                                    <a href="delete?dentistId=${sessionScope.Login_Dentist.id}&slot=${DentistAvailiableTime.slot}&day=Sunday" class="delete_schedule" data-toggle="modal" data-target="#delete_modal" onclick="deleteSlot(this)">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <!-- /Slot List -->
                                                                </div>
                                                                <!-- /Sunday Slot -->
                                                            </div>
                                                            <!-- /Schedule Content -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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

            <!-- Add Time Slot Modal -->

            <div class="modal fade custom-modal" id="add_time_slot_monday">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add Time Slots</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="add">
                                <div class="hours-info">
                                    <div class="row form-row hours-cont">
                                        <div class="col-12 col-md-10">
                                            <div class="row form-row">
                                                <div class="col-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>Available slot</label><br>
                                                    <c:set var="slot1" value="unchecked"/>
                                                    <c:set var="slot2" value="unchecked"/>
                                                    <c:set var="slot3" value="unchecked"/>
                                                    <c:set var="slot4" value="unchecked"/>
                                                    <c:set var="slot5" value="unchecked"/>
                                                    <c:set var="slot6" value="unchecked"/>
                                                    <input type="hidden" name="dentistId" value="${sessionScope.Login_Dentist.id}"/>
                                                    <input type="hidden" name="day" value="monday"/>
                                                    <c:forEach var="time" items="${mondaySchedule}">
                                                        <c:if test="${time.slot == 1}">
                                                            <c:set var="slot1" value="checked"/>
                                                            Slot 1 (7:00 am - 8:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 2}">
                                                            <c:set var="slot2" value="checked"/>
                                                            Slot 2 (8:45 am - 10:15 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 3}">
                                                            <c:set var="slot3" value="checked"/>
                                                            Slot 3 (10:30 am - 12:00 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 4}">
                                                            <c:set var="slot4" value="checked"/>
                                                            Slot 4 (13:00 am - 14:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 5}">
                                                            <c:set var="slot5" value="checked"/>
                                                            Slot 5 (15:00 am - 16:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 6}">
                                                            <c:set var="slot6" value="checked"/>
                                                            Slot 6 (17:00 am - 18:30 am)<br>
                                                        </c:if>
                                                    </c:forEach>
                                                    <br><label>Unavailable slot </label><br>
                                                    <div style="${slot1 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot1" value="on">  Slot 1 (7:00 am - 8:30 am)<br></div>
                                                    <div style="${slot2 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot2" value="on">  Slot 2 (8:45 am - 10:15 am)<br></div>
                                                    <div style="${slot3 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot3" value="on">  Slot 3 (10:30 am - 12:00 am)<br></div>
                                                    <div style="${slot4 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot4" value="on">  Slot 4 (13:00 am - 14:30 am)<br></div>    
                                                    <div style="${slot5 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot5" value="on">  Slot 5 (15:00 am - 16:30 am)<br></div>
                                                    <div style="${slot6 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot6" value="on">  Slot 6 (17:00 am - 18:30 am)<br></div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade custom-modal" id="add_time_slot_tuesday">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Time Slots</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="add">
                            <div class="hours-info">
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Available slot</label><br>
                                                    <c:set var="slot1" value="unchecked"/>
                                                    <c:set var="slot2" value="unchecked"/>
                                                    <c:set var="slot3" value="unchecked"/>
                                                    <c:set var="slot4" value="unchecked"/>
                                                    <c:set var="slot5" value="unchecked"/>
                                                    <c:set var="slot6" value="unchecked"/>
                                                    <input type="hidden" name="dentistId" value="${sessionScope.Login_Dentist.id}"/>
                                                    <input type="hidden" name="day" value="tuesday"/>
                                                    <c:forEach var="time" items="${tuesdaySchedule}">
                                                        <c:if test="${time.slot == 1}">
                                                            <c:set var="slot1" value="checked"/>
                                                            Slot 1 (7:00 am - 8:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 2}">
                                                            <c:set var="slot2" value="checked"/>
                                                            Slot 2 (8:45 am - 10:15 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 3}">
                                                            <c:set var="slot3" value="checked"/>
                                                            Slot 3 (10:30 am - 12:00 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 4}">
                                                            <c:set var="slot4" value="checked"/>
                                                            Slot 4 (13:00 am - 14:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 5}">
                                                            <c:set var="slot5" value="checked"/>
                                                            Slot 5 (15:00 am - 16:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 6}">
                                                            <c:set var="slot6" value="checked"/>
                                                            Slot 6 (17:00 am - 18:30 am)<br>
                                                        </c:if>
                                                    </c:forEach>
                                                    <br><label>Unavailable slot </label><br>
                                                    <div style="${slot1 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot1" value="on">  Slot 1 (7:00 am - 8:30 am)<br></div>
                                                    <div style="${slot2 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot2" value="on">  Slot 2 (8:45 am - 10:15 am)<br></div>
                                                    <div style="${slot3 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot3" value="on">  Slot 3 (10:30 am - 12:00 am)<br></div>
                                                    <div style="${slot4 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot4" value="on">  Slot 4 (13:00 am - 14:30 am)<br></div>    
                                                    <div style="${slot5 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot5" value="on">  Slot 5 (15:00 am - 16:30 am)<br></div>
                                                    <div style="${slot6 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot6" value="on">  Slot 6 (17:00 am - 18:30 am)<br></div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade custom-modal" id="add_time_slot_wednesday">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Time Slots</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="add">
                            <div class="hours-info">
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Available slot</label><br>
                                                    <c:set var="slot1" value="unchecked"/>
                                                    <c:set var="slot2" value="unchecked"/>
                                                    <c:set var="slot3" value="unchecked"/>
                                                    <c:set var="slot4" value="unchecked"/>
                                                    <c:set var="slot5" value="unchecked"/>
                                                    <c:set var="slot6" value="unchecked"/>
                                                    <input type="hidden" name="dentistId" value="${sessionScope.Login_Dentist.id}"/>
                                                    <input type="hidden" name="day" value="wednesday"/>
                                                    <c:forEach var="time" items="${wednesdaySchedule}">
                                                        <c:if test="${time.slot == 1}">
                                                            <c:set var="slot1" value="checked"/>
                                                            Slot 1 (7:00 am - 8:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 2}">
                                                            <c:set var="slot2" value="checked"/>
                                                            Slot 2 (8:45 am - 10:15 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 3}">
                                                            <c:set var="slot3" value="checked"/>
                                                            Slot 3 (10:30 am - 12:00 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 4}">
                                                            <c:set var="slot4" value="checked"/>
                                                            Slot 4 (13:00 am - 14:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 5}">
                                                            <c:set var="slot5" value="checked"/>
                                                            Slot 5 (15:00 am - 16:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 6}">
                                                            <c:set var="slot6" value="checked"/>
                                                            Slot 6 (17:00 am - 18:30 am)<br>
                                                        </c:if>
                                                    </c:forEach>
                                                    <br><label>Unavailable slot </label><br>
                                                    <div style="${slot1 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot1" value="on">  Slot 1 (7:00 am - 8:30 am)<br></div>
                                                    <div style="${slot2 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot2" value="on">  Slot 2 (8:45 am - 10:15 am)<br></div>
                                                    <div style="${slot3 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot3" value="on">  Slot 3 (10:30 am - 12:00 am)<br></div>
                                                    <div style="${slot4 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot4" value="on">  Slot 4 (13:00 am - 14:30 am)<br></div>    
                                                    <div style="${slot5 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot5" value="on">  Slot 5 (15:00 am - 16:30 am)<br></div>
                                                    <div style="${slot6 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot6" value="on">  Slot 6 (17:00 am - 18:30 am)<br></div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade custom-modal" id="add_time_slot_thursday">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Time Slots</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="add">
                            <div class="hours-info">
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Available slot</label><br>
                                                    <c:set var="slot1" value="unchecked"/>
                                                    <c:set var="slot2" value="unchecked"/>
                                                    <c:set var="slot3" value="unchecked"/>
                                                    <c:set var="slot4" value="unchecked"/>
                                                    <c:set var="slot5" value="unchecked"/>
                                                    <c:set var="slot6" value="unchecked"/>
                                                    <input type="hidden" name="dentistId" value="${sessionScope.Login_Dentist.id}"/>
                                                    <input type="hidden" name="day" value="thursday"/>
                                                    <c:forEach var="time" items="${thursdaySchedule}">
                                                        <c:if test="${time.slot == 1}">
                                                            <c:set var="slot1" value="checked"/>
                                                            Slot 1 (7:00 am - 8:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 2}">
                                                            <c:set var="slot2" value="checked"/>
                                                            Slot 2 (8:45 am - 10:15 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 3}">
                                                            <c:set var="slot3" value="checked"/>
                                                            Slot 3 (10:30 am - 12:00 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 4}">
                                                            <c:set var="slot4" value="checked"/>
                                                            Slot 4 (13:00 am - 14:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 5}">
                                                            <c:set var="slot5" value="checked"/>
                                                            Slot 5 (15:00 am - 16:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 6}">
                                                            <c:set var="slot6" value="checked"/>
                                                            Slot 6 (17:00 am - 18:30 am)<br>
                                                        </c:if>
                                                    </c:forEach>
                                                    <br><label>Unavailable slot </label><br>
                                                    <div style="${slot1 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot1" value="on">  Slot 1 (7:00 am - 8:30 am)<br></div>
                                                    <div style="${slot2 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot2" value="on">  Slot 2 (8:45 am - 10:15 am)<br></div>
                                                    <div style="${slot3 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot3" value="on">  Slot 3 (10:30 am - 12:00 am)<br></div>
                                                    <div style="${slot4 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot4" value="on">  Slot 4 (13:00 am - 14:30 am)<br></div>    
                                                    <div style="${slot5 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot5" value="on">  Slot 5 (15:00 am - 16:30 am)<br></div>
                                                    <div style="${slot6 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot6" value="on">  Slot 6 (17:00 am - 18:30 am)<br></div>

                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade custom-modal" id="add_time_slot_friday">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Time Slots</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="add">
                            <div class="hours-info">
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Available slot</label><br>
                                                    <c:set var="slot1" value="unchecked"/>
                                                    <c:set var="slot2" value="unchecked"/>
                                                    <c:set var="slot3" value="unchecked"/>
                                                    <c:set var="slot4" value="unchecked"/>
                                                    <c:set var="slot5" value="unchecked"/>
                                                    <c:set var="slot6" value="unchecked"/>
                                                    <input type="hidden" name="dentistId" value="${sessionScope.Login_Dentist.id}"/>
                                                    <input type="hidden" name="day" value="friday"/>
                                                    <c:forEach var="time" items="${fridaySchedule}">
                                                        <c:if test="${time.slot == 1}">
                                                            <c:set var="slot1" value="checked"/>
                                                            Slot 1 (7:00 am - 8:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 2}">
                                                            <c:set var="slot2" value="checked"/>
                                                            Slot 2 (8:45 am - 10:15 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 3}">
                                                            <c:set var="slot3" value="checked"/>
                                                            Slot 3 (10:30 am - 12:00 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 4}">
                                                            <c:set var="slot4" value="checked"/>
                                                            Slot 4 (13:00 am - 14:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 5}">
                                                            <c:set var="slot5" value="checked"/>
                                                            Slot 5 (15:00 am - 16:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 6}">
                                                            <c:set var="slot6" value="checked"/>
                                                            Slot 6 (17:00 am - 18:30 am)<br>
                                                        </c:if>
                                                    </c:forEach>
                                                    <br><label>Unavailable slot </label><br>
                                                    <div style="${slot1 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot1" value="on">  Slot 1 (7:00 am - 8:30 am)<br></div>
                                                    <div style="${slot2 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot2" value="on">  Slot 2 (8:45 am - 10:15 am)<br></div>
                                                    <div style="${slot3 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot3" value="on">  Slot 3 (10:30 am - 12:00 am)<br></div>
                                                    <div style="${slot4 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot4" value="on">  Slot 4 (13:00 am - 14:30 am)<br></div>    
                                                    <div style="${slot5 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot5" value="on">  Slot 5 (15:00 am - 16:30 am)<br></div>
                                                    <div style="${slot6 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot6" value="on">  Slot 6 (17:00 am - 18:30 am)<br></div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade custom-modal" id="add_time_slot_saturday">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Time Slots</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="add">
                            <div class="hours-info">
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Available slot</label><br>
                                                    <c:set var="slot1" value="unchecked"/>
                                                    <c:set var="slot2" value="unchecked"/>
                                                    <c:set var="slot3" value="unchecked"/>
                                                    <c:set var="slot4" value="unchecked"/>
                                                    <c:set var="slot5" value="unchecked"/>
                                                    <c:set var="slot6" value="unchecked"/>
                                                    <input type="hidden" name="dentistId" value="${sessionScope.Login_Dentist.id}"/>
                                                    <input type="hidden" name="day" value="saturday"/>
                                                    <c:forEach var="time" items="${saturdaySchedule}">
                                                        <c:if test="${time.slot == 1}">
                                                            <c:set var="slot1" value="checked"/>
                                                            Slot 1 (7:00 am - 8:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 2}">
                                                            <c:set var="slot2" value="checked"/>
                                                            Slot 2 (8:45 am - 10:15 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 3}">
                                                            <c:set var="slot3" value="checked"/>
                                                            Slot 3 (10:30 am - 12:00 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 4}">
                                                            <c:set var="slot4" value="checked"/>
                                                            Slot 4 (13:00 am - 14:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 5}">
                                                            <c:set var="slot5" value="checked"/>
                                                            Slot 5 (15:00 am - 16:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 6}">
                                                            <c:set var="slot6" value="checked"/>
                                                            Slot 6 (17:00 am - 18:30 am)<br>
                                                        </c:if>
                                                    </c:forEach>
                                                    <br><label>Unavailable slot </label><br>
                                                    <div style="${slot1 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot1" value="on">  Slot 1 (7:00 am - 8:30 am)<br></div>
                                                    <div style="${slot2 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot2" value="on">  Slot 2 (8:45 am - 10:15 am)<br></div>
                                                    <div style="${slot3 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot3" value="on">  Slot 3 (10:30 am - 12:00 am)<br></div>
                                                    <div style="${slot4 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot4" value="on">  Slot 4 (13:00 am - 14:30 am)<br></div>    
                                                    <div style="${slot5 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot5" value="on">  Slot 5 (15:00 am - 16:30 am)<br></div>
                                                    <div style="${slot6 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot6" value="on">  Slot 6 (17:00 am - 18:30 am)<br></div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade custom-modal" id="add_time_slot_sunday">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Time Slots</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="add">
                            <div class="hours-info">
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Available slot</label><br>
                                                    <c:set var="slot1" value="unchecked"/>
                                                    <c:set var="slot2" value="unchecked"/>
                                                    <c:set var="slot3" value="unchecked"/>
                                                    <c:set var="slot4" value="unchecked"/>
                                                    <c:set var="slot5" value="unchecked"/>
                                                    <c:set var="slot6" value="unchecked"/>
                                                    <input type="hidden" name="dentistId" value="${sessionScope.Login_Dentist.id}"/>
                                                    <input type="hidden" name="day" value="sunday"/>
                                                    <c:forEach var="time" items="${sundaySchedule}">
                                                        <c:if test="${time.slot == 1}">
                                                            <c:set var="slot1" value="checked"/>
                                                            Slot 1 (7:00 am - 8:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 2}">
                                                            <c:set var="slot2" value="checked"/>
                                                            Slot 2 (8:45 am - 10:15 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 3}">
                                                            <c:set var="slot3" value="checked"/>
                                                            Slot 3 (10:30 am - 12:00 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 4}">
                                                            <c:set var="slot4" value="checked"/>
                                                            Slot 4 (13:00 am - 14:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 5}">
                                                            <c:set var="slot5" value="checked"/>
                                                            Slot 5 (15:00 am - 16:30 am)<br>
                                                        </c:if>
                                                        <c:if test="${time.slot == 6}">
                                                            <c:set var="slot6" value="checked"/>
                                                            Slot 6 (17:00 am - 18:30 am)<br>
                                                        </c:if>
                                                    </c:forEach>
                                                    <br><label>Unavailable slot </label><br>
                                                    <div style="${slot1 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot1" value="on">  Slot 1 (7:00 am - 8:30 am)<br></div>
                                                    <div style="${slot2 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot2" value="on">  Slot 2 (8:45 am - 10:15 am)<br></div>
                                                    <div style="${slot3 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot3" value="on">  Slot 3 (10:30 am - 12:00 am)<br></div>
                                                    <div style="${slot4 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot4" value="on">  Slot 4 (13:00 am - 14:30 am)<br></div>    
                                                    <div style="${slot5 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot5" value="on">  Slot 5 (15:00 am - 16:30 am)<br></div>
                                                    <div style="${slot6 == "checked" ? "display: none ;":""}"><input type="checkbox" name="slot6" value="on">  Slot 6 (17:00 am - 18:30 am)<br></div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="delete_modal" aria-hidden="true" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document" >
                <div class="modal-content text-center">
                    <div class="modal-body">
                        <div class="form-content p-2">
                            <p class="mb-4">Are you sure want to delete this slot?</p>
                            <a id="linkDelete" href="" class="btn btn-warning">Delete</a>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Add Time Slot Modal -->
        <!-- jQuery -->
        <script src="../assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="../assets/js/popper.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="../assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="../assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Select2 JS -->
        <script src="../assets/plugins/select2/js/select2.min.js"></script>

        <!-- Custom JS -->
        <script src="../assets/js/script.js"></script>
        <script>
                                                                                        $(document).ready(function () {
                                                                                            $('.toast').toast('show');
                                                                                        });
                                                                                        var deleteSlot = function (elm) {
                                                                                            var linkDelete = document.getElementById('linkDelete');
                                                                                            linkDelete.href = elm.href;
                                                                                        };

        </script>
    </body>

    <!-- doccure/schedule-timings.html  30 Nov 2019 04:12:09 GMT -->
</html>