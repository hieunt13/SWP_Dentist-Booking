<%-- 
    Document   : footer
    Created on : May 21, 2022, 2:16:24 PM
    Author     : hieunguyen
--%>

<%@page import="com.fptproject.SWP391.model.ClinicInformation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="footer">
<% 
    ClinicInformation clinicInformation = (ClinicInformation)request.getServletContext().getAttribute("CLINIC_INFO");  
    if(clinicInformation==null){
        clinicInformation = new ClinicInformation();
    }

%>
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
                        <h2 class="footer-title">For Employee</h2>
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/ShowAppointmentDashboardController">Dashboard</a></li>
                            <li><a href="<%= request.getContextPath() %>/appointmentEmployee">Appointment</a></li>
                            <li><a href="<%= request.getContextPath() %>/ListFeedbackController">Feedback</a></li>              
                            <li class="login-link">
                                <a href="<%= request.getContextPath()%>/LogoutController">Logout</a>
                            </li>
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
                                <p> <%= clinicInformation.getAddress() %> </p>
                            </div>
                            <p>
                                <i class="fas fa-phone-alt"></i>
                                <%= clinicInformation.getPhone() %>
                            </p>
                            <p class="mb-0">
                                <i class="fas fa-envelope"></i>
                                <%= clinicInformation.getEmail() %>
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
