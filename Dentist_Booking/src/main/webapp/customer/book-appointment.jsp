<%-- 
    Document   : book-appointment
    Created on : May 21, 2022, 4:17:04 PM
    Author     : hieunguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <form onsubmit = "event.preventDefault(); myValidation();" id="book" action="book" method="GET">
                                    <h3>Your infomation</h3>
                                    <div class="row g-3">
                                        <div class="col-12 col-sm-6">
                                            <input readonly="true" type="text" class="form-control border-0" name="customerName" value="${sessionScope.Login_Customer.personalName}" style="height: 55px;">
                                            <input type="hidden" name="customerId" value="${sessionScope.Login_Customer.id}">
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <input readonly="true" type="email" class="form-control border-0" name="customerEmail" placeholder="Your Email" value="${sessionScope.Login_Customer.email}" style="height: 55px;">
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <input readonly="true" type="text" class="form-control border-0" name="customerPhone" placeholder="Your Mobile" value="${sessionScope.Login_Customer.phoneNumber}" style="height: 55px;">
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
                                                    <img src="../customer/${dentist.image}" alt="User Image">
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
                                <p class="col-md-12 center" style="text-align:center; color: red">Only 2 slot each services per appointment</p>
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

                                        <div style="display:none" class="col-12 col-sm-12">
                                            <div class="date" id="date" data-target-input="nearest">
                                                <input required="required" oninvalid="InvalidMsg(this);" oninput="InvalidMsg(this);" form="book" type="text"
                                                       class="form-control border-0 datetimepicker-input" id="date"
                                                       placeholder="Choose Date" style="height: 55px;" name="date" value="${date}">
                                            </div>
                                        </div>
                                        <span>Choose services:</span>
                                        <div class="col-12 col-sm-12" id="1st-service" ${servicesId[0] == null ? "style=\"display:none\"":""}>

                                            <select id="1stService" form="book" class="form-select border-0" name="serviceId" style="height: 55px;" required>
                                                <option id="1st-slot" value="" ${servicesId == null ? "selected":""}>Choose service</option>
                                                <c:forEach var="service" items="${services}">
                                                    <option type="checkbox" name="serviceId" ${servicesId[0] == service.id ? "selected":""} value="${service.id}" />${service.serviceName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-12 col-sm-5" style="display:none">
                                            <select required id="1stServiceSlot" form="book" class="form-select border-0" name="slot" style="height: 55px;" >
                                                <option id="0" value="" selected="true">Choose slot</option>
                                                <c:forEach var = "i" begin = "1" end = "6">
                                                    <option id="${i}" value="Slot ${i}">Slot ${i}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-12 col-sm-12" id="2nd-service" ${servicesId[1] == null ? "style=\"display:none\"":""}>
                                            <select id="2ndService" form="book" class="form-select border-0" name="serviceId" style="height: 55px;">
                                                <option id="2nd-slot" value="" ${servicesId == null ? "selected":""}>Choose service</option>
                                                <c:forEach var="service" items="${services}">
                                                    <option type="checkbox" name="serviceId" value="${service.id}" ${servicesId[1] == service.id ? "selected":""} />${service.serviceName}</option>
                                                </c:forEach>
                                            </select>
                                            <span id="alert" style="display:none; color:red;">Services picked cannot be duplicated!</span>
                                        </div>
                                        <div class="col-12 col-sm-5" style="display:none">
                                            <div class="time" id="time">
                                                <select id="2ndServiceSlot" class="form-select border-0" name="slot" style="height: 55px;" form="book">
                                                    <option value="" id="0" selected="true">Choose slot</option>
                                                    <c:forEach var = "i" begin = "1" end = "6">
                                                        <option id="slot-${i}" value="Slot ${i}" >Slot ${i}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <textarea form="book" name="customerSymtom" class="form-control border-0" rows="10" placeholder="Describe your problem" value="${customerSymtom}"></textarea>
                                        </div>
                                    </div>
                                    <h5 id="errorMsg" style="color:red; display:none; text-align:center;">PLease pick your slots and services for appointment!</h5>
                                </div>
                                <!-- /Schedule Content -->

                            </div>
                            <!-- /Schedule Widget -->


                        </div>
                    </div>

                    <div class="d-flex justify-content-center" style="margin-bottom: 5%;">
                        <div >
                            <button onclick="checkError()" form="book" class="btn btn-primary w-100 py-3" type="submit">Book Appointment</button>
                        </div>
                    </div>
                    <div style="display:none" id="list_slot_booked">
                        <c:forEach var="slotUnvailable" items="${slotUnavailable}">
                            <span class="appointmentId">${slotUnvailable.key.id}</span><span class="slotUnavailable">Slot ${slotUnvailable.key.slot}</span><span class="meeting_date"><fmt:formatDate pattern = "d/M/yyyy" value="${slotUnvailable.value}"/></span>
                            </c:forEach>
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

        <script src="../customer/js/appointment.js" type="text/javascript"></script>

    </body>

    <!-- doccure/booking.html  30 Nov 2019 04:12:16 GMT -->
</html>
