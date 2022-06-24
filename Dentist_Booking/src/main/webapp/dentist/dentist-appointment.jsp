<%-- 
    Document   : dentist-appointment
    Created on : May 21, 2022, 12:48:52 PM
    Author     : hieunguyen
--%>

<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%@page import="com.fptproject.SWP391.model.Appointment"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
    <%
        Dentist dentist = (Dentist) session.getAttribute("Login_Dentist");
        if (dentist == null || dentist.equals("")) {
            response.sendRedirect("../login.jsp");
            return;
        }
    %>
    <!-- doccure/appointments.html  30 Nov 2019 04:12:09 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link href="<%=request.getContextPath()%>/dentist/assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dentist/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dentist/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dentist/assets/plugins/fontawesome/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dentist/assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="../dentist/assets/js/html5shiv.min.js"></script>
                <script src="../dentist/assets/js/respond.min.js"></script>
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
                                        <li class="breadcrumb-item active" aria-current="page">Appointments</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Appointments</h2>
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

                                <!--Profile Side Bar-->
                            <jsp:include flush="true" page="profile-sidebar.jsp"></jsp:include>
                                <!--/Profile Side Bar-->

                            </div>
                        <%
                            String successMessage = (String) request.getAttribute("SUCCESS");
                            if (successMessage == null) {
                                successMessage = "";
                            }
                        %> 
                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <p style="color: springgreen; font-weight: bold"><%= successMessage%></p>
                            <div class="appointments">
                                <%
                                    List<Customer> customerList = (List<Customer>) request.getAttribute("LIST_CUSTOMER_DENTIST");
                                    List<Appointment> appointmentList = (List<Appointment>) request.getAttribute("LIST_APPOINTMENT_DENTIST");
                                    if (appointmentList != null) {
                                        for (Appointment appointment : appointmentList) {
                                            if(appointment.getStatus()>=1){

                                %>
                                <!-- Appointment List -->
                                <div class="appointment-list">
                                    <div class="profile-info-widget">
                                        <a href="patient-profile.html" class="booking-doc-img"
                                            <% 
                                                for (Customer customer : customerList) { 
                                                    if (customer.getId()==appointment.getCustomerId()){
                                            %>
                                            <img src="<%= customer.getImage() %>" alt="User Image">
                                            <% 
                                                   } 
                                                }
                                            %>
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>Meeting ID: <%= appointment.getId()%></a></h3>
                                            <div class="patient-details">
                                                <h5><i class="far fa-clock"></i> Meeting date: <%= appointment.getMeetingDate()%></h5>
                                                <h5><i class="fas fa-medkit"></i> Customer's symptom: <%= appointment.getCustomerSymptom()%></h5>
                                                <h5><i class="fas fa-id-card"></i> Customer's id: <%= appointment.getCustomerId()%></h5>
                                                <% if (appointment.getDentistNote() != null && !appointment.getDentistNote().isEmpty()) {%>
                                                <h5><i class="fas fa-notes-medical"></i> Dentist's note: <%= appointment.getDentistNote()%></h5>
                                                <% }%>
                                            </div>
                                        </div>
                                    </div>
                                    <c:url var="bookAppointment" value="${request.contextPath}/dentist/AppointmentController/booking">
                                        <c:param name="dentistId" value="<%=appointment.getDentistId()%>"></c:param>
                                        <c:param name="customerId" value="<%= appointment.getCustomerId()%>"></c:param>
                                    </c:url>
                                    <div class="appointment-action">

                                        <%
                                            if (appointment.getDentistConfirm() == 0 && (appointment.getStatus()>=2)) {
                                        %>
                                        <a href="../dentist/ConfirmDentistAppointment?confirm=confirm&id=<%= appointment.getId()%>" data-toggle="modal" data-target="#<%= appointment.getId()%>" class="btn btn-sm bg-success-light">
                                            <i class="fas fa-check"></i> Complete
                                        </a>                                           
<!--                                        <a href="../dentist/DeleteAppointmentController" data-toggle="modal" data-target="#delete_appointment" onclick="deleteID('<%= appointment.getId()%>')" class="btn btn-sm bg-danger-light">
                                            <i class="fas fa-times"></i> Decline
                                        </a> -->
                                        <%
                                        } else {
                                            if (appointment.getDentistConfirm() == 1) {
                                        %>
                                        <a class="btn btn-sm  isDisabled">
                                            <i class="fas fa-check"></i> Done
                                        </a>
                                        <%
                                                    }
                                                }
                                        %>

                                        <a class="btn btn-sm bg-purple-light" href="${bookAppointment}">
                                            <i class="fas fa-calendar-alt"></i> Book
                                        </a>
                                        
                                        <a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#appt_details">
                                            <i class="far fa-eye"></i> View
                                        </a>
                                    </div>
                                </div>
                                <!-- /Appointment List -->                                           
                                <%
                                           }
                                        }
                                    }else{
                                %>  
                                <h5 class="text-center"> You don't have any appointments</h5>
                                <% 
                                    }
                                %>
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
            <!-- Dentist Note Modal -->
        <%
            if (appointmentList != null) {
                for (Appointment appointment : appointmentList) {
        %>
        <div class="modal fade" aria-hidden="true" role="dialog" id="<%= appointment.getId()%>">
            <div class="modal-dialog modal-dialog-centered" role="document" >
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Dentist Note for the Patient</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="../dentist/DentistNote" method="post">
                            <div class="row form-row">
                                <input type="hidden" name="appointment_id" value="<%= appointment.getId()%>"/>
                                <input type="hidden" name="id" value="<%= appointment.getId()%>"/>
                                <input type="hidden" name="confirm" value="confirm"/>
                                <div class="col-12 col-sm-12">
                                    <div class="form-group">
                                        <textarea type="text" class="form-control" name="note" rows="3" minlength="10" maxlength="1000"></textarea>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block" >Send</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
        <!-- /Dentist Note Modal -->  

        <!-- Dentist Delete Modal -->

        <div class="modal fade" aria-hidden="true" role="dialog" id="delete_appointment">
            <div class="modal-dialog modal-dialog-centered" role="document" >
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="form-content p-2">
                            <h4 style="text-align: center" class="modal-title">Delete</h4>
                            <p style="text-align: center" mb-4">Are you sure want to delete?</p>
                            <form style="text-align: center" action="../dentist/DeleteAppointmentController" method="POST">
                                <input type="hidden" name="appointmentID" id="appointment_id_delete"/>
                                <button type="submit"  class="btn btn-primary" > Delete </button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- /Dentist Delete Modal -->
        <!-- Appointment Details Modal -->
        <div class="modal fade custom-modal" id="appt_details">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Appointment Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <ul class="info-details">
                            <li>
                                <div class="details-header">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <span class="title">#APT0001</span>
                                            <span class="text">21 Oct 2019 10:00 AM</span>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="text-right">
                                                <button type="button" class="btn bg-success-light btn-sm" id="topup_status">Completed</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="title">Status:</span>
                                <span class="text">Completed</span>
                            </li>
                            <li>
                                <span class="title">Confirm Date:</span>
                                <span class="text">29 Jun 2019</span>
                            </li>
                            <li>
                                <span class="title">Paid Amount</span>
                                <span class="text">$450</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Appointment Details Modal -->

        <!-- jQuery -->
        <script src="../dentist/assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="../dentist/assets/js/popper.min.js"></script>
        <script src="../dentist/assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="../dentist/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="../dentist/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="../dentist/assets/js/script.js"></script>
        <script>
                                            var deleteID = function (id) {
                                                var deleteid = document.getElementById('appointment_id_delete');
                                                deleteid.value = id.toString();
                                            };
        </script>
    </body>

    <!-- doccure/appointments.html  30 Nov 2019 04:12:09 GMT -->
</html>
