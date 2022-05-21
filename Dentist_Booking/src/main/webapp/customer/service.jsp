<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- doccure/my-patients.html  30 Nov 2019 04:12:09 GMT -->
    <head>
        <meta charset="utf-8" />
        <title>Dental Clinic</title>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=0"
            />

        <!-- Favicons -->
        <link href="../assets/img/favicon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />

        <!-- Fontawesome CSS -->
        <link
            rel="stylesheet"
            href="../assets/plugins/fontawesome/css/fontawesome.min.css"
            />
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css" />

        <!-- Main CSS -->
        <link rel="stylesheet" href="../assets/css/style.css" />

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
                                    <li class="breadcrumb-item">
                                        <a href="index.jsp">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Services
                                    </li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Services</h2>
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
                            <!-- Profile Sidebar -->
                            <div class="profile-sidebar">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <img
                                                src="../assets/img/doctors/doctor-thumb-02.jpg"
                                                alt="User Image"
                                                />
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>Customer Name</h3>

                                            <div class="patient-details">
                                                <h5 class="mb-0">
                                                    BDS, MDS - Oral & Maxillofacial Surgery
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li>
                                                <a href="appointments.html">
                                                    <i class="fas fa-calendar-check"></i>
                                                    <span>Appointments</span>
                                                </a>
                                            </li>
                                            <li class="active">
                                                <a href="my-patients.html">
                                                    <i class="fas fa-user-injured"></i>
                                                    <span>Services</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="schedule-timings.html">
                                                    <i class="fas fa-hourglass-start"></i>
                                                    <span>Schedule Timings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="invoices.html">
                                                    <i class="fas fa-file-invoice"></i>
                                                    <span>Invoices</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="reviews.html">
                                                    <i class="fas fa-star"></i>
                                                    <span>Reviews</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="chat-doctor.html">
                                                    <i class="fas fa-comments"></i>
                                                    <span>Message</span>
                                                    <small class="unread-msg">23</small>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="doctor-profile-settings.html">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="social-media.html">
                                                    <i class="fas fa-share-alt"></i>
                                                    <span>Social Media</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="doctor-change-password.html">
                                                    <i class="fas fa-lock"></i>
                                                    <span>Change Password</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="index-2.html">
                                                    <i class="fas fa-sign-out-alt"></i>
                                                    <span>Logout</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- /Profile Sidebar -->
                        </div>

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="row row-grid">
                                <c:forEach var="service" items="${list}">
                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                        <div class="card widget-profile pat-widget-profile">
                                            <div class="card-body">
                                                <div class="pro-widget-content">
                                                    <div class="profile-info-widget">
                                                        <a
                                                            href=""
                                                            class="booking-doc-img"
                                                            >
                                                            <img
                                                                src="../assets/img/patients/patient.jpg"
                                                                alt="User Image"
                                                                />
                                                        </a>
                                                        <div class="profile-det-info">
                                                            <h3>
                                                                <a href="#">${service.serviceName}</a>
                                                            </h3>

                                                            <div class="patient-details">
                                                                <h5>
                                                                    ${service.shortDescription}
                                                                </h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="patient-info">
                                                    <a
                                                        href="#"
                                                        class="btn btn-sm bg-info-light btn-block"
                                                        data-toggle="modal"
                                                        data-target="#${service.id}"
                                                        >
                                                        <i class="far fa-eye"></i> View detail
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
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
        <c:forEach var="service_detail" items="${list}">
            <div class="modal fade custom-modal" id="${service_detail.id}">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                                >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <ul class="info-details">
                                <li>
                                    <div class="details-header">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <span class="title">${service_detail.id}</span>
                                                <span class="text">21 Oct 2019 10:00 AM</span>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="text-right">
                                                    <button
                                                        type="button"
                                                        class="btn bg-success-light btn-sm"
                                                        id="topup_status"
                                                        >
                                                        ${service_detail.status == "1" ? "available": "inavailable"}
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <span class="title">${service_detail.serviceName}</span>
                                </li>
                                <li>
                                    <span class="title">Description:</span>
                                    <span class="text"
                                          >${service_detail.longDescription}</span
                                    >
                                </li>
                                <li>
                                    <span class="title">Price</span>
                                    <span class="text">$${service_detail.price}</span>
                                </li>
                                <li>
                                    <a
                                        href="javascript:void(0);"
                                        class="btn btn-sm bg-success-light btn-block"
                                        >
                                        <i class="fas fa-check"></i> Book now
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- jQuery -->
        <script src="../assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="../assets/js/popper.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="../assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="../assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="../assets/js/script.js"></script>
    </body>

    <!-- doccure/my-patients.html  30 Nov 2019 04:12:09 GMT -->
</html>
<h2 class="breadcrumb-title">My Patients</h2>
