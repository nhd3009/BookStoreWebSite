<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="${pageContext.request.contextPath}/admin/">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">Home Admin</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/"> <i
			class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>


	<!-- Nav Item - Charts -->
	<li class="nav-item">
	    <a class="nav-link" id="btn-list-user" href="list_user">
	        <i class="bi bi-person"></i>
	        <span>Users</span>
	    </a>
	</li>
	<li class="nav-item">
	    <a class="nav-link" id="btn-list-category" href="list_category">
	        <i class="bi bi-list"></i>
	        <span>Category</span>
	    </a>
	</li>
	<li class="nav-item">
	    <a class="nav-link" href="list_book">
	        <i class="bi bi-book"></i>
	        <span>Books</span>
	    </a>
	</li>
	<li class="nav-item">
	    <a class="nav-link" href="list_customer">
	        <i class="bi bi-person-circle"></i>
	        <span>Customers</span>
	    </a>
	</li>
	<li class="nav-item">
	    <a class="nav-link" href="list_review">
	        <i class="bi bi-pencil"></i>
	        <span>Review</span>
	    </a>
	</li>
	<li class="nav-item">
	    <a class="nav-link" href="list_order">
	        <i class="bi bi-cart"></i>
	        <span>Order</span>
	    </a>
	</li>

			

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>