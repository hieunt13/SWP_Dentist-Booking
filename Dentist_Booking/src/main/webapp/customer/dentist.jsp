<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/search.html  30 Nov 2019 04:12:16 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link href="../assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css">

        <!-- Datetimepicker CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap-datetimepicker.min.css">

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="../assets/plugins/select2/css/select2.min.css">

        <!-- Fancybox CSS -->
        <link rel="stylesheet" href="../assets/plugins/fancybox/jquery.fancybox.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="../assets/css/style.css">

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
                            <div class="col-md-8 col-12">
                                <nav aria-label="breadcrumb" class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="../customer/index.jsp">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Search</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Dentists</h2>
                            </div>
                            <div class="col-md-4 col-12 d-md-block d-none">
                                <form action="<%=request.getContextPath()%>/dentists/search">
                                <div class="sort-by">
                                    <input type="text" class="search-box" name="nameSearch" placeholder="Select Name" value="${nameSearch}">
                                    <div class="btn">
                                        <button type="submit" class="btn btn-google">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">

                            <!-- Search Filter -->
                            <div class="card search-filter">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Search Filter</h4>
                                </div>
                                <div class="card-body">
                                    <form action="<%=request.getContextPath()%>/dentists/sort">
                                        <div class="filter-widget">
                                            <h4>Select Specialist</h4>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="checkbox" name="select_specialist" checked>
                                                    <span class="checkmark"></span> Urology
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="checkbox" name="select_specialist" checked>
                                                    <span class="checkmark"></span> Neurology
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="checkbox" name="select_specialist">
                                                    <span class="checkmark"></span> Dentist
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="checkbox" name="select_specialist">
                                                    <span class="checkmark"></span> Orthopedic
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="checkbox" name="select_specialist">
                                                    <span class="checkmark"></span> Cardiologist
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="checkbox" name="select_specialist">
                                                    <span class="checkmark"></span> Cardiologist
                                                </label>
                                            </div>
                                        </div>
                                        <div class="btn-search">
                                            <button type="submit" class="btn btn-block">Sort</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /Search Filter -->

                        </div>

                        <div class="col-md-12 col-lg-8 col-xl-9">
                            <c:forEach var="dentist" items="${list}">
                                <c:url var="dentistDetail" value="${request.contextPath}/dentist/detail">
                                    <c:param name="id" value="${dentist.id}"></c:param>
                                </c:url>
                                <!-- Doctor Widget -->
                                <div class="card">
                                    <div class="card-body">
                                        <div class="doctor-widget">
                                            <div class="doc-info-left">
                                                <div class="doctor-img">
                                                    <a href="${dentistDetail}">
                                                        <img src="../assets/img/doctors/doctor-thumb-01.jpg" class="img-fluid" alt="User Image">
                                                    </a>
                                                </div>
                                                <div class="doc-info-cont">
                                                    <h4 class="doc-name"><a href="doctor-profile.html">${dentist.personalName}</a></h4>
                                                    <p class="doc-speciality">MDS - Periodontology and Oral Implantology, BDS</p>
                                                    <h5 class="doc-department"><img src="../assets/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">Dentist</h5>
                                                    <div class="rating">
                                                        <i class="fas fa-star filled"></i>

                                                        <span class="d-inline-block average-rating">(${dentist.rate})</span>
                                                    </div>
                                                    <div class="clinic-details">
                                                        <p class="doc-location"><i class="fas fa-map-marker-alt"></i> TP.HCM, VIETNAM</p>
                                                        <ul class="clinic-gallery">
                                                            <li>
                                                                <a href="../assets/img/features/feature-01.jpg" data-fancybox="gallery">
                                                                    <img src="../assets/img/features/feature-01.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="../assets/img/features/feature-02.jpg" data-fancybox="gallery">
                                                                    <img  src="../assets/img/features/feature-02.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="../assets/img/features/feature-03.jpg" data-fancybox="gallery">
                                                                    <img src="../assets/img/features/feature-03.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="../assets/img/features/feature-04.jpg" data-fancybox="gallery">
                                                                    <img src="../assets/img/features/feature-04.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="doc-info-right">
                                                <div class="clini-infos">
                                                    <ul>

                                                        <li><i class="far fa-comment"></i> 17 Feedback</li>
                                                        <li><i class="fas fa-map-marker-alt"></i> TP.HCM, VIETNAM</li>
                                                    </ul>
                                                </div>
                                                <div class="clinic-booking">
                                                    <a class="view-pro-btn" href="${dentistDetail}">View Profile</a>
                                                    <a class="apt-btn" href="../customer/booking.jsp">Book Appointment</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Doctor Widget -->
                            </c:forEach>
                            <div class="load-more text-center">
                                <a class="btn btn-primary btn-sm" href="javascript:void(0);">Load More</a>	
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
        <script src="../assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="../assets/js/popper.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="../assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="../assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Select2 JS -->
        <script src="../assets/plugins/select2/js/select2.min.js"></script>

        <!-- Datetimepicker JS -->
        <script src="../assets/js/moment.min.js"></script>
        <script src="../assets/js/bootstrap-datetimepicker.min.js"></script>

        <!-- Fancybox JS -->
        <script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/search.html  30 Nov 2019 04:12:16 GMT -->
</html>