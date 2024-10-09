<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="header-top">
	<div class="container">
		<div class="row">
			<!-- Begin Header Top Left Area -->
			<div class="col-lg-3 col-md-4">
				<div class="header-top-left">
					<ul class="phone-wrap">
						<li><span>Telephone Enquiry:</span><a href="#">(+123) 123
								321 345</a></li>
					</ul>
				</div>
			</div>
			<!-- Header Top Left Area End Here -->
			<!-- Begin Header Top Right Area -->
			<div class="col-lg-9 col-md-8">
				<div class="header-top-right">
					<ul class="ht-menu">
						<!-- Begin Setting Area -->
						<c:if test="${loggedCustomer == null }">
							<li>
								<div class="ht-setting-trigger">
									<span>Setting</span>
								</div>
								<div class="setting ht-setting">
									<ul class="ht-setting-list">
										<li><a href="login">Sign In</a></li>
										<li><a href="register">Register</a></li>
									</ul>
								</div>
							</li>
						</c:if>
						<c:if test="${loggedCustomer != null }">
							<li>
								<div class="ht-setting-trigger">
									<span>Welcome, ${loggedCustomer.fullname }</span>
								</div>
								<div class="setting ht-setting">
									<ul class="ht-setting-list">
										<li><a href="profile">My Account</a></li>
										<li><a href="my_order">My Order</a></li>
										<li><a href="logout">Log out</a></li>
									</ul>
								</div>
							</li>
						</c:if>

						<!-- Setting Area End Here -->
					</ul>
				</div>
			</div>
			<!-- Header Top Right Area End Here -->
		</div>
	</div>
</div>
<!-- Header Top Area End Here -->
<!-- Begin Header Middle Area -->
<div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0">
	<div class="container">
		<div class="row">
			<!-- Begin Header Logo Area -->
			<div class="col-lg-3">
				<div class="logo pb-sm-30 pb-xs-30">
					<a href="${pageContext.request.contextPath}"> <img
						src="client/assets/images/menu/logo/1.jpg" alt="">
					</a>
				</div>
			</div>
			<!-- Header Logo Area End Here -->
			<!-- Begin Header Middle Right Area -->
			<div class="col-lg-9 pl-0 ml-sm-15 ml-xs-15">
				<!-- Begin Header Middle Searchbox Area -->
				<form action="search" class="hm-searchbox">
					<input type="text" placeholder="Enter your search key ..."
						name="keyword">
					<button class="li-btn" type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
				<!-- Header Middle Searchbox Area End Here -->
				<!-- Begin Header Middle Right Area -->
				<div class="header-middle-right">
					<ul class="hm-menu">
						<!-- Begin Header Middle Wishlist Area -->
						<!-- <li class="hm-wishlist"><a href="wishlist.html"> <span
								class="cart-item-count wishlist-item-count">0</span> <i
								class="fa fa-heart-o"></i>
						</a></li> -->
						<!-- Header Middle Wishlist Area End Here -->
						<!-- Begin Header Mini Cart Area -->
						<li class="hm-minicart">
							<div class="hm-minicart-trigger">
								<span class="item-icon"></span> <span class="item-text"><fmt:formatNumber
										value="${cart.totalAmount}" type="currency" /> <span
									class="cart-item-count">${cart.totalQuantity }</span> </span>
							</div> <span></span>
							<div class="minicart">
								<c:if test="${cart.totalItems > 0 }">
									<ul class="minicart-product-list">
										<c:forEach items="${cart.items}" var="item" varStatus="status">
											<li>
												<a href="${pageContext.request.contextPath}/book_detail?id=${item.key.bookId}"
												class="minicart-product-image"> <img
													src="data:image/jpg;base64,${item.key.base64Image }"
													alt="cart products">
												</a>
												<div class="minicart-product-details">
													<h6>
														<a href="single-product.html">${item.key.title}</a>
													</h6>
													<span><fmt:formatNumber value="${item.key.price}" type="currency" /> x ${item.value}</span>
												</div>
											</li>
										</c:forEach>
									</ul>
									<p class="minicart-total">
										SUBTOTAL: <span><fmt:formatNumber value="${cart.totalAmount }" type="currency" /></span>
									</p>
									<div class="minicart-button">
										<a href="view_cart"
											class="li-button li-button-fullwidth li-button-dark"> <span>View
												Full Cart</span>
										</a> <a href="checkout" class="li-button li-button-fullwidth">
											<span>Checkout</span>
										</a>
									</div>
								</c:if>
								<c:if test="${cart.totalItems == 0 }">
									<p style="font-size: 18px; text-align: center;">
										There is no items in your cart
									</p>
								</c:if>
							</div>
						</li>
						<!-- Header Mini Cart Area End Here -->
					</ul>
				</div>
				<!-- Header Middle Right Area End Here -->
			</div>
			<!-- Header Middle Right Area End Here -->
		</div>
	</div>
</div>