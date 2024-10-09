<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- index28:48-->
<head>
<jsp:directive.include file="common/head.jsp" />
<title>Profile - Book Store</title>
</head>
<body>

	<!-- Begin Body Wrapper -->
	<div class="body-wrapper">
		<!-- Begin Header Area -->
		<header>
			<!-- Begin Header Top Area -->
			<jsp:directive.include file="common/top_header.jsp" />
			<!-- Header Middle Area End Here -->

			<!-- Begin Header Bottom Area -->
			<jsp:directive.include file="common/navbar.jsp" />
			<!-- Header Bottom Area End Here -->

		</header>
		<!-- Header Area End Here -->

		<!-- Begin Profile -->
		<div class="breadcrumb-area">
			<div class="container">
				<div class="breadcrumb-content">
					<ul>
						<li><a href="${pageContext.request.contextPath}">Home</a></li>
						<li class="active">Profile</li>
					</ul>
				</div>
			</div>
		</div>
		<section style="background-color: #eee;">
			<div class="container pt-20">
				<div class="row">
					<div class="col-lg-4">
						<div class="card mb-4">
							<div class="card-body text-center">
								<h5 class="my-3">${loggedCustomer.fullname }</h5>
								<p class="text-muted mb-1">${loggedCustomer.email }</p>
								<p class="text-muted mb-4">${loggedCustomer.address }, ${loggedCustomer.city }, ${loggedCustomer.country }</p>
								<div class="d-flex justify-content-center mb-2">
									<a href="edit_profile" class="btn btn-primary">Edit Profile</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="card mb-4">
							<div class="card-body">
								<div class="row pt-50">
									<div class="col-sm-3">
										<p class="mb-0"><b>Full Name</b></p>
									</div> 
									<div class="col-sm-9">
										<p class="text-muted mb-0">${loggedCustomer.fullname }</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0"><b>Email</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${loggedCustomer.email }</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0"><b>Phone</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${loggedCustomer.phone }</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0"><b>Address</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${loggedCustomer.address }</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0"><b>City</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${loggedCustomer.city }</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0"><b>Zipcode</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${loggedCustomer.zipcode }</p>
									</div>
								</div>
								<hr>
								<div class="row mb-50">
									<div class="col-sm-3">
										<p class="mb-0"><b>Country</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${loggedCustomer.country }</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Profile -->

		<!-- Begin Footer Area -->
		<jsp:directive.include file="common/footer.jsp" />
		<!-- Footer Area End Here -->

		<!-- Begin Quick View | Modal Area -->
		<!-- Quick View | Modal Area End Here -->


	</div>

	<!-- Begin Script Area -->
	<jsp:directive.include file="common/script.jsp" />
	<!-- End Script Area -->

</body>

<!-- index30:23-->
</html>