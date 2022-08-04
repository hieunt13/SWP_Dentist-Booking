<%@page import="com.fptproject.SWP391.model.Invoice"%>
<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%@page import="com.fptproject.SWP391.model.Employee"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Employee admin = (Employee) session.getAttribute("Login_Employee");
        if (admin == null || !admin.getRole().equals("ADMIN")) {
            response.sendRedirect("/dentalclinic/login.jsp");
            return;
        }
    %>
    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:20 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Dashboard</title>

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/admin/assets/img/favicon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/assets/css/font-awesome.min.css">

        <!-- Feathericon CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/assets/css/feathericon.min.css">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/assets/plugins/morris/morris.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/css/style.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/assets/css/style.css">

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
                                <div class="col-sm-12">
                                    <h3 class="page-title">Welcome Admin!</h3>
                                    <ul class="breadcrumb">
                                        <li class="breadcrumb-item active">Dashboard</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /Page Header -->
                    <%
                        int dentist = (int) request.getAttribute("NUM_OF_DENTIST");
                        int customer = (int) request.getAttribute("NUM_OF_CUSTOMER");
                        int appointment = (int) request.getAttribute("NUM_OF_APPOINTMENT");
                        int revenue = (int) request.getAttribute("SUM_OF_REVENUE");
                    %>
                    <div class="row">
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <span class="dash-widget-icon text-primary border-primary">
                                            <i class="fe fe-users"></i>
                                        </span>
                                        <div class="dash-count">
                                            <h3><%= dentist%></h3>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">
                                        <h6 class="text-muted">Dentist</h6>
                                        <!--										<div class="progress progress-sm">
                                                                                                                                <div class="progress-bar bg-primary w-50"></div>
                                                                                                                        </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <span class="dash-widget-icon text-success">
                                            <i class="fe fe-credit-card"></i>
                                        </span>
                                        <div class="dash-count">
                                            <h3><%= customer%></h3>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">

                                        <h6 class="text-muted">Patients</h6>
                                        <!--										<div class="progress progress-sm">
                                                                                                                                <div class="progress-bar bg-success w-50"></div>
                                                                                                                        </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <span class="dash-widget-icon text-danger border-danger">
                                            <i class="fe fe-money"></i>
                                        </span>
                                        <div class="dash-count">
                                            <h3><%= appointment%></h3>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">

                                        <h6 class="text-muted">Appointment</h6>
                                        <!--										<div class="progress progress-sm">
                                                                                                                                <div class="progress-bar bg-danger w-50"></div>
                                                                                                                        </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <span class="dash-widget-icon text-warning border-warning">
                                            <i class="fe fe-folder"></i>
                                        </span>
                                        <div class="dash-count">
                                            <h3>$ <%= revenue%></h3>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">

                                        <h6 class="text-muted">Revenue</h6>
                                        <!--										<div class="progress progress-sm">
                                                                                                                                <div class="progress-bar bg-warning w-50"></div>
                                                                                                                        </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--
                                        <div class="row">
                                            <div class="col-md-12 col-lg-6">

                            <!-- Sales Chart -->
                            <div class="card card-chart">
                                <div class="card-header">
                                    <h4 class="card-title">Revenue</h4>
                                </div>
                                <div class="card-body">
                                    <div id="morrisArea"></div>
                                </div>
                            </div>
                            <!-- /Sales Chart -->

                        </div>
                        <div class="col-md-12 col-lg-6">

                            <!-- Invoice Chart -->
                            <div class="card card-chart">
                                <div class="card-header">
                                    <h4 class="card-title">Status</h4>
                                </div>
                                <div class="card-body">
                                    <div id="morrisLine"></div>
                                </div>
                            </div>
                            <!-- /Invoice Chart -->

                        </div>	
                    </div>
                    --%>
                    <div class="row">
                        <div class="col-md-6 d-flex">

                            <!-- Recent Orders -->
                            <div class="card card-table flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Doctors List</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Doctor Name</th>
                                                    <th>Speciality</th>
                                                    <th>Reviews</th>
                                                    <th>Earned</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <%
                                                        List<Dentist> dentistList = (List<Dentist>) request.getAttribute("LIST_DENTIST");
                                                        if (dentistList != null) {
                                                            for (Dentist dentistObjec : dentistList) {
                                                            int earn = 0;
                                                    %>

                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="#" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/dentist/<%= dentistObjec.getImage()%>" alt="User Image"></a>
                                                            <a href="#"> <%= dentistObjec.getPersonalName()%> </a>
                                                        </h2>
                                                    </td>
                                                    <td><%= dentistObjec.getSpeciality()%></td>                                           
                                                    <td>
                                                        <%= dentistObjec.getRate()%> 
                                                        <i class="fe fe-star text-warning"></i>
                                                        <!--                                                    <i class="fe fe-star text-warning"></i>
                                                                                                            <i class="fe fe-star text-warning"></i>
                                                                                                            <i class="fe fe-star text-warning"></i>
                                                                                                            <i class="fe fe-star-o text-secondary"></i>-->
                                                    </td>
                                                    <td>
                                                        <%
                                                            
                                                            List<Invoice> invoiceList = (List<Invoice>) request.getAttribute("LIST_INVOICE");
                                                            if (invoiceList != null) {                                                               
                                                                for (Invoice invoice : invoiceList) {
                                                                    if ((invoice.getId().equals(dentistObjec.getId())) && invoice.getStatus() == 1) {
                                                                        earn = earn + invoice.getPrice();
                                                                    }
                                                                }
                                                            }
                                                        %>
                                                        <%= earn %> $
                                                    </td>
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /Recent Orders -->

                        </div>
                        <div class="col-md-6 d-flex">

                            <!-- Feed Activity -->
                            <div class="card  card-table flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Patients List</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>													
                                                    <th>Patient Name</th>
                                                    <th>Phone</th>
                                                    <!--                                                    <th>Last Visit</th>
                                                                                                        <th>Paid</th>													-->
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    List<Customer> customerList = (List<Customer>) request.getAttribute("LIST_CUSTOMER");
                                                    if (customerList
                                                            != null) {
                                                        for (Customer customerObjec : customerList) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/customer/<%= customerObjec.getImage()%>" alt="User Image"></a>
                                                            <a href="profile.jsp"><%= customerObjec.getPersonalName()%> </a>
                                                        </h2>
                                                    </td>
                                                    <td><%= customerObjec.getPhoneNumber()%></td>
                                                    <!--                                               //      <td>20 Oct 2019</td>
                                                                                                        <td class="text-right">$100.00</td>-->
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /Feed Activity -->

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                            <!-- Recent Orders -->
                            <div class="card card-table">
                                <div class="card-header">
                                    <h4 class="card-title">Appointment List</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Doctor Name</th>
                                                    <th>Speciality</th>
                                                    <th>Patient Name</th>
                                                    <th>Apointment Time</th>
                                                    <th>Status</th>
                                                    <th class="text-right">Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-01.jpg" alt="User Image"></a>
                                                            <a href="profile.jsp">Dr. Ruby Perrin</a>
                                                        </h2>
                                                    </td>
                                                    <td>Dental</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient1.jpg" alt="User Image"></a>
                                                            <a href="profile.jsp">Charlene Reed </a>
                                                        </h2>
                                                    </td>
                                                    <td>9 Nov 2019 <span class="text-primary d-block">11.00 AM - 11.15 AM</span></td>
                                                    <td>
                                                        <div class="status-toggle">
                                                            <input type="checkbox" id="status_1" class="check" checked>
                                                            <label for="status_1" class="checktoggle">checkbox</label>
                                                        </div>
                                                    </td>
                                                    <td class="text-right">
                                                        $200.00
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-02.jpg" alt="User Image"></a>
                                                            <a href="profile.jsp">Dr. Darren Elder</a>
                                                        </h2>
                                                    </td>
                                                    <td>Dental</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient2.jpg" alt="User Image"></a>
                                                            <a href="profile.jsp">Travis Trimble </a>
                                                        </h2>
                                                    </td>

                                                    <td>5 Nov 2019 <span class="text-primary d-block">11.00 AM - 11.35 AM</span></td>
                                                    <td>
                                                        <div class="status-toggle">
                                                            <input type="checkbox" id="status_2" class="check" checked>
                                                            <label for="status_2" class="checktoggle">checkbox</label>
                                                        </div>
                                                    </td>
                                                    <td class="text-right">
                                                        $300.00
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-03.jpg" alt="User Image"></a>
                                                            <a href="profile.jsp">Dr. Deborah Angel</a>
                                                        </h2>
                                                    </td>
                                                    <td>Cardiology</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient3.jpg" alt="User Image"></a>
                                                            <a href="profile.jsp">Carl Kelly</a>
                                                        </h2>
                                                    </td>
                                                    <td>11 Nov 2019 <span class="text-primary d-block">12.00 PM - 12.15 PM</span></td>
                                                    <td>
                                                        <div class="status-toggle">
                                                            <input type="checkbox" id="status_3" class="check" checked>
                                                            <label for="status_3" class="checktoggle">checkbox</label>
                                                        </div>
                                                    </td>
                                                    <td class="text-right">
                                                        $150.00
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-04.jpg" alt="User Image"></a>
                                                            <a href="profile.jsp">Dr. Sofia Brient</a>
                                                        </h2>
                                                    </td>
                                                    <td>Urology</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient4.jpg" alt="User Image"></a>
                                                            <a href="profile.jsp"> Michelle Fairfax</a>
                                                        </h2>
                                                    </td>
                                                    <td>7 Nov 2019<span class="text-primary d-block">1.00 PM - 1.20 PM</span></td>
                                                    <td>
                                                        <div class="status-toggle">
                                                            <input type="checkbox" id="status_4" class="check" checked>
                                                            <label for="status_4" class="checktoggle">checkbox</label>
                                                        </div>
                                                    </td>
                                                    <td class="text-right">
                                                        $150.00
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/doctor-thumb-05.jpg" alt="User Image"></a>
                                                            <a href="profile.jsp">Dr. Marvin Campbell</a>
                                                        </h2>
                                                    </td>
                                                    <td>Orthopaedics</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient5.jpg" alt="User Image"></a>
                                                            <a href="profile.jsp">Gina Moore</a>
                                                        </h2>
                                                    </td>

                                                    <td>15 Nov 2019 <span class="text-primary d-block">1.00 PM - 1.15 PM</span></td>
                                                    <td>
                                                        <div class="status-toggle">
                                                            <input type="checkbox" id="status_5" class="check" checked>
                                                            <label for="status_5" class="checktoggle">checkbox</label>
                                                        </div>
                                                    </td>
                                                    <td class="text-right">
                                                        $200.00
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /Recent Orders -->

                        </div>
                    </div>

                </div>			
            </div>
            <!-- /Page Wrapper -->

        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script src="<%=request.getContextPath()%>/admin/assets/js/jquery-3.2.1.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="<%=request.getContextPath()%>/admin/assets/js/popper.min.js"></script>
        <script src="<%=request.getContextPath()%>/admin/assets/js/bootstrap.min.js"></script>

        <!-- Slimscroll JS -->
        <script src="<%=request.getContextPath()%>/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="<%=request.getContextPath()%>/admin/assets/plugins/raphael/raphael.min.js"></script>    
        <script src="<%=request.getContextPath()%>/admin/assets/plugins/morris/morris.min.js"></script>  
        <script src="<%=request.getContextPath()%>/admin/assets/js/chart.morris.js"></script>

        <!-- Custom JS -->
        <script  src="<%=request.getContextPath()%>/admin/assets/js/script.js"></script>

    </body>

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:34 GMT -->
</html>