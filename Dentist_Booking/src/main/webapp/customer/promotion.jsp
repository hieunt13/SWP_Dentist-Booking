<%-- 
    Document   : promotion
    Created on : May 21, 2022, 12:54:14 PM
    Author     : hieunguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- doccure/favourites.html  30 Nov 2019 04:12:16 GMT -->
    <head>
        <meta charset="utf-8" />
        <title>Dental Clinic</title>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=0"
            />

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

        <!-- Fontawesome CSS -->
        <link
            rel="stylesheet"
            href="assets/plugins/fontawesome/css/fontawesome.min.css"
            />
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css" />

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css" />

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
                                        <a href="index-2.html">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Promotion
                                    </li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Promotion</h2>
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
                            <div class="profile-sidebar">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <img
                                                src="assets/img/patients/patient.jpg"
                                                alt="User Image"
                                                />
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>Richard Wilson</h3>
                                            <div class="patient-details">
                                                <h5>
                                                    <i class="fas fa-birthday-cake"></i> 24 Jul 1983, 38
                                                    years
                                                </h5>
                                                <h5 class="mb-0">
                                                    <i class="fas fa-map-marker-alt"></i> Newyork, USA
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li>
                                                <a href="patient-dashboard.html">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Dashboard</span>
                                                </a>
                                            </li>
                                            <li class="active">
                                                <a href="favourites.html">
                                                    <i class="fas fa-bookmark"></i>
                                                    <span>Favourites</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="chat.html">
                                                    <i class="fas fa-comments"></i>
                                                    <span>Message</span>
                                                    <small class="unread-msg">23</small>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="profile-settings.html">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="change-password.html">
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
                        </div>
                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="row row-grid">
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="profile-widget">
                                        <div class="doc-img">
                                            <a href="doctor-profile.html">
                                                <img
                                                    class="img-fluid"
                                                    alt="User Image"
                                                    src="assets/img/doctors/doctor-01.jpg"
                                                    />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.html">Summer Discount</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <div class="patient-details">
                                                <h5>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing
                                                    elit. Etiam tristique quam ut nulla pellentesque
                                                </h5>
                                            </div>

                                            <ul class="available-info">
                                                <li><i class="far fa-clock"></i> Expires in 4 days</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> Discount 25%
                                                    <i
                                                        class="fas fa-info-circle"
                                                        data-toggle="tooltip"
                                                        title="Lorem Ipsum"
                                                        ></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a
                                                        href="#"
                                                        class="btn btn-sm view-btn"
                                                        data-toggle="modal"
                                                        data-target="#promotion_details"
                                                        >View Detail</a
                                                    >
                                                </div>
                                                <div class="col-6">
                                                    <a href="booking.html" class="btn book-btn"
                                                       >Redeem Now</a
                                                    >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="profile-widget">
                                        <div class="doc-img">
                                            <a href="doctor-profile.html">
                                                <img
                                                    class="img-fluid"
                                                    alt="User Image"
                                                    src="assets/img/doctors/doctor-01.jpg"
                                                    />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.html">Summer Discount</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <div class="patient-details">
                                                <h5>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing
                                                    elit. Etiam tristique quam ut nulla pellentesque
                                                </h5>
                                            </div>

                                            <ul class="available-info">
                                                <li><i class="far fa-clock"></i> Expires in 4 days</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> Discount 25%
                                                    <i
                                                        class="fas fa-info-circle"
                                                        data-toggle="tooltip"
                                                        title="Lorem Ipsum"
                                                        ></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a
                                                        href="#"
                                                        class="btn btn-sm view-btn"
                                                        data-toggle="modal"
                                                        data-target="#promotion_details"
                                                        >View Detail</a
                                                    >
                                                </div>
                                                <div class="col-6">
                                                    <a href="booking.html" class="btn book-btn"
                                                       >Redeem Now</a
                                                    >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="profile-widget">
                                        <div class="doc-img">
                                            <a href="doctor-profile.html">
                                                <img
                                                    class="img-fluid"
                                                    alt="User Image"
                                                    src="assets/img/doctors/doctor-01.jpg"
                                                    />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.html">Summer Discount</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <div class="patient-details">
                                                <h5>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing
                                                    elit. Etiam tristique quam ut nulla pellentesque
                                                </h5>
                                            </div>

                                            <ul class="available-info">
                                                <li><i class="far fa-clock"></i> Expires in 4 days</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> Discount 25%
                                                    <i
                                                        class="fas fa-info-circle"
                                                        data-toggle="tooltip"
                                                        title="Lorem Ipsum"
                                                        ></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a
                                                        href="#"
                                                        class="btn btn-sm view-btn"
                                                        data-toggle="modal"
                                                        data-target="#promotion_details"
                                                        >View Detail</a
                                                    >
                                                </div>
                                                <div class="col-6">
                                                    <a href="booking.html" class="btn book-btn"
                                                       >Redeem Now</a
                                                    >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="profile-widget">
                                        <div class="doc-img">
                                            <a href="doctor-profile.html">
                                                <img
                                                    class="img-fluid"
                                                    alt="User Image"
                                                    src="assets/img/doctors/doctor-01.jpg"
                                                    />
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor-profile.html">Summer Discount</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <div class="patient-details">
                                                <h5>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing
                                                    elit. Etiam tristique quam ut nulla pellentesque
                                                </h5>
                                            </div>

                                            <ul class="available-info">
                                                <li><i class="far fa-clock"></i> Expires in 4 days</li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> Discount 25%
                                                    <i
                                                        class="fas fa-info-circle"
                                                        data-toggle="tooltip"
                                                        title="Lorem Ipsum"
                                                        ></i>
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a
                                                        href="#"
                                                        class="btn btn-sm view-btn"
                                                        data-toggle="modal"
                                                        data-target="#promotion_details"
                                                        >View Detail</a
                                                    >
                                                </div>
                                                <div class="col-6">
                                                    <a href="booking.html" class="btn book-btn"
                                                       >Redeem Now</a
                                                    >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
        <div class="modal fade custom-modal" id="promotion_details">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Promotion Details</h5>
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
                                            <span class="title">#APT0001</span>
                                            <span class="text">Expires on 21 Oct 2022 10:00 AM</span>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="text-right">
                                                <button
                                                    type="button"
                                                    class="btn bg-success-light btn-sm"
                                                    id="topup_status"
                                                    >
                                                    Available
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="title">Promotion Name:</span>
                                <span class="text">Summer Discount</span>
                            </li>
                            <li>
                                <span class="title">Description:</span>
                                <span class="text"
                                      >Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed
                                    laoreet magna fermentum consequat varius. Morbi consequat
                                    mauris eu molestie accumsan. Suspendisse dapibus dignissim ex,
                                    et rhoncus lectus rutrum et.</span
                                >
                            </li>
                            <li>
                                <span class="title">Discount Amount</span>
                                <span class="text">25%</span>
                            </li>
                            <li>
                                <a
                                    href="javascript:void(0);"
                                    class="btn btn-sm bg-success-light btn-block"
                                    >
                                    <i class="fas fa-check"></i> Redeem now
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
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

    <!-- doccure/favourites.html  30 Nov 2019 04:12:17 GMT -->
</html>

