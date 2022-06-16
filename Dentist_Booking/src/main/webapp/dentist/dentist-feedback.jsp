<%-- 
    Document   : dentist-feedback
    Created on : May 21, 2022, 12:18:49 PM
    Author     : hieunguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/reviews.html  30 Nov 2019 04:12:15 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link href="../dentist/assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../dentist/assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="../dentist/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="../dentist/assets/plugins/fontawesome/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="../dentist/assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.min.js"></script>
                <script src="assets/js/respond.min.js"></script>
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
                                        <li class="breadcrumb-item active" aria-current="page">Reviews</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Reviews</h2>
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

                                <!-- Profile Side Bar -->
                            <jsp:include flush="true" page="profile-sidebar.jsp"></jsp:include>
                                <!-- /Profile Side Bar -->

                            </div>
                            <div class="col-md-7 col-lg-8 col-xl-9">
                                <div class="doc-review review-listing">

                                    <!-- Review Listing -->
                                    <ul class="comments-list">

                                        <!-- Comment List -->
                                    <c:forEach var="feedback" items="${map}">
                                        <!-- Comment List -->
                                        <li>
                                            <div class="comment">
                                                <img class="avatar rounded-circle" alt="User Image" src="../dentist/assets/img/patients/patient.jpg">
                                                <div class="comment-body">
                                                    <div class="meta-data">
                                                        <span class="comment-author">${feedback.key.personalName}</span>
                                                        <span class="comment-date">Reviewed on appointment: ${feedback.value.appointmentId}</span>
                                                        <div class="review-count rating">
                                                            <c:if test="${feedback.value.dentistRating <= 1}">
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star "></i>
                                                                <i class="fas fa-star "></i>
                                                                <i class="fas fa-star "></i>
                                                                <i class="fas fa-star "></i>
                                                            </c:if>
                                                            <c:if test="${feedback.value.dentistRating <= 2 && feedback.value.dentistRating > 1}">
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </c:if>
                                                            <c:if test="${feedback.value.dentistRating <= 3 && feedback.value.dentistRating > 2}">
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </c:if>
                                                            <c:if test="${feedback.value.dentistRating <= 4 && feedback.value.dentistRating > 3}">
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star"></i>
                                                            </c:if>
                                                            <c:if test="${feedback.value.dentistRating <= 5 && feedback.value.dentistRating > 4}">
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                            </c:if>
                                                            ${feedback.value.dentistRating}
                                                        </div>
                                                    </div>
                                                    <p class="recommended"><i class="far fa-thumbs-up"></i> I recommend the doctor</p>
                                                    <p class="comment-content">
                                                        ${feedback.value.dentistMessage}
                                                    </p>
                                                    <div class="comment-reply">
                                                        <a class="comment-btn" href="#">
                                                            <i class="fas fa-reply"></i> Reply
                                                        </a>
                                                        <p class="recommend-btn">
                                                            <span>Recommend?</span>
                                                            <a href="#" class="like-btn">
                                                                <i class="far fa-thumbs-up"></i> Yes
                                                            </a>
                                                            <a href="#" class="dislike-btn">
                                                                <i class="far fa-thumbs-down"></i> No
                                                            </a>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                        </li>
                                        <!-- /Comment List -->
                                        
                                    </c:forEach>
                                </ul>
                                <!-- /Comment List -->
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
        <script src="../dentist/assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="../dentist/assets/js/popper.min.js"></script>
        <script src="../dentist/assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="../dentist/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="../dentist/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="../dentist/assets/js/script.js"></script>

    </body>

    <!-- doccure/reviews.html  30 Nov 2019 04:12:15 GMT -->
</html>
