<%-- 
    Document   : footer
    Created on : May 21, 2022, 2:53:36 PM
    Author     : hieunguyen
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.fptproject.SWP391.model.ClinicInformation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ClinicInformation clinicInformation = (ClinicInformation) request.getServletContext().getAttribute("CLINIC_INFO");
    if (clinicInformation == null) {
        clinicInformation = new ClinicInformation();
    }
%>
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
