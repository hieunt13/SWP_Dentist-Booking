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
                <img src="<%=request.getContextPath()%>/employee/assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
            </a>
            <div class="profile-det-info">
                <h3>${sessionScope.Login_Employee.personalName}</h3>

                <div class="patient-details">
                    <h5 class="mb-0">Employee</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="dashboard-widget">
        <nav class="dashboard-menu">
            <ul>
                <li>
                    <a href="<%=request.getContextPath()%>/ShowAppointmentDashboardController">
                        <i class="fas fa-columns"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/appointmentEmployee">
                        <i class="fas fa-calendar-check"></i>
                        <span>Appointments</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/ListFeedbackController">
                        <i class="fas fa-star"></i>
                        <span>Feedback</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /Profile Sidebar -->
