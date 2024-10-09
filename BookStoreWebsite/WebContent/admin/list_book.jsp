<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:directive.include file="common/head.jsp" />
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:directive.include file="common/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:directive.include file="common/topbar.jsp" />
				<!-- End of Topbar -->
				<div class="container-fluid">
					<h1 class="h3 mb-2 text-gray-800">Users Table</h1>
					<c:if test="${msg != null }">
						<h4>
							<i>${msg }</i>
						</h4>
					</c:if>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<a class="btn btn-primary" href="new_book">Create New Book</a>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable">
									<thead>
										<tr>
											<th>Index</th>
											<th>Book ID</th>
											<th>Image</th>
											<th>Title</th>
											<th>Author</th>
											<th>Category</th>
											<th>Price</th>
											<th>Last Updated</th>
											<th>Action</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Index</th>
											<th>Book ID</th>
											<th>Image</th>
											<th>Title</th>
											<th>Author</th>
											<th>Category</th>
											<th>Price</th>
											<th>Publish Date</th>
											<th>Action</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${listBook }" var="book" varStatus="status">
											<tr>
												<td>${status.index + 1 }</td>
												<td>${book.bookId }</td>
												<td><img src="data:image/jpg;base64,${book.base64Image}" style="width: 84px; height: 110px;" /></td>
												<td>${book.title }</td>
												<td>${book.author }</td>
												<td>${book.category.name }</td>
												<td>$${book.price }</td>
												<td>${book.publishDate }</td>
												<td>
													<a class="btn btn-warning mb-2" href="edit_book?id=${book.bookId }">Update</a>
													<a class="btn btn-danger" href="javascript:confirmDelete(${book.bookId })">Delete</a>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<jsp:directive.include file="common/footer.jsp" />
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<jsp:directive.include file="common/logout_modal.jsp"/>

	<!-- Bootstrap core JavaScript-->
	<jsp:directive.include file="common/script.jsp" />
	
	<script>
		function confirmDelete(bookId){
			if(confirm('Are you sure to delete this book with Id ' + bookId + '?')){
				window.location = "delete_book?id=" + bookId;
			}
		}
	</script>

</body>

</html>