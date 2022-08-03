<%-- 
    Document   : login
    Created on : May 21, 2022, 12:28:31 PM
    Author     : hieunguyen
--%>

<%@page import="com.fptproject.SWP391.model.ClinicInformation"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/login.html  30 Nov 2019 04:12:20 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link href="customer/assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="customer/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="customer/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="customer/assets/plugins/fontawesome/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="customer/assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        -->                <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script><!--
<![endif]-->

    </head>
    <body class="account-page">
        <%
            ClinicInformation clinicInformation = (ClinicInformation) request.getServletContext().getAttribute("CLINIC_INFO");
            if (clinicInformation == null) {
                clinicInformation = new ClinicInformation();
            }

        %>
        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <header class="header">
                <nav class="navbar navbar-expand-lg header-nav">
                    <div class="navbar-header">
                        <a id="mobile_btn" href="javascript:void(0);">
                            <span class="bar-icon">
                                <span></span>
                                <span></span>
                                <span></span>
                            </span>
                        </a>
                        <a href="customer/index.jsp" class="navbar-brand logo">
                            <img src="customer/assets/img/logo.png" class="img-fluid" alt="Logo">
                        </a>
                    </div>
                    <div class="main-menu-wrapper">
                        <div class="menu-header">
                            <a href="customer/index.jsp" class="menu-logo">
                                <img src="customer/assets/img/logo.png" class="img-fluid" alt="Logo">
                            </a>
                            <a id="menu_close" class="menu-close" href="javascript:void(0);">
                                <i class="fas fa-times"></i>
                            </a>
                        </div>
                        <ul class="main-nav">
                            <li>
                                <a href="<%=request.getContextPath()%>/home/mainpage">Home</a>
                            </li>
                            <li><a href="<%=request.getContextPath()%>/dentists/list">Dentist</a></li>
                            <li><a href="<%=request.getContextPath()%>/service/list">Service</a></li>
                            <li><a href="<%=request.getContextPath()%>/promotion/list">Promotion</a></li>	


                        </ul>
                    </div>		 
                    <ul class="nav header-navbar-rht">
                        <li class="nav-item contact-item">
                            <div class="header-contact-img">
                                <i class="far fa-hospital"></i>							
                            </div>
                            <div class="header-contact-detail">
                                <p class="contact-header">Contact</p>
                                <p class="contact-info-header"><%= clinicInformation.getPhone()%></p>
                            </div>
                        </li>

                        <!-- User Menu -->



                    </ul>
                </nav>
            </header>
            <!-- /Header -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-8 offset-md-2">

                            <!-- Login Tab Content -->
                            <div class="account-content">
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-md-7 col-lg-6 login-left">
                                        <img src="customer/assets/img/login-banner.png" class="img-fluid" alt="Doccure Login">	
                                    </div>
                                    <div class="col-md-12 col-lg-6 login-right">
                                        <div class="login-header">
                                            <h3>Login <span>Doccure</span></h3>

                                        </div>
                                        <c:if test="${not empty requestScope.ERROR}">
                                            <p class="text-danger">${requestScope.ERROR}</p>
                                        </c:if>
                                        <c:if test="${not empty requestScope.SUCCESS}">
                                            <p class="text-success">${requestScope.SUCCESS}</p>
                                        </c:if>
                                        <c:if test="${not empty requestScope.LOGIN_REQUIREMENT}">
                                            <p class="text-danger">${requestScope.SUCCESS}</p>
                                        </c:if>
                                        <form method="post" action="LoginController"">
                                            <div class="form-group form-focus">
                                                <input type="text" name="username" class="form-control floating">
                                                <label class="focus-label">Username</label>
                                            </div>
                                            <div class="form-group form-focus">
                                                <input type="password" name="password" class="form-control floating">
                                                <label class="focus-label">Password</label>
                                            </div>
                                            <button class="btn btn-primary btn-block btn-lg login-btn" type="submit">Login</button>
                                            <div class="login-or">
                                                <span class="or-line"></span>
                                                <span class="span-or">or</span>
                                            </div>
                                            <div class="row form-row social-login">
                                                <div class="col-12">
                                                    <a 
                                                        href="https://accounts.google.com/o/oauth2/auth?scope=email+profile&redirect_uri=http://localhost:8080/dentalclinic/GoogleLoginController&response_type=code&client_id=952544515189-6enodfbupmerbjii310kfldbskq323kh.apps.googleusercontent.com&approval_prompt=force" 
                                                        class="btn btn-google btn-block"><i class="fab fa-google mr-1"></i> Login</a>
                                                </div>


                                            </div>
                                            <div class="text-center dont-have">Don’t have an account? <a href="customer/register.jsp">Register</a></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /Login Tab Content -->

                        </div>
                    </div>

                </div>

            </div>		
            <!-- /Page Content -->

            <footer class="footer">

                <!-- Footer Top -->
                <div class="footer-top">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-3 col-md-6">

                                <!-- Footer Widget -->
                                <div class="footer-widget footer-about">
                                    <div class="footer-logo">
                                        <img src="<%=request.getContextPath()%>/customer/assets/img/footer-logo.png" alt="logo">
                                    </div>
                                    <div class="footer-about-content">
                                        <p>Our Dental Clinic is proud to be one of the "Prestige - Quality" ones in Ho Chi Minh City today.</p>
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
                                    <h2 class="footer-title">For Customer</h2>
                                    <ul>
                                        <li>
                                            <a href="<%=request.getContextPath()%>/home/mainpage"><i class="fas fa-angle-double-right"></i> Home</a>
                                        </li>
                                        <li><a href="<%=request.getContextPath()%>/dentists/list"><i class="fas fa-angle-double-right"></i> Dentist</a></li>
                                        <li><a href="<%=request.getContextPath()%>/service/list"><i class="fas fa-angle-double-right"></i> Service</a></li>
                                        <li><a href="<%=request.getContextPath()%>/promotion/list"><i class="fas fa-angle-double-right"></i> Promotion</a></li>	



                                    </ul>
                                </div>
                                <!-- /Footer Widget -->

                            </div>

                            <div class="col-lg-3 col-md-6">

                                <!-- Footer Widget -->
                                <div class="footer-widget footer-menu">
                                    <h2 class="footer-title">More feature</h2>
                                    <ul>
                                        <c:choose>
                                            <c:when test="${sessionScope.Login_Customer == null}">
                                                <li><a href="<%=request.getContextPath()%>/login.jsp"><i class="fas fa-angle-double-right"></i> Login</a></li>
                                                <li><a href="<%=request.getContextPath()%>/customer/register.jsp"><i class="fas fa-angle-double-right"></i> Register</a></li>
                                                </c:when>      
                                                <c:otherwise>
                                                <li><a href="<%=request.getContextPath()%>/LogoutController"><i class="fas fa-angle-double-right"></i> Logout</a></li>
                                                </c:otherwise>
                                            </c:choose>
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
                                            <p><%= clinicInformation.getAddress()%></p>
                                        </div>
                                        <p>
                                            <i class="fas fa-phone-alt"></i>
                                            <%= clinicInformation.getPhone()%>
                                        </p>
                                        <p class="mb-0">
                                            <i class="fas fa-envelope"></i>
                                            <%= clinicInformation.getEmail()%>
                                        </p>
                                    </div>
                                </div>
                                <!-- /Footer Widget -->

                            </div>

                        </div>
                    </div>
                </div>
                <!-- /Footer Top -->
            </footer>


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
    <script src="customer/assets/js/jquery.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="customer/assets/js/popper.min.js"></script>
    <script src="customer/assets/js/bootstrap.min.js"></script>

    <!-- Custom JS -->
    <script src="customer/assets/js/script.js"></script>

</body>

<!-- doccure/login.html  30 Nov 2019 04:12:20 GMT -->
</html>
