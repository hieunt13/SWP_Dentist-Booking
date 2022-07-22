<%@page import="com.fptproject.SWP391.model.Employee"%>
<%@page import="com.fptproject.SWP391.error.ClinicInformationError"%>
<%@page import="com.fptproject.SWP391.model.ClinicInformation"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Employee admin = (Employee) session.getAttribute("Login_Employee");
        if (admin == null || !admin.getRole().equals("ADMIN")){
            response.sendRedirect("/dentalclinic/login.jsp");
            return;
        }
    %>
    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:46 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Profile</title>

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/css/style.css" />
        <link rel="stylesheet" href="assets/css/style.css">

        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.min.js"></script>
                <script src="assets/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <!-- Main Wrapper -->

        <div class="main-wrapper">

            <!-- Header -->
            <jsp:include flush="true" page="header.jsp"></jsp:include>
                <!-- /Header -->
                <!-- Sidebar -->
            <jsp:include flush="true" page="sidebar.jsp"></jsp:include>
                <!-- /Sidebar -->

                <!-- Page Wrapper -->
                <div class="page-wrapper">
                    <div class="content container-fluid">

                        <!-- Page Header -->
                        <div class="page-header">
                            <div class="row">
                                <div class="col">
                                    <h3 class="page-title">Profile</h3>
                                    <ul class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Profile</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /Page Header -->

                        <div class="row">
                            <div class="col-md-12">
                                <div class="profile-header">
                                    <div class="row align-items-center">
                                        <div class="col-auto profile-image">
                                            <a href="#">
                                                <img class="rounded-circle" alt="User Image" src="<%= admin.getImage() %>">
                                            </a>
                                        </div>
                                        <div class="col ml-md-n2 profile-user-info">
                                            <h4 class="user-name mb-0"><%= admin.getPersonalName()%></h4>
                                        <h6 class="text-muted"><%= admin.getEmail()%></h6>
                                        <div class="user-Location"><i class="fa fa-phone"></i> <%= admin.getPhoneNumber()%></div>
                                        <div class="about-text">I am admin of dental clinic</div>
                                    </div>
                                </div>
                            </div>
                            <%
                                String setActive = (String) request.getAttribute("SET_ACTIVE");
                                if (setActive == null) {
                                    setActive = "personalTab";
                                }
                            %>
                            <div class="profile-menu">
                                <ul class="nav nav-tabs nav-tabs-solid">
                                    <li class="nav-item">
                                        <a class="nav-link <% if (setActive.equals("personalTab")) {%>active<%}%>" data-toggle="tab" href="#per_details_tab">About</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link <% if (setActive.equals("clinicTab")) {%>active<%}%>" data-toggle="tab" href="#clinic_details_tab">Clinic</a>
                                    </li>
                                </ul>
                            </div>	
                            <div class="tab-content profile-tab-cont">

                                <!-- Personal Details Tab -->
                                <div class="tab-pane fade <% if (setActive.equals("personalTab")) {%>show active<%}%>" id="per_details_tab">

                                    <!-- Personal Details -->
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title d-flex justify-content-between">
                                                        <span>Personal Details</span> 
                                                    </h5>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Name</p>
                                                        <p class="col-sm-10"><%= admin.getPersonalName() %></p>
                                                    </div>

                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Email ID</p>
                                                        <p class="col-sm-10"><%= admin.getEmail() %></p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Mobile</p>
                                                        <p class="col-sm-10"><%= admin.getPhoneNumber() %></p>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>


                                    </div>
                                    <!-- /Personal Details -->

                                </div>
                                <!-- /Personal Details Tab -->

                                <!-- Clinic Details Tab -->
                                <%
                                    ClinicInformation clinicInformation = (ClinicInformation) request.getServletContext().getAttribute("CLINIC_INFO");
                                    if (clinicInformation == null) {
                                        clinicInformation = new ClinicInformation();
                                    }

                                    ClinicInformation currentInput = (ClinicInformation) request.getAttribute("CURRENT_INPUT");

                                    ClinicInformationError error = (ClinicInformationError) request.getAttribute("CLINIC_ERROR");
                                    if (error == null) {
                                        error = new ClinicInformationError();
                                    }

                                    String success = (String) request.getAttribute("SUCCESS");
                                    if (success == null) {
                                        success = "";
                                    }
                                %>
                                <div id="clinic_details_tab" class="tab-pane fade <% if (setActive.equals("clinicTab")) {%>show active<%}%>">
                                    <!-- Clinic Details -->
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title d-flex justify-content-between">
                                                        <span>Clinic Details</span><span  style="font-weight: bolder; color: springgreen; font-size: 25px; margin-left: 5px"><%if (success.equals("") == false) {%><%= success%><%}%></span> 
                                                        <!--<a class="edit-link" data-toggle="modal" href="#edit_clinic_details"><i class="fa fa-edit mr-1"></i>Edit</a> -->
                                                    </h5>
                                                    <div class="modal-body">
                                                        <form action="../admin/AdminUpdateClinicInformationController" method="POST">
                                                            <div class="row form-row">
                                                                <div class="col-12 col-sm-12">
                                                                    <div class="form-group">
                                                                        <label>Name</label>
                                                                        <input type="text" name="name" class="form-control" value="<%if (currentInput == null) {%><%= clinicInformation.getName()%><%} else {%><%= currentInput.getName()%><%}%>">
                                                                        <span class="text-danger" style="font-weight: bold"><%= error.getNameError()%></span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 col-sm-6">
                                                                    <div class="form-group">
                                                                        <label>Open Time</label>
                                                                        <input type="time" name="openTime" class="form-control" value="<%if (currentInput == null) {%><%= clinicInformation.getOpenTime()%><%} else {%><%= currentInput.getOpenTime()%><%}%>">
                                                                        <span class="text-danger" style="font-weight: bold"><%= error.getOpenTimeError()%></span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 col-sm-6">
                                                                    <div class="form-group">
                                                                        <label>Close Time</label>
                                                                        <input type="time" name="closeTime" class="form-control" value="<%if (currentInput == null) {%><%= clinicInformation.getCloseTIme()%><%} else {%><%= currentInput.getCloseTIme()%><%}%>">
                                                                        <span class="text-danger" style="font-weight: bold"><%= error.getCloseTImeError()%></span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 col-sm-6">
                                                                    <div class="form-group">
                                                                        <label>Email</label>
                                                                        <input type="email" name="email" class="form-control" value="<%if (currentInput == null) {%><%= clinicInformation.getEmail()%><%} else {%><%= currentInput.getEmail()%><%}%>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 col-sm-6">
                                                                    <div class="form-group">
                                                                        <label>Phone</label>
                                                                        <input type="text" name="phone" value="<%if (currentInput == null) {%><%= clinicInformation.getPhone()%><%} else {%><%= currentInput.getPhone()%><%}%>" class="form-control">
                                                                        <span class="text-danger" style="font-weight: bold"><%= error.getPhoneError()%></span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 col-sm-12">
                                                                    <div class="form-group">
                                                                        <label>Address</label>
                                                                        <input type="text" name="address" value="<%if (currentInput == null) {%><%= clinicInformation.getAddress()%><%} else {%><%= currentInput.getAddress()%><%}%>" class="form-control">
                                                                        <span class="text-danger" style="font-weight: bold"><%= error.getAddressError()%></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <button type="submit" class="btn btn-primary btn-block">Save Changes</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Edit Details Modal -->
                                            <div class="modal fade" id="edit_clinic_details" aria-hidden="true" role="dialog">
                                                <div class="modal-dialog modal-dialog-centered" role="document" >
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Personal Details</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form>
                                                                <div class="row form-row">
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>First Name</label>
                                                                            <input type="text" class="form-control" value="John">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Last Name</label>
                                                                            <input type="text"  class="form-control" value="Doe">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <div class="form-group">
                                                                            <label>Date of Birth</label>
                                                                            <div class="cal-icon">
                                                                                <input type="text" class="form-control" value="24-07-1983">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Email ID</label>
                                                                            <input type="email" class="form-control" value="johndoe@example.com">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Mobile</label>
                                                                            <input type="text" value="+1 202-555-0125" class="form-control">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <h5 class="form-title"><span>Address</span></h5>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <div class="form-group">
                                                                            <label>Address</label>
                                                                            <input type="text" class="form-control" value="4663 Agriculture Lane">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>City</label>
                                                                            <input type="text" class="form-control" value="Miami">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>State</label>
                                                                            <input type="text" class="form-control" value="Florida">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Zip Code</label>
                                                                            <input type="text" class="form-control" value="22434">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Country</label>
                                                                            <input type="text" class="form-control" value="United States">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <button type="submit" class="btn btn-primary btn-block">Save Changes</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Edit Details Modal -->

                                        </div>


                                    </div>
                                    <!-- /Clinic Details -->

                                </div>
                                <!-- /Clinic Details Tab -->


                            </div>
                        </div>
                    </div>

                </div>			
            </div>
            <!-- /Page Wrapper -->

        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script src="assets/js/jquery-3.2.1.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Slimscroll JS -->
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <!-- Custom JS -->
        <script  src="assets/js/script.js"></script>

    </body>

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:46 GMT -->
</html>