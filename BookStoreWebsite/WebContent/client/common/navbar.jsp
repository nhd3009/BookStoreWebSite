<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<style>
	.hb-menu a[href="${pageContext.request.contextPath}"]::after, .hb-menu a[href="${pageContext.request.contextPath}"]::after,.hb-menu a[href="${pageContext.request.contextPath}"]::after
		{
		display: none;
	}
</style>
<div class="header-bottom header-sticky d-none d-lg-block d-xl-block">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- Begin Header Bottom Menu Area -->
				<div class="hb-menu">
					<nav>
						<ul>
							<li><a href="${pageContext.request.contextPath}">Home</a></li>
							<li class="dropdown-holder"><a href="index.html">Category</a>
								<ul class="hb-dropdown">
									<c:forEach items="${listCategory}" var="category">
										<li>
											<a class="drop" href="view_category?id=${category.categoryId}">${category.name }</a>
										</li>
									</c:forEach>
								</ul></li>
							<li><a href="${pageContext.request.contextPath}">About Us</a></li>
							<!-- Removed dropdown-holder class -->
							<li><a href="${pageContext.request.contextPath}">Contact</a></li>
							<!-- Removed dropdown-holder class -->
						</ul>
					</nav>
				</div>

				<!-- Header Bottom Menu Area End Here -->
			</div>
		</div>
	</div>
</div>

<!-- Begin Mobile Menu Area -->
<div class="mobile-menu-area d-lg-none d-xl-none col-12">
	<div class="container">
		<div class="row">
			<div class="mobile-menu"></div>
		</div>
	</div>
</div>
<!-- Mobile Menu Area End Here -->