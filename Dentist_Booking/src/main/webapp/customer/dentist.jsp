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
        <link href="<%=request.getContextPath()%>/customer/assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/plugins/fontawesome/css/all.min.css">

        <!-- Datetimepicker CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/css/bootstrap-datetimepicker.min.css">

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/plugins/select2/css/select2.min.css">

        <!-- Fancybox CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/plugins/fancybox/jquery.fancybox.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/css/style.css">

<!--         HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries 
        [if lt IE 9]>-->
                <script src="<%=request.getContextPath()%>/customer/assets/js/html5shiv.min.js"></script>
                <script src="<%=request.getContextPath()%>/customer/assets/js/respond.min.js"></script>
<!--        <![endif]-->

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
                                        <li class="breadcrumb-item "><a href="../home/mainpage">Home</a></li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title active">Dentists</h2>
                            </div>
                            <div class="col-md-4 col-12 d-md-block d-none">

                            <c:url var="search" value="${request.contextPath}//dentists/search">
                            </c:url>
                            <form style="display: flex;"  action="${search}">
                                <input type="text" class="form-control mr-3 ml-3" style="border-radius: 4px;" name="nameSearch" placeholder="Search Name" aria-label="Search" aria-describedby="search-addon" value="${nameSearch}" />
                                <span class="input-group-btn">
                                    <button class="btn btn-primary mr-20" style="padding: 10px 20px;" type="submit"><span><i class="fas fa-search"></i></span></button>
                                </span>
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
                                    <h4 class="card-title mb-0">Sort</h4>
                                </div>
                                <div class="card-body">
                                    <form action="<%=request.getContextPath()%>/dentists/sort">
                                        <div class="filter-widget">
                                            <h4>Rating</h4>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="radio" name="column" value="rate-ASC" ${sortRequest == "rate-ASC" ? "checked":""}>
                                                    <span class="checkmark"></span> Ascending
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="radio" name="column" value="rate-DESC" ${sortRequest == "rate-DESC" ? "checked":""}>
                                                    <span class="checkmark"></span> Descending
                                                </label>
                                            </div>
                                        </div>
                                        <div class="filter-widget">
                                            <h4>Years of work</h4>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="radio" name="column" value="working_experience-ASC" ${sortRequest == "working_experience-ASC" ? "checked":""}>
                                                    <span class="checkmark"></span> Ascending
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="radio" name="column" value="working_experience-DESC" ${sortRequest == "working_experience-DESC" ? "checked":""}>
                                                    <span class="checkmark"></span> Descending
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
                            <div>
                                <h3 style="text-align: center; color: #007bff;">${searchMsg}</h3>
                            </div>
                            <c:forEach var="dentist" items="${list}">
                                <c:url var="dentistDetail" value="${request.contextPath}/dentists/detail">
                                    <c:param name="id" value="${dentist.id}"></c:param>
                                </c:url>
                                <!-- Doctor Widget -->
                                <div class="card">
                                    <div class="card-body">
                                        <div class="doctor-widget">
                                            <div class="doc-info-left">
                                                <div class="doctor-img">
                                                    <a href="${dentistDetail}">
                                                        <img src="<%=request.getContextPath()%>/dentist/${dentist.image}" class="img-fluid" alt="User Image">
                                                    </a>
                                                </div>
                                                <div class="doc-info-cont">
                                                    <h4 class="doc-name"><a href="${dentistDetail}">${dentist.personalName}</a></h4>
                                                    <p class="doc-speciality">${dentist.speciality}</p>
                                                    <h5 class="doc-department"><img src="../customer/assets/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">Dentist</h5>
                                                    <div class="rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <span class="d-inline-block average-rating">(${dentist.rate})</span>
                                                    </div>
                                                    <p> <i class="fas fa-archive"></i> Work & Experience: ${dentist.workingExperience} years</p>
                                                    <div class="clinic-details">
                                                        <p> <i class="fas fa-award"></i>  ${dentist.award}</p>

                                                        <ul class="clinic-gallery">
                                                            <li>
                                                                <a href="../customer/assets/img/features/feature-01.jpg" data-fancybox="gallery">
                                                                    <img src="../customer/assets/img/features/feature-01.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="../customer/assets/img/features/feature-02.jpg" data-fancybox="gallery">
                                                                    <img  src="../customer/assets/img/features/feature-02.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="../customer/assets/img/features/feature-03.jpg" data-fancybox="gallery">
                                                                    <img src="../assets/img/features/feature-03.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="../customer/assets/img/features/feature-04.jpg" data-fancybox="gallery">
                                                                    <img src="../customer/assets/img/features/feature-04.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="doc-info-right">
                                                <div class="clini-infos">
                                                    <ul>
                                                        
                                                    </ul>
                                                </div>
                                                <div class="clinic-booking">
                                                    <a class="view-pro-btn" href="${dentistDetail}">View Profile</a>
                                                    <a class="apt-btn" href="../appointment/booking?dentistId=${dentist.id}">Book Appointment</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Doctor Widget -->
                            </c:forEach>
                            <!--                            <div class="load-more text-center">
                                                            <a class="btn btn-primary btn-sm" href="javascript:void(0);">Load More</a>	
                                                        </div>	-->
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
        <script src="../customer/assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="../customer/assets/js/popper.min.js"></script>
        <script src="../customer/assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="../customer/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="../customer/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Select2 JS -->
        <script src="../customer/assets/plugins/select2/js/select2.min.js"></script>

        <!-- Datetimepicker JS -->
        <script src="../customer/assets/js/moment.min.js"></script>
        <script src="../customer/assets/js/bootstrap-datetimepicker.min.js"></script>

        <!-- Fancybox JS -->
        <script src="../customer/assets/plugins/fancybox/jquery.fancybox.min.js"></script>

        <!-- Custom JS -->
        <script src="../customer/assets/js/script.js"></script>

    </body>

    <!-- doccure/search.html  30 Nov 2019 04:12:16 GMT -->
</html>