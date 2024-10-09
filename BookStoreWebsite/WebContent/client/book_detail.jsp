<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- index28:48-->
<head>
<jsp:directive.include file="common/head.jsp" />
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
						<li><a href="index.html">Home</a></li>
						<li class="active">Single Product</li>
					</ul>
				</div>
			</div>
		</div>


		<div class="content-wraper">
			<div class="container">
				<div class="row single-product-area">
					<div class="col-lg-4 col-md-6 mt-3">
						<!-- Product Details Left -->
						<div class="product-details-left">
							<div class="product-details-images">
								<div class="lg-image">
									<img style="width: 300px; height: auto;"
										src="data:image/jpg;base64,${book.base64Image}"
										alt="product image">
								</div>
							</div>
						</div>
						<!--// Product Details Left -->
					</div>

					<div class="col-lg-8 col-md-6">
						<div class="product-details-view-content sp-normal-content pt-60">
							<div class="product-info">
								<h2>${book.title}</h2>
								<span class="product-details-ref">Author: ${book.author}</span>
								<div class="d-flex align-items-center">
									<!-- Rating box -->
									<div class="rating-box pt-20 me-3">
										<ul class="rating">
											<c:forTokens items="${book.ratingStars}" delims=","
												var="star">
												<c:if test="${star eq 'on'}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
												<c:if test="${star eq 'off'}">
													<li class="no-star"><i class="fa fa-star-o"></i></li>
												</c:if>
												<c:if test="${star eq 'half'}">
													<li><i class="fa fa-star-half-o"></i></li>
												</c:if>
											</c:forTokens>
										</ul>
									</div>
								</div>

								<div class="price-box pt-20">
									<span class="new-price new-price-2">$${book.price }</span>
								</div>
								<div class="product-desc">
									<p>
										<span>${book.description}</span>
									</p>
								</div>
								<div class="single-add-to-cart">
									<div class="cart-quantity">
										<button id="addToCardButton" class="add-to-cart" type="submit">Add to cart</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="product-area pt-40">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="li-product-tab">
							<ul class="nav li-product-menu">
								<li><a class="active" data-toggle="tab" href="#description"><span>Description</span></a></li>
								<li><a data-toggle="tab" href="#product-details"><span>Product
											Details</span></a></li>
								<li><a data-toggle="tab" href="#reviews"><span>Reviews</span></a></li>
							</ul>
						</div>
						<!-- Begin Li's Tab Menu Content Area -->
					</div>
				</div>
				<div class="tab-content">
					<div id="description" class="tab-pane active show" role="tabpanel">
						<div class="product-description">
							<span>${book.description}</span>
						</div>
					</div>
					<div id="product-details" class="tab-pane" role="tabpanel">
						<div class="product-details-manufacturer">
							<img src="data:image/jpg;base64,${book.base64Image}"
								alt="Product Manufacturer Image">
							<p>
								<span>ISBN: </span> ${book.isbn }
							</p>
							<p>
								<span>Author: </span> ${book.author }
							</p>
							<p>
								<span>Publish Date: </span> ${book.publishDate }
							</p>
							<p>
								<span>Category: </span> ${book.category.name }
							</p>
						</div>
					</div>
					<div id="reviews" class="tab-pane" role="tabpanel">
						<div class="product-reviews">
							<div class="product-details-comment-block">
								<c:forEach items="${book.reviews}" var="review">
									<div class="border border-dark mt-5">
										<div
											class="comment-author-infos d-flex justify-content-between w-100 mt-10">
											<span><b>${review.customer.fullname}<c:if test="${loggedCustomer.fullname == review.customer.fullname }"> <i>(Your comment)</i></c:if></b></span> <em>${review.reviewTime}</em>
										</div>

										<div class="comment-details">
											<div
												class="d-flex justify-content-between align-items-center">
												<h4 class="title-block">${review.headline}</h4>
												<div class="comment-review d-flex align-items-center">
													<span class="mr-2">Rating: </span>
													<ul class="rating d-flex">
														<c:forTokens items="${review.stars}" delims="," var="star">
															<c:if test="${star eq 'on'}">
																<li><i class="fa fa-star"></i></li>
															</c:if>
															<c:if test="${star eq 'off'}">
																<li class="no-star"><i class="fa fa-star-o"></i></li>
															</c:if>
														</c:forTokens>
													</ul>
												</div>
											</div>

											<!-- Comment -->
											<p>${review.comment}</p>
										</div>

									</div>
								</c:forEach>

								<c:if test="${loggedCustomer == null }">
									<div class="review-btn mt-10">
										<a class="review-links" href="login">Login to Write Review</a>
									</div>
								</c:if>

								<c:if test="${loggedCustomer != null }">
									<div class="review-btn mt-10">
										<a class="review-links" href="write_review"
											data-toggle="modal" data-target="#mymodal">Write Your
											Review!</a>
									</div>
									<!-- Begin Quick View | Modal Area -->
									<div class="modal fade modal-wrapper" id="mymodal">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-body">
													<h3 class="review-page-title">Write Your Review</h3>
													<div class="modal-inner-area row">
														<div class="col-lg-6">
															<div class="li-review-product">
																<img class="d-block mx-auto"
																	src="data:image/jpg;base64,${book.base64Image}"
																	style="width: 75%; height: auto;"
																	alt="Product Manufacturer Image">
																<div class="li-review-product-desc">
																	<p class="li-product-name">${book.title }</p>
																	<p>
																		<span>${book.description }</span>
																	</p>
																</div>
															</div>
														</div>
														<div class="col-lg-6">
															<div class="li-review-content">
																<!-- Begin Feedback Area -->
																<div class="feedback-area">
																	<div class="feedback">
																		<h3 class="feedback-title">Our Feedback</h3>
																		<form action="submit_review" id="reviewForm"
																			method="post">
																			<input hidden type="text" name="bookId" id="bookId" value="${book.bookId }">
																			<p class="your-opinion">
																				<label>Your Rating</label> <span>
																					<div class="br-wrapper br-theme-fontawesome-stars">
																						<select class="star-rating" style="display: none;" id="starRating" name="starRating">
																							<option value="1">1</option>
																							<option value="2">2</option>
																							<option value="3">3</option>
																							<option value="4">4</option>
																							<option value="5" selected>5</option>
																						</select>
																					</div>
																				</span>
																			</p>
																			<p class="feedback-form">
																				<label for="feedback">Headline</label> 
																				<input
																					type="text" name="headline" id="headline"
																					aria-required="true">
																				<br> 
																				<label for="feedback">Your Review</label>
																				<textarea name="comment" id="comment" cols="45"
																					rows="8" aria-required="true"></textarea>
																			</p>
																			<div class="feedback-input">
																				<!-- 
																			<p class="feedback-form-author feedback-form-email">
																				<label for="email">Email<span
																					class="required">*</span>
																				</label> <input id="email" name="email" value="" size="30"
																					aria-required="true" type="text"> <span
																					class="required"><sub>*</sub> Required
																					fields</span>
																			</p>
																			 -->

																				<div class="feedback-btn pb-15">
																					<button class="btn btn-danger" data-dismiss="modal"
																						aria-label="Close">Close</button> <button type="submit" class="btn btn-success">Submit</button>
																				</div>
																			</div>
																		</form>
																	</div>
																</div>
																<!-- Feedback Area End Here -->
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- Quick View | Modal Area End Here -->
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<section class="product-area li-laptop-product pt-30 pb-50">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="li-section-title">
							<h2>
								<span>Same Category Book</span>
							</h2>
						</div>
						<!-- Begin Li's Tab Menu Content Area -->
					</div>
				</div>
				<div class="tab-content">
					<div id="li-new-product" class="tab-pane active show"
						role="tabpanel">
						<div class="row">
							<div class="product-active owl-carousel">
								<c:forEach items="${listBookByCategory}" var="bookCategory">
									<div class="col-lg-12">
										<!-- single-product-wrap start -->
										<div class="single-product-wrap">
											<div class="product-image">
												<a href="book_detail?id=${bookCategory.bookId}"> <img
													src="data:image/jpg;base64,${bookCategory.base64Image}"
													alt="Li's Product Image">
												</a>
											</div>
											<div class="product_desc">
												<div class="product_desc_info">
													<div class="product-review">
														<h5 class="manufacturer">
															<i><a href="shop-left-sidebar.html">${bookCategory.author}</a></i>
														</h5>
													</div>
													<h4>
														<a class="product_name"
															href="book_detail?id=${bookCategory.bookId}">${bookCategory.title}</a>
													</h4>
													<div class="price-box">
														<span class="new-price">$${bookCategory.price}</span>
													</div>
												</div>
												<div class="add-actions">
													<ul class="add-actions-link">
														<li class="add-cart active"><a href="#">Add to
																cart</a></li>
														<li><a class="links-details" href="wishlist.html"><i
																class="fa fa-heart-o"></i></a></li>
														<li><a href="#" title="quick view"
															class="quick-view-btn" data-toggle="modal"
															data-target="#exampleModalCenter"><i
																class="fa fa-eye"></i></a></li>
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
		</section>

		<!-- Begin Footer Area -->
		<jsp:directive.include file="common/footer.jsp" />
		<!-- Footer Area End Here -->


	</div>

	<!-- Begin Script Area -->
	<jsp:directive.include file="common/script.jsp" />
	<!-- End Script Area -->

	<script>
			$(document).ready(function() {
				$("#reviewForm").validate({
					rules: {
						headline: "required",
						comment: "required",
						starRating: "required",
					},
					
					messages: {
						headline: "Please enter headline",	
						comment: "Please enter your comment",
						starRating: "Please select your rating",
					}
				});
				
				$("#addToCardButton").click(function(){
					window.location = 'add_to_cart?book_id=' + ${book.bookId};
				});
			});
	</script>

</body>

<!-- index30:23-->
</html>