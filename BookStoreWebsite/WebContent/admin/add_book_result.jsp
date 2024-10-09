<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
<jsp:directive.include file="common/head.jsp" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css">
</head>
<body>
	<div class="container" style="margin-top: 20px;">
		<div class="d-flex justify-content-center align-items-center"
			style="height: 100vh;">
			<div class="row text-center">
				<div class="col-12">
					<h3>Add Book to Order ID: ${order.orderId } completed</h3>
				</div>
				<div class="col-12">
					<input class="btn btn-success" type="button" value="Close"
						onclick="javascript:self.close()" />
				</div>
			</div>
		</div>


	</div>

	<jsp:directive.include file="common/script.jsp" />

	<script>
		window.onunload = function() {
			window.opener.location.reload();
		}
	</script>
</body>
</html>