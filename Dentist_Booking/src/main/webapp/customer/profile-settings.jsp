<%-- 
    Document   : profile-setting
    Created on : May 21, 2022, 12:21:49 PM
    Author     : hieunguyen
--%>
<%
    session = request.getSession();
    if (session == null) {
        response.sendRedirect("../login.jsp");
        return;
    }%>
<%@page import="com.fptproject.SWP391.error.CustomerError"%>
<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/profile-settings.html  30 Nov 2019 04:12:18 GMT -->
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

        <!-- Datetimepicker CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        --><script src="<%=request.getContextPath()%>/customer/assets/js/html5shiv.min.js"></script>
        <script src="<%=request.getContextPath()%>/customer/assets/js/respond.min.js"></script><!--
      <![endif]-->

    </head>
    <body>
        <% Customer customer = (Customer) session.getAttribute("Login_Customer");%>
        <%
            CustomerError customerError = (CustomerError) request.getAttribute("CUSTOMER_ERROR");
            if (customerError == null) {
                customerError = new CustomerError();
            }
        %>
        <%
            Customer customerCurrentInput = (Customer) request.getAttribute("CURRENT_INPUT");
            String success = (String) request.getAttribute("SUCCESS");
            if (success == null) {
                success = "";
            }
        %>

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <jsp:include flush="true" page="header.jsp"></jsp:include>
                <!-- /Header -->

                <!-- Breadcrumb -->
                <div class="breadcrumb-bar">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-12 col-12">
                                <nav aria-label="breadcrumb" class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index-.jsp">Home</a></li>
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
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">

                            <!-- Profile Sidebar -->
                        <jsp:include flush="true" page="profile-sidebar.jsp"></jsp:include>
                            <!-- /Profile Sidebar -->

                            <div class="col-md-7 col-lg-8 col-xl-9">
                                <div class="card">
                                    <div class="card-body">

                                        <!-- Profile Settings Form -->

                                        <form action="<%= request.getContextPath()%>/customer/ChangeProfileController" enctype="multipart/form-data" method="POST">
                                        <div class="row form-row">
                                            <input type="hidden" name="id" value="<%= customer.getId()%>">
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Personal Name</label>
                                                    <input type="text" name="personalName" required="" class="form-control" value="<%if (customerCurrentInput == null) {%><%= customer.getPersonalName()%><%} else {%><%= customerCurrentInput.getPersonalName()%><%}%>"> 
                                                    <span class="text-danger" style="font-weight: bold"><%= customerError.getPersonalNameError()%></span>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Age</label>
                                                    <input type="number" name="age" min="1" step="1"  class="form-control" value="<%if (customerCurrentInput == null) {%><%= customer.getAge()%><%} else {%><%= customerCurrentInput.getAge()%><%}%>">
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Gender</label>
                                                    <select name="gender" class="form-control select">
                                                        <%if (customerCurrentInput == null) { %>
                                                        <option value="0" <% if (customer.getGender() == 0) { %> selected <% } %> >Male</option>
                                                        <option value="1" <% if (customer.getGender() == 1) { %> selected <% } %>> Female</option>
                                                        <%} else {%>
                                                        <option value="0" <% if (customerCurrentInput.getGender() == 0) { %> selected <% } %> >Male</option>
                                                        <option value="1" <% if (customerCurrentInput.getGender() == 1) { %> selected <% } %>> Female</option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" required="" class="form-control" value="<%if (customerCurrentInput == null) {%><%= customer.getEmail()%><%} else {%><%= customerCurrentInput.getEmail()%><%}%>">
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Phone</label>
                                                    <input type="text" name="phone" required="" value="<%if (customerCurrentInput == null) {%><%= customer.getPhoneNumber()%><%} else {%><%= customerCurrentInput.getPhoneNumber()%><%}%>" class="form-control">
                                                    <span class="text-danger" style="font-weight: bold"><%= customerError.getPhoneNumberError()%></span>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text" name="address" required="" class="form-control" value="<%if (customerCurrentInput == null) {%><%= customer.getAddress()%><%} else {%><%= customerCurrentInput.getAddress()%><%}%>">
                                                    <span class="text-danger" style="font-weight: bold"><%= customerError.getAddressError()%></span>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <div class="change-avatar">
                                                        <div class="profile-img">
                                                            <img id="avatar" src="<%if (customerCurrentInput == null) {%><%= customer.getImage()%><%} else {%><%= customerCurrentInput.getImage()%><%}%>" alt="User Image">
                                                        </div>
                                                        <div class="upload-img">
                                                            <div class="change-photo-btn">
                                                                <span><i class="fa fa-upload"></i>Upload Photo</span>
                                                                <input type="hidden" name="currentImage" value="<%if (customerCurrentInput == null) {%><%= customer.getImage()%><%} else {%><%= customerCurrentInput.getImage()%><%}%>" />
                                                                <input type="file" name="image" accept="image/*" class="upload" id="file" onchange="loadFile(event)" />
                                                            </div>
                                                            <small class="form-text text-muted">Allowed Image file</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button type="submit" class="btn btn-primary submit-btn">Save Changes</button><span style="font-weight: bolder; color: springgreen; font-size: 18px; margin-left: 5px"><%if (success.equals("") == false) {%><%= success%><%}%></span>
                                        </div>
                                    </form>
                                    <!-- /Profile Settings Form -->

                                </div>
                            </div>
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

        <!-- Select2 JS -->
        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <!-- Datetimepicker JS -->
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

        <script>
                                                                    var loadFile = function (event) {
                                                                        var image2 = document.getElementById('avatar');
                                                                        image2.src = URL.createObjectURL(event.target.files[0]);
                                                                    };
        </script>

    </body>

    <!-- doccure/profile-settings.html  30 Nov 2019 04:12:18 GMT -->
</html>
