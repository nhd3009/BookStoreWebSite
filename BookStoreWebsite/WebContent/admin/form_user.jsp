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
							<h4 class="card-title">User form</h4>
							<c:if test="${user == null }">
								<p class="card-description">Create user form</p>
							</c:if>
							<c:if test="${user != null }">
								<p class="card-description">Edit user form</p>
							</c:if>
							<c:if test="${user == null }">
								<form action="create_user" method="post" class="forms-sample" id="userForm">
									<div class="form-group">
										<label for="fullname">Full Name</label>
										<input type="text" class="form-control" id="fullname" name="fullname"
											placeholder="Full Name">
									</div>
									<div class="form-group">
										<label for="email">Email address</label> <input
											type="email" class="form-control" id="email" name="email"
											placeholder="Email">
									</div>
									<div class="form-group">
										<label for="password">Password</label> <input
											type="password" class="form-control" id="password" name="password"
											placeholder="Password">
									</div>
									<input type="submit" class="btn btn-success" value="Submit"/>
									<input type="button" class="btn btn-danger" value="Cancel" onclick="javascript:history.go(-1);"/>
								</form>
							</c:if>
							<c:if test="${user != null }">
								<form action="update_user" method="post" class="forms-sample" id="userForm">
									<input type="hidden" class="form-control" id="userId" name="userId"
											value="${user.userId }">
									<div class="form-group">
										<label for="fullname">Full Name</label>
										<input type="text" class="form-control" id="fullname" name="fullname"
											placeholder="Full Name" value="${user.fullName }">
									</div>
									<div class="form-group">
										<label for="email">Email address</label> <input
											type="email" class="form-control" id="email" name="email"
											placeholder="Email" value="${user.email }">
									</div>
									<div class="form-group">
										<label for="password">Password</label> <input
											type="password" class="form-control" id="password" name="password"
											placeholder="Password" value="${user.password }">
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
			$("#userForm").validate({
				rules: {
					email: {
						required: true,
						email: true
					},
			
					fullname: "required",
					
					<c:if test="${user == null}">
					password: "required"
					</c:if>
				},
				
				messages: {
					email: {
						required: "Please enter email",
						email: "Please enter an valid email address"
					},
					
					fullname: "Please enter full name",
					
					<c:if test="${user == null}">
					password: "Please enter password"
					</c:if>				
				}
			});
		});
		</script>
</body>

</html>