<%-- 
    Document   : header
    Created on : May 21, 2022, 2:53:28 PM
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
            <a href="../customer/index.jsp" class="navbar-brand logo">
                <img src="../assets/img/logo.png" class="img-fluid" alt="Logo">
            </a>
        </div>
        <div class="main-menu-wrapper">
            <div class="menu-header">
                <a href="../customer/index.jsp" class="menu-logo">
                    <img src="../assets/img/logo.png" class="img-fluid" alt="Logo">
                </a>
                <a id="menu_close" class="menu-close" href="javascript:void(0);">
                    <i class="fas fa-times"></i>
                </a>
            </div>
            <ul class="main-nav">
                <li>
                    <a href="../customer/index.jsp">Home</a>
                </li>
                <li><a href="<%=request.getContextPath()%>/dentist/list">Dentist</a></li>
                <li><a href="<%=request.getContextPath()%>/service/list">Service</a></li>
                <li><a href="../customer/promotion.jsp">Promotion</a></li>	
                <li class="has-submenu">
                    <a href="#">Pages <i class="fas fa-chevron-down"></i></a>
                    <ul class="submenu">
                        <li><a href="../login.jsp">Login</a></li>
                        <li><a href="../customer/register.jsp">Register</a></li>
                    </ul>
                </li>
                <li class="login-link">
                    <a href="login.html">Login / Signup</a>
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
                        <img class="rounded-circle" src="../assets/img/patients/patient.jpg" width="31" alt="Ryan Taylor">
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <div class="user-header">
                        <div class="avatar avatar-sm">
                            <img src="../assets/img/patients/patient.jpg" alt="User Image" class="avatar-img rounded-circle">
                        </div>
                        <div class="user-text">
                            <h6>Richard Wilson</h6>
                            <p class="text-muted mb-0">Customer</p>
                        </div>
                    </div>
                    <a class="dropdown-item" href="../customer/customer-dashboard.jsp">Dashboard</a>
                    <a class="dropdown-item" href="../customer/invoices.jsp">Invoices</a>
                    <a class="dropdown-item" href="../customer/profile-settings.jsp">Profile Settings</a>
                    <a class="dropdown-item" href="../customer/schedule.jsp">Schedule</a>
                    <a class="dropdown-item" href="../customer/checkout.jsp">Checkout</a>                    
                    <a class="dropdown-item" href="../customer/chat.jsp">Chat</a>
                    <a class="dropdown-item" href="../customer/change-password.jsp">Change Password</a>
                    <a class="dropdown-item" class="dropdown-item" href="login.html">Logout</a>
                </div>
            </li>
            <!-- /User Menu -->

        </ul>
    </nav>
</header>
