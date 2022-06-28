<%-- 
    Document   : dentist-detail
    Created on : May 21, 2022, 12:36:56 PM
    Author     : hieunguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/doctor-profile.html  30 Nov 2019 04:12:16 GMT -->
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

        <!-- Fancybox CSS -->
        <link rel="stylesheet" href="../assets/plugins/fancybox/jquery.fancybox.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="../assets/css/style.css">

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
                                        <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/home/mainpage">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Dentist Profile</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Dentist Profile</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container">

                    <!-- Doctor Widget -->
                    <div class="card">
                        <div class="card-body">
                            <div class="doctor-widget">
                                <div class="doc-info-left">
                                    <div class="doctor-img">
                                        <img src="<%=request.getContextPath()%>/dentist/${dentist.image}" class="img-fluid" alt="User Image">
                                    </div>
                                    <div class="doc-info-cont">
                                        <h4 class="doc-name">${dentist.personalName}</h4>
                                        <p class="doc-department"><img src="../assets/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">Dentist</p>
                                        <div class="rating">
                                            <i class="fas fa-star filled"></i>
                                            <span class="d-inline-block average-rating">(${dentist.rate})</span>
                                        </div>
                                        <div class="clinic-details">
                                            <ul class="clinic-gallery">
                                                <li>
                                                    <a href="../assets/img/features/feature-01.jpg" data-fancybox="gallery">
                                                        <img src="../assets/img/features/feature-01.jpg" alt="Feature">
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="../assets/img/features/feature-02.jpg" data-fancybox="gallery">
                                                        <img  src="../assets/img/features/feature-02.jpg" alt="Feature Image">
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
                                        <div class="clinic-services">
                                            <span>${dentist.speciality}</span>                            
                                        </div>
                                    </div>
                                </div>
                                <div class="doc-info-right">
                                    <div class="clini-infos">
                                        <ul>
                                            <li><i class="far fa-comment"></i> 35 Feedback</li>
                                        </ul>
                                    </div>
                                    <div class="doctor-action">
                                        <a href="javascript:void(0)" class="btn btn-white fav-btn">
                                            <i class="far fa-bookmark"></i>
                                        </a>
                                        <a href="../customer/chat.jsp" class="btn btn-white msg-btn">
                                            <i class="far fa-comment-alt"></i>
                                        </a>
                                        <a href="javascript:void(0)" class="btn btn-white call-btn" data-toggle="modal" data-target="#voice_call">
                                            <i class="fas fa-phone"></i>
                                        </a>
                                        <a href="javascript:void(0)" class="btn btn-white call-btn" data-toggle="modal" data-target="#video_call">
                                            <i class="fas fa-video"></i>
                                        </a>
                                    </div>
                                    <div class="clinic-booking">
                                        <a class="apt-btn" href="<%=request.getContextPath()%>/appointment/booking?dentistId=${dentist.id}">Book Appointment</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Doctor Widget -->

                    <!-- Doctor Details Tab -->
                    <div class="card">
                        <div class="card-body pt-0">

                            <!-- Tab Menu -->
                            <nav class="user-tabs mb-4">
                                <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#doc_overview" data-toggle="tab">Overview</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#doc_reviews" data-toggle="tab">Reviews</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#doc_business_hours" data-toggle="tab">Business Hours</a>
                                    </li>
                                </ul>
                            </nav>
                            <!-- /Tab Menu -->

                            <!-- Tab Content -->
                            <div class="tab-content pt-0">

                                <!-- Overview Content -->
                                <div role="tabpanel" id="doc_overview" class="tab-pane fade show active">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-9">

                                            <!-- About Details -->
                                            <div class="widget about-widget">
                                                <h4 class="widget-title">About Me</h4>
                                                <p>${dentist.description}</p>
                                            </div>
                                            <!-- /About Details -->

                                            <!-- Education Details -->
                                            <div class="widget education-widget">
                                                <h4 class="widget-title">Education</h4>
                                                <div class="experience-box">
                                                    <ul class="experience-list">
                                                        <li>
                                                            <div class="experience-user">
                                                                <div class="before-circle"></div>
                                                            </div>
                                                            <div class="experience-content">
                                                                <div class="timeline-content">
                                                                    <a href="#/" class="name">${dentist.education}</a>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- /Education Details -->

                                            <!-- Experience Details -->
                                            <div class="widget experience-widget">
                                                <h4 class="widget-title">Work & Experience</h4>
                                                <div class="experience-box">
                                                    <ul class="experience-list">
                                                        <li>
                                                            <div class="experience-user">
                                                                <div class="before-circle"></div>
                                                            </div>
                                                            <div class="experience-content">
                                                                <div class="timeline-content">
                                                                    <a href="#/" class="name">Years working on dental clinic</a>
                                                                    <span class="time">${dentist.workingExperience} years</span>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- /Experience Details -->

                                            <!-- Awards Details -->
                                            <div class="widget awards-widget">
                                                <h4 class="widget-title">Awards</h4>
                                                <div class="experience-box">
                                                    <ul class="experience-list">
                                                        <li>
                                                            <div class="experience-user">
                                                                <div class="before-circle"></div>
                                                            </div>
                                                            <div class="experience-content">
                                                                <div class="timeline-content">   
                                                                    <h4 class="exp-title">${dentist.award}</h4>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- /Awards Details -->
                                        </div>
                                    </div>
                                </div>
                                <!-- /Overview Content -->


                                <!-- Reviews Content -->
                                <div role="tabpanel" id="doc_reviews" class="tab-pane fade">

                                    <!-- Review Listing -->
                                    <div class="widget review-listing">
                                        <ul class="comments-list">
                                            <!-- Comment List -->
                                            <h4 style="text-align: center; color: #007bff;"> ${listFeedback.size() < 1 ? "There aren't any feedback yet!" : ""} </h4>
                                            <c:forEach var="feedback" items="${listFeedback}">
                                                <!-- Comment List -->
                                                <li>
                                                    <div class="comment" style="width: 100%">
                                                        <img class="avatar rounded-circle" alt="User Image" src="../dentist/${feedback.appointment.customer.image}">
                                                        <div class="comment-body" style="width: inherit">
                                                            <div class="meta-data">
                                                                <span class="comment-author">${feedback.appointment.customer.personalName}</span>
                                                                <span class="comment-date">Reviewed on appointment: ${feedback.appointmentId}</span>
                                                                <div class="review-count rating">
                                                                    <c:if test="${feedback.dentistRating <= 1}">
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star "></i>
                                                                        <i class="fas fa-star "></i>
                                                                        <i class="fas fa-star "></i>
                                                                        <i class="fas fa-star "></i>
                                                                    </c:if>
                                                                    <c:if test="${feedback.dentistRating <= 2 && feedback.dentistRating > 1}">
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                    </c:if>
                                                                    <c:if test="${feedback.dentistRating <= 3 && feedback.dentistRating > 2}">
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star"></i>
                                                                        <i class="fas fa-star"></i>
                                                                    </c:if>
                                                                    <c:if test="${feedback.dentistRating <= 4 && feedback.dentistRating > 3}">
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star"></i>
                                                                    </c:if>
                                                                    <c:if test="${feedback.dentistRating <= 5 && feedback.dentistRating > 4}">
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                    </c:if>
                                                                    ${feedback.dentistRating}
                                                                </div>
                                                            </div>
                                                            <p class="recommended"><i class="far fa-thumbs-up"></i> I recommend the doctor</p>
                                                            <p class="comment-content">
                                                                ${feedback.dentistMessage}
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

<!--                                         Show All 
                                        <div class="all-feedback text-center">
                                            <a href="#" class="btn btn-primary btn-sm">
                                                Show all feedback <strong></strong>
                                            </a>
                                        </div>
                                         /Show All -->

                                    </div>
                                    <!-- /Review Listing -->

                                    <!-- Write Review -->
                                    <div class="write-review">
                                        <h4>Write a review for <strong>Dr. Darren Elder</strong></h4>

                                        <!-- Write Review Form -->
                                        <form>
                                            <div class="form-group">
                                                <label>Review</label>
                                                <div class="star-rating">
                                                    <input id="star-5" type="radio" name="rating" value="star-5">
                                                    <label for="star-5" title="5 stars">
                                                        <i class="active fa fa-star"></i>
                                                    </label>
                                                    <input id="star-4" type="radio" name="rating" value="star-4">
                                                    <label for="star-4" title="4 stars">
                                                        <i class="active fa fa-star"></i>
                                                    </label>
                                                    <input id="star-3" type="radio" name="rating" value="star-3">
                                                    <label for="star-3" title="3 stars">
                                                        <i class="active fa fa-star"></i>
                                                    </label>
                                                    <input id="star-2" type="radio" name="rating" value="star-2">
                                                    <label for="star-2" title="2 stars">
                                                        <i class="active fa fa-star"></i>
                                                    </label>
                                                    <input id="star-1" type="radio" name="rating" value="star-1">
                                                    <label for="star-1" title="1 star">
                                                        <i class="active fa fa-star"></i>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Title of your review</label>
                                                <input class="form-control" type="text" placeholder="If you could say it in one sentence, what would you say?">
                                            </div>
                                            <div class="form-group">
                                                <label>Your review</label>
                                                <textarea id="review_desc" maxlength="100" class="form-control"></textarea>

                                                <div class="d-flex justify-content-between mt-3"><small class="text-muted"><span id="chars">100</span> characters remaining</small></div>
                                            </div>
                                            <hr>
                                            <div class="form-group">
                                                <div class="terms-accept">
                                                    <div class="custom-checkbox">
                                                        <input type="checkbox" id="terms_accept">
                                                        <label for="terms_accept">I have read and accept <a href="#">Terms &amp; Conditions</a></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="submit-section">
                                                <button type="submit" class="btn btn-primary submit-btn">Add Review</button>
                                            </div>
                                        </form>
                                        <!-- /Write Review Form -->

                                    </div>
                                    <!-- /Write Review -->

                                </div>
                                <!-- /Reviews Content -->

                                <!-- Business Hours Content -->
                                <div role="tabpanel" id="doc_business_hours" class="tab-pane fade">
                                    <div class="row">
                                        <div class="col-md-6 offset-md-3">

                                            <!-- Business Hours Widget -->
                                            <div class="widget business-widget">
                                                <div class="widget-content">
                                                    <div class="listing-hours">
                                                        <div class="listing-day current">
                                                            <div class="day">Monday</div>
                                                            <div class="time-items">
                                                                <c:forEach var="time" items="${mondaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <span class="time">07:00 AM - 08:30 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <span class="time">08:45 AM - 10:15 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <span class="time">10:30 AM - 12:00 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <span class="time">13:00 PM - 14:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <span class="time">15:00 PM - 16:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:set var="check" value="false"/>
                                                                <c:forEach var="time" items="${mondaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == false}">
                                                                    <span class="time"><span class="badge bg-danger-light">Closed</span></span>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                        <div class="listing-day current">
                                                            <div class="day">Tuesday</div>
                                                            <div class="time-items">
                                                                <c:forEach var="time" items="${tuesdaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <span class="time">07:00 AM - 08:30 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <span class="time">08:45 AM - 10:15 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <span class="time">10:30 AM - 12:00 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <span class="time">13:00 PM - 14:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <span class="time">15:00 PM - 16:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:set var="check" value="false"/>
                                                                <c:forEach var="time" items="${tuesdaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == false}">
                                                                    <span class="time"><span class="badge bg-danger-light">Closed</span></span>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                        <div class="listing-day current">
                                                            <div class="day">Wednesday</div>
                                                            <div class="time-items">
                                                                <c:forEach var="time" items="${wednesdaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <span class="time">07:00 AM - 08:30 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <span class="time">08:45 AM - 10:15 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <span class="time">10:30 AM - 12:00 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <span class="time">13:00 PM - 14:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <span class="time">15:00 PM - 16:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:set var="check" value="false"/>
                                                                <c:forEach var="time" items="${wednesdaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == false}">
                                                                    <span class="time"><span class="badge bg-danger-light">Closed</span></span>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                        <div class="listing-day current">
                                                            <div class="day">Thursday</div>
                                                            <div class="time-items">
                                                                <c:forEach var="time" items="${thursdaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <span class="time">07:00 AM - 08:30 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <span class="time">08:45 AM - 10:15 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <span class="time">10:30 AM - 12:00 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <span class="time">13:00 PM - 14:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <span class="time">15:00 PM - 16:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:set var="check" value="false"/>
                                                                <c:forEach var="time" items="${thursdaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == false}">
                                                                    <span class="time"><span class="badge bg-danger-light">Closed</span></span>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                        <div class="listing-day current">
                                                            <div class="day">Friday</div>
                                                            <div class="time-items">
                                                                <c:forEach var="time" items="${fridaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <span class="time">07:00 AM - 08:30 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <span class="time">08:45 AM - 10:15 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <span class="time">10:30 AM - 12:00 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <span class="time">13:00 PM - 14:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <span class="time">15:00 PM - 16:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:set var="check" value="false"/>
                                                                <c:forEach var="time" items="${fridaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == false}">
                                                                    <span class="time"><span class="badge bg-danger-light">Closed</span></span>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                        <div class="listing-day current">
                                                            <div class="day">Saturday</div>
                                                            <div class="time-items">
                                                                <c:forEach var="time" items="${saturdaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <span class="time">07:00 AM - 08:30 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <span class="time">08:45 AM - 10:15 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <span class="time">10:30 AM - 12:00 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <span class="time">13:00 PM - 14:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <span class="time">15:00 PM - 16:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                </c:forEach>
                                                                        
                                                                <c:set var="check" value="false"/>
                                                                <c:forEach var="time" items="${saturdaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == false}">
                                                                    <span class="time"><span class="badge bg-danger-light">Closed</span></span>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                        <div class="listing-day current">
                                                            <div class="day">Sunday</div>
                                                            <div class="time-items">
                                                                <c:forEach var="time" items="${sundaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <span class="time">07:00 AM - 08:30 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <span class="time">08:45 AM - 10:15 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <span class="time">10:30 AM - 12:00 AM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <span class="time">13:00 PM - 14:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <span class="time">15:00 PM - 16:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <span class="time">17:00 PM - 18:30 PM</span>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:set var="check" value="false"/>
                                                                <c:forEach var="time" items="${sundaySchedule}">
                                                                    <c:if test="${time.slot == 1}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 2}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 3}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 4}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 5}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                    <c:if test="${time.slot == 6}">
                                                                        <c:set var="check" value="true"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == false}">
                                                                    <span class="time"><span class="badge bg-danger-light">Closed</span></span>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Business Hours Widget -->

                                        </div>
                                    </div>
                                </div>
                                <!-- /Business Hours Content -->

                            </div>
                        </div>
                    </div>
                    <!-- /Doctor Details Tab -->

                </div>
            </div>		
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include flush="true" page="footer.jsp"></jsp:include>
            <!-- /Footer -->

        </div>
        <!-- /Main Wrapper -->

        <!-- Voice Call Modal -->
        <div class="modal fade call-modal" id="voice_call">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <!-- Outgoing Call -->
                        <div class="call-box incoming-box">
                            <div class="call-wrapper">
                                <div class="call-inner">
                                    <div class="call-user">
                                        <img alt="User Image" src="../assets/img/doctors/doctor-thumb-02.jpg" class="call-avatar">
                                        <h4>Dr. Darren Elder</h4>
                                        <span>Connecting...</span>
                                    </div>							
                                    <div class="call-items">
                                        <a href="javascript:void(0);" class="btn call-item call-end" data-dismiss="modal" aria-label="Close"><i class="material-icons">call_end</i></a>
                                        <a href="voice-call.html" class="btn call-item call-start"><i class="material-icons">call</i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Outgoing Call -->

                    </div>
                </div>
            </div>
        </div>
        <!-- /Voice Call Modal -->

        <!-- Video Call Modal -->
        <div class="modal fade call-modal" id="video_call">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">

                        <!-- Incoming Call -->
                        <div class="call-box incoming-box">
                            <div class="call-wrapper">
                                <div class="call-inner">
                                    <div class="call-user">
                                        <img class="call-avatar" src="../assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
                                        <h4>Dr. Darren Elder</h4>
                                        <span>Calling ...</span>
                                    </div>							
                                    <div class="call-items">
                                        <a href="javascript:void(0);" class="btn call-item call-end" data-dismiss="modal" aria-label="Close"><i class="material-icons">call_end</i></a>
                                        <a href="video-call.html" class="btn call-item call-start"><i class="material-icons">videocam</i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Incoming Call -->

                    </div>
                </div>
            </div>
        </div>
        <!-- Video Call Modal -->

        <!-- jQuery -->
        <script src="../assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="../assets/js/popper.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>

        <!-- Fancybox JS -->
        <script src="../assets/plugins/fancybox/jquery.fancybox.min.js"></script>

        <!-- Custom JS -->
        <script src="../assets/js/script.js"></script>

    </body>

    <!-- doccure/doctor-profile.html  30 Nov 2019 04:12:16 GMT -->
</html>
