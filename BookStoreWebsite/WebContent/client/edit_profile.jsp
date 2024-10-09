<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- index28:48-->
<head>
<jsp:directive.include file="common/head.jsp" />
<title>Edit Profile - Book Store</title>
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

		<div class="breadcrumb-area">
			<div class="container">
				<div class="breadcrumb-content">
					<ul>
						<li><a href="${pageContext.request.contextPath}">Home</a></li>
						<li class="active">Edit Profile</li>
					</ul>
				</div>
			</div>
		</div>

	<!-- Begin Register Content Area -->
            <div class="page-section mt-60 mb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12 col-xs-12">
                            <form action="update_profile" method="post" id="profileForm">
                                <div class="login-form">
                                    <h4 class="login-title">Edit Profile</h4>
                                    <div class="row">
                                        <div class="col-md-12 mb-20">
                                            <label style="font-size: 20px;"><i>Email Address </i></label>
                                            <p style="font-size: 20px;"><i>${loggedCustomer.email } (Cannot be changed)</i></p>
                                        </div>
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>First Name</label>
                                            <input class="mb-0" type="text" placeholder="First Name" id="firstname" name="firstname">
                                        </div>
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>Last Name</label>
                                            <input class="mb-0" type="text" placeholder="Last Name" id="lastname" name="lastname">
                                        </div>
                                        <div class="col-md-12 mb-20">
                                            <label>Address</label>
                                            <input class="mb-0" type="text" placeholder="Address" id="address" name="address" value="${loggedCustomer.address }">
                                        </div>
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>City</label>
                                            <input class="mb-0" type="text" placeholder="City" id="city" name="city" value="${loggedCustomer.city }">
                                        </div>
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>Country</label>
                                            <input class="mb-0" type="text" placeholder="Country" id="country" name="country" value="${loggedCustomer.country }">
                                        </div>
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>Zipcode</label>
                                            <input class="mb-0" type="text" placeholder="Zipcode" id="zipcode" name="zipcode" value="${loggedCustomer.zipcode }">
                                        </div>
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>Phone number</label>
                                            <input class="mb-0" type="text" placeholder="Phone number" id="phone" name="phone" value="${loggedCustomer.phone }">
                                        </div>
                                        <hr>
                                        <div class="col-md-12 mb-5">
                                            <label><i>Leave password if you don't want to change password</i></label>
                                        </div>
                                        <div class="col-md-6 mb-20">
                                            <label>Password</label>
                                            <input class="mb-0" type="password" placeholder="Password" id="password" name="password">
                                        </div>
                                        <div class="col-md-6 mb-20">
                                            <label>Confirm Password</label>
                                            <input class="mb-0" type="password" placeholder="Confirm Password" id="confirmPassword" name="confirmPassword">
                                        </div>
                                        <div class="col-12">
                                            <button type="submit" class="register-button mt-0">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Register Content Area End Here -->



		<!-- Begin Footer Area -->
		<jsp:directive.include file="common/footer.jsp" />
		<!-- Footer Area End Here -->


	</div>
	<!-- Begin Script Area -->
	<jsp:directive.include file="common/script.jsp" />
	<!-- End Script Area -->
	<script>
		$(document).ready(function() {
			$("#profileForm").validate({
				rules: {
					email: {
						required: true,
						email: true
					},
					firstname: "required",
					lastname: "required",
					address: "required",
					city: "required",
					country: "required",
					phone: "required",
					zipcode: "required",
					confirmPassword: {
						equalTo: "#password"
					},
				},
				
				messages: {
					email: {
						required: "Please enter email address",
						email: "Please enter a valid email address"
					},
					firstname: "Please enter first name",
					lastname: "Please enter last name",
					address: "Please enter an address",
					city: "Please enter a city",
					country: "Please enter a country",
					phone: "Please enter phone number",
					zipcode: "Please enter zipcode",
					confirmPassword: {
						equalTo: "Confirm password does not match password"
					},	
				}
			});
		});
	</script>
	<script>
	    var fullname = "${loggedCustomer.fullname}";
	
	    if (fullname) {
	        var nameParts = fullname.trim().split(/\s+/);
	        var firstName = nameParts[0];
	        var lastName = nameParts.slice(1).join(" ");
	        document.getElementById("firstname").value = firstName;
	        document.getElementById("lastname").value = lastName;
	    }
	</script>
	
</body>

<!-- index30:23-->
</html>