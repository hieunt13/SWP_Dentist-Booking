<!DOCTYPE html>
<html lang="en">
    
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/patient-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Patient List Page</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
		
		<!-- Datatables CSS -->
		<link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
		
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
			
			<!-- Sidebar -->
          <jsp:include flush="true" page="sidebar.jsp"></jsp:include>
			<!-- /Sidebar -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">List of Patient</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item"><a href="javascript:(0);">Users</a></li>
									<li class="breadcrumb-item active">Patient</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
                                                                        <form action="../admin/AdminSearchCustomerController" method="post"
											style="margin-bottom: 20px; margin-right: 20px;"
											data-toggle="modal">
                                                                                <input type="text" name="search" />
                                                                                <input type="submit" name="Search" value="Search" style="background-color: lightgreen; color: white; font-weight: bold"/>
                                                                        </form>
									<div class="table-responsive">
										<div class="table-responsive">
										<table class="datatable table table-hover table-center mb-0">
											<thead>
												<tr>
													<th>Patient ID</th>
													<th>Patient Name</th>
													<th>Age</th>
													<th>Address</th>
													<th>Phone</th>
													<th>Last Visit</th>
													<th class="text-right">Paid</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>#PT001</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient1.jpg" alt="User Image"></a>
															<a href="profile.jsp">Charlene Reed </a>
														</h2>
													</td>
													<td>29</td>
													<td>4417  Goosetown Drive, Taylorsville, North Carolina, 28681</td>
													<td>8286329170</td>
													<td>20 Oct 2019</td>
													<td class="text-right">$100.00</td>
												</tr>
												<tr>
													<td>#PT002</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient2.jpg" alt="User Image"></a>
															<a href="profile.jsp">Travis Trimble </a>
														</h2>
													</td>
													<td>23</td>
													<td>4026  Fantages Way, Brunswick, Maine, 04011</td>
													<td>2077299974</td>
													<td>22 Oct 2019</td>
													<td class="text-right">$200.00</td>
												</tr>
												<tr>
													<td>#PT003</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient3.jpg" alt="User Image"></a>
															<a href="profile.jsp">Carl Kelly</a>
														</h2>
													</td>
													<td>29</td>
													<td>2037 Pearcy Avenue, Decatur, Indiana, 46733</td>
													<td>2607247769</td>
													<td>21 Oct 2019</td>
													<td class="text-right">$250.00</td>
												</tr>
												<tr>
													<td>#PT004</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient4.jpg" alt="User Image"></a>
															<a href="profile.jsp"> Michelle Fairfax</a>
														</h2>
													</td>
													<td>25</td>
													<td>2037 Pearcy Avenue, Decatur, Indiana, 46733</td>
													<td>5043686874</td>
													<td>21 Sep 2019</td>
													<td class="text-right">$150.00</td>
												</tr>
												<tr>
													<td>#PT005</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient5.jpg" alt="User Image"></a>
															<a href="profile.jsp">Gina Moore</a>
														</h2>
													</td>
													<td>23</td>
													<td>888  Everette Alley, Hialeah, Florida, 33012</td>
													<td>9548207887</td>
													<td>18 Sep 2019</td>
													<td class="text-right">$350.00</td>
												</tr>
												<tr>
													<td>#PT006</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient6.jpg" alt="User Image"></a>
															<a href="profile.jsp">Elsie Gilley</a>
														</h2>
													</td>
													<td>16</td>
													<td>644  Coffman Alley, Bowling Green, Kentucky, 42101</td>
													<td>3153844562</td>
													<td>18 Sep 2019</td>
													<td class="text-right">$300.00</td>
												</tr>
												<tr>
													<td>#PT007</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient7.jpg" alt="User Image"></a>
															<a href="profile.jsp"> Joan Gardner</a>
														</h2>
													</td>
													<td>25</td>
													<td>2399  Hillview Drive, San Francisco, California, 94103</td>
													<td>7072202603</td>
													<td>18 Sep 2019</td>
													<td class="text-right">$250.00</td>
												</tr>
												<tr>
													<td>#PT008</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient8.jpg" alt="User Image"></a>
															<a href="profile.jsp"> Daniel Griffing</a>
														</h2>
													</td>
													<td>21</td>
													<td>4914  Hilltop Haven Drive, Passaic, New Jersey, 07055</td>
													<td>9737739497</td>
													<td>7 Sep 2019</td>
													<td class="text-right">$150.00</td>
												</tr>
												<tr>
													<td>#PT009</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient9.jpg" alt="User Image"></a>
															<a href="profile.jsp">Walter Roberson</a>
														</h2>
													</td>
													<td>18</td>
													<td>1299  Star Trek Drive, Panama City, Florida, 32405</td>
													<td>8503584445</td>
													<td>11 Sep 2019</td>
													<td class="text-right">$100.00</td>
												</tr>
												<tr>
													<td>#PT010</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient10.jpg" alt="User Image"></a>
															<a href="profile.jsp">Robert Rhodes</a>
														</h2>
													</td>
													<td>19</td>
													<td>1214  Hamill Avenue, Del Mar, California, 92014</td>
													<td>8582595285</td>
													<td>12 Sep 2019</td>
													<td class="text-right">$120.00</td>
												</tr>
												<tr>
													<td>#PT011</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient11.jpg" alt="User Image"></a>
															<a href="profile.jsp">Harry Williams</a>
														</h2>
													</td>
													<td>9</td>
													<td>4566  Sampson Street, Denver, Colorado, 80202</td>
													<td>3036077075</td>
													<td>14 Sep 2019</td>
													<td class="text-right">$130.00</td>
												</tr>
												<tr>
													<td>#PT012</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient12.jpg" alt="User Image"></a>
															<a href="profile.jsp">Robert Johnston</a>
														</h2>
													</td>
													<td>29</td>
													<td>1996  Crummit Lane, Beatrice, Nebraska, 68310</td>
													<td>4022231492</td>
													<td>7 Nov 2019</td>
													<td class="text-right">$260.00</td>
												</tr>
												<tr>
													<td>#PT013</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient13.jpg" alt="User Image"></a>
															<a href="profile.jsp">Tracy Mason</a>
														</h2>
													</td>
													<td>32</td>
													<td>4211  Vesta Drive, TOLEDO, Washington, 98591</td>
													<td>7737265795</td>
													<td>9 Nov 2019</td>
													<td class="text-right">$290.00</td>
												</tr>
												<tr>
													<td>#PT014</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient14.jpg" alt="User Image"></a>
															<a href="profile.jsp"> Daniel Finch</a>
														</h2>
													</td>
													<td>23</td>
													<td>186  Bryan Street, Greensboro, North Carolina, 27409</td>
													<td>3362314023</td>
													<td>5 Nov 2019</td>
													<td class="text-right">$300.00</td>
												</tr>
												<tr>
													<td>#PT015</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/patient15.jpg" alt="User Image"></a>
															<a href="profile.jsp">Jessica Garza</a>
														</h2>
													</td>
													<td>10</td>
													<td>4672  Rose Street, Schaumburg, Illinois, 60173</td>
													<td>7082788201</td>
													<td>6 Nov 2019</td>
													<td class="text-right">$310.00</td>
												</tr>
											</tbody>
										</table>
									</div>
									</div>
								</div>
							</div>
						</div>			
					</div>
					
				</div>			
			</div>
			<!-- /Page Wrapper -->
		
        </div>
		<!-- /Main Wrapper -->
		
		<!-- jQuery -->
        <script src="assets/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		
		<!-- Datatables JS -->
		<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="assets/plugins/datatables/datatables.min.js"></script>
		
		<!-- Custom JS -->
		<script  src="assets/js/script.js"></script>
		
    </body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/patient-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:52 GMT -->
</html>