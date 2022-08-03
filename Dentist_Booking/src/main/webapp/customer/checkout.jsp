<%-- 
    Document   : checkout
    Created on : May 21, 2022, 12:43:21 PM
    Author     : hieunguyen
--%>
<%
    session = request.getSession();
    if (session == null) {
        response.sendRedirect("../login.jsp");
        return;
    }%>
<%@page import="com.fptproject.SWP391.model.Appointment"%>
<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fptproject.SWP391.model.Service"%>
<%@page import="com.fptproject.SWP391.model.AppointmentDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
    <%
        Customer customer = (Customer) session.getAttribute("Login_Customer");
        if (customer == null) {
            response.sendRedirect("../login.jsp");
            return;
        }
    %>
    <!-- doccure/checkout.html  30 Nov 2019 04:12:16 GMT -->
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
                                        <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Checkout</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->

                <!-- Page Content -->
                <div class="content">
                    <div class="container">

                        <div class="row">
                            <div class="col-md-7 col-lg-8">
                                <div class="card">
                                    <div class="card-body">

                                        <!-- Checkout Form -->
                                        <form action="CheckPaymentController" method="post">
                                            <!-- Personal Information -->
                                            <div class="info-widget">
                                                <h4 class="card-title">Personal Information</h4>
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group card-label">
                                                            <label>Full Name</label>
                                                            <input class="form-control" type="text" value="<%= customer.getPersonalName()%>">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Phone</label>
                                                        <input class="form-control" type="text" value="<%= customer.getPhoneNumber()%>">
                                                    </div>
                                                </div>    
                                                <div class="col-md-12 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Email</label>
                                                        <input class="form-control" type="email" value="<%= customer.getEmail()%>">
                                                    </div>
                                                </div>
                                                <div class="col-md-12 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Address</label>
                                                        <input class="form-control" type="text" value="<%= customer.getAddress()%>">
                                                    </div>
                                                </div>   
                                            </div>
                                        </div>
                                        <!-- /Personal Information -->

                                        <!-- Personal Information -->

                                        <div class="info-widget">
                                            <h4 class="card-title">Service Information</h4>
                                            <div class="row">
                                                <%
                                                    int total = 0;
                                                    HashMap<String, Float> promotionDiscountMap = (HashMap<String, Float>) request.getAttribute("HASHMAP_DISCOUNT_PROMOTION");
                                                    List<Service> listService = (List<Service>) request.getAttribute("LIST_SERVICE");
                                                    if (listService != null) {
                                                        for (Service service : listService) {
                                                %>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Service Name</label>
                                                        <input class="form-control" type="text" style="background-color: white" value="<%= service.getServiceName()%>" readonly >
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Price</label>
                                                        <% if (promotionDiscountMap.get(service.getPromotionId()) != 0) {%>    
                                                        <input class="form-control" style="background-color: white; font-weight: 600; color: red" type="text" value="$<%= (int) (service.getPrice() - service.getPrice() * promotionDiscountMap.get(service.getPromotionId()))%>" readonly >
                                                        <% total += (int) (service.getPrice() - service.getPrice() * promotionDiscountMap.get(service.getPromotionId())); %>
                                                        <% } else {%>
                                                        <input class="form-control" style="background-color: white; font-weight: 600" type="text" value="$<%= service.getPrice()%>" readonly >
                                                        <% total += service.getPrice(); %>
                                                        <% }%>
                                                    </div>
                                                </div>    
                                                <div class="col-md-3 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Discount</label>
                                                        <input class="form-control" style="background-color: white" type="text" value="<%= (int) (promotionDiscountMap.get(service.getPromotionId()) * 100)%>%" readonly >
                                                    </div>
                                                </div>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </div>
                                        </div>
                                        <!-- /Personal Information -->



                                        <div class="payment-widget">
                                            <h4 class="card-title">Payment Method</h4>
                                            
                                            <!-- Pay by card -->
                                            <div class="payment-list">
                                                <label class="payment-radio paypal-option">
                                                    <input type="radio" name="paymentStatus" value="paid" >
                                                    <span class="checkmark"></span>
                                                    Pay by card
                                                </label>
                                            </div>
                                            <!-- /Pay by card -->
                                            
                                            <!-- MoMo  -->

                                            <div class="payment-list">
                                                <label class="payment-radio credit-card-option">
                                                    <input type="radio" name="paymentStatus" value="paid" checked>
                                                    <span class="checkmark"></span>
                                                    MoMo
                                                </label>
                                            </div>
                                            <!-- /MoMo -->
                                            
                                            <!-- Paypal  -->

                                            <div class="payment-list">
                                                <label class="payment-radio credit-card-option">
                                                    <input type="radio" name="paymentStatus" value="paid" checked>
                                                    <span class="checkmark"></span>
                                                    Paypal
                                                </label>
                                            </div>
                                            <!-- /Paypal -->
                                            <%
                                                Appointment appointment = (Appointment) request.getAttribute("APPOINTMENT");
                                            %>
                                            
                                            <!-- Terms Accept -->
                                            
                                            <!-- /Terms Accept -->

                                            <!-- Submit Section -->
                                            <div class="submit-section mt-4">
                                                <input type="hidden" name="appointmentID" value="<%= appointment.getId()%>">
                                                <button type="submit" class="btn btn-primary submit-btn">Confirm</button>
                                            </div>
                                            <!-- /Submit Section -->

                                        </div>
                                    </form>
                                    <!-- /Checkout Form -->

                                </div>
                            </div>

                        </div>

                        <div class="col-md-5 col-lg-4 theiaStickySidebar">

                            <!-- Booking Summary -->
                            <div class="card booking-card">
                                <div class="card-header">
                                    <h4 class="card-title">Booking Summary</h4>
                                </div>
                                <div class="card-body">

                                    <!-- Booking Doctor Info -->
                                    <%
                                        Dentist dentist = (Dentist) request.getAttribute("DENTIST");
                                        if (dentist != null) {
                                    %>
                                    <div class="booking-doc-info">
                                        <a href="doctor-profile.html" class="booking-doc-img">
                                            <img src="<%= dentist.getImage()%>" alt="User Image">
                                        </a>
                                        <div class="booking-info">
                                            <h4><a href="doctor-profile.html">Dr. <%= dentist.getPersonalName()%></a></h4>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <span class="d-inline-block average-rating"><%= dentist.getRate()%></span>
                                            </div>
                                            <div class="clinic-details">
                                                <p class="doc-location"> <%= dentist.getWorkingExperience()%> years of expereience </p>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <!-- Booking Doctor Info -->

                                    <%
                                        List<AppointmentDetail> listAppointmentDetail = (List<AppointmentDetail>) request.getAttribute("LIST_APPOINTMENTDETAIL");
                                        if (appointment != null) {
                                    %>
                                    <div class="booking-summary">
                                        <div class="booking-item-wrap">
                                            <ul class="booking-date">
                                                <li>Date <span><%= appointment.getMeetingDate()%></span></li>
                                                <li>Time  
                                                    <span><% for (AppointmentDetail appointmentDetail : listAppointmentDetail) {%> Slot <%= appointmentDetail.getSlot()%> <% }%></span>
                                                </li>
                                            </ul>
                                            <ul class="booking-fee">
                                                <li>Service Fee <span>$<%= total%></span></li>
                                                <li>Booking Fee <span>$2</span></li>
                                            </ul>
                                            <div class="booking-total">
                                                <ul class="booking-total-list">
                                                    <li>
                                                        <span>Total</span>
                                                        <span class="total-cost">$<%= total + 2%></span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>                
                                </div>
                            </div>
                            <!-- /Booking Summary -->

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

    <!-- doccure/checkout.html  30 Nov 2019 04:12:16 GMT -->
</html>
