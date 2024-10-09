<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:directive.include file="common/head.jsp" />
</head>
<body>
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
				<jsp:directive.include file="common/topbar.jsp" />
				<div class="container-fluid">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Book form</h4>

							<c:if test="${book == null }">
								<p class="card-description">Create book form</p>
							</c:if>
							<c:if test="${book != null }">
								<p class="card-description">Edit book form</p>
							</c:if>

							<c:if test="${book == null }">
								<form action="create_book" method="post" class="forms-sample"
									id="bookForm" enctype="multipart/form-data">
									<div class="form-group">
										<label for="category">Category</label> <select
											class="form-control" name="category">
											<c:forEach items="${listCategory}" var="category">
												<option value="${category.categoryId }">${category.name }</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label for="title">Title</label> <input type="text"
											class="form-control" id="title" name="title"
											placeholder="Title">
									</div>
									<div class="form-group">
										<label for="author">Author</label> <input type="text"
											class="form-control" id="author" name="author"
											placeholder="Author">
									</div>
									<div class="form-group">
										<label for="isbn">ISBN</label> <input type="text"
											class="form-control" id="isbn" name="isbn" placeholder="ISBN">
									</div>
									<div class="form-group">
										<label for="publishDate">Publish Date</label> <input
											id="publishDate" class="form-control" type="date"
											name="publishDate" />
									</div>
									<div class="form-group">
										<label for="image">Book Image</label> <input type="file"
											class="form-control" id="bookImage" name="image"> <img
											id="thumbnail"
											style="margin-top: 10px; width: 215px; height: 300px; object-fit: cover;"
											alt="Image Preview">
									</div>
									<div class="form-group">
										<label for="price">Price</label> <input type="text"
											class="form-control" id="price" name="price"
											placeholder="Price">
									</div>
									<div class="form-group">
										<label for="description">Description</label>
										<textarea class="form-control" id="description"
											name="description" rows="4"></textarea>
									</div>
									<input type="submit" class="btn btn-success" value="Submit" />
									<input type="button" class="btn btn-danger" value="Cancel"
										onclick="javascript:history.go(-1);" />
								</form>
							</c:if>

							<c:if test="${book != null }">
								<form action="update_book" method="post" class="forms-sample"
									id="bookForm" enctype="multipart/form-data">
									<input type="hidden" class="form-control" id="bookId"
										name="bookId" value="${book.bookId }">
									<div class="form-group">
										<label for="category">Category</label> <select
											class="form-control" name="category">
											<c:forEach items="${listCategory}" var="category">
												<c:if
													test="${category.categoryId == book.category.categoryId}">
													<option value="${category.categoryId }" selected>${category.name }</option>
												</c:if>
												<c:if
													test="${category.categoryId != book.category.categoryId}">
													<option value="${category.categoryId }">${category.name }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label for="title">Title</label> <input type="text"
											class="form-control" id="title" name="title"
											placeholder="Title" value="${book.title}">
									</div>
									<div class="form-group">
										<label for="author">Author</label> <input type="text"
											class="form-control" id="author" name="author"
											placeholder="Author" value="${book.author}" />
									</div>
									<div class="form-group">
										<label for="isbn">ISBN</label> <input type="text"
											class="form-control" id="isbn" name="isbn" placeholder="ISBN"
											value="${book.isbn}" />
									</div>
									<div class="form-group">
										<label for="publishDate">Publish Date</label> <input
											id="publishDate" class="form-control" type="date"
											name="publishDate" value="${book.publishDate}" />
									</div>
									<div class="form-group">
										<label for="image">Book Image</label> <input type="file"
											class="form-control" id="bookImage" name="image"> <img
											id="thumbnail"
											src="data:image/jpg;base64,${book.base64Image}"
											style="margin-top: 10px; width: 215px; height: 300px; object-fit: cover;"
											alt="Image Preview">
									</div>
									<div class="form-group">
										<label for="price">Price</label> <input type="text"
											class="form-control" id="price" name="price"
											placeholder="Price" value="${book.price}" />
									</div>
									<div class="form-group">
										<label for="description">Description</label>
										<textarea class="form-control" id="description"
											name="description" rows="4">${book.description}</textarea>
									</div>
									<input type="submit" class="btn btn-success" value="Submit" />
									<input type="button" class="btn btn-danger" value="Cancel"
										onclick="javascript:history.go(-1);" />
								</form>
							</c:if>
						</div>
					</div>
				</div>


			</div>
			<!-- End of Content Wrapper -->
			<!-- Footer -->
			<jsp:directive.include file="common/footer.jsp" />
			<!-- End of Footer -->
		</div>
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
			$(document).ready(function() {
				$('#bookImage').change(function() {
					showImageThumbnail(this);
				});
				
				$('#description').richText();
				
				
				$("#bookForm").validate({
					rules: {
						category: "required",
						title: "required",
						author: "required",
						isbn: "required",
						publishDate: "required",
						<c:if test="${book == null}">
							image: "required",
						</c:if>
						price: "required",
						description: "required",
					},
					
					messages: {
						category: "Please select the book category!",
						title: "Please enter the book title!",
						author: "Please enter the book author!",
						isbn: "Please enter the book isbn!",
						publishDate: "Please enter the book publish date!",
						image: "Please enter the book image!",
						price: "Please enter the book price!",
						description: "Please enter the book description!",			
					}
				});
				
			});
			
			function showImageThumbnail(fileInput){
				var file = fileInput.files[0];
				var reader = new FileReader();	
				reader.onload = function(e) {
					$('#thumbnail').attr('src', e.target.result);
				};
				reader.readAsDataURL(file);
			}
			
			
		</script>
</body>

</html>