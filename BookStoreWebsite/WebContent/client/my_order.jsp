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
						<li class="active">My Order</li>
					</ul>
				</div>
			</div>
		</div>
		
		
		
		

		<!-- Begin My Order Area -->
		<c:if test="${fn:length(listOrderCustomer) == 0}">
			<div class="d-flex justify-content-center align-items-center"
				style="height: 100vh;">
				<h2>You have not placed any orders.</h2>
			</div>
		</c:if>
		
		<c:if test="${fn:length(listOrderCustomer) > 0}">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th>Index</th>
										<th>Order ID</th>
										<th>Quantity</th>
										<th>Total Amount</th>
										<th>Order Date</th>
										<th>Status</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listOrderCustomer }" var="order" varStatus="status">
										<tr>
											<td>${status.index + 1 }</td>
											<td>${order.orderId }</td>
											<td>${order.bookCopies }</td>
											<td><fmt:formatNumber value="${order.total }" type="currency"/></td>
											<td>${order.orderDate }</td>
											<td>${order.status }</td>
											<td style="text-align: center;">
												<a class="btn btn-primary mb-2" href="my_order_detail?id=${order.orderId }">Detail</a>
											</td>
										</tr>
									</c:forEach>
			
								</tbody>
							</table>
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