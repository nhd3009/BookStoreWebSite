<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- index28:48-->
<head>
	<jsp:directive.include file="common/head.jsp" />
	<title>Home - Book Store</title>
</head>
<body>

	<!-- Begin Body Wrapper -->
	<div class="body-wrapper">
		<!-- Begin Header Area -->
		<header>
			<!-- Begin Header Top Area -->
			<jsp:directive.include file="common/top_header.jsp"/>
			<!-- Header Middle Area End Here -->
			
			<!-- Begin Header Bottom Area -->
			<jsp:directive.include file="common/navbar.jsp"/>
			<!-- Header Bottom Area End Here -->
			
		</header>
		<!-- Header Area End Here -->
		
		<!-- Begin Slider With Banner Area -->
		<jsp:directive.include file="common/banner.jsp" />
		<!-- Slider With Banner Area End Here -->
		
		<!-- Begin Product Area -->
		<jsp:directive.include file="common/product_area.jsp" />
		<!-- Product Area End Here -->


		<!-- Begin Li's Trending Product Area -->
		<jsp:directive.include file="common/trending_product_1.jsp"/>
		<!-- Li's Trending Product Area End Here -->
		
		<!-- Begin Li's Trendding Products Area -->
		<jsp:directive.include file="common/trending_product_2.jsp"/>
		<!-- Li's Trendding Products Area End Here -->
		
		<!-- Begin Footer Area -->		
		<jsp:directive.include file="common/footer.jsp" />
		<!-- Footer Area End Here -->
		
		<!-- Begin Quick View | Modal Area -->
		<!-- Quick View | Modal Area End Here -->
		

	</div>
	
	<!-- Begin Script Area -->	
	<jsp:directive.include file="common/script.jsp" />
	<!-- End Script Area -->	
	
</body>

<!-- index30:23-->
</html>