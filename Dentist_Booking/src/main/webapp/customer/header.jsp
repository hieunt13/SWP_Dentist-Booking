<%-- 
    Document   : header
    Created on : May 21, 2022, 2:53:28 PM
    Author     : hieunguyen
--%>

<%@page import="com.fptproject.SWP391.model.ClinicInformation"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
        ClinicInformation clinicInformation = (ClinicInformation)request.getServletContext().getAttribute("CLINIC_INFO");  
        if(clinicInformation==null){
            clinicInformation = new ClinicInformation();
        }
%>

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
            <a href="<%=request.getContextPath()%>/customer/index.jsp" class="navbar-brand logo">
                <img src="<%=request.getContextPath()%>/customer/assets/img/logo.png" class="img-fluid" alt="Logo">
            </a>
        </div>
        <div class="main-menu-wrapper">
            <div class="menu-header">
                <a href="<%=request.getContextPath()%>/customer/index.jsp" class="menu-logo">
                    <img src="<%=request.getContextPath()%>/customer/assets/img/logo.png" class="img-fluid" alt="Logo">
                </a>
                <a id="menu_close" class="menu-close" href="javascript:void(0);">
                    <i class="fas fa-times"></i>
                </a>
            </div>
            <ul class="main-nav">
                <li>
                    <a href="<%=request.getContextPath()%>/AdminLoadClinicInformationController">Home</a>
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
                    <p class="contact-info-header"><%= clinicInformation.getPhone() %></p>
                </div>
            <li class="nav-item">
                <c:if test="${sessionScope.Login_Customer == null}">
                    <a class="nav-link header-login" href="<%=request.getContextPath()%>/login.jsp">login / Signup </a>
                </c:if>                
            </li>
            </li>

            <!-- User Menu -->


            <c:if test="${sessionScope.Login_Customer != null}">
                <li class="nav-item dropdown has-arrow logged-item">
                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                        <span class="user-img">
                            <img class="rounded-circle" src="<%=request.getContextPath()%>/customer/${sessionScope.Login_Customer.image}" width="31" alt="Avatar">
                        </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="user-header">
                            <div class="avatar avatar-sm">
                                <img src="<%=request.getContextPath()%>/customer/${sessionScope.Login_Customer.image}" alt="User Image" class="avatar-img rounded-circle">
                            </div>
                            <div class="user-text">
                                <h6>${sessionScope.Login_Customer.personalName}</h6>
                                <p class="text-muted mb-0">${sessionScope.Login_Customer.role}</p>
                            </div>
                        </div>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/ViewAppointmentController">Dashboard</a>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/ViewInvoiceController">Invoices</a>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/customer/profile-settings.jsp">Profile Settings</a>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/customer/schedule.jsp">Schedule</a>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/customer/checkout.jsp">Checkout</a>                    
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/customer/chat.jsp">Chat</a>
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/customer/change-password.jsp">Change Password</a>
                        <a class="dropdown-item" class="dropdown-item" href="<%=request.getContextPath()%>/LogoutController">Logout</a>
                    </div>
                </li>
            </c:if> 


            <!-- /User Menu -->

        </ul>
    </nav>
</header>
