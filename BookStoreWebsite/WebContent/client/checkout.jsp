<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- index28:48-->
<head>
<jsp:directive.include file="common/head.jsp" />
<title>Checkout - Book Store</title>
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
						<li class="active">Checkout</li>
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


		<!-- Begin CheckOut Area -->
		<c:if test="${cart.totalItems > 0 }">
			<form action="place_order" id="checkoutForm" method="post">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-12">
							
								<div class="checkbox-form">
									<h3>Billing Details</h3>
									<div class="row">
										<div class="col-md-12">
											<div class="checkout-form-list">
												<label>Recipient Name <span class="required">*</span></label>
												<input name="fullname" id="fullname" placeholder="" type="text" value="${loggedCustomer.fullname }">
											</div>
										</div>
										<div class="col-md-12">
											<div class="checkout-form-list">
												<label>Address <span class="required">*</span></label>
												<input name="address" id="address" placeholder="" type="text" value="${loggedCustomer.address }">
											</div>
										</div>
										<div class="col-md-12">
											<div class="checkout-form-list">
												<label>Town / City <span class="required">*</span></label>
												<input name="city" id="city" placeholder="" type="text" value="${loggedCustomer.city }">
											</div>
										</div>
										<div class="col-md-12">
											<div class="checkout-form-list">
												<label>Country <span class="required">*</span></label>
												<input name="country" id="country" placeholder="" type="text" value="${loggedCustomer.country }">
											</div>
										</div>
										<div class="col-md-6">
											<div class="checkout-form-list">
												<label>Postcode / Zip <span class="required">*</span></label>
												<input name="zipcode" id="zipcode" placeholder="" type="text" value="${loggedCustomer.zipcode }">
											</div>
										</div>
										<div class="col-md-6">
											<div class="checkout-form-list">
												<label>Recipient Phone<span class="required">*</span></label> 
												<input name="phone" id="phone" placeholder="" type="text" value="${loggedCustomer.phone }">
											</div>
										</div>
										<div class="col-md-12">
											<div class="checkout-form-list">
												<label>Payment method<span class="required">*</span></label>
												<select name="payment" id="payment">
													<option value="Cash on Delivery">Cash on Delivery (COD)</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							
						</div>
						<div class="col-lg-6 col-12">
							<div class="your-order">
								<h3>Your order</h3>
								<div class="your-order-table table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th class="cart-product-image">Image</th>
												<th class="cart-product-name">Product</th>
												<th class="cart-product-total">Total</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cart.items}" var="item" varStatus="status">
												<tr class="cart_item">
													<td class="cart-product-image"><img style="width: 25%; height: 25%" src="data:image/jpg;base64,${item.key.base64Image }"></td>
													<td class="cart-product-name">${item.key.title }<strong
														class="product-quantity"> × ${item.value}</strong></td>
													<td class="cart-product-total"><span class="amount"><fmt:formatNumber
																	value="${item.value * item.key.price }" type="currency" /></span></td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr class="order-total">
												<th>Order Total</th>
												<th></th>
												<td><strong><span class="amount"><fmt:formatNumber
																value="${cart.totalAmount }" type="currency" /></span></strong></td>
											</tr>
										</tfoot>
									</table>
								</div>
								<div class="payment-method">
									<div class="payment-accordion">
										<div class="order-button-payment">
											<input value="Place order" type="submit">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</c:if>
		<!-- Check out End Here -->

		<!-- Begin Footer Area -->
		<jsp:directive.include file="common/footer.jsp" />
		<!-- Footer Area End Here -->


	</div>

	<!-- Begin Script Area -->
	<jsp:directive.include file="common/script.jsp" />
	<!-- End Script Area -->
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#checkoutForm").validate({
			rules: {
				fullname: "required",
				phone: "required",
				address: "required",
				city: "required",
				zipcode: "required",
				country: "required",
			},
			
			messages: {
				fullname: "required",
				phone: "required",
				address: "required",
				city: "required",
				zipcode: "required",
				country: "required",
			}
		});
	});
	</script>

</body>

<!-- index30:23-->
</html>