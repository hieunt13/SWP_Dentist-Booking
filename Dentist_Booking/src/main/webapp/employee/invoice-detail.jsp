<%-- 
    Document   : invoice-detail
    Created on : May 21, 2022, 12:31:43 PM
    Author     : hieunguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_CHECKOUT_LIST}">
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
                                                    <strong>Appointment ID:</strong> ${list.id} <br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Invoice Item -->
                                    <div class="invoice-item">
                                        <div class="row">
                                            <div class="col-md-4">

                                            </div>
                                            <div class="col-md-8">
                                                <div class="invoice-info invoice-info2">
                                                    <strong class="customer-text">Invoice To</strong>
                                                    <p class="invoice-details">
                                                        ${list.customer.personalName}<br>
                                                        ${list.customer.address}<br>
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
                                                    <strong class="customer-text">Payment Status</strong>
                                                    <p class="invoice-details invoice-details-two text-success">
                                                        <c:if test="${list.paymentConfirm == 1}">
                                                            Prepaid
                                                        </c:if>

                                                    </p>
                                                    <p class="invoice-details invoice-details-two text-warning">
                                                        <c:if test="${list.paymentConfirm == 0}">
                                                            Unpaid
                                                        </c:if>
                                                    </p>
                                                    <p class="invoice-details invoice-details-two text-success">
                                                        Ready for offline payment
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
                                                            <c:set var="appointmentIdApplied" value=""/>
                                                            <c:forEach var="appointment" items="${EMPLOYEE_APPOINTMENT_DETAIL_LIST}">
                                                                <c:if test="${appointment.key.id == list.id}">
                                                                    <c:set var="appointmentIdApplied" value="${appointment.value}"/>
                                                                    <c:set var="finalTotal" scope="request" value="${0}"/>
                                                                    <c:set var="priceDiscount" scope="request" value="${0}"/>
                                                                    <c:set var="total" scope="request" value="${0}"/>
                                                                    <c:forEach var="appointmentSlot" items="${appointment.value}">
                                                                        <tr>
                                                                            <td>${appointmentSlot.service.serviceName}</td>
                                                                            <td class="text-center">${appointmentSlot.service.price}$</td>

                                                                            <fmt:formatNumber var="discount" value="${appointmentSlot.service.promotion.discountPercentage * 100}" minFractionDigits="0" maxFractionDigits="0"/>
                                                                            <td class="text-center">${discount}%</td>
                                                                            <td class="text-center">$0</td>
                                                                            <fmt:formatNumber var="priceDiscount" value="${appointmentSlot.service.price - (appointmentSlot.service.price * appointmentSlot.service.promotion.discountPercentage)}" minFractionDigits="0" maxFractionDigits="0"/>

                                                                            <c:set var="total" scope="request" value="${total+appointmentSlot.service.price}"/>
                                                                            <td class="text-right">$${priceDiscount}</td>
                                                                            <c:set var="finalTotal" scope="request" value="${finalTotal+priceDiscount}"/>
                                                                        </tr>
                                                                    </c:forEach>

                                                                </c:if>
                                                            </c:forEach>
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
                                                                <td><span>$${finalTotal + 2}</span></td>
                                                                <c:set var="totalInvoicePrice" scope="request" value="${finalTotal + 2}"/>
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
                                <div style="width: 50%; margin: auto; margin-bottom: 20px; border: 1px solid green; border-radius: 4px">
                                    <a
                                        href="#"
                                        data-toggle="modal"
                                        data-target="#${list.id}"
                                        class="btn btn-sm bg-success-light btn-block">
                                        <i class="fas fa-check"></i> Confirm checkout

                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>  


                </div>

            </div>	


            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include flush="true" page="footer.jsp"></jsp:include>
                <!-- /Footer -->

            </div>
            <!-- /Main Wrapper -->
        <c:forEach var="list" items="${EMPLOYEE_APPOINTMENT_CHECKOUT_LIST}">
            <div class="modal fade custom-modal" id="${list.id}">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Confirm checkout</h5>
                        </div>

                        <div class="modal-body">
                            <ul class="info-details">
                                <li>
                                    <div class="details-header">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <span class="title">Make sure that customer has paid before checkout!</span>
                                                <span class="text">This action cannot be undone, are you sure want to checkout this appointment?</span>
                                            </div>
                                            </li>
                                            <li>
                                                <a
                                                    href="<%=request.getContextPath()%>/CreateInvoice?appointmentId=${list.id}&invoicePrice=${totalInvoicePrice}"

                                                    class="btn btn-sm bg-success-light btn-block"
                                                    >
                                                    <i class="fas fa-check"></i> Checkout now

                                                </a>
                                            </li>
                                            </ul>
                                        </div>
                                    </div>
                                    </div>
                                    </div>
                                </c:forEach>
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
