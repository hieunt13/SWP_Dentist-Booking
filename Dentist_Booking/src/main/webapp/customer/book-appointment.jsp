<%-- 
    Document   : book-appointment
    Created on : May 21, 2022, 4:17:04 PM
    Author     : hieunguyen
--%>

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
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

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
                                <h1 class="mb-4">Make An Appointment To Visit Our Doctor</h1>
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
                            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                                <div class="bg-light rounded h-100 d-flex align-items-center p-5">
                                    <form>
                                        <div class="row g-3">
                                            <div class="col-12 col-sm-6">
                                                <input type="text" class="form-control border-0" placeholder="Your Name" style="height: 55px;">
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <input type="email" class="form-control border-0" placeholder="Your Email" style="height: 55px;">
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <input type="text" class="form-control border-0" placeholder="Your Mobile" style="height: 55px;">
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <select class="form-select border-0" style="height: 55px;">
                                                    <option selected>Choose Doctor</option>
                                                    <option value="1">Doctor 1</option>
                                                    <option value="2">Doctor 2</option>
                                                    <option value="3">Doctor 3</option>
                                                </select>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="date" id="date" data-target-input="nearest">
                                                    <input type="text"
                                                           class="form-control border-0 datetimepicker-input"
                                                           placeholder="Choose Date" data-target="#date" data-toggle="datetimepicker" style="height: 55px;">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="time" id="time" data-target-input="nearest">
                                                    <input type="text"
                                                           class="form-control border-0 datetimepicker-input"
                                                           placeholder="Choose Date" data-target="#time" data-toggle="datetimepicker" style="height: 55px;">
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <textarea class="form-control border-0" rows="5" placeholder="Describe your problem"></textarea>
                                            </div>
                                            <div class="col-12">
                                                <button class="btn btn-primary w-100 py-3" type="submit">Book Appointment</button>
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
                                            <a href="doctor-profile.html" class="booking-doc-img">
                                                <img src="assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
                                            </a>
                                            <div class="booking-info">
                                                <h4><a href="doctor-profile.html">Dr. Darren Elder</a></h4>
                                                <div class="rating">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star"></i>
                                                    <span class="d-inline-block average-rating">35</span>
                                                </div>
                                                <p class="text-muted mb-0"><i class="fas fa-map-marker-alt"></i> Newyork, USA</p>
                                            </div>
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
                                                    <ul>
                                                        <li class="left-arrow">
                                                            <a href="#">
                                                                <i class="fa fa-chevron-left"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <span>Mon</span>
                                                            <span class="slot-date">11 Nov <small class="slot-year">2019</small></span>
                                                        </li>
                                                        <li>
                                                            <span>Tue</span>
                                                            <span class="slot-date">12 Nov <small class="slot-year">2019</small></span>
                                                        </li>
                                                        <li>
                                                            <span>Wed</span>
                                                            <span class="slot-date">13 Nov <small class="slot-year">2019</small></span>
                                                        </li>
                                                        <li>
                                                            <span>Thu</span>
                                                            <span class="slot-date">14 Nov <small class="slot-year">2019</small></span>
                                                        </li>
                                                        <li>
                                                            <span>Fri</span>
                                                            <span class="slot-date">15 Nov <small class="slot-year">2019</small></span>
                                                        </li>
                                                        <li>
                                                            <span>Sat</span>
                                                            <span class="slot-date">16 Nov <small class="slot-year">2019</small></span>
                                                        </li>
                                                        <li>
                                                            <span>Sun</span>
                                                            <span class="slot-date">17 Nov <small class="slot-year">2019</small></span>
                                                        </li>
                                                        <li class="right-arrow">
                                                            <a href="#">
                                                                <i class="fa fa-chevron-right"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
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
                                                            <a class="timing" href="#">
                                                                <span>9:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>10:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>11:00</span> <span>AM</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="timing" href="#">
                                                                <span>9:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>10:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>11:00</span> <span>AM</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="timing" href="#">
                                                                <span>9:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>10:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>11:00</span> <span>AM</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="timing" href="#">
                                                                <span>9:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>10:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>11:00</span> <span>AM</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="timing" href="#">
                                                                <span>9:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing selected" href="#">
                                                                <span>10:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>11:00</span> <span>AM</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="timing" href="#">
                                                                <span>9:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>10:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>11:00</span> <span>AM</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="timing" href="#">
                                                                <span>9:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>10:00</span> <span>AM</span>
                                                            </a>
                                                            <a class="timing" href="#">
                                                                <span>11:00</span> <span>AM</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <!-- /Time Slot -->

                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Schedule Content -->

                                </div>
                                <!-- /Schedule Widget -->

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

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

    <!-- doccure/booking.html  30 Nov 2019 04:12:16 GMT -->
</html>
