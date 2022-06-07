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
                                        <li class="breadcrumb-item"><a href="homepage/mainpage">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Booking</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Booking</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->
                <h1>${appointmentMsg}</h1>
            <!-- Page Content -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="row g-5">
                        <div class="col-lg-12" data-wow-delay="0.1s">
                            <p class="d-inline-block border rounded-pill py-1 px-4">Appointment</p>
                            <h1 class="mb-4">Make An Appointment To Visit Our Dentist</h1>
                        </div>

                        <div class="col-lg-12" >
                            <div class="bg-light rounded h-100 d-flex align-items-center p-5">
                                <form id="book" action="book" method="GET">
                                    <h3>Your infomation</h3>
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
                                <h3 class="col-md-12 center" style="text-align:center; color: #007bff">Please pick your slot</h3>
                                <p class="col-md-12 center" style="text-align:center; color: red">Only 2 services per appointment</p>
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
                                                            <span class="day-of-week"></span>
                                                            <span class="slot-date"></span>

                                                        </li>
                                                        <li>
                                                            <span class="day-of-week"></span>
                                                            <span class="slot-date"></span>
                                                        </li>
                                                        <li>
                                                            <span class="day-of-week"></span>
                                                            <span class="slot-date"></span>
                                                        </li>
                                                        <li>
                                                            <span class="day-of-week"></span>
                                                            <span class="slot-date"></span>
                                                        </li>
                                                        <li>
                                                            <span class="day-of-week"></span>
                                                            <span class="slot-date"></span>
                                                        </li>
                                                        <li>
                                                            <span class="day-of-week"></span>
                                                            <span class="slot-date"></span>
                                                        </li>
                                                        <li>
                                                            <span class="day-of-week"></span>
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
                                                    <li class="monday">
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
                                                            <span id="slot1">Slot 1</span><br><span>(7:00 am - 8:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  ">
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  ">
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  ">
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" ">
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  ">
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                    </li>
                                                    <li class="tuesday">
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
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}" >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                    </li>
                                                    <li class="wednesday">
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
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                    </li>
                                                    <li class="thursday">
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
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                    </li>
                                                    <li class="friday">
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
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                    </li>
                                                    <li class="saturday">
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
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                    </li>
                                                    <li class="sunday">
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
                                                            <span>Slot 1</span><br><span>(7:00 am - 8:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot2 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 2</span><br><span>(8:45 am - 10:15 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot3 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 3</span><br><span>(10:30 am - 12:00 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot4 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 4</span><br><span>(13:00 pm - 14:30 pm)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot5 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 5</span><br><span>(15:00 pm - 16:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                        <span class="timing ${slot6 == 'on'? "selected\" onclick=\"javascript:pickSlot(this)\"":""}"  >
                                                            <span>Slot 6</span><br><span>(17:00 am - 18:30 am)</span><span class="slotDate" style="display:none;"></span>
                                                        </span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- /Time Slot -->

                                        </div>
                                    </div>
                                    <div style="margin-top:5%;" class="row g-3">
                                        <div class="col-12 col-sm-12">
                                            Time:
                                            <div class="date" id="date" data-target-input="nearest">
                                                <input onchange="return false;" form="book" type="text"
                                                       class="form-control border-0 datetimepicker-input" id="date"
                                                       placeholder="Choose Date" data-target="#date" data-toggle="datetimepicker" style="height: 55px;" name="date">
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-4">
                                            <select form="book" class="form-select border-0" name="serviceId" style="height: 55px;">
                                                <option value="serviceId" ${servicesId == null ? "selected":""}>Choose service</option>
                                                <c:forEach var="service" items="${services}">
                                                    <option type="checkbox" name="serviceId" ${servicesId[0] == service.id ? "selected":""} value="${service.id}" />${service.serviceName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-12 col-sm-4">
                                            <select form="book" class="form-select border-0" name="slot" style="height: 55px;" onclick="alert(this)" onfocus="alert(this)" onchange="alert(this)">
                                                <option id="0" value="Slot" selected="true">Choose slot</option>
                                                <c:forEach var = "i" begin = "1" end = "6">
                                                    <option id="${i}" value="Slot ${i}">Slot ${i}</option>
                                                </c:forEach>
                                            </select>
                                            <span id="alert" style="display:none; color:red;">Please pick your slot above</span>
                                        </div>
                                        <div class="col-12 col-sm-4">
                                            <input onchange="return false;" type="text" class="form-control border-0" name="promotion" placeholder="Enter promotion ID" value="${promotionId}" style="height: 55px;">
                                        </div>
                                        <div class="col-12 col-sm-4">
                                            <select form="book" class="form-select border-0" name="serviceId" style="height: 55px;">
                                                <option value="serviceId" ${servicesId == null ? "selected":""}>Choose service</option>
                                                <c:forEach var="service" items="${services}">
                                                    <option type="checkbox" name="serviceId" value="${service.id}" ${servicesId[1] == service.id ? "selected":""} />${service.serviceName}</option>
                                                </c:forEach>
                                            </select>

                                        </div>
                                        <div class="col-12 col-sm-4" >
                                            <div class="time" id="time">
                                                <select class="form-select border-0" name="slot" style="height: 55px;" onclick="alert2nd(this);" onfocus="alert2nd(this);" onchange="alert2nd(this);" form="book">
                                                    <option id="0" value="Slot" selected="true">Choose slot</option>
                                                    <c:forEach var = "i" begin = "1" end = "6">
                                                        <option id="slot-${i}" value="Slot ${i}">Slot ${i}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <span id="alert1" style="display:none; color:red;">Please pick your slot above</span>
                                        </div>
                                        <span id="alert" style="${serviceErrorMsg == null ? "display:none;":"" } color:red;">${serviceErrorMsg}</span>
                                        <div class="col-12 col-sm-4">
                                            <input onchange="return false;" type="text" class="form-control border-0" name="promotion" placeholder="Enter promotion ID" value="${promotionId}" style="height: 55px;">
                                        </div>
                                        <div class="col-12">
                                            <textarea form="book" name="customerSymtom" class="form-control border-0" rows="10" placeholder="Describe your problem"></textarea>
                                        </div>
                                    </div>

                                </div>
                                <!-- /Schedule Content -->

                            </div>
                            <!-- /Schedule Widget -->


                        </div>
                    </div>

                    <div class="d-flex justify-content-center" style="margin-bottom: 5%;">
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
                                                    var selectSlotElm = document.getElementById(elm.childNodes[1].innerText.charAt(elm.childNodes[1].innerText.length - 1));
                                                    var selectSlotElm2nd = document.getElementById('slot-' + elm.childNodes[1].innerText.charAt(elm.childNodes[1].innerText.length - 1));
                                                    var valueInputDate = document.querySelector("#date").childNodes[1].value;
                                                    var timeOfSlot = elm.childNodes[4].innerText;
                                                    var selected1stServiceSlotCheck = false;
                                                    var selected2ndServiceSlotCheck = false;

                                                    if (timeOfSlot == valueInputDate && (selectSlotElm.selected == true || selectSlotElm2nd.selected == true)) {
                                                        var elmSlot = elm.childNodes[1].innerText.substring(0, 6);
                                                        if (selectSlotElm.label == elmSlot && selectSlotElm.selected == true) {                                    
                                                            for (let j = 1; j < 6; j++) {                                             
                                                                if (document.getElementById('slot-' + j).selected) {
                                                                    selected2ndServiceSlotCheck = document.getElementById('slot-' + j).selected;
                                                                }
                                                            }
                                                            if (selected2ndServiceSlotCheck) {
                                                                selectSlotElm.selected = false;
                                                            }else{
                                                                selectSlotElm.selected = false;
                                                                document.querySelector("#date").childNodes[1].value = "";
                                                            }
                                                            document.querySelector("#alert").style.display = "none";
                                                            elm.style.backgroundColor = "#42c0fb";
                                                            return;
                                                        } else {
                                                            for (let j = 1; j < 6; j++) {
                                                                if (document.getElementById(j).selected) {
                                                                    selected1stServiceSlotCheck = document.getElementById(j).selected;
                                                                }
                                                            }
                                                            if (selected1stServiceSlotCheck) {
                                                                selectSlotElm2nd.selected = false;
                                                            }else{
                                                                selectSlotElm2nd.selected = false;
                                                                document.querySelector("#date").childNodes[1].value = "";
                                                            }
                                                            document.querySelector("#alert").style.display = "none";
                                                            elm.style.backgroundColor = "#42c0fb";
                                                        }

                                                    } else if (timeOfSlot == valueInputDate || valueInputDate == "") {
                                                        for (let j = 1; j < 6; j++) {
                                                            var selectedCheck = document.getElementById(j).selected;
                                                            console.log(selectedCheck);
                                                            if (selectedCheck == true && selectSlotElm2nd.selected == false) {
                                                                selectSlotElm2nd.selected = "true";
                                                                document.querySelector("#alert1").style.display = "none";
                                                                elm.style.backgroundColor = "red";
                                                                return;
                                                            }
                                                        }
                                                        document.querySelector("#alert").style.display = "none";
                                                        document.getElementById(elm.childNodes[1].innerText.charAt(elm.childNodes[1].innerText.length - 1)).selected = "true";
                                                        document.querySelector("#date").childNodes[1].value = elm.childNodes[4].innerText;
                                                        elm.style.backgroundColor = "red";
                                                    }
                                                }

                                                function resetPickSlot() {
                                                    document.querySelector(".time").childNodes[1].value = '';
                                                    const collection = document.querySelectorAll(".timing.selected");

                                                    for (let i = 0; i < collection.length; i++) {
                                                        collection[i].style.backgroundColor = "#42c0fb";
                                                        var valueInputDate = document.querySelector("#date").childNodes[1].value;
                                                        var timeOfSlot = collection[i].childNodes[4].innerText;
                                                        var selectSlotElm = document.getElementById(collection[i].childNodes[1].innerText.charAt(collection[i].childNodes[1].innerText.length - 1));
                                                        if (valueInputDate === timeOfSlot && selectSlotElm.selected === true) {
                                                            document.querySelector("#alert").style.display = "none";
                                                            collection[i].style.backgroundColor = "red";
                                                        }

                                                    }
                                                }
                                                function handleSelect(elm)
                                                {
                                                    window.location = "booking?dentistId=" + elm.value;
                                                }
                                                function alert(elm) {
                                                    elm.selectedIndex = elm.defaultIndex;
                                                    document.querySelector("#alert").style.display = "block";
                                                }
                                                function alert2nd(elm) {
                                                    elm.selectedIndex = elm.defaultIndex;
                                                    document.querySelector("#alert1").style.display = "block";
                                                }

                                                const Calendar = function () {
                                                    let current = new Date();
                                                    const moveToMonday = (increment) => {
                                                        let round = 0;
                                                        while (current.getDay() != 0 || (round < 2 && increment < 0)) {
                                                            current = new Date(current.getFullYear(), current.getMonth(), current.getDate() + (increment || -1));
                                                            if (current.getDay() == 0)
                                                                round++;
                                                        }
                                                    }
                                                    const getWeek = (step = 1) => {
                                                        const increment = step == 0 ? step : step / Math.abs(step);
                                                        moveToMonday(increment);
                                                        let week = [];
                                                        while (week.length < 7) {
                                                            const day = new Date(current.getFullYear(), current.getMonth(), current.getDate() + 1);
                                                            current = day;
                                                            week.push(current);
                                                        }
                                                        return week;
                                                    }
                                                    return {
                                                        getWeek
                                                    }
                                                }

                                                const cal = new Calendar();


                                                var months = ["January", "February", "March", "April", "May", "June",
                                                    "July", "August", "September", "October", "November", "December"];
                                                var daysOfWeekLetters = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

                                                var today = new Date();
                                                const create = (days) => {
                                                    let dayOfWeek = document.querySelectorAll(".day-of-week");
                                                    let slotDate = document.querySelectorAll(".slotDate");
                                                    console.log(slotDate);
                                                    let array = document.querySelectorAll(".slot-date");
                                                    var z = 6;
                                                    var i = 0;
                                                    var x = 0;
                                                    days.forEach((day) => {
                                                        for (i; i < z; i++) {
                                                            slotDate[i].innerHTML = day.getDate() + '/' + day.getMonth() + '/' + day.getFullYear();
                                                        }
                                                        z = z + 6;
                                                        dayOfWeek[x].innerHTML = daysOfWeekLetters[day.getDay()];
                                                        array[x].innerHTML = day.getDate() + ' ' + months[day.getMonth()] + ' ' + day.getFullYear();
                                                        if (today.getDate() == day.getDate() && today.getMonth() == day.getMonth() && today.getFullYear() == day.getFullYear()) {
                                                            array[x].style.borderRadius = "0px 0px 10px 10px";
                                                            array[x].style.backgroundColor = "#09e5ab";
                                                            array[x].style.color = "white";
                                                            dayOfWeek[x].style.backgroundColor = "#09e5ab";
                                                            dayOfWeek[x].style.color = "white";
                                                            dayOfWeek[x].style.borderRadius = "10px 10px 0px 0px";
                                                        } else {
                                                            array[x].style.borderRadius = "0px 0px 0px 0px";
                                                            array[x].style.backgroundColor = "white";
                                                            dayOfWeek[x].style.backgroundColor = "white";
                                                            dayOfWeek[x].style.borderRadius = "0px 0px 0px 0px";
                                                            array[x].style.color = "#757575";
                                                            dayOfWeek[x].style.color = "#757575";
                                                        }
                                                        x++;
                                                    })
                                                }

                                                document.getElementById('next').addEventListener('click', (e) => {
                                                    create(cal.getWeek(1));
                                                    resetPickSlot();
                                                })

                                                document.getElementById('prev').addEventListener('click', (e) => {
                                                    create(cal.getWeek(-1));
                                                    resetPickSlot();
                                                })
                                                create(cal.getWeek(0));
        </script>

    </body>

    <!-- doccure/booking.html  30 Nov 2019 04:12:16 GMT -->
</html>
