<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:directive.include file="common/head.jsp" />
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:directive.include file="common/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<jsp:directive.include file="common/topbar.jsp" />
				<div class="container-fluid">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Customer form</h4>
							
							<c:if test="${customer == null }">
								<p class="card-description">Create customer form</p>
							</c:if>
							<c:if test="${customer != null }">
								<p class="card-description">Edit customer form</p>
							</c:if>
							
							<c:if test="${customer == null }">
								<form action="create_customer" method="post" class="forms-sample" id="customerForm">
									<div class="form-group">
										<label for="email">Email</label> <input
											type="email" class="form-control" id="email" name="email"
											placeholder="Email">
									</div>
									<div class="form-group">
										<label for="password">Password</label> <input
											type="password" class="form-control" id="password" name="password"
											placeholder="Password">
									</div>
									<div class="form-group">
										<label for="password">Confirm Password</label> <input
											type="password" class="form-control" id="confirmPassword" name="confirmPassword"
											placeholder="Confirm Password">
									</div>
									<div class="form-group">
										<label for="fullname">Full name</label>
										<input type="text" class="form-control" id="fullname" name="fullname"
											placeholder="Full Name">
									</div>
									<div class="form-group">
										<label for="address">Address</label> <input
											type="text" class="form-control" id="address" name="address"
											placeholder="Address">
									</div>
									<div class="form-group">
										<label for="city">City</label> <input
											type="text" class="form-control" id="city" name="city"
											placeholder="City">
									</div>
									<div class="form-group">
										<label for="city">Country</label> <input
											type="text" class="form-control" id="country" name="country"
											placeholder="Country">
									</div>
									<div class="form-group">
										<label for="city">Phone Number</label> <input
											type="text" class="form-control" id="phone" name="phone"
											placeholder="Phone">
									</div>
									<div class="form-group">
										<label for="fullname">Zipcode</label>
										<input type="text" class="form-control" id="zipcode" name="zipcode"
											placeholder="Zipcode">
									</div>
									<input type="submit" class="btn btn-success" value="Submit"/>
									<input type="button" class="btn btn-danger" value="Cancel" onclick="javascript:history.go(-1);"/>
								</form>
							</c:if>
							
							
							<c:if test="${customer != null }">
								<form action="update_customer" method="post" class="forms-sample" id="customerForm">
									<input type="hidden" class="form-control" id="customerId" name="customerId"
											value="${customer.customerId }">
									<div class="form-group">
										<label for="email">Email</label> <input
											type="email" class="form-control" id="email" name="email"
											placeholder="Email" value="${customer.email }">
									</div>
									<div class="form-group">
										<label for="password">Password</label> <input
											type="password" class="form-control" id="password" name="password"
											placeholder="Password" value="${customer.password }">
									</div>
									<div class="form-group">
										<label for="password">Confirm Password</label> <input
											type="password" class="form-control" id="confirmPassword" name="confirmPassword"
											placeholder="Confirm Password" value="${customer.password }">
									</div>
									<div class="form-group">
										<label for="fullname">Full name</label>
										<input type="text" class="form-control" id="fullname" name="fullname"
											placeholder="Full Name" value="${customer.fullname }">
									</div>
									<div class="form-group">
										<label for="address">Address</label> <input
											type="text" class="form-control" id="address" name="address"
											placeholder="Address" value="${customer.address }">
									</div>
									<div class="form-group">
										<label for="city">City</label> <input
											type="text" class="form-control" id="city" name="city"
											placeholder="City" value="${customer.city }">
									</div>
									<div class="form-group">
										<label for="city">Country</label> <input
											type="text" class="form-control" id="country" name="country"
											placeholder="Country" value="${customer.country }">
									</div>
									<div class="form-group">
										<label for="city">Phone Number</label> <input
											type="text" class="form-control" id="phone" name="phone"
											placeholder="Phone" value="${customer.phone }">
									</div>
									<div class="form-group">
										<label for="fullname">Zipcode</label>
										<input type="text" class="form-control" id="zipcode" name="zipcode"
											placeholder="Zipcode" value="${customer.zipcode }">
									</div>
									<input type="submit" class="btn btn-success" value="Submit"/>
									<input type="button" class="btn btn-danger" value="Cancel" onclick="javascript:history.go(-1);"/>
								</form>
							</c:if>
						</div>
					</div>
				</div>
				

			</div>
			<!-- End of Content Wrapper -->
			<!-- Footer -->
			<jsp:directive.include file="common/footer.jsp" />
			<!-- End of Footer -->
		</div>
	</div>
	<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<jsp:directive.include file="common/logout_modal.jsp"/>

		<!-- Bootstrap core JavaScript-->
		<jsp:directive.include file="common/script.jsp" />
		
		<script>
		$(document).ready(function() {
			$("#customerForm").validate({
				rules: {
					email: {
						required: true,
						email: true
					},
					fullname: "required",
					address: "required",
					city: "required",
					country: "required",
					phone: "required",
					zipcode: "required",
					
					<c:if test="${customer == null}">
					password: "Please enter password",
					</c:if>
					
					confirmPassword: {
						<c:if test="${customer == null}">
						required: "Please confirm password",
						</c:if>
						equalTo: "Confirm password does not match password"
					},
				},
				
				messages: {
					email: {
						required: "Please enter email address",
						email: "Please enter a valid email address"
					},
					fullname: "Please enter full name",
					address: "Please enter an address",
					city: "Please enter a city",
					country: "Please enter a country",
					phone: "Please enter phone number",
					zipcode: "Please enter zipcode",
					
					<c:if test="${customer == null}">
					password: "Please enter password",
					</c:if>
					
					confirmPassword: {
						<c:if test="${customer == null}">
						required: "Please confirm password",
						</c:if>
						equalTo: "Confirm password does not match password"
					},
	
				}
			});
		});
		</script>
</body>

</html>