<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- index28:48-->
<head>
<jsp:directive.include file="common/head.jsp" />
<title>My Order - Book Store</title>
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

		<div class="breadcrumb-area" style="margin-bottom: 50px;">
			<div class="container">
				<div class="breadcrumb-content">
					<ul>
						<li><a href="${pageContext.request.contextPath}">Home</a></li>
						<li class="active">My Detail Order</li>
					</ul>
				</div>
			</div>
		</div>

		<!-- Begin My Order Area -->
		
		<c:if test="${order == null }">
			<div class="d-flex justify-content-center align-items-center"
				style="height: 100vh;">
				<h2>You have not placed this order. So you are not authorized to view this order.</h2>
			</div>
		</c:if>
		<c:if test="${order != null }">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<h2 style="text-align: center; margin-bottom: 20px;">Your Order Detail ID: ${order.orderId }</h2>
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable"
								style="padding-left: 50px; padding-right: 50px; padding-top: 30px; padding-bottom: 30px;">
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

						<h5 style="text-align: center;" class="h5 mb-2 text-gray-800">
							<b>Order Overview</b>
						</h5>
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable"
										style="padding-left: 50px; padding-right: 50px; padding-top: 30px; padding-bottom: 30px;">
										<thead>
											<tr>
												<th style="text-align: center;">Index</th>
												<th style="text-align: center;">Image</th>
												<th style="text-align: center;">Book Title</th>
												<th style="text-align: center;">Author</th>
												<th style="text-align: center;">Price</th>
												<th style="text-align: center;">Quantity</th>
												<th style="text-align: center;">Sub Total</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${order.orderDetails }" var="orderDetail"
												varStatus="status">
												<tr>
													<td style="text-align: center;">${status.index + 1 }</td>
													<td style="text-align: center;"><img style="width: 25%; height: 25%" src="data:image/jpg;base64,${orderDetail.book.base64Image }"></td>
													<td >${orderDetail.book.title }</td>
													<td>${orderDetail.book.author }</td>
													<td style="text-align: center;"><fmt:formatNumber
															value="${orderDetail.book.price }" type="currency" /></td>
													<td style="text-align: center;">${orderDetail.quantity }</td>
													<td style="text-align: center;"><fmt:formatNumber value="${orderDetail.subtotal }"
															type="currency" /></td>
												</tr>
											</c:forEach>

										</tbody>
										<tfoot>
											<tr>
												<th colspan="5" style="text-align: right;"><b><i>Total</i></b></th>
												<th>${order.bookCopies }</th>
												<th><fmt:formatNumber value="${order.total }"
														type="currency" /></th>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<!-- My Order End Here -->

		<!-- Begin Footer Area -->
		<jsp:directive.include file="common/footer.jsp" />
		<!-- Footer Area End Here -->


	</div>

	<!-- Begin Script Area -->
	<jsp:directive.include file="common/script.jsp" />
	<!-- End Script Area -->

</body>

<!-- index30:23-->
</html>