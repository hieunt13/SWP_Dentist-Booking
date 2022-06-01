<%-- 
    Document   : header
    Created on : May 21, 2022, 1:16:07 PM
    Author     : hieunguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <a href="index-2.html" class="navbar-brand logo">
                <img src="../dentist/assets/img/logo.png" class="img-fluid" alt="Logo">
            </a>
        </div>
        <div class="main-menu-wrapper">
            <div class="menu-header">
                <a href="index-2.html" class="menu-logo">
                    <img src="../dentist/assets/img/logo.png" class="img-fluid" alt="Logo">
                </a>
                <a id="menu_close" class="menu-close" href="javascript:void(0);">
                    <i class="fas fa-times"></i>
                </a>
            </div>            
            <ul class="main-nav">
                <li><a href="dentist-dashboard.jsp">Dashboard</a></li>
                <li><a href="dentist-appointment.jsp">Appointments</a></li>
                <li><a href="<%=request.getContextPath()%>/schedule/show?dentistId=${sessionScope.Login_Dentist.id}">Schedule Timing</a></li>
                <li><a href="dentist-patients.jsp">Patients</a></li>
                <li><a href="dentist-chat.jsp">Chat</a></li>
                <li><a href="dentist-invoices.jsp">Invoices</a></li>
                <li><a href="dentist-profile-settings.jsp">Profile Settings</a></li>
                <li><a href="dentist-feedback.jsp">Reviews</a></li>		
                <li class="login-link">
                    <a href="../LogoutController">Logout</a>
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
                        <img class="rounded-circle" src="${sessionScope.Login_Dentist.image}" width="31" alt="Darren Elder">
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <div class="user-header">
                        <div class="avatar avatar-sm">
                            <img src="../dentist/assets/img/doctors/doctor-thumb-02.jpg" alt="User Image" class="avatar-img rounded-circle">
                        </div>
                        <div class="user-text">
                            <h6>${sessionScope.Login_Dentist.personalName}</h6>
                            <p class="text-muted mb-0">${sessionScope.Login_Dentist.username}</p>
                        </div>
                    </div>
                    <a class="dropdown-item" href="dentist-dashboard.jsp">Dashboard</a>
                    <a class="dropdown-item" href="dentist-profile-settings.jsp">Profile Settings</a>
                    <a class="dropdown-item" href="../LogoutController">Logout</a>
                </div>
            </li>
            <!-- /User Menu -->

        </ul>
    </nav>
</header>
<!-- /Header -->
