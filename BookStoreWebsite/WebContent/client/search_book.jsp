<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- index28:48-->
<head>
	<jsp:directive.include file="common/head.jsp" />
	<title>Search ${search} - Book Store</title>
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
						<li>Search</li>
						<li class="active">${search}</li>
					</ul>
				</div>
			</div>
		</div>

		<!-- Begin Product Area -->
		<div class="product-area pt-10 pb-50">
			<div class="container">

				<div class="tab-content">
					<div id="li-new-product" class="tab-pane active show"
						role="tabpanel">
						<div class="row">
							<c:forEach items="${result}" var="book">
								<div class="col-lg-2 col-md-4 col-sm-6 mt-3">
									<!-- single-product-wrap start -->
									<div class="single-product-wrap">
										<div class="product-image">
											<a href="book_detail?id=${book.bookId}"> <img
												src="data:image/jpg;base64,${book.base64Image}"
												alt="Li's Product Image">
											</a>
										</div>
										<div class="product_desc">
											<div class="product_desc_info">
												<div class="product-review">
													<h5 class="manufacturer">
														<i><a href="#">${book.author}</a></i>
													</h5>
													<div class="rating-box">
													<ul class="rating">
														<c:forTokens items="${book.ratingStars }" delims="," var="star">
															<c:if test="${star eq 'on' }">
																<li><i class="fa fa-star"></i></li>
															</c:if>
															<c:if test="${star eq 'off' }">
																<li class="no-star"><i class="fa fa-star-o"></i></li>
															</c:if>
															<c:if test="${star eq 'half' }">
																<li><i class="fa fa-star-half-o"></i></li>
															</c:if>
														</c:forTokens>	
													</ul>
												</div>
												</div>
												<h4>
													<a class="product_name" href="book_detail?id=${book.bookId}">${book.title}</a>
												</h4>
												<div class="price-box">
													<span class="new-price">$${book.price}</span>
												</div>
											</div>
											<div class="add-actions">
												<ul class="add-actions-link">
													<li class="add-cart active"><a href="add_to_cart?book_id=${book.bookId }">Add to
															cart</a></li>
													<li><a class="links-details" href="wishlist.html"><i
															class="fa fa-heart-o"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<!-- single-product-wrap end -->
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Product Area End Here -->




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