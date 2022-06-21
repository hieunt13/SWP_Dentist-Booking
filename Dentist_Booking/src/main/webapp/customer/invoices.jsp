<%-- 
    Document   : invoice
    Created on : May 21, 2022, 3:14:19 PM
    Author     : hieunguyen
--%>

<%@page import="com.fptproject.SWP391.model.Invoice"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/invoices.html  30 Nov 2019 04:12:14 GMT -->
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
                                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Invoices</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Invoices</h2>
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
                            <div class="card card-table">
                                <div class="card-body">

                                    <!-- Invoice Table -->
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th class="text-center">Appointment ID</th>
                                                    <th class="text-center">Employee ID</th>
                                                    <th>Price</th>
                                                    <th class="text-center">Payment Method</th>
                                                    <th class="text-center">Status</th>
                                                    <th class="text-right">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    List<Invoice> invoiceList = (List<Invoice>) request.getAttribute("LIST_INVOICE");
                                                    if(invoiceList!=null){
                                                        if(invoiceList.size()>0){
                                                            for( Invoice invoice : invoiceList ){
                                                %>
                                                <tr>
                                                    <td>
                                                        <a><%= invoice.getId() %></a>
                                                    </td>
                                                    <td class="text-center">
                                                        <a><%= invoice.getAppointmentId() %></a>
                                                    </td>
                                                    <td class="text-center">
                                                        <a><%= invoice.getEmployeeId() %></a>
                                                    </td>
                                                    <td>$<%= invoice.getPrice() %></td>
                                                    <td class="text-center">
                                                        <% if(invoice.getPaymentMethod()== (byte) 0){ %>
                                                            <a>Pay in cash</a>
                                                        <% }else{ %>
                                                            <a>Pay with Paypal</a>
                                                        <% }%>
                                                    </td>
                                                    <td class="text-center">
                                                        <% if( invoice.getStatus() == 1){ %>
                                                            <span class="badge badge-pill bg-success-light inv-badge" style="font-size: 13px; color: #fffcfcf5">Paid</span>
                                                        <% }else{  %>
                                                            <span class="badge badge-pill bg-danger-light inv-badge" style="font-size: 13px; color: #fffcfcf5">Unpaid</span>
                                                        <% } %>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="table-action">
                                                            <% if( invoice.getStatus() == 1){ %>
                                                            <a href="ViewInvoiceDetailController?invoiceID=<%= invoice.getId() %>&appointmentID=<%= invoice.getAppointmentId() %>" class="btn btn-sm bg-info-light">
                                                                <i class="far fa-eye"></i> View
                                                            </a>
                                                            <a href="javascript:void(0);" class="btn btn-sm bg-primary-light">
                                                                <i class="fas fa-print"></i> Print
                                                            </a>
                                                            <% } %>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /Invoice Table -->

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

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/invoices.html  30 Nov 2019 04:12:14 GMT -->
</html>
