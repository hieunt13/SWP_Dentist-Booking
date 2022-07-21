<%-- 
    Document   : register
    Created on : May 21, 2022, 12:20:50 PM
    Author     : hieunguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/register.html  30 Nov 2019 04:12:20 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
-->               <script src="<%=request.getContextPath()%>/customer/assets/js/html5shiv.min.js"></script>
          <script src="<%=request.getContextPath()%>/customer/assets/js/respond.min.js"></script><!--
        <![endif]-->

    </head>
    <body class="account-page">

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <jsp:include flush="true" page="header.jsp"></jsp:include>
                <!-- /Header -->

                <!-- Page Content -->
                <div class="content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="col-md-8 offset-md-2">

                                <!-- Register Content -->
                                <div class="account-content">
                                    <div class="row align-items-center justify-content-center">
                                        <div class="col-md-7 col-lg-6 login-left">
                                            <img src="<%=request.getContextPath()%>/customer/assets/img/login-banner.png" class="img-fluid" alt="Doccure Register">	
                                    </div>
                                    <div class="col-md-12 col-lg-6 login-right">
                                        <div class="login-header">
                                            <h3>Patient Register </h3>
                                        </div>


                                        <!-- Register Form -->
                                        <form action="<%=request.getContextPath()%>/RegisterController" method="Post">
                                            <div class="form-group form-focus">
                                                <input name="username" type="text" class="form-control floating" value="${requestScope.USERNAME_VALUE}">
                                                <label class="focus-label">Username</label>
                                            </div>
                                            <c:if test="${not empty requestScope.CUSTOMER_ERROR}">
                                                <p class="text-danger">${requestScope.CUSTOMER_ERROR.getUsernameError()}</p>
                                            </c:if>
                                            
                                            <div class="form-group form-focus">
                                                <input name="personalName" type="text" class="form-control floating" value="${requestScope.FULLNAME_VALUE}">
                                                <label class="focus-label">Full Name</label>
                                            </div>
                                            <c:if test="${not empty requestScope.CUSTOMER_ERROR}">
                                                <p class="text-danger">${requestScope.CUSTOMER_ERROR.getPersonalNameError()}</p>
                                            </c:if>
                                            
                                            <div class="form-group form-focus">
                                                <input name="emailAddress" type="text" class="form-control floating" value="${requestScope.EMAIL_ADDRESS}">
                                                <label class="focus-label">Email Address</label>
                                            </div>
                                            <c:if test="${not empty requestScope.CUSTOMER_ERROR}">
                                                <p class="text-danger">${requestScope.CUSTOMER_ERROR.getEmailError()}</p>
                                            </c:if>
                                            
                                            <div class="form-group form-focus">
                                                <input name="password" type="password" class="form-control floating" value="${requestScope.PASSWORD_VALUE}">
                                                <label class="focus-label">Create Password</label>
                                            </div>
                                            <div class="form-group form-focus">
                                                <input name="confirmPassword" type="password" class="form-control floating" value="${requestScope.CONFIRM_PASSWORD_VALUE}">
                                                <label class="focus-label">Confirm Password</label>
                                            </div>
                                            <c:if test="${not empty requestScope.CUSTOMER_ERROR}">
                                                <p class="text-danger">${requestScope.CUSTOMER_ERROR.getPasswordError()}</p>
                                            </c:if>
                                            <div class="text-right">
                                                <a class="forgot-link" href="<%=request.getContextPath()%>/login.jsp">Already have an account?</a>
                                            </div>
                                            <button class="btn btn-primary btn-block btn-lg login-btn" type="submit">Signup</button>
                                        </form>
                                        <!-- /Register Form -->

                                    </div>
                                </div>
                            </div>
                            <!-- /Register Content -->

                        </div>
                    </div>

                </div>

            </div>		
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include flush="true" page="footer.jsp"></jsp:include>
            <!-- /Footer -->

        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/register.html  30 Nov 2019 04:12:20 GMT -->
</html>