<%-- 
    Document   : book-appointment
    Created on : May 21, 2022, 4:17:04 PM
    Author     : hieunguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/booking.html  30 Nov 2019 04:12:16 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="../customer/lib/animate/animate.min.css" rel="stylesheet">
        <link href="../customer/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../customer/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../customer/css/bootstrap.min.css" rel="stylesheet">

        <!-- Favicons -->
        <link href="../customer/assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../customer/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="../customer/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="../customer/assets/plugins/fontawesome/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="../customer/assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.min.js"></script>
                <script src="assets/js/respond.min.js"></script>
        <![endif]-->
        <style>
            .dropdown-check-list {
                display: inline-block;
            }

            .dropdown-check-list .anchor {
                position: relative;
                cursor: pointer;
                display: inline-block;
                padding: 5px 50px 5px 10px;

            }

            .dropdown-check-list .anchor:after {
                position: absolute;
                content: "";
                border-left: 2px solid black;

                padding: 5px;
                right: 10px;
                top: 20%;
                -moz-transform: rotate(-135deg);
                -ms-transform: rotate(-135deg);
                -o-transform: rotate(-135deg);
                -webkit-transform: rotate(-135deg);
                transform: rotate(-135deg);
            }

            .dropdown-check-list .anchor:active:after {
                right: 8px;
                top: 21%;
            }

            .dropdown-check-list ul.items {
                padding: 2px;
                display: none;
                margin: 0;

            }

            .dropdown-check-list ul.items li {
                list-style: none;
            }

            .dropdown-check-list.visible .anchor {
                color: #0094ff;
            }

            .dropdown-check-list.visible .items {
                display: block;
            }
        </style>
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
                                        <li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Booking</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Booking</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->

                <!-- Page Content -->
                <div class="container-xxl py-5">
                    <div class="container">
                        <div class="row g-5">
                            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                                <p class="d-inline-block border rounded-pill py-1 px-4">Appointment</p>
                                <h1 class="mb-4">Make An Appointment To Visit Our Dentist</h1>
                                <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                                <div class="bg-light rounded d-flex align-items-center p-5 mb-4">
                                    <div class="d-flex flex-shrink-0 align-items-center justify-content-center rounded-circle bg-white" style="width: 55px; height: 55px;">
                                        <i class="fa fa-phone-alt text-primary"></i>
                                    </div>
                                    <div class="ms-4">
                                        <p class="mb-2">Call Us Now</p>
                                        <h5 class="mb-0">+012 345 6789</h5>
                                    </div>
                                </div>
                                <div class="bg-light rounded d-flex align-items-center p-5">
                                    <div class="d-flex flex-shrink-0 align-items-center justify-content-center rounded-circle bg-white" style="width: 55px; height: 55px;">
                                        <i class="fa fa-envelope-open text-primary"></i>
                                    </div>
                                    <div class="ms-4">
                                        <p class="mb-2">Mail Us Now</p>
                                        <h5 class="mb-0">info@example.com</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6" >
                                <div class="bg-light rounded h-100 d-flex align-items-center p-5">
                                    <form id="book" action="book" method="GET">
                                        <div class="row g-3">
                                            <div class="col-12 col-sm-6">
                                                <input type="text" class="form-control border-0" name="customerName" placeholder="Your Name" value="${sessionScope.Login_Customer.personalName}" style="height: 55px;">
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <input type="email" class="form-control border-0" name="customerEmail" placeholder="Your Email" value="${sessionScope.Login_Customer.email}" style="height: 55px;">
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <input type="text" class="form-control border-0" name="customerPhone" placeholder="Your Mobile" value="${sessionScope.Login_Customer.phoneNumber}" style="height: 55px;">
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <select class="form-select border-0" name="dentistId" style="height: 55px;" onchange="javascript:handleSelect(this)">
                                                <c:forEach var="dentist" items="${dentists}">
                                                    <option value="${dentist.id}" ${dentist.id == dentistId ? "selected":""} >${dentist.personalName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div id="list1"  class="dropdown-check-list form-select border-0">
                                                <span class="anchor">Choose Services</span>
                                                <ul class="items">
                                                    <c:forEach var="service" items="${services}">
                                                        <li><input type="checkbox" name="serviceId" value="${service.id}" />${service.serviceName}</li>
                                                        </c:forEach>


                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <div class="date" id="date" data-target-input="nearest">
                                                <input type="text"
                                                       class="form-control border-0 datetimepicker-input" id="date"
                                                       placeholder="Choose Date" data-target="#date" data-toggle="datetimepicker" style="height: 55px;" name="date">
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <div class="time" id="time" data-target-input="nearest">
                                                <input type="text"
                                                       class="form-control border-0 datetimepicker-input"
                                                       placeholder="Choose Slot" data-target="#time" data-toggle="datetimepicker" style="height: 55px;" name="slot">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <textarea class="form-control border-0" rows="5" placeholder="Describe your problem"></textarea>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <div class="content">
                <div class="container">

                    <div class="row">
                        <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="card">
                                <div class="card-body">
                                    <div class="booking-doc-info">
                                        <c:url var="dentistDetail" value="${request.contextPath}/dentists/detail">
                                            <c:param name="id" value="${dentistId}"></c:param>
                                        </c:url>
                                        <c:forEach var="dentist" items="${dentists}">
                                            <c:if test="${dentist.id == dentistId}">
                                                <a href="${dentistDetail}" class="booking-doc-img">
                                                    <img src="../customer/assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
                                                </a>
                                                <div class="booking-info">
                                                    <h4><a href="${dentistDetail}">${dentist.personalName}</a></h4>
                                                    <div class="rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <span class="d-inline-block average-rating">(${dentist.rate})</span>
                                                    </div>
                                                    <p class="text-muted mb-0"><i class="fas fa-map-marker-alt"></i> ${dentist.speciality}</p>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

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

                    <div class="d-flex justify-content-center" >
                        <div >
                            <button form="book" class="btn btn-primary w-100 py-3" type="submit">Book Appointment</button>
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
            <script src="../customer/assets/js/jquery.min.js"></script>

            <!-- Bootstrap Core JS -->
            <script src="../customer/assets/js/popper.min.js"></script>
            <script src="../customer/assets/js/bootstrap.min.js"></script>

            <!-- Custom JS -->
            <script src="../customer/assets/js/script.js"></script>

            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="../customer/lib/wow/wow.min.js"></script>
            <script src="../customer/lib/easing/easing.min.js"></script>
            <script src="../customer/lib/waypoints/waypoints.min.js"></script>
            <script src="../customer/lib/counterup/counterup.min.js"></script>
            <script src="../customer/lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="../customer/lib/tempusdominus/js/moment.min.js"></script>
            <script src="../customer/lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="../customer/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

            <!-- Template Javascript -->
            <script src="../customer/js/main.js"></script>

            <script type="text/javascript">
                                                function pickSlot(elm) {
                                                    document.querySelector(".time").childNodes[1].value = elm.childNodes[1].innerText;
                                                    elm.style.backgroundColor = "red";
                                                }
                                                function handleSelect(elm)
                                                {
                                                    window.location = "bookingDentist?dentistId=" + elm.value;
                                                }
                                                ;

                                                const date = new Date();

                                                const renderCalendar = () => {
                                                    date.setDate(1);

                                                    const monthDays = document.querySelector(".days");

                                                    const lastDay = new Date(
                                                            date.getFullYear(),
                                                            date.getMonth() + 1,
                                                            0
                                                            ).getDate();

                                                    const prevLastDay = new Date(
                                                            date.getFullYear(),
                                                            date.getMonth(),
                                                            0
                                                            ).getDate();

                                                    const firstDayIndex = date.getDay();

                                                    const lastDayIndex = new Date(
                                                            date.getFullYear(),
                                                            date.getMonth() + 1,
                                                            0
                                                            ).getDay();

                                                    const nextDays = 7 - lastDayIndex - 1;

                                                    const months = [
                                                        "January",
                                                        "February",
                                                        "March",
                                                        "April",
                                                        "May",
                                                        "June",
                                                        "July",
                                                        "August",
                                                        "September",
                                                        "October",
                                                        "November",
                                                        "December",
                                                    ];

                                                    let array = document.querySelectorAll(".slot-date");
                                                    console.log(array);
                                                    for (let x = 0; x < array.length; x++) {
                                                        array[x].innerHTML = '11 ' + months[date.getMonth()] + ' <small class="slot-year">2019</small>';
                                                    }
//
//                                                    let days = "";
//
//                                                    for (let x = firstDayIndex; x > 0; x--) {
//                                                        days += `<div class="prev-date">${prevLastDay - x + 1}</div>`;
//                                                    }
//
//                                                    for (let i = 1; i <= lastDay; i++) {
//                                                        if (
//                                                                i === new Date().getDate() &&
//                                                                date.getMonth() === new Date().getMonth()
//                                                                ) {
//                                                            days += `<div class="today">${i}</div>`;
//                                                        } else {
//                                                            days += `<div>${i}</div>`;
//                                                        }
//                                                    }
//
//                                                    for (let j = 1; j <= nextDays; j++) {
//                                                        days += `<div class="next-date">${j}</div>`;
//                                                        monthDays.innerHTML = days;
//                                                    }
                                                };

//                                                document.querySelector(".prev").addEventListener("click", () => {
//                                                    date.setMonth(date.getMonth() - 1);
//                                                    renderCalendar();
//                                                });
//
//                                                document.querySelector(".next").addEventListener("click", () => {
//                                                    date.setMonth(date.getMonth() + 1);
//                                                    renderCalendar();
//                                                });

                                                renderCalendar();

                                                var checkList = document.getElementById('list1');
                                                checkList.getElementsByClassName('anchor')[0].onclick = function (evt) {
                                                    if (checkList.classList.contains('visible'))
                                                        checkList.classList.remove('visible');
                                                    else
                                                        checkList.classList.add('visible');
                                                };
        </script>

    </body>

    <!-- doccure/booking.html  30 Nov 2019 04:12:16 GMT -->
</html>
