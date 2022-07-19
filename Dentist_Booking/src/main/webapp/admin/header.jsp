<%-- 
    Document   : header
    Created on : May 26, 2022, 12:08:21 PM
    Author     : admin
--%>

<%@page import="com.fptproject.SWP391.model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header">
		<%
                    Employee admin = (Employee)session.getAttribute("Login_Employee");
                    if(admin==null || !admin.getRole().equals("ADMIN")){
                        response.sendRedirect("/dentalclinic/login.jsp");
                        return;
                    }
                %>	
				<!-- Logo -->
                <div class="header-left">
                    <a class="logo">
						<img src="assets/img/logo.png" alt="Logo">
					</a>
					<a class="logo logo-small">
						<img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
					</a>
                </div>
				<!-- /Logo -->
				
                            <!--
				<a href="javascript:void(0);" id="toggle_btn">
					<i class="fe fe-text-align-left"></i>
				</a>
                            -->
				
				
				<!-- Mobile Menu Toggle -->
				<a class="mobile_btn" id="mobile_btn">
					<i class="fa fa-bars"></i>
				</a>
				<!-- /Mobile Menu Toggle -->
				
				<!-- Header Right Menu -->
				<ul class="nav user-menu">

					<!-- Notifications -->
					
					<!-- /Notifications -->
					
					<!-- User Menu -->
					<li class="nav-item dropdown has-arrow">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<span class="user-img"><img class="rounded-circle" src="<%= admin.getImage() %>" width="31" alt="Ryan Taylor"></span>
						</a>
						<div class="dropdown-menu">
							<div class="user-header">
								<div class="avatar avatar-sm">
									<img src="<%= admin.getImage() %>" alt="User Image" class="avatar-img rounded-circle">
								</div>
								<div class="user-text">
									<h6><%= admin.getPersonalName() %></h6>
									<p class="text-muted mb-0">Administrator</p>
								</div>
							</div>
							<a class="dropdown-item" href="profile.jsp">My Profile</a>
							<a class="dropdown-item" href="<%= request.getContextPath()%>/LogoutController">Logout</a>
						</div>
					</li>
					<!-- /User Menu -->
					
				</ul>
				<!-- /Header Right Menu -->
				
            </div>
