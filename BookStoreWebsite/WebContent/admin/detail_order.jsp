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
					<h1 style="text-align: center;" class="h1 mb-2 text-gray-800"><b>Detail Order ID ${order.orderId }</b></h1>
					<h5 style="text-align: center;" class="h5 mb-2 text-gray-800"><b>Order Overview</b></h5>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" style="padding-left: 50px; padding-right: 50px; padding-top: 30px; padding-bottom: 30px;">
									<tr>
										<td class="col-3"><b>Ordered By</b></td>
										<td class="col-9">${order.customer.fullname }</td>
									</tr>
									<tr>
										<td class="col-3"><b>Book Copies</b></td>
										<td class="col-9">${order.bookCopies }</td>
									</tr>
									<tr>
										<td class="col-3"><b>Total Amount</b></td>
										<td class="col-9">${order.total }</td>
									</tr>
									<tr>
										<td class="col-3"><b>Recipient Name</b></td>
										<td class="col-9">${order.recipientName }</td>
									</tr>
									<tr>
										<td class="col-3"><b>Recipient Phone</b></td>
										<td class="col-9">${order.recipientPhone }</td>
									</tr>
									<tr>
										<td class="col-3"><b>Ship to</b></td>
										<td class="col-9">${order.shippingAddress }</td>
									</tr>
									<tr>
										<td class="col-3"><b>Payment method</b></td>
										<td class="col-9">${order.paymentMethod }</td>
									</tr>
									<tr>
										<td class="col-3"><b>Order Status</b></td>
										<td class="col-9">${order.status }</td>
									</tr>
									<tr>
										<td class="col-3"><b>Order date</b></td>
										<td class="col-9">${order.orderDate }</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					
					<h5 style="text-align: center;" class="h5 mb-2 text-gray-800"><b>Order Overview</b></h5>
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" style="padding-left: 50px; padding-right: 50px; padding-top: 30px; padding-bottom: 30px;">
									<thead>
										<tr>
											<th>Index</th>
											<th>Book Title</th>
											<th>Author</th>
											<th>Price</th>
											<th>Quantity</th>
											<th>Sub Total</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${order.orderDetails }" var="orderDetail" varStatus="status">
											<tr>
												<td>${status.index + 1 }</td>
												<td>${orderDetail.book.title }</td>
												<td>${orderDetail.book.author }</td>
												<td><fmt:formatNumber value="${orderDetail.book.price }" type="currency"/></td>
												<td>${orderDetail.quantity }</td>
												<td><fmt:formatNumber value="${orderDetail.subtotal }" type="currency"/></td>
											</tr>
										</c:forEach>
									
									</tbody>
									<tfoot>
										<tr>
											<th colspan="4" style="text-align: right;"><b><i>Total</i></b></th>
											<th>${order.bookCopies }</th>
											<th><fmt:formatNumber value="${order.total }" type="currency"/></th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
					
					<div class="card shadow mb-4">
						<div class="card-body">
							<div style="text-align: center;">
								<a class="btn btn-warning" href="edit_order" style="margin-right: 30px;">Edit Order</a>
								<a class="btn btn-danger" href="delete_order">Delete Order</a>
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
	<jsp:directive.include file="common/logout_modal.jsp" />

	<!-- Bootstrap core JavaScript-->
	<jsp:directive.include file="common/script.jsp" />

</body>

</html>