<%-- 
    Document   : promotion
    Created on : May 21, 2022, 12:54:14 PM
    Author     : hieunguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
-->          <script src="../customer/assets/js/html5shiv.min.js"></script>
          <script src="../customer/assets/js/respond.min.js"></script><!--
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
                                        <li class="breadcrumb-item">
                                            <a href="../customer/index.jsp">Home</a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            Promotion
                                        </li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Promotion</h2>
                            </div>
                            <div class="col-md-4 col-12 d-md-block d-none">
                            <c:url var="search" value="${request.contextPath}/promotion/search">
                            </c:url>
                            <form style="display: flex;"  action="${search}">
                                <input type="text" class="form-control mr-3 ml-3" style="border-radius: 4px;" name="searchRequest" placeholder="Search Name or ID" aria-label="Search" aria-describedby="search-addon" value="${searchRequest}"/>
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
                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                            <!-- Search Filter -->
                            <div class="card search-filter">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Filter</h4>
                                </div>
                                <div class="card-body">
                                    <form action="<%=request.getContextPath()%>/promotion/sort">
                                        <div class="filter-widget">
                                            <h4>Discount Percentage</h4>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="radio" name="column" value="discount_percentage-ASC" ${sortRequest == "discount_percentage-ASC" ? "checked":""}>
                                                    <span class="checkmark"></span> Ascending
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="radio" name="column" value="discount_percentage-DESC" ${sortRequest == "discount_percentage-DESC" ? "checked":""}>
                                                    <span class="checkmark"></span> Descending
                                                </label>
                                            </div>
                                        </div>
                                        <div class="filter-widget">
                                            <h4>Date</h4>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="radio" name="column" value="expired_date-ASC" ${sortRequest == "expired_date-ASC" ? "checked":""}>
                                                    <span class="checkmark"></span> Ascending
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="radio" name="column" value="expired_date-DESC" ${sortRequest == "expired_date-DESC" ? "checked":""}>
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
                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="row row-grid">
                                <div class="col-md-12 col-lg-12 col-xl-12">
                                    <h3 style="text-align: center; color: #007bff;">${searchMsg}</h3>
                                </div>
                                <c:forEach var="promotion" items="${list}">
                                    <div class="col-md-3 col-lg-3 col-xl-3" style="min-height:100%">
                                        <div class="profile-widget">
                                            <div class="doc-img">
                                                <a href="#" 
                                                   data-toggle="modal"
                                                   data-target="#${promotion.id}">
                                                    <img
                                                        class="img-fluid"
                                                        alt="User Image"
                                                        src="<%=request.getContextPath()%>/admin/${promotion.image}"
                                                        />
                                                </a>
                                                <a href="javascript:void(0)" class="fav-btn">
                                                    <i class="far fa-bookmark"></i>
                                                </a>
                                            </div>
                                            <div class="pro-content">
                                                <h3 class="title">
                                                    <a href="#" 
                                                       data-toggle="modal"
                                                       data-target="#${promotion.id}"
                                                       >${promotion.promotionName}</a>
                                                    <i class="fas fa-check-circle verified"></i>
                                                </h3>
                                                <div class="patient-details">
                                                    <h5>
                                                        For ${promotion.shortDescription}
                                                    </h5>
                                                </div>

                                                <ul class="available-info">
                                                    <fmt:formatDate var="expiredDate" value="${promotion.expiredDate}" pattern="dd-MM-yyyy"/>
                                                    <li><i class="far fa-clock"></i> Expires date: ${expiredDate}</li>
                                                    <li>
                                                        <fmt:parseNumber var="discountPercentage" integerOnly="true" 
                                                                         type="number" value="${promotion.discountPercentage * 100}"/>
                                                        <i class="far fa-money-bill-alt"></i> Discount ${discountPercentage}%
                                                        <i
                                                            class="fas fa-info-circle"
                                                            data-toggle="tooltip"
                                                            title="Lorem Ipsum"
                                                            ></i>
                                                    </li>

                                                    <c:set var="servicesIdApplied" value=""/>
                                                    <c:set var="servicesIdApplied" value="${promotionService.value}"/>


                                                </ul>

                                                <div class="row row-sm">
                                                    <div class="col-12">
                                                        <a
                                                            href="#"
                                                            class="btn book-btn"
                                                            data-toggle="modal"
                                                            data-target="#${promotion.id}"
                                                            >View Detail</a
                                                        >
                                                    </div>
                                                    <c:url var="bookingPromotion" value="${request.contextPath}/appointment/booking">
                                                        <c:forEach var="service" items="${servicesIdApplied}">
                                                            <c:param name="serviceId" value="${service.id}"></c:param>
                                                        </c:forEach>

                                                    </c:url>

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
        <c:forEach var="promotion_detail" items="${list}">
            <div class="modal fade custom-modal" id="${promotion_detail.id}">
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
                                                <span class="title">${promotion_detail.promotionName}</span>
                                                <fmt:formatDate var="expiredDate" value="${promotion_detail.expiredDate}" pattern="dd-MM-yyyy"/>
                                                <span class="text">Expires on ${expiredDate}</span>
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
                                    <span class="title">Promotion ID:</span>
                                    <span class="text">${promotion_detail.id}</span>
                                </li>
                                <li>
                                    <span class="title">Description:</span>
                                    <span class="text"
                                          >${promotion_detail.longDescription}</span
                                    >
                                </li>
                                <li>
                                    <fmt:parseNumber var="discountPercentage" integerOnly="true" 
                                                     type="number" value="${promotion_detail.discountPercentage * 100}"/>
                                    <span class="title">Discount Amount:</span>
                                    <span class="text">${discountPercentage}%</span>
                                </li>

                                <li>
                                    <span class="title">Services applied:</span>
                                    <span class="text">
                                        <c:set var="servicesIdApplied" value=""/>
                                        <c:forEach var="promotion" items="${servicesApplied}">
                                            <c:if test="${promotion.key.id == promotion_detail.id}">
                                                <c:set var="servicesIdApplied" value="${promotion.value}"/>
                                                <c:forEach var="service" items="${promotion.value}">
                                                    <li> 
                                                        <c:url var="bookingPromotion" value="${request.contextPath}/appointment/booking">
                                                            <c:param name="serviceId" value="${service.id}"></c:param>
                                                        </c:url>
                                                        <a style="display: inline-block"
                                                           href="${bookingPromotion}"
                                                           class="btn btn-sm bg-success-light"
                                                           >
                                                            Book
                                                        </a>
                                                        - ${service.serviceName}
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                    </span>
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
        <script src="../customer/assets/js/script.js"></script>
    </body>

    <!-- doccure/favourites.html  30 Nov 2019 04:12:17 GMT -->
</html>

