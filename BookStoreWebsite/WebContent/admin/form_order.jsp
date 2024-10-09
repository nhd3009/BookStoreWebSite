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
					<h1 style="text-align: center;" class="h1 mb-2 text-gray-800"><b>Edit Order ID ${order.orderId }</b></h1>
					<h5 style="text-align: center;" class="h5 mb-2 text-gray-800"><b>Order Overview</b></h5>
					<!-- DataTales Example -->
					<form action="update_order" method="post" id="orderForm">
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" style="padding-left: 50px; padding-right: 50px; padding-top: 30px; padding-bottom: 30px;">
										<tr>
											<td class="col-3"><b>Ordered By</b></td>
											<td class="col-9">${order.customer.fullname }</td>
										</tr>
										<tr>
											<td class="col-3"><b>Order date</b></td>
											<td class="col-9">${order.orderDate }</td>
										</tr>
										<tr>
											<td class="col-3"><b>Recipient Name</b></td>
											<td class="col-9"><input class="form-control" name="recipientName" type="text" value="${order.recipientName }"></td>
										</tr>
										<tr>
											<td class="col-3"><b>Recipient Phone</b></td>
											<td class="col-9"><input class="form-control" name="recipientPhone" type="text" value="${order.recipientPhone }"></td>
										</tr>
										<tr>
											<td class="col-3"><b>Ship to</b></td>
											<td class="col-9"><input class="form-control" name="address" type="text" value="${order.shippingAddress }"></td>
										</tr>
										<tr>
											<td class="col-3"><b>Payment method</b></td>
											<td class="col-9">
												<select class="form-control" name="payment">
													<option value="Cash On Delivery">Cash on Delivery</option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="col-3"><b>Order Status</b></td>
											<td class="col-9">
												<select class="form-control" name="orderStatus">
													<option value="Processing" <c:if test="${order.status eq 'Processing'}">selected</c:if>>Processing</option>
													<option value="Shipping" <c:if test="${order.status eq 'Shipping'}">selected</c:if>>Shipping</option>
												 	<option value="Delivered" <c:if test="${order.status eq 'Delivered'}">selected</c:if>>Delivered</option>
													<option value="Completed" <c:if test="${order.status eq 'Completed'}">selected</c:if>>Completed</option>
													<option value="Cancelled" <c:if test="${order.status eq 'Cancelled'}">selected</c:if>>Cancelled</option>
												</select>
											</td>
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
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${order.orderDetails }" var="orderDetail" varStatus="status">
												<tr>	
													<td>${status.index + 1 }</td>
													<td><input type="hidden" name="bookId" value="${orderDetail.book.bookId }" />${orderDetail.book.title }</td>
													<td>${orderDetail.book.author }</td>
													<td>
														<input type="hidden" name="price" value="${orderDetail.book.bookId }">
														<fmt:formatNumber value="${orderDetail.book.price }" type="currency"/>
													</td>
													<td style="width: 10%;"><input class="form-control" value="${orderDetail.quantity}" type="number" name="quantity${status.index + 1 }" min="1" required></td>
													<td><fmt:formatNumber value="${orderDetail.subtotal }" type="currency"/></td>
													<td class="li-product-remove"><a href="remove_from_order?id=${orderDetail.book.bookId }"><i class="fa fa-times"></i></a></td>
												</tr>
											</c:forEach>
										
										</tbody>
										<tfoot>
											<tr>
												<th colspan="4" style="text-align: right;"><b><i>Total</i></b></th>
												<th>${order.bookCopies }</th>
												<th colspan=2><fmt:formatNumber value="${order.total }" type="currency"/></th>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
						<div class="card shadow mb-4">
							<div class="card-body">
								<div style="text-align: center;">
									<input class="btn btn-success" type="submit" value="Edit Order" style="margin-right: 30px;">
									<a class="btn btn-warning" style="margin-right: 30px;" href="javascript:showPopUp()">Add Books</a>
									<a class="btn btn-danger" href="javascript:window.location.href='list_order'">Cancel</a>
								</div>
							</div>
						</div>
					</form>
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
	
	<script type="text/javascript">
		function showPopUp(){
			var width = 700;
			var height = 500;
			var left = (screen.width - width) / 2;
			var top = (screen.height - width) / 2;
			window.open('add_book_form', '_blank', 'width=' + width + ', height='+ height +', top='+ top + ', left=' + left);
		}
		
		$(document).ready(function(){
			$("#orderForm").validate({
				rules: {
					recipientName: "required",
					recipientPhone: "required",
					address: "required",
				},
				messages: {
					recipientName: "required",
					recipientPhone: "required",
					address: "required",
				}
			});
		});
	</script>

</body>

</html>