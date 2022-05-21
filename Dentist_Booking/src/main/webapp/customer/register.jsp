<%-- 
    Document   : register
    Created on : May 21, 2022, 12:20:50 PM
    Author     : hieunguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/register.html  30 Nov 2019 04:12:20 GMT -->
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
    <body class="account-page">

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <jsp:include flush="true" page="header.jsp"></jsp:include>
            <!-- /Header -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-8 offset-md-2">

                            <!-- Register Content -->
                            <div class="account-content">
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-md-7 col-lg-6 login-left">
                                        <img src="assets/img/login-banner.png" class="img-fluid" alt="Doccure Register">	
                                    </div>
                                    <div class="col-md-12 col-lg-6 login-right">
                                        <div class="login-header">
                                            <h3>Patient Register <a href="doctor-register.html">Are you a Doctor?</a></h3>
                                        </div>

                                        <!-- Register Form -->
                                        <form action="https://dreamguys.co.in/demo/doccure/doctor-dashboard.html">
                                            <div class="form-group form-focus">
                                                <input type="text" class="form-control floating">
                                                <label class="focus-label">Name</label>
                                            </div>
                                            <div class="form-group form-focus">
                                                <input type="text" class="form-control floating">
                                                <label class="focus-label">Mobile Number</label>
                                            </div>
                                            <div class="form-group form-focus">
                                                <input type="password" class="form-control floating">
                                                <label class="focus-label">Create Password</label>
                                            </div>
                                            <div class="text-right">
                                                <a class="forgot-link" href="login.html">Already have an account?</a>
                                            </div>
                                            <button class="btn btn-primary btn-block btn-lg login-btn" type="submit">Signup</button>
                                            <div class="login-or">
                                                <span class="or-line"></span>
                                                <span class="span-or">or</span>
                                            </div>
                                            <div class="row form-row social-login">
                                                <div class="col-6">
                                                    <a href="#" class="btn btn-facebook btn-block"><i class="fab fa-facebook-f mr-1"></i> Login</a>
                                                </div>
                                                <div class="col-6">
                                                    <a href="#" class="btn btn-google btn-block"><i class="fab fa-google mr-1"></i> Login</a>
                                                </div>
                                            </div>
                                        </form>
                                        <!-- /Register Form -->

                                    </div>
                                </div>
                            </div>
                            <!-- /Register Content -->

                        </div>
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

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/register.html  30 Nov 2019 04:12:20 GMT -->
</html>