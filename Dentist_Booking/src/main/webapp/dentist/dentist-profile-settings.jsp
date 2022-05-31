<%-- 
    Document   : dentist-profile-settings
    Created on : May 21, 2022, 12:38:12 PM
    Author     : hieunguyen
--%>

<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/doctor-profile-settings.html  30 Nov 2019 04:12:14 GMT -->
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

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css">

        <link rel="stylesheet" href="assets/plugins/dropzone/dropzone.min.css">

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
                                        <li class="breadcrumb-item active" aria-current="page">Profile Settings</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Profile Settings</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->

                <!-- Page Content -->
                <form action="../dentist/UpdateProfile" method="post">
                <div class="content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

                            <!-- Profile Side Bar -->
                            <jsp:include flush="true" page="profile-sidebar.jsp"></jsp:include>
                            <!-- /Profile Side Bar -->

                        </div>
                        <div class="col-md-7 col-lg-8 col-xl-9">
                        <% Dentist dentist = (Dentist)session.getAttribute("Login_Dentist"); 
                            String successMessage = (String) request.getAttribute("SUCCESS");
                            if(successMessage == null){
                                successMessage = "";
                            }
                        %>    
                            <!-- Basic Information -->
                       
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Basic Information</h4>
                                    <div class="row form-row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="change-avatar">
                                                    <div class="profile-img">
                                                        <img src="<%= dentist.getImage() %>" alt="User Image" name="image">
                                                    </div>
                                                    <div class="upload-img">
                                                        <div class="change-photo-btn">
                                                            <span><i class="fa fa-upload"></i> Upload Photo</span>
                                                            <input type="file" class="upload" name="image" accept="image/*">
                                                        </div>
                                                        <small class="form-text text-muted">Allowed JPG, GIF or PNG. Max size of 2MB</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Personal Name <span class="text-danger"></span></label>
                                                <input type="text" class="form-control" name="personalName" value="<%= dentist.getPersonalName() %>" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Gender</label>
                                                <% String gender1, gender2; if(dentist.getGender()==0) {gender1="Male"; gender2="Female";}else {gender1="Female"; gender2="Male";}%>
                                                <select class="form-control select" name="gender">
                                                    <option><%= gender1 %></option>
                                                    <option><%= gender2 %></option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Speciality</label>
                                                <input type="text" class="form-control" name="speciality" value="<%= dentist.getSpeciality() %>">
                                            </div>
                                        </div> 
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Education</label>
                                                <input type="text" class="form-control" name="education" value="<%= dentist.getEducation()%>">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Working Experience (Year)</label>
                                                <input type="number" class="form-control" name="workingExperience" value="<%= dentist.getWorkingExperience() %>">
                                            </div>
                                        </div>   
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Award</label>
                                                <input type="text" class="form-control" name="award" value="<%= dentist.getAward() %>">
                                            </div>
                                        </div>       
                                    </div>
                                </div>
                            </div>
                            <!-- /Basic Information -->
                            <!-- About Me -->
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">About Me</h4>
                                    <div class="form-group mb-0">
                                        <label>Biography</label>
                                        <textarea class="form-control" rows="5" name="description" value="<%= dentist.getDescription() %>"><%= dentist.getDescription() %></textarea>
                                    </div>
                                </div>
                            </div>
                            <!-- /About Me -->
                            <div class="submit-section submit-btn-bottom">
                                <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                                <div> <%= successMessage %> </div>
                            </div>

                        </div>
                    </div>

                    </div>
            </div>	
            </form>
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

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Select2 JS -->
        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <!-- Dropzone JS -->
        <script src="assets/plugins/dropzone/dropzone.min.js"></script>

        <!-- Bootstrap Tagsinput JS -->
        <script src="assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.js"></script>

        <!-- Profile Settings JS -->
        <script src="assets/js/profile-settings.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/doctor-profile-settings.html  30 Nov 2019 04:12:15 GMT -->
</html>
