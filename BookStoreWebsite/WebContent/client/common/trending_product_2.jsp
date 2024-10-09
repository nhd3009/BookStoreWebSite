<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="product-area li-trending-product pt-10 pb-45">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="li-section-title">
					<h2>
						<span>Most Favorited Book</span>
					</h2>
				</div>
				<!-- Begin Li's Tab Menu Content Area -->
			</div>
		</div>
		<div class="tab-content">
			<div id="li-new-product" class="tab-pane active show" role="tabpanel">
				<div class="row">
					<div class="product-active owl-carousel">
						<c:forEach items="${listfavoritedBook}" var="book">
							<div class="col-lg-12">
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
													<i><a href="shop-left-sidebar.html">${book.author}</a></i>
												</h5>
												<div class="rating-box">
													<ul class="rating">
														<c:forTokens items="${book.ratingStars }" delims=","
															var="star">
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
												<li class="add-cart active"><a
													href="add_to_cart?book_id=${book.bookId }">Add to cart</a></li>
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
</section>