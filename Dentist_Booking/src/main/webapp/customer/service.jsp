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



        <!-- Libraries Stylesheet -->
        <link href="../customer/lib/animate/animate.min.css" rel="stylesheet">
        <link href="../customer/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../customer/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../customer/css/bootstrap.min.css" rel="stylesheet">


        <style>
            .service-item {
                transition: .5s;
            }

            .service-item:hover {
                margin-top: -10px;
                box-shadow: 0 .5rem 1.5rem rgba(0, 0, 0, .08);
            }

            .service-item .btn {
                width: 40px;
                height: 40px;
                display: inline-flex;
                align-items: center;
                background: #FFFFFF;
                border-radius: 40px;
                white-space: nowrap;
                overflow: hidden;
                transition: .5s;
            }

            .service-item:hover .btn {
                width: 140px;
            }

        </style>

        <!-- Favicons -->
        <link href="../customer/assets/img/favicon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../customer/assets/css/bootstrap.min.css" />

        <!-- Fontawesome CSS -->
        <link
            rel="stylesheet"
            href="../customer/assets/plugins/fontawesome/css/fontawesome.min.css"
            />
        <link rel="stylesheet" href="../customer/assets/plugins/fontawesome/css/all.min.css" />

        <!-- Main CSS -->
        <link rel="stylesheet" href="../customer/assets/css/style.css" />

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
                <div class="breadcrumb-bar">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-8 col-12">
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
                            <div class="col-md-4 col-12 d-md-block d-none">
                                <div class="input-group">
                                    <div class="input-group-btn search-panel">
                                        <button type="button" class="btn btn-secondary dropdown-toggle" style="padding: 10px 20px;" data-toggle="dropdown">
                                            <span id="search_concept">Filter by</span> <span class="caret"></span>
                                        </button>
                                    <c:url var="sort" value="${request.contextPath}/service/sort">
                                    </c:url>
                                    <ul class="dropdown-menu" role="menu">
                                        <h5 class="ml-2 text-muted">Filter by price</h5>
                                        <li class="dropdown-item"><a href="sort?type=ASC">ASC</a></li>
                                        <li class="dropdown-item"><a href="sort?type=DESC">DESC</a></li>
                                    </ul>
                                </div>
                                <c:url var="search" value="${request.contextPath}/service/search">
                                </c:url>
                                <form style="display: flex;"  action="${search}">
                                    <input type="text" class="form-control mr-3 ml-3" style="border-radius: 4px;" name="name" placeholder="Search service name" aria-label="Search" aria-describedby="search-addon" value="${name}"/>
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary mr-20" style="padding: 10px 20px;" type="submit"><span><i class="fas fa-search"></i></span></button>
                                    </span>
                                </form>

                            </div>                                
                        </div>

                    </div>
                </div>
            </div>
            <!-- Page Header End -->


            <!-- Service Start -->

            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                        <p class="d-inline-block border rounded-pill py-1 px-4 ">Services</p>
                        <h1>Dental Care Solutions</h1>
                    </div>
                    <div>
                        <h3 style="text-align: center; color: #007bff; ${searchMsg != null ? "height: 600px; margin: auto;" : ""} ">${searchMsg}</h3>
                    </div>
                    <div class="row g-4">
                        <c:forEach var="service" items="${list}">
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="service-item bg-white rounded h-100 p-5 text-truncate-container">
                                    <div class="d-inline-flex align-items-center justify-content-center bg-white rounded-circle mb-4" style="width: 65px; height: 65px;">
                                        <i class="fa fa-tooth text-primary fs-4"></i>
                                    </div>
                                    <h4 style="color:#00cc00" class="mb-3">${service.serviceName}</h4>
                                    <p class="mb-4" style="display: -webkit-box;
                                       -webkit-line-clamp: 4;
                                       -webkit-box-orient: vertical;
                                       overflow: hidden;
                                       text-overflow: ellipsis;">${service.shortDescription}</p>
                                    <p>Price: ${service.price}$</p>
                                    <a
                                        href="#"
                                        class="btn btn-sm bg-info-light btn-block"                           
                                        data-toggle="modal"
                                        data-target="#${service.id}"
                                        >
                                        <i class="fa fa-plus text-primary me-3" ></i>  View detail
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- Service End -->
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
                                                <span class="title">${service_detail.serviceName}</span>
                                                <span class="text">${service_detail.id}</span>
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
                                        href="<%=request.getContextPath()%>/appointment/booking?serviceId=${service_detail.id}"
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
        <script src="../customer/assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="../customer/assets/js/popper.min.js"></script>
        <script src="../customer/assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="../customer/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="../customer/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="../assets/js/script.js"></script>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../customer/lib/wow/wow.min.js"></script>
        <script src="../customer/lib/easing/easing.min.js"></script>
        <script src="../customer/lib/waypoints/waypoints.min.js"></script>
        <script src="../customer/lib/counterup/counterup.min.js"></script>
        <script src="../customer/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="../customer/lib/tempusdominus/js/moment.min.js"></script>
        <script src="../customer/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="../customer/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="../customer/js/main.js"></script>

    </body>

    <!-- doccure/my-patients.html  30 Nov 2019 04:12:09 GMT -->
</html>