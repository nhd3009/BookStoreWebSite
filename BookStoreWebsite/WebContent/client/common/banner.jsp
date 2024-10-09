<div class="slider-with-banner">
	<div class="container">
		<div class="row">
			<!-- Begin Slider Area -->
			<div class="col-lg-8 col-md-8">
				<div class="slider-area">
					<div class="slider-active owl-carousel">
						<!-- Begin Single Slide Area -->
						<div class="single-slide align-center-left animation-style-01 bg-1">
							<div class="slider-progress"></div>
							<div class="slider-content" style="float: right;">
								<h5>
									<span>New Arrival</span>
								</h5>
								<h2>${listNewBook[0].title}</h2>
								<h3>
									Starting at <span>$${listNewBook[0].price}</span>
								</h3>
								<div class="default-btn slide-btn">
									<a class="links"
										href="${pageContext.request.contextPath}/book_detail?id=${listNewBook[0].bookId}">Shopping
										Now</a>
								</div>
								
							</div>
						</div>
						<!-- Single Slide Area End Here -->

						<!-- Begin Single Slide Area -->
						<div
							class="single-slide align-center-left animation-style-02 bg-2">
							<div class="slider-progress"></div>
							<div class="slider-content">
								<h5>
									<span>Best Seller</span>
								</h5>
								<h2>${listBestSeller[0].title}</h2>
								<h3>
									Starting at <span>$${listBestSeller[0].price}</span>
								</h3>
								<div class="default-btn slide-btn">
									<a class="links"
										href="${pageContext.request.contextPath}/book_detail?id=${listBestSeller[0].bookId}">Shopping
										Now</a>
								</div>
							</div>
							
						</div>
						<!-- Single Slide Area End Here -->

						<!-- Begin Single Slide Area -->
						<div
							class="single-slide align-center-left animation-style-01 bg-3">
							<div class="slider-progress"></div>
							<div class="slider-content">
								<h5>
									<span>Best Favorited Book</span>
								</h5>
								<h2>${listfavoritedBook[0].title}</h2>
								<h3>
									Starting at <span>$${listfavoritedBook[0].price}</span>
								</h3>
								<div class="default-btn slide-btn">
									<a class="links"
										href="${pageContext.request.contextPath}/book_detail?id=${listfavoritedBook[0].bookId}">Shopping
										Now</a>
								</div>
							</div>
						</div>
						<!-- Single Slide Area End Here -->
					</div>
				</div>

			</div>
			<!-- Slider Area End Here -->
			<!-- Begin Li Banner Area -->
			<div class="col-lg-4 col-md-4 text-center pt-xs-30">
				<div class="li-banner">
					<a href="#"> <img src="client/assets/images/banner/banner.jpg"
						alt="">
					</a>
				</div>
				<div class="li-banner mt-15 mt-sm-30 mt-xs-30">
					<a href="#"> <img src="client/assets/images/banner/banner.jpg"
						alt="">
					</a>
				</div>
			</div>
			<!-- Li Banner Area End Here -->
		</div>
	</div>
</div>