<%-- 
    Document   : invoice-detail
    Created on : May 21, 2022, 12:31:43 PM
    Author     : hieunguyen
--%>
<%
    session = request.getSession();
    if (session == null) {
        response.sendRedirect("../login.jsp");
        return;
    }%>
<%@page import="com.fptproject.SWP391.model.Service"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fptproject.SWP391.model.Invoice"%>
<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/invoice-view.html  30 Nov 2019 04:12:19 GMT -->
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
        --><script src="<%=request.getContextPath()%>/customer/assets/js/html5shiv.min.js"></script>
        <script src="<%=request.getContextPath()%>/customer/assets/js/respond.min.js"></script><!--
      <![endif]-->

    </head>
    <body>
        <%
            Customer customer = (Customer) session.getAttribute("Login_Customer");
            if (customer == null) {
                response.sendRedirect("../login.jsp");
                return;
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
                                        <li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Invoice View</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Invoice View</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->

                <!-- Page Content -->
                <div class="content">
                    <div class="container-fluid">
                    <%
                        Invoice invoice = (Invoice) request.getAttribute("INVOICE");
                        String employeePersonalName = (String) request.getAttribute("EMPLOYEE_PERSONAL_NAME");
                    %>
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="invoice-content">
                                <div class="invoice-item">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="invoice-logo">
                                                <img src="assets/img/logo.png" alt="logo">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="invoice-details">
                                                <strong>Invoice ID:</strong> <%= invoice.getId()%> <br>
                                                <strong>Appointment ID:</strong> <%= invoice.getAppointmentId()%> <br>
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Invoice Item -->
                                <div class="invoice-item">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="invoice-info">
                                                <strong class="customer-text">Invoice From</strong>
                                                <p class="invoice-details invoice-details-two">
                                                    <%= employeePersonalName%> <br>
                                                    Dental Clinic<br>
                                                    Viet Nam <br>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="invoice-info invoice-info2">
                                                <strong class="customer-text">Invoice To</strong>
                                                <p class="invoice-details">
                                                    <%= customer.getPersonalName()%><br>
                                                    <%= customer.getAddress()%><br>
                                                    Viet Nam<br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Invoice Item -->

                                <!-- Invoice Item -->
                                <div class="invoice-item">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="invoice-info">
                                                <strong class="customer-text">Payment Method</strong>
                                                <p class="invoice-details invoice-details-two">
                                                    <% if (invoice.getPaymentMethod() == (byte) 0) { %>
                                                    Pay in cash <br>
                                                    <% } else { %>
                                                    Pay with Paypal <br>
                                                    <% }%>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Invoice Item -->

                                <!-- Invoice Item -->
                                <div class="invoice-item invoice-table-wrap">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="invoice-table table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Service</th>
                                                            <th class="text-center">Price</th>
                                                            <th class="text-center">Discount</th>
                                                            <th class="text-center">VAT</th>
                                                            <th class="text-right">Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            int total = 0;
                                                            HashMap<String, Float> promotionDiscountMap = (HashMap<String, Float>) request.getAttribute("HASHMAP_DISCOUNT_PROMOTION");
                                                            List<Service> listService = (List<Service>) request.getAttribute("LIST_SERVICE");
                                                            if (listService != null) {
                                                                for (Service service : listService) {
                                                                    total += (service.getPrice() - service.getPrice() * promotionDiscountMap.get(service.getPromotionId()));
                                                        %>
                                                        <tr>
                                                            <td><%= service.getServiceName()%></td>
                                                            <td class="text-center">$<%= service.getPrice()%></td>
                                                            <td class="text-center"><%= (int) (promotionDiscountMap.get(service.getPromotionId()) * 100)%>%</td>
                                                            <td class="text-center">$0</td>
                                                            <td class="text-right">$<%= (int) (service.getPrice() - service.getPrice() * promotionDiscountMap.get(service.getPromotionId()))%></td>
                                                        </tr>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xl-4 ml-auto">
                                            <div class="table-responsive">
                                                <table class="invoice-table-two table">
                                                    <tbody>
                                                        <tr>
                                                            <th>Booking Fee :</th>
                                                            <td><span>+$2</span></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Total Amount:</th>
                                                            <td><span>$<%= invoice.getPrice()%></span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Invoice Item -->

                                <!-- Invoice Information -->
                                <div class="other-info">
                                    <h4>Thank you for using our service !</h4>
                                    <p class="text-muted mb-0">We hope to see you again. You can help us improve our service quality by giving feedback.We will seriously read and consider your opinion.</p>
                                </div>
                                <!-- /Invoice Information -->

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

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/invoice-view.html  30 Nov 2019 04:12:20 GMT -->
</html>
