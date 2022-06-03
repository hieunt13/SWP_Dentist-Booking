<%-- 
    Document   : dentist-change-password
    Created on : May 21, 2022, 12:38:37 PM
    Author     : hieunguyen
--%>
<%                  
    Dentist dentist = (Dentist)session.getAttribute("Login_Dentist"); 
    if (dentist == null || dentist.equals("")){
        response.sendRedirect("../login.jsp");
        return;
    }
    String successMessage = (String) request.getAttribute("SUCCESS");
    if(successMessage == null){
        successMessage = "";
    }
    DentistError error = (DentistError) request.getAttribute("DENTIST_ERROR");
    if(error == null){
        error = new DentistError();
    }

 %>
<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%@page import="com.fptproject.SWP391.error.DentistError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/doctor-change-password.html  30 Nov 2019 04:12:36 GMT -->
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
                <script src="assets/js/html5shiv.min.js"></script>
                <script src="assets/js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!--Header-->
            <jsp:include flush="true" page="header.jsp"></jsp:include>
                <!--/Header-->

                <!-- Breadcrumb -->
                <div class="breadcrumb-bar">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-12 col-12">
                                <nav aria-label="breadcrumb" class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active" aria-current="page">Change Password</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Change Password</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->

                <!-- Page Content -->
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

                                <!-- Profile Side Bar -->
                            <jsp:include flush="true" page="profile-sidebar.jsp"></jsp:include>
                                <!-- /Profile Side Bar -->
                                

                            </div>
                            <div class="col-md-7 col-lg-8 col-xl-9">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-6">

                                                <!-- Change Password Form -->
                                                <form action="../dentist/DentistChangePassword" method="post">
                                                    <div class="form-group">
                                                        <label>Old Password</label>
                                                        <input type="password" class="form-control" name="oldPassword" placeholder="Enter your old password" value="${oldPassword}"> 
                                                    <div style="color: red;"><%= error.getOldPasswordError()%></div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>New Password</label>
                                                        <input type="password" class="form-control" name="newPassword" placeholder="Enter your new password" value="${newPassword}"> 
                                                        <div style="color: red;"><%= error.getNewPasswordError()%></div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Confirm Password</label>
                                                        <input type="password" class="form-control" name="confirmPassword" placeholder="Enter your confirm password" value="${confirmPassword}"> 
                                                        <div style="color: red;"><%= error.getConfirmPasswordError()%></div>
                                                    </div>
                                                    <div class="submit-section">
                                                        <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>                                                      
                                                        <div style="color: red;"><%= successMessage %></div>
                                                    </div>
                                                    
                                                </form>
                                                <!-- /Change Password Form -->

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>		
                <!-- /Page Content -->

                <!-- footer -->
            <jsp:include flush="true" page="footer.jsp"></jsp:include>
            <!-- /footer -->

        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/doctor-change-password.html  30 Nov 2019 04:12:36 GMT -->
</html>
