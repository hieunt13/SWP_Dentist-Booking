<%-- 
    Document   : header
    Created on : May 21, 2022, 1:16:07 PM
    Author     : hieunguyen
--%>

<%@page import="com.fptproject.SWP391.model.Employee"%>
<%@page import="com.fptproject.SWP391.model.ClinicInformation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Header -->
<% 
    ClinicInformation clinicInformation = (ClinicInformation)request.getServletContext().getAttribute("CLINIC_INFO");  
    if(clinicInformation==null){
        clinicInformation = new ClinicInformation();
    }

%>
<%
        Employee employee = (Employee) session.getAttribute("Login_Employee");
        if (employee == null || !employee.getRole().equals("STAFF")){
            response.sendRedirect("/dentalclinic/login.jsp");
            return;
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

            <a href="#" class="navbar-brand logo">
                <img src="<%=request.getContextPath()%>/employee/assets/img/logo.png" class="img-fluid" alt="Logo">
            </a>
        </div>
        <div class="main-menu-wrapper">
            <div class="menu-header">
                <a href="#" class="menu-logo">
                    <img src="<%=request.getContextPath()%>/employee/assets/img/logo.png" class="img-fluid" alt="Logo">
                </a>
                <a id="menu_close" class="menu-close" href="javascript:void(0);">
                    <i class="fas fa-times"></i>
                </a>
            </div>            
            <ul class="main-nav">
                <li><a href="<%=request.getContextPath()%>/ShowAppointmentDashboardController">Dashboard</a></li>
                <li><a href="<%=request.getContextPath()%>/appointmentEmployee">Appointments</a></li>
                <li><a href="<%=request.getContextPath()%>/ListFeedbackController">Feedback</a></li>
                <li class="login-link">
                    <a href="<%=request.getContextPath()%>/LogoutController">Logout</a>
                </li>
            </ul>
        </div>		 
        <ul class="nav header-navbar-rht">
            <li class="nav-item contact-item">
                <div class="header-contact-img">
                    <i class="far fa-hospital"></i>							
                </div>
                <div class="header-contact-detail">
                    <p class="contact-header">Contact</p>
                    <p class="contact-info-header"> <%= clinicInformation.getPhone() %></p>
                </div>
            </li>

            <!-- User Menu -->
            <li class="nav-item dropdown has-arrow logged-item">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                    <span class="user-img"><img class="rounded-circle" src="<%= request.getContextPath() %>/employee/${sessionScope.Login_Employee.image}" width="31" alt="Ryan Taylor"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <div class="user-header">
                        <div class="avatar avatar-sm">
                                <img src="<%= request.getContextPath() %>/employee/${sessionScope.Login_Employee.image}" alt="User Image" class="avatar-img rounded-circle">
                        </div>
                        <div class="user-text">
                                <h6>${sessionScope.Login_Employee.personalName}</h6>
                                <p class="text-muted mb-0">Employee</p>
                        </div>
                    </div>

                    <a class="dropdown-item" href="<%=request.getContextPath()%>/ShowAppointmentDashboardController">Dashboard</a>
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/appointmentEmployee">Appointment</a>
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/ListFeedbackController">Feedback</a>
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/LogoutController">Logout</a>
                </div>
            </li>
            <!-- /User Menu -->

        </ul>
    </nav>
</header>
<!-- /Header -->
