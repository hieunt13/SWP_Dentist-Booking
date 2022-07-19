<%-- 
    Document   : slidebar
    Created on : May 22, 2022, 9:29:43 PM
    Author     : admin
--%>

<%@page import="com.fptproject.SWP391.model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%
        Employee admin = (Employee) session.getAttribute("Login_Employee");
        if (admin == null || !admin.getRole().equals("ADMIN")){
            response.sendRedirect("/dentalclinic/login.jsp");
            return;
        }
    %>
<div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
					<div id="sidebar-menu" class="sidebar-menu">
						<ul>
							<li class="menu-title"> 
								<span>Main</span>
							</li>
							<li> 
								<a href="../admin/AdminStatistic"><i class="fe fe-home"></i> <span>Dashboard</span></a>
							</li>
							<li> 
								<a href="../admin/AdminSearchAppointmentController?fromDate=&toDate="><i class="fe fe-layout"></i> <span>Appointments</span></a>
							</li>
							<li> 
								<a href="../admin/AdminSearchDentistController?search="><i class="fe fe-user-plus"></i> <span>Dentist</span></a>
							</li>
                                                        <li> 
								<a href="../admin/AdminSearchServiceController?search="><i class="fe fe-file"></i> <span>Service</span></a>
							</li>
                                                        <li> 
								<a href="../admin/AdminSearchPromotionController?search="><i class="fe fe-gift"></i> <span>Promotion</span></a>
							</li>
							<li> 
								<a href="../admin/AdminSearchCustomerController?search="><i class="fe fe-user"></i> <span>Patients</span></a>
							</li>
							<li> 
								<a href="../admin/AdminSearchFeedbackController?fromRate=&toRate="><i class="fe fe-star-o"></i> <span>Reviews</span></a>
							</li>
							<li class="menu-title"> 
								<span>Pages</span>
							</li>
							<li> 
								<a href="profile.jsp"><i class="fe fe-user-plus"></i> <span>Profile</span></a>
							</li>
							<li> 
								<a href="blank-page.jsp"><i class="fe fe-file"></i> <span>Blank Page</span></a>
							</li>
							
					</div>
                </div>
            </div>
