<%@page import="com.fptproject.SWP391.model.ClinicInformation"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/  30 Nov 2019 04:11:34 GMT -->
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Dental Clinic</title>

        <!-- Favicons -->
        <link type="image/x-icon" href="../customer/assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../customer/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="../customer/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="../customer/assets/plugins/fontawesome/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="../customer/assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.min.js"></script>
                <script src="assets/js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
    <% 
        ClinicInformation clinicInformation = (ClinicInformation)request.getServletContext().getAttribute("CLINIC_INFO");  
        if(clinicInformation==null){
            clinicInformation = new ClinicInformation();
        }
        String[] openTime = (String[])request.getServletContext().getAttribute("OPEN_TIME");
        String[] closeTime = (String[])request.getServletContext().getAttribute("CLOSE_TIME");
    %>
    <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <jsp:include flush="true" page="header.jsp"></jsp:include>
                <!-- /Header -->

                <!-- Home Banner -->
                <section class="section section-search">
                    <div class="container-fluid">
                        <div class="banner-wrapper">
                            <div class="banner-header text-center">
                            <c:if test="${sessionScope.Login_Customer == null}">
                                <h1>Please login to use the services</h1>
                                <p>Our Clinic open from <%= openTime[0] + ":" + openTime[1] %> to <%= closeTime[0] + ":" + closeTime[1] %> </p>
                            </c:if>
                            <c:if test="${sessionScope.Login_Customer != null}">
                                <h1>Welcome, ${sessionScope.Login_Customer.personalName}</h1>
                                <p style="margin-bottom: 5px">Our Clinic open from <%= openTime[0] + ":" + openTime[1] %> to <%= closeTime[0] + ":" + closeTime[1] %> </p>
                                <p>Search Doctor, Make an Appointment</p>
                            </c:if>

                        </div>

                        <!-- Search -->
                        <div class="search-box">
                            <form action="templateshub.net">
                                <div class="form-group search-location">
                                    <input type="text" class="form-control" placeholder="Search Location">
                                    <span class="form-text">Based on your Location</span>
                                </div>
                                <div class="form-group search-info">
                                    <input type="text" class="form-control" placeholder="Search Doctors, Clinics, Hospitals, Diseases Etc">
                                    <span class="form-text">Ex : Dental or Sugar Check up etc</span>
                                </div>
                                <button type="submit" class="btn btn-primary search-btn"><i class="fas fa-search"></i> <span>Search</span></button>
                            </form>
                        </div>
                        <!-- /Search -->

                    </div>
                </div>
            </section>
            <!-- /Home Banner -->

            <!-- Clinic and Specialities -->
            <section class="section section-specialities">
                <div class="container-fluid">
                    <div class="section-header text-center">
                        <h2>Services</h2>
                        <p class="sub-title">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-9">
                            <!-- Slider -->
                            <div class="specialities-slider slider">
                                <c:forEach var="service" items="${listService}">
                                    <!-- Slider Item -->
                                    <div class="speicality-item text-center">
                                        <div class="speicality-img">
                                            <img src="../customer/assets/img/specialities/specialities-05.png" class="img-fluid" alt="Service">
                                            <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                        </div>
                                        <p>${service.serviceName}</p>
                                    </div>	
                                    <!-- /Slider Item -->
                                </c:forEach>
                            </div>
                            <!-- /Slider -->

                        </div>
                    </div>
                </div>   
            </section>	 
            <!-- Clinic and Specialities -->

            <!-- Popular Section -->
            <section class="section section-doctor">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="section-header ">
                                <h2>Book Our Dentists</h2>
                                <p>Lorem Ipsum is simply dummy text </p>
                            </div>
                            <div class="about-content">
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</p>
                                <p>web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes</p>					
                                <a href="<%=request.getContextPath()%>/dentists/list">View More..</a>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="doctor-slider slider">
                                <c:forEach var="dentist" items="${listDentist}">
                                    <c:url var="dentistDetail" value="${request.contextPath}/dentists/detail">
                                        <c:param name="id" value="${dentist.id}"></c:param>
                                    </c:url>
                                    <!-- Doctor Widget -->
                                    <div class="profile-widget">
                                        <div class="doc-img">
                                            <a href="${dentistDetail}">
                                                <img class="img-fluid" alt="User Image" src="../customer/assets/img/doctors/doctor-02.jpg">
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="${dentistDetail}">${dentist.personalName}</a> 
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="speciality">${dentist.speciality}</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <span class="d-inline-block average-rating">(${dentist.rate})</span>
                                            </div>
                                            <ul class="available-info">
                                                <li>
                                                    <i class="fas fa-map-marker-alt"></i> Work & Experience: ${dentist.workingExperience} years
                                                </li>
                                            </ul>
                                            <div class="row row-sm">
                                                <div class="col-6">
                                                    <a href="${dentistDetail}" class="btn view-btn">View Profile</a>
                                                </div>
                                                <div class="col-6">
                                                    <a href="../customer/booking.jsp" class="btn book-btn">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Doctor Widget -->
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- /Popular Section -->

            <!-- Availabe Features -->
            <section class="section section-features">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-5 features-img">
                            <img src="../customer/assets/img/features/feature.png" class="img-fluid" alt="Feature">
                        </div>
                        <div class="col-md-7">
                            <div class="section-header">	
                                <h2 class="mt-2">Availabe Features in Our Clinic</h2>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. </p>
                            </div>	
                            <div class="features-slider slider">
                                <!-- Slider Item -->
                                <div class="feature-item text-center">
                                    <img src="../customer/assets/img/features/feature-01.jpg" class="img-fluid" alt="Feature">
                                    <p>Patient Ward</p>
                                </div>
                                <!-- /Slider Item -->

                                <!-- Slider Item -->
                                <div class="feature-item text-center">
                                    <img src="../customer/assets/img/features/feature-02.jpg" class="img-fluid" alt="Feature">
                                    <p>Test Room</p>
                                </div>
                                <!-- /Slider Item -->

                                <!-- Slider Item -->
                                <div class="feature-item text-center">
                                    <img src="../customer/assets/img/features/feature-03.jpg" class="img-fluid" alt="Feature">
                                    <p>ICU</p>
                                </div>
                                <!-- /Slider Item -->

                                <!-- Slider Item -->
                                <div class="feature-item text-center">
                                    <img src="../customer/assets/img/features/feature-04.jpg" class="img-fluid" alt="Feature">
                                    <p>Laboratory</p>
                                </div>
                                <!-- /Slider Item -->

                                <!-- Slider Item -->
                                <div class="feature-item text-center">
                                    <img src="../customer/assets/img/features/feature-05.jpg" class="img-fluid" alt="Feature">
                                    <p>Operation</p>
                                </div>
                                <!-- /Slider Item -->

                                <!-- Slider Item -->
                                <div class="feature-item text-center">
                                    <img src="../customer/assets/img/features/feature-06.jpg" class="img-fluid" alt="Feature">
                                    <p>Medical</p>
                                </div>
                                <!-- /Slider Item -->
                            </div>
                        </div>
                    </div>
                </div>
            </section>		
            <!-- Availabe Features -->

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

        <!-- Slick JS -->
        <script src="../customer/assets/js/slick.js"></script>

        <!-- Custom JS -->
        <script src="../customer/assets/js/script.js"></script>

    </body>

    <!-- doccure/  30 Nov 2019 04:11:53 GMT -->
</html>