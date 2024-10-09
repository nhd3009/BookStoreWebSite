<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- index28:48-->
<head>
<jsp:directive.include file="common/head.jsp" />
<title>Shopping Cart - Book Store</title>
<style>
	input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
		{
		-webkit-appearance: none;
		margin: 0;
	}
	input[type="number"] {
		-moz-appearance: textfield;
	}
</style>
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
						<li class="active">Shopping Cart</li>
					</ul>
				</div>
			</div>
		</div>

		<c:set var="cart" value="${sessionScope['cart']}" />

		<c:if test="${cart.totalItems == 0}">
			<div class="d-flex justify-content-center align-items-center"
				style="height: 100vh;">
				<h2>There is no items in your cart</h2>
			</div>
		</c:if>


		<!-- Begin Shopping Cart Area -->
		<c:if test="${cart.totalItems > 0 }">
			<div class="Shopping-cart-area pt-60 pb-60">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<form action="update_cart" method="post" id="cartForm">
								<div class="table-content table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th class="li-product-remove">remove</th>
												<th class="li-product-thumbnail">images</th>
												<th class="cart-product-name">Product</th>
												<th class="li-product-price">Unit Price</th>
												<th class="li-product-quantity">Quantity</th>
												<th class="li-product-subtotal">Total</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cart.items}" var="item"
												varStatus="status">
												<input type="hidden" name="bookId" value="${item.key.bookId }">
												<tr>
													<td class="li-product-remove"><a
														href="remove_from_cart?book_id=${item.key.bookId }"><i
															class="fa fa-times"></i></a></td>
													<td class="li-product-thumbnail"><a href="${pageContext.request.contextPath}/book_detail?id=${item.key.bookId}"><img
															style="width: 25%; height: 25%"
															src="data:image/jpg;base64,${item.key.base64Image }"
															alt="Li's Product Image"></a></td>
													<td class="li-product-name"><a href="${pageContext.request.contextPath}/book_detail?id=${item.key.bookId}">${item.key.title}</a></td>
													<td class="li-product-price"><span class="amount"><fmt:formatNumber
																value="${item.key.price}" type="currency" /></span></td>

													


													<td class="quantity"><label>Quantity</label>
														<div class="cart-plus-minus">
															<input class="cart-plus-minus-box" value="${item.value}"
																type="number" id="quantity${status.index +1}"
																name="quantity${status.index +1}" min="1" required>
															<div class="dec qtybutton">
																<i class="fa fa-angle-down"></i>
															</div>
															<div class="inc qtybutton">
																<i class="fa fa-angle-up"></i>
															</div>
															<div class="dec qtybutton">
																<i class="fa fa-angle-down"></i>
															</div>
															<div class="inc qtybutton">
																<i class="fa fa-angle-up"></i>
															</div>
														</div></td>
													<td class="product-subtotal"><span class="amount"><fmt:formatNumber
																value="${item.value * item.key.price }" type="currency" /></span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="row">
									<div class="col-12">
										<div class="coupon-all">
											<div class="coupon">
												<input id="coupon_code" class="input-text"
													name="coupon_code" value="" placeholder="Coupon code"
													type="text"> <input class="button"
													name="apply_coupon" value="Apply coupon" type="submit">
											</div>
											<div class="coupon2">
												<a class="btn btn-danger" href="${pageContext.request.contextPath}/clear_cart">Clear Cart</a>
												<input class="button" name="update_cart" value="Update cart"
													type="submit">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-5 ml-auto">
										<div class="cart-page-total">
											<h2>Cart totals</h2>
											<ul>
												<li>Total Quantity <span>${cart.totalQuantity }</span></li>
												<li>Total <span><fmt:formatNumber
															value="${cart.totalAmount }" type="currency" /></span></li>
											</ul>
											<a href="checkout">Proceed to checkout</a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<!-- Shopping Cart End Here -->

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