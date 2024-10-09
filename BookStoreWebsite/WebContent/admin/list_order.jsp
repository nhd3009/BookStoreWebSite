<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<h1 class="h3 mb-2 text-gray-800">Order Table</h1>
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
											<th>Order ID</th>
											<th>Ordered By</th>
											<th>Book Copies</th>
											<th>Total</th>
											<th>Payment Method</th>
											<th>Status</th>
											<th>Order Date</th>
											<th>Action</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Index</th>
											<th>Order ID</th>
											<th>Ordered By</th>
											<th>Book Copies</th>
											<th>Total</th>
											<th>Payment Method</th>
											<th>Status</th>
											<th>Order Date</th>
											<th>Action</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${listOrder }" var="order" varStatus="status">
											<tr>
												<td>${status.index + 1 }</td>
												<td>${order.orderId }</td>
												<td>${order.customer.fullname }</td>
												<td>${order.bookCopies }</td>
												<td><fmt:formatNumber value="${order.total }" type="currency"/></td>
												<td>${order.paymentMethod }</td>
												<td>${order.status }</td>
												<td>${order.orderDate }</td>
												<td>
													<a class="btn btn-primary mb-2" href="view_order?id=${order.orderId }">Detail</a>
													<a class="btn btn-warning mb-2" href="edit_order?id=${order.orderId }">Edit</a>
													<a class="btn btn-danger mb-2" href="javascript:confirmDelete(${order.orderId})">Delete</a>
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
		function confirmDelete(orderId){
			if(confirm('Are you sure to delete this order with Id ' + orderId + '?')){
				window.location = "delete_order?id=" + orderId;
			}
		}
	</script>

</body>

</html>