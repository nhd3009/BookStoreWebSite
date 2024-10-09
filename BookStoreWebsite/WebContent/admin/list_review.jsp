<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

				<!-- Topbar -->
				<jsp:directive.include file="common/topbar.jsp" />
				<!-- End of Topbar -->
				<div class="container-fluid">
					<h1 class="h3 mb-2 text-gray-800">Review Table</h1>
					<c:if test="${msg != null }">
						<h4>
							<i>${msg }</i>
						</h4>
					</c:if>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable">
									<thead>
										<tr>
											<th>Index</th>
											<th>ReviewID</th>
											<th>Book</th>
											<th>Rating</th>
											<th>Headline</th>
											<th>Customer</th>
											<th>Review On</th>
											<th>Action</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Index</th>
											<th>ReviewID</th>
											<th>Book</th>
											<th>Rating</th>
											<th>Headline</th>
											<th>Customer</th>
											<th>Review On</th>
											<th>Action</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${listReview }" var="review" varStatus="status">
											<tr>
												<td>${status.index + 1 }</td>
												<td>${review.reviewId }</td>
												<td>${review.book.title }</td>
												<td>${review.rating }</td>
												<td>${review.headline }</td>
												<td>${review.customer.fullname }</td>
												<td>${review.reviewTime }</td>
												<td>
													<a class="btn btn-danger" href="javascript:confirmDelete(${review.reviewId })">Delete</a>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<jsp:directive.include file="common/footer.jsp" />
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

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
		function confirmDelete(reviewId){
			if(confirm('Are you sure to delete this review with Id ' + reviewId + '?')){
				window.location = "delete_review?id=" + reviewId;
			}
		}
	</script>

</body>

</html>