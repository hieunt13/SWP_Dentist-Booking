<%-- 
    Document   : dentist-profile-sidebar
    Created on : May 21, 2022, 1:43:47 PM
    Author     : hieunguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Profile Sidebar -->
<div class="profile-sidebar">
    <div class="widget-profile pro-widget-content">
        <div class="profile-info-widget">
            <a href="#" class="booking-doc-img">
                <img src="<%=request.getContextPath()%>/dentist/${sessionScope.Login_Dentist.image}" alt="User Image">
            </a>
            <div class="profile-det-info">
                <h3>${sessionScope.Login_Dentist.personalName}</h3>

                <div class="patient-details">
                    <h5 class="mb-0">User Name: ${sessionScope.Login_Dentist.username}</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="dashboard-widget">
        <nav class="dashboard-menu">
            <ul>
                <li>
                    <a href="<%=request.getContextPath()%>/dentist/dentist-dashboard.jsp">
                        <i class="fas fa-columns"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/dentist/AppointmentController">
                        <i class="fas fa-calendar-check"></i>
                        <span>Appointments</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/dentist/dentist-patients.jsp">
                        <i class="fas fa-user-injured"></i>
                        <span>My Patients</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/schedule/show?dentistId=${sessionScope.Login_Dentist.id}">
                        <i class="fas fa-hourglass-start"></i>
                        <span>Schedule Timings</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/feedbackDentist/view?dentistId=${sessionScope.Login_Dentist.id}">
                        <i class="fas fa-star"></i>
                        <span>Reviews</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/dentist/dentist-chat.jsp">
                        <i class="fas fa-comments"></i>
                        <span>Message</span>
                        <small class="unread-msg">23</small>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/dentist/dentist-profile-settings.jsp">
                        <i class="fas fa-user-cog"></i>
                        <span>Profile Settings</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/dentist/dentist-change-password.jsp">
                        <i class="fas fa-lock"></i>
                        <span>Change Password</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/LogoutController">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /Profile Sidebar -->
