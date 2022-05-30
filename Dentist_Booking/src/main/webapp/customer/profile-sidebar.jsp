<%-- 
    Document   : profile-sidebar
    Created on : May 21, 2022, 3:57:49 PM
    Author     : hieunguyen
--%>

<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
    <div class="profile-sidebar">
        <div class="widget-profile pro-widget-content">
            <div class="profile-info-widget">
                <a href="#" class="booking-doc-img">
                    <img src="../assets/img/patients/patient.jpg" alt="User Image">
                </a>
                <div class="profile-det-info">
                    <h3><% Customer customer = (Customer)session.getAttribute("Login_Customer");%>  <%=customer.getPersonalName() %></h3>
                    <div class="patient-details">
                        <h5>Patient</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="dashboard-widget">
            <nav class="dashboard-menu">
                <ul>
                    <li>
                        <a href="../customer/customer-dashboard.jsp">
                            <i class="fas fa-columns"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="../customer/chat.jsp">
                            <i class="fas fa-comments"></i>
                            <span>Message</span>
                            <small class="unread-msg">23</small>
                        </a>
                    </li>
                    <li>
                        <a href="../customer/profile-settings.jsp">
                            <i class="fas fa-user-cog"></i>
                            <span>Profile Settings</span>
                        </a>
                    </li>
                    <li>
                        <a href="../customer/change-password.jsp">
                            <i class="fas fa-lock"></i>
                            <span>Change Password</span>
                        </a>
                    </li>
                    <li>
                        <a href="../customer/invoices.jsp">
                            <i class="fas fa-lock"></i>
                            <span>Invoice</span>
                        </a>
                    </li>
                    <li>
                        <a href="../customer/index.jsp">
                            <i class="fas fa-sign-out-alt"></i>
                            <span>Logout</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

    </div>
</div>
