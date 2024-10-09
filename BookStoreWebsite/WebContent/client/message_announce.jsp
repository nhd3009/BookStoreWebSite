<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

		<div class="pt-30 pb-60">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="text-center ptb-50 pt-xs-20">
							<c:if test="${msg_error != null}">
								<h1>${msg_error}</h1>
								<div class="btn btn-outline-secondary">
									<a href="javascript:history.go(-1)">Go back</a>
								</div>
							</c:if>
							<c:if test="${msg_success != null }">
								<h1>${msg_success}</h1>
								<div class="btn btn-outline-secondary">
									<a href="login">Click here to login</a>
								</div>
							</c:if>
							<c:if test="${msg_success == null && msg_error == null}">
								<h1>${msg}</h1>
								<div class="btn btn-outline-secondary">
									<a href="${pageContext.request.contextPath}">Back to home page</a>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>

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