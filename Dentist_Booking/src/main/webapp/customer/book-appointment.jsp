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
                                        <li class="breadcrumb-item"><span href="index-2.html">Home</span></li>
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
                                            <input type="hidden" name="customerId" value="${sessionScope.Login_Customer.id}">
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
                                            <div class="date" id="date" data-target-input="nearest">
                                                <input type="text"
                                                       class="form-control border-0 datetimepicker-input" id="date"
                                                       placeholder="Choose Date" data-target="#date" data-toggle="datetimepicker" style="height: 55px;" name="date">
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <select class="form-select border-0" name="serviceId" style="height: 55px;">
                                                <option value="serviceId" checked>Choose service</option>
                                                <c:forEach var="service" items="${services}">
                                                        <option type="checkbox" name="serviceId" value="${service.id}" />${service.serviceName}</option>
                                                     </c:forEach>
                                            </select>
                                
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
                                                <span href="${dentistDetail}" class="booking-doc-img">
                                                    <img src="../customer/assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
                                                </span>
                                                <div class="booking-info">
                                                    <h4><span href="${dentistDetail}">${dentist.personalName}</span></h4>
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
                                                        <li id="prev" class="left-arrow">

                                                            <i class="fa fa-chevron-left"></i>

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
                                                        <li id="next" class="right-arrow">

                                                            <i class="fa fa-chevron-right"></i>

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
                                                        <span class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"   >
                                                            <span id="slot1">Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  ">
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  ">
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  ">
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" ">
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  ">
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                        </span>
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
                                                        <span class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                        </span>
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
                                                        <span class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                        </span>
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
                                                        <span class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                        </span>
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
                                                        <span class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                        </span>
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
                                                        <span class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                        </span>
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
                                                        <span class="timing ${slot1 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span>
                                                        </span>
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
                                                function undoPickSlot() {
                                                    document.querySelector(".time").childNodes[1].value = '';
                                                    const collection = document.querySelectorAll(".timing.selected");
                                                    for (let i = 0; i < collection.length; i++) {
                                                        collection[i].style.backgroundColor = "#42c0fb";
                                                    }
                                                }
                                                function handleSelect(elm)
                                                {
                                                    window.location = "bookingDentist?dentistId=" + elm.value;
                                                }
                                                ;

                                                const Calendar = function () {
                                                    let current = new Date();
                                                    const move = (step) => {
                                                        let arr = [];
                                                        const increment = step / Math.abs(step);
                                                        while (arr.length < Math.abs(step)) {
                                                            const day = new Date(current.getFullYear(), current.getMonth(), current.getDate() + increment);
                                                            current = day;
                                                            arr.push(day);
                                                        }
                                                        return arr;
                                                    }

                                                    return {
                                                        move
                                                    }
                                                }

                                                const cal = new Calendar();

                                                var months = ["January", "February", "March", "April", "May", "June",
                                                    "July", "August", "September", "October", "November", "December"];



                                                const create = (days) => {
                                                    let array = document.querySelectorAll(".slot-date");
                                                    var x = 0;
                                                    days.forEach((day) => {
                                                        array[x].innerHTML = day.getDate() + ' ' + months[day.getMonth()] + ' <small class="slot-year">' + day.getFullYear() + '</small>';
                                                        x++;
                                                        console.log(array[x]);
                                                        console.log(day.getDate() + months[day.getMonth()] + day.getFullYear());
                                                    })
                                                }

                                                document.getElementById('next').addEventListener('click', (e) => {
                                                    create(cal.move(7));
                                                    undoPickSlot();
                                                })

                                                document.getElementById('prev').addEventListener('click', (e) => {
                                                    create(cal.move(-7));
                                                    undoPickSlot();
                                                })

                                                var checkList = document.getElementById('list1');
                                                checkList.getElementsByClassName('anchor')[0].onclick = function (evt) {
                                                    if (checkList.classList.contains('visible'))
                                                        checkList.classList.remove('visible');
                                                    else
                                                        checkList.classList.add('visible');
                                                };
                                                create();
        </script>

    </body>

    <!-- doccure/booking.html  30 Nov 2019 04:12:16 GMT -->
</html>
