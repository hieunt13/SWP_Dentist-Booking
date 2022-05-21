<%-- 
    Document   : header
    Created on : May 21, 2022, 2:15:48 PM
    Author     : hieunguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <a href="index-2.html" class="navbar-brand logo">
                <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
            </a>
        </div>
        <div class="main-menu-wrapper">
            <div class="menu-header">
                <a href="index-2.html" class="menu-logo">
                    <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
                </a>
                <a id="menu_close" class="menu-close" href="javascript:void(0);">
                    <i class="fas fa-times"></i>
                </a>
            </div>
            <ul class="main-nav">
		<li><a href="employee-dashboard.jsp">Dashboard</a></li>
                <li><a href="employee-appointment-confirm.jsp">Appointment</a></li>
                <li><a href="employee-add-invoice">Billing</a></li>
                <li><a href="#">Feedback</a></li>              
                <li class="login-link">
                    <a href="#">Logout</a>
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
                    <p class="contact-info-header"> +1 315 369 5943</p>
                </div>
            </li>

            <!-- User Menu -->
            <li class="nav-item dropdown has-arrow logged-item">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                    <span class="user-img">
                        <img class="rounded-circle" src="assets/img/patients/patient.jpg" width="31" alt="Hieu">
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <div class="user-header">
                        <div class="avatar avatar-sm">
                            <img src="assets/img/patients/patient.jpg" alt="User Image" class="avatar-img rounded-circle">
                        </div>
                        <div class="user-text">
                            <h6>Richard Wilson</h6>
                            <p class="text-muted mb-0">Employee</p>
                        </div>
                    </div>
                    <a class="dropdown-item" href="employee-dashboard.jsp">Dashboard</a>
                    <a class="dropdown-item" href="#">Logout</a>
                </div>
            </li>
            <!-- /User Menu -->

        </ul>
    </nav>
</header>
