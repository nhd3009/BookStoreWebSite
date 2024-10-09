<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:directive.include file="head.jsp" />
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:directive.include file="sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:directive.include file="topbar.jsp" />
				<!-- End of Topbar -->
				<div class="container-fluid">
					<h1 class="h3 mb-2 text-gray-800">Message</h1>
						<h4>
							<i>${msg}</i>
						</h4>
				</div>
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<jsp:directive.include file="footer.jsp" />
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<jsp:directive.include file="script.jsp" />

</body>

</html>