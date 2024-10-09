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
							<h4 class="card-title">Category form</h4>
							<c:if test="${category == null }">
								<p class="card-description">Create category form</p>
							</c:if>
							<c:if test="${category != null }">
								<p class="card-description">Edit category form</p>
							</c:if>
							<c:if test="${category == null }">
								<form action="create_category" method="post" class="forms-sample" id="categoryForm">
									<div class="form-group">
										<label for="name">Category Name</label>
										<input type="text" class="form-control" id="name" name="name"
											placeholder="Category Name">
									</div>
									<input type="submit" class="btn btn-success" value="Save">
									<input type="button" value="Cancel" class="btn btn-danger" onclick="javascript:history.go(-1);">
								</form>
							</c:if>
							<c:if test="${category != null }">
								<form action="update_category" method="post" class="forms-sample" id="categoryForm">
									<input type="hidden" class="form-control" id="categoryId" name="categoryId"
											value="${category.categoryId }">
									<div class="form-group">
										<label for="name">Category Name</label>
										<input type="text" class="form-control" id="name" name="name"
											value="${category.name }">
									</div>
									<input type="submit" class="btn btn-success" value="Save">
									<input type="button" value="Cancel" class="btn btn-danger" onclick="javascript:history.go(-1);">
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
			$(document).ready(function(){
				$("#categoryForm").validate({
					rules: {
						name: "required",
					},
					
					messages: {
						name: "Please enter the category name!",
					}
				});
			});
		</script>
</body>

</html>