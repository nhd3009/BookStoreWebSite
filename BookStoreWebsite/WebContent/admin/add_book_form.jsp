<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Add Book</title>
	<jsp:directive.include file="common/head.jsp" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css">
</head>
<body>
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-12">
				<h1>Add Book to Order ID: ${order.orderId }</h1>
				
				<form action="add_book_to_order" method="post">
					<div class="form-group">
					    <label for="book">Book</label>
					    <select class="form-control selectpicker" name="bookId" data-live-search="true">
					        <c:forEach items="${listBook }" varStatus="status" var="book">
					            <option value="${book.bookId}">${book.title} - ${book.author}</option>
					        </c:forEach>
					    </select>
					</div>
					<div class="col-6 form-group">
						<label for="book">Number of Copies</label>
						<input class="form-control" type="text" name="quantity">
					</div>
					<div class="col-12" style="text-align: center; margin-top: 50px;">
						<input type="submit" class="btn btn-success" value="Save" />
						<input type="button" class="btn btn-danger" value="Cancel" onclick="javascript:self.close()"/>
					</div>		
				</form>
			</div>
		</div>
		
	</div>
	
	<jsp:directive.include file="common/script.jsp" />
	
	<script>
		$(document).ready(function() {
	        $('.selectpicker').selectpicker();
	    });
	</script>
</body>
</html>