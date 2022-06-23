<%-- 
    Document   : schedule
    Created on : May 21, 2022, 12:45:42 PM
    Author     : hieunguyen
--%>
<%
    session = request.getSession();
    if (session == null) {
        response.sendRedirect("../login.jsp");
        return;
    }%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/calendar.html  30 Nov 2019 04:12:18 GMT -->
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

        <!-- Datetimepicker CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

        <!-- Full Calander CSS -->
        <link rel="stylesheet" href="assets/plugins/fullcalendar/fullcalendar.min.css">

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
                            <div class="col">
                                <nav aria-label="breadcrumb" class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="../customer/index.jsp">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Schedule</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Schedule</h2>
                            </div>
                            <div class="col-auto text-right float-right ml-auto">
                                <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#add_event">View Detail</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->

                <!-- Page Content -->
                <div class="content">
                    <div class="container-fluid">

                        <div class="row">

                            <div class="container">

                                <div class="row">
                                    <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">

                                        <!-- Schedule Widget -->
                                        <div class="card booking-schedule schedule-widget">

                                            <!-- Schedule Header -->
                                            <div class="schedule-header">
                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <!-- Day Slot -->
                                                        <div class="day-slot">
                                                            <div class="date">
                                                                <h1></h1>
                                                                <ul>
                                                                    <li class="left-arrow">
                                                                        <a href="#">
                                                                            <i class="fa fa-chevron-left"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <span>Mon</span>
                                                                        <span class="slot-date">11 <small class="slot-year">2019</small></span>

                                                                    </li>
                                                                    <li>
                                                                        <span>Tue</span>
                                                                        <span class="slot-date">12 <small class="slot-year">2019</small></span>
                                                                    </li>
                                                                    <li>
                                                                        <span>Wed</span>
                                                                        <span class="slot-date">13 <small class="slot-year">2019</small></span>
                                                                    </li>
                                                                    <li>
                                                                        <span>Thu</span>
                                                                        <span class="slot-date">14 <small class="slot-year">2019</small></span>
                                                                    </li>
                                                                    <li>
                                                                        <span>Fri</span>
                                                                        <span class="slot-date">15 <small class="slot-year">2019</small></span>
                                                                    </li>
                                                                    <li>
                                                                        <span>Sat</span>
                                                                        <span class="slot-date">16 <small class="slot-year">2019</small></span>
                                                                    </li>
                                                                    <li>
                                                                        <span>Sun</span>
                                                                        <span class="slot-date">17 <small class="slot-year">2019</small></span>
                                                                    </li>
                                                                    <li class="right-arrow">
                                                                        <a href="#">
                                                                            <i class="fa fa-chevron-right"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <!-- /Day Slot -->

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Schedule Header -->

                                            <!-- Schedule Content -->
                                            <div class="schedule-cont">
                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <!-- Time Slot -->
                                                        <div class="time-slot">
                                                            <ul class="clearfix">
                                                                <li>
                                                                <c:set var="slot1" value="off"/>
                                                                <c:set var="slot2" value="off"/>
                                                                <c:set var="slot3" value="off"/>
                                                                <c:set var="slot4" value="off"/>
                                                                <c:set var="slot5" value="off"/>
                                                                <c:set var="slot6" value="off"/>                
                                                                <c:forEach var="DentistAvailiableTime" items="${mondaySchedule}">
                                                                <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                    <c:set var="slot1" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                    <c:set var="slot2" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                    <c:set var="slot3" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                    <c:set var="slot4" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                    <c:set var="slot5" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                    <c:set var="slot6" value="on"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <a class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#"  >
                                                                <span id="slot1">Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" ">
                                                                <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                            </a>
                                                            <a class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" ">
                                                                <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                            </a>
                                                            <a class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" ">
                                                                <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                            </a>
                                                            <a class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#"">
                                                                <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" ">
                                                                <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <c:set var="slot1" value="off"/>
                                                            <c:set var="slot2" value="off"/>
                                                            <c:set var="slot3" value="off"/>
                                                            <c:set var="slot4" value="off"/>
                                                            <c:set var="slot5" value="off"/>
                                                            <c:set var="slot6" value="off"/>                
                                                            <c:forEach var="DentistAvailiableTime" items="${tuesdaySchedule}">
                                                                <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                    <c:set var="slot1" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                    <c:set var="slot2" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                    <c:set var="slot3" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                    <c:set var="slot4" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                    <c:set var="slot5" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                    <c:set var="slot6" value="on"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <a class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#">
                                                                <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#">
                                                                <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                            </a>
                                                            <a class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#">
                                                                <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                            </a>
                                                            <a class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#">
                                                                <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                            </a>
                                                            <a class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#">
                                                                <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#">
                                                                <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <c:set var="slot1" value="off"/>
                                                            <c:set var="slot2" value="off"/>
                                                            <c:set var="slot3" value="off"/>
                                                            <c:set var="slot4" value="off"/>
                                                            <c:set var="slot5" value="off"/>
                                                            <c:set var="slot6" value="off"/>                
                                                            <c:forEach var="DentistAvailiableTime" items="${wednesdaySchedule}">
                                                                <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                    <c:set var="slot1" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                    <c:set var="slot2" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                    <c:set var="slot3" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                    <c:set var="slot4" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                    <c:set var="slot5" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                    <c:set var="slot6" value="on"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <a class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                            </a>
                                                            <a class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                            </a>
                                                            <a class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                            </a>
                                                            <a class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <c:set var="slot1" value="off"/>
                                                            <c:set var="slot2" value="off"/>
                                                            <c:set var="slot3" value="off"/>
                                                            <c:set var="slot4" value="off"/>
                                                            <c:set var="slot5" value="off"/>
                                                            <c:set var="slot6" value="off"/>                
                                                            <c:forEach var="DentistAvailiableTime" items="${thursdaySchedule}">
                                                                <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                    <c:set var="slot1" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                    <c:set var="slot2" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                    <c:set var="slot3" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                    <c:set var="slot4" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                    <c:set var="slot5" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                    <c:set var="slot6" value="on"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <a class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot2 == 'on'? "selselected\" onclick=\"javascript:pickSlot(this)\"ected":""}" href="#" >
                                                                <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                            </a>
                                                            <a class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                            </a>
                                                            <a class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                            </a>
                                                            <a class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <c:set var="slot1" value="off"/>
                                                            <c:set var="slot2" value="off"/>
                                                            <c:set var="slot3" value="off"/>
                                                            <c:set var="slot4" value="off"/>
                                                            <c:set var="slot5" value="off"/>
                                                            <c:set var="slot6" value="off"/>                
                                                            <c:forEach var="DentistAvailiableTime" items="${fridaySchedule}">
                                                                <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                    <c:set var="slot1" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                    <c:set var="slot2" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                    <c:set var="slot3" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                    <c:set var="slot4" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                    <c:set var="slot5" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                    <c:set var="slot6" value="on"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <a class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                            </a>
                                                            <a class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                            </a>
                                                            <a class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                            </a>
                                                            <a class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <c:set var="slot1" value="off"/>
                                                            <c:set var="slot2" value="off"/>
                                                            <c:set var="slot3" value="off"/>
                                                            <c:set var="slot4" value="off"/>
                                                            <c:set var="slot5" value="off"/>
                                                            <c:set var="slot6" value="off"/>                
                                                            <c:forEach var="DentistAvailiableTime" items="${saturdaySchedule}">
                                                                <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                    <c:set var="slot1" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                    <c:set var="slot2" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                    <c:set var="slot3" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                    <c:set var="slot4" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                    <c:set var="slot5" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                    <c:set var="slot6" value="on"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <a class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                            </a>
                                                            <a class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                            </a>
                                                            <a class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                            </a>
                                                            <a class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <c:set var="slot1" value="off"/>
                                                            <c:set var="slot2" value="off"/>
                                                            <c:set var="slot3" value="off"/>
                                                            <c:set var="slot4" value="off"/>
                                                            <c:set var="slot5" value="off"/>
                                                            <c:set var="slot6" value="off"/>                
                                                            <c:forEach var="DentistAvailiableTime" items="${sundaySchedule}">
                                                                <c:if test="${DentistAvailiableTime.slot == 1}">
                                                                    <c:set var="slot1" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 2}">
                                                                    <c:set var="slot2" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 3}">
                                                                    <c:set var="slot3" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 4}">
                                                                    <c:set var="slot4" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 5}">
                                                                    <c:set var="slot5" value="on"/>
                                                                </c:if>
                                                                <c:if test="${DentistAvailiableTime.slot == 6}">
                                                                    <c:set var="slot6" value="on"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <a class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                            </a>
                                                            <a class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                            </a>
                                                            <a class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                            </a>
                                                            <a class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                            </a>
                                                            <a class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" href="#" >
                                                                <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                            </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- /Time Slot -->

                                                </div>
                                            </div>
                                            <!--                                    <p>
                                                                                    <h2>Note </h2>
                                                                                    <span> Slot 1:(7:00 am - 8:30 am)</span>
                                                                                    <br>
                                                                                    <span>Slot 2:(8:45 am - 10:15 am)</span>
                                                                                    <br>
                                                                                    <span>Slot 3:(10:30 am - 12:00 am)</span>
                                                                                    <br>
                                                                                    <span>Slot 4:(13:00 pm - 14:30 pm)</span>
                                                                                    <br>
                                                                                    <span>Slot 5:(15:00 pm - 16:30 am)</span>
                                                                                    <br>
                                                                                    <span>Slot 6:(17:00 am - 18:30 am)</span>
                                                                                    <br>
                                                                                </p>-->
                                        </div>
                                        <!-- /Schedule Content -->

                                    </div>
                                    <!-- /Schedule Widget -->


                                </div>
                            </div>

                            <!--                         Calendar 
                                                    <div class="col-md-7 col-lg-8 col-xl-9">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div id="calendar"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                     /Calendar -->

                        </div>

                    </div>

                </div>		
                <!-- /Page Content -->

                <!-- Footer -->
                <footer class="footer">

                    <!-- Footer Top -->
                    <div class="footer-top">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-3 col-md-6">

                                    <!-- Footer Widget -->
                                    <div class="footer-widget footer-about">
                                        <div class="footer-logo">
                                            <img src="assets/img/footer-logo.png" alt="logo">
                                        </div>
                                        <div class="footer-about-content">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                            <div class="social-icon">
                                                <ul>
                                                    <li>
                                                        <a href="#" target="_blank"><i class="fab fa-facebook-f"></i> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" target="_blank"><i class="fab fa-twitter"></i> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" target="_blank"><i class="fab fa-dribbble"></i> </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Footer Widget -->

                                </div>

                                <div class="col-lg-3 col-md-6">

                                    <!-- Footer Widget -->
                                    <div class="footer-widget footer-menu">
                                        <h2 class="footer-title">For Patients</h2>
                                        <ul>
                                            <li><a href="search.html"><i class="fas fa-angle-double-right"></i> Search for Doctors</a></li>
                                            <li><a href="login.html"><i class="fas fa-angle-double-right"></i> Login</a></li>
                                            <li><a href="register.html"><i class="fas fa-angle-double-right"></i> Register</a></li>
                                            <li><a href="booking.html"><i class="fas fa-angle-double-right"></i> Booking</a></li>
                                            <li><a href="patient-dashboard.html"><i class="fas fa-angle-double-right"></i> Patient Dashboard</a></li>
                                        </ul>
                                    </div>
                                    <!-- /Footer Widget -->

                                </div>

                                <div class="col-lg-3 col-md-6">

                                    <!-- Footer Widget -->
                                    <div class="footer-widget footer-menu">
                                        <h2 class="footer-title">For Doctors</h2>
                                        <ul>
                                            <li><a href="appointments.html"><i class="fas fa-angle-double-right"></i> Appointments</a></li>
                                            <li><a href="chat.html"><i class="fas fa-angle-double-right"></i> Chat</a></li>
                                            <li><a href="login.html"><i class="fas fa-angle-double-right"></i> Login</a></li>
                                            <li><a href="doctor-register.html"><i class="fas fa-angle-double-right"></i> Register</a></li>
                                            <li><a href="doctor-dashboard.html"><i class="fas fa-angle-double-right"></i> Doctor Dashboard</a></li>
                                        </ul>
                                    </div>
                                    <!-- /Footer Widget -->

                                </div>

                                <div class="col-lg-3 col-md-6">

                                    <!-- Footer Widget -->
                                    <div class="footer-widget footer-contact">
                                        <h2 class="footer-title">Contact Us</h2>
                                        <div class="footer-contact-info">
                                            <div class="footer-address">
                                                <span><i class="fas fa-map-marker-alt"></i></span>
                                                <p> 3556  Beech Street, San Francisco,<br> California, CA 94108 </p>
                                            </div>
                                            <p>
                                                <i class="fas fa-phone-alt"></i>
                                                +1 315 369 5943
                                            </p>
                                            <p class="mb-0">
                                                <i class="fas fa-envelope"></i>
                                                doccure@example.com
                                            </p>
                                        </div>
                                    </div>
                                    <!-- /Footer Widget -->

                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /Footer Top -->

                    <!-- Footer Bottom -->
                    <div class="footer-bottom">
                        <div class="container-fluid">

                            <!-- Copyright -->
                            <div class="copyright">
                                <div class="row">
                                    <div class="col-md-6 col-lg-6">
                                        <div class="copyright-text">
                                            <p class="mb-0"><a href="templateshub.net">Templates Hub</a></p>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6">

                                        <!-- Copyright Menu -->
                                        <div class="copyright-menu">
                                            <ul class="policy-menu">
                                                <li><a href="term-condition.html">Terms and Conditions</a></li>
                                                <li><a href="privacy-policy.html">Policy</a></li>
                                            </ul>
                                        </div>
                                        <!-- /Copyright Menu -->

                                    </div>
                                </div>
                            </div>
                            <!-- /Copyright -->

                        </div>
                    </div>
                    <!-- /Footer Bottom -->

                </footer>
                <!-- /Footer -->

            </div>
            <!-- /Main Wrapper -->

            

            <!-- Add Event Modal -->
            <div class="modal custom-modal fade none-border" id="my_event">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Event</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body"></div>
                        <div class="modal-footer justify-content-center">
                            <button type="button" class="btn btn-success save-event submit-btn">Create event</button>
                            <button type="button" class="btn btn-danger delete-event submit-btn" data-dismiss="modal">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Add Event Modal -->

            <!-- Add Category Modal -->
            <div class="modal custom-modal fade" id="add_new_event">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Category</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label>Category Name</label>
                                    <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
                                </div>
                                <div class="form-group">
                                    <label>Choose Category Color</label>
                                    <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                        <option value="success">Success</option>
                                        <option value="danger">Danger</option>
                                        <option value="info">Info</option>
                                        <option value="primary">Primary</option>
                                        <option value="warning">Warning</option>
                                        <option value="inverse">Inverse</option>
                                    </select>
                                </div>
                                <div class="submit-section text-center">
                                    <button type="button" class="btn btn-primary save-category submit-btn" data-dismiss="modal">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Add Category Modal -->

            <!-- jQuery -->
            <script src="assets/js/jquery.min.js"></script>

            <!-- Bootstrap Core JS -->
            <script src="assets/js/popper.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>

            <!-- Sticky Sidebar JS -->
            <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
            <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

            <!-- Datetimepicker JS -->
            <script src="assets/js/moment.min.js"></script>
            <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

            <!-- Full Calendar JS -->
            <script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
            <script src="assets/plugins/fullcalendar/fullcalendar.min.js"></script>
            <script src="assets/plugins/fullcalendar/jquery.fullcalendar.js"></script>

            <!-- Custom JS -->
            <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/calendar.html  30 Nov 2019 04:12:19 GMT -->
</html>
