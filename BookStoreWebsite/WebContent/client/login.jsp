<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- index28:48-->
<head>
<jsp:directive.include file="common/head.jsp" />
<title>Login - Book Store</title>
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
						<li class="active">Login</li>
					</ul>
				</div>
			</div>
		</div>

	<!-- Begin Login Content Area -->
            <div class="page-section mt-60 mb-60">
                <div class="container d-flex align-items-center justify-content-center w-50">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12 col-xs-12">
                            <form action="login" method="post" id="loginForm">
                                <div class="login-form">
                                    <h4 class="login-title">Login</h4>
                                    <c:if test="${msg_login != null}">
                                    	<p class="fst-italic fw-bold" style="color: red;">${msg_login}</p>
                                    </c:if>
                                    <div class="row">
                                        <div class="col-md-12 mb-20">
                                            <label>Email Address</label>
                                            <input class="mb-0" type="email" placeholder="Email Address" id="email" name="email">
                                        </div>
                                        <div class="col-md-12 mb-20">
                                            <label>Password</label>
                                            <input class="mb-0" type="password" placeholder="Password" id="password" name="password">
                                        </div>
                                        <div class="col-12">
                                            <button type="submit" class="register-button mt-0">Sign In</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Login Content Area End Here -->



		<!-- Begin Footer Area -->
		<jsp:directive.include file="common/footer.jsp" />
		<!-- Footer Area End Here -->


	</div>
	<!-- Begin Script Area -->
	<jsp:directive.include file="common/script.jsp" />
	<!-- End Script Area -->
	<script>
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					email: {
						required: true,
						email: true
					},		
					password: "required",
				},
				
				messages: {
					email: {
						required: "Please enter email address",
						email: "Please enter a valid email address"
					},
					password: "required",
				}
			});
		});
	</script>
	
	
</body>

<!-- index30:23-->
</html>