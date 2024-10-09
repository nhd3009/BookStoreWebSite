<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:directive.include file="common/head.jsp"/>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:directive.include file="common/sidebar.jsp"/>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:directive.include file="common/topbar.jsp"/>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                
				<div class="container-fluid">
					<div class="container">
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<h3>Quick Action</h3>
							</div>
							<div class="col-12">
								<div class="d-flex justify-content-center">
			                		<a style="margin-right: 20px;" class="btn btn-primary" href="new_user">New User</a>
			                		<a style="margin-right: 20px;" class="btn btn-primary" href="new_category">New Category</a>
			                		<a style="margin-right: 20px;" class="btn btn-primary" href="new_book">New Book</a>
			                		<a class="btn btn-primary" href="new_customer">New Customer</a>
			                	</div>
							</div>
							<div class="col-12" style="margin-bottom: 50px; margin-top: 50px;">
								<h3 style="text-align: center;">Recent Sale</h3>
								<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Index</th>
											<th>Order ID</th>
											<th>Ordered By</th>
											<th>Book Copies</th>
											<th>Total</th>
											<th>Payment Method</th>
											<th>Status</th>
											<th>Order Date</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listMostRecentSales }" var="order" varStatus="status">
											<tr>
												<td>${status.index + 1 }</td>
												<td>${order.orderId }</td>
												<td>${order.customer.fullname }</td>
												<td>${order.bookCopies }</td>
												<td><fmt:formatNumber value="${order.total }" type="currency"/></td>
												<td>${order.paymentMethod }</td>
												<td>${order.status }</td>
												<td>${order.orderDate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-12" style="margin-bottom: 50px; margin-top: 10px;">
								<h3 style="text-align: center;">Recent Review</h3>
								<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Index</th>
											<th>Book</th>
											<th>Rating</th>
											<th>Headline</th>
											<th>Customer</th>
											<th>Review Date</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listRecentReview }" var="review" varStatus="status">
											<tr>
												<td>${status.index + 1 }</td>
												<td>${review.book.bookId}</td>
												<td>${review.rating }</td>
												<td>${review.headline }</td>
												<td>${review.customer.fullname }</td>
												<td>${review.reviewTime }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

                       <div class="col-xl-8 col-lg-7">
                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Revenue for the year</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <canvas id="myAreaChart" width="597" height="400" style="display: block; height: 320px; width: 478px;" class="chartjs-render-monitor"></canvas>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Total order By Month</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <canvas id="myPieChart" width="340" height="316" style="display: block; height: 253px; width: 272px;" class="chartjs-render-monitor"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
					</div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <jsp:directive.include file="common/footer.jsp"/>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <jsp:directive.include file="common/logout_modal.jsp"/>

    <!-- Bootstrap core JavaScript-->
    <jsp:directive.include file="common/script.jsp"/>
    
    <script>
	    var ctx = document.getElementById("myAreaChart");
	    var myLineChart = new Chart(ctx, {
	      type: 'line',
	      data: {
	        labels: ${chartLabels},
	        datasets: [{
	          label: "Earnings",
	          lineTension: 0.3,
	          backgroundColor: "rgba(78, 115, 223, 0.05)",
	          borderColor: "rgba(78, 115, 223, 1)",
	          pointRadius: 3,
	          pointBackgroundColor: "rgba(78, 115, 223, 1)",
	          pointBorderColor: "rgba(78, 115, 223, 1)",
	          pointHoverRadius: 3,
	          pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	          pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	          pointHitRadius: 10,
	          pointBorderWidth: 2,
	          data: ${chartData},
	        }],
	      },
	      options: {
	        maintainAspectRatio: false,
	        layout: {
	          padding: {
	            left: 10,
	            right: 25,
	            top: 25,
	            bottom: 0
	          }
	        },
	        scales: {
	          xAxes: [{
	            time: {
	              unit: 'date'
	            },
	            gridLines: {
	              display: false,
	              drawBorder: false
	            },
	            ticks: {
	              maxTicksLimit: 7
	            }
	          }],
	          yAxes: [{
	            ticks: {
	              maxTicksLimit: 5,
	              padding: 10,
	              // Include a dollar sign in the ticks
	              callback: function(value, index, values) {
	                return '$' + number_format(value);
	              }
	            },
	            gridLines: {
	              color: "rgb(234, 236, 244)",
	              zeroLineColor: "rgb(234, 236, 244)",
	              drawBorder: false,
	              borderDash: [2],
	              zeroLineBorderDash: [2]
	            }
	          }],
	        },
	        legend: {
	          display: false
	        },
	        tooltips: {
	          backgroundColor: "rgb(255,255,255)",
	          bodyFontColor: "#858796",
	          titleMarginBottom: 10,
	          titleFontColor: '#6e707e',
	          titleFontSize: 14,
	          borderColor: '#dddfeb',
	          borderWidth: 1,
	          xPadding: 15,
	          yPadding: 15,
	          displayColors: false,
	          intersect: false,
	          mode: 'index',
	          caretPadding: 10,
	          callbacks: {
	            label: function(tooltipItem, chart) {
	              var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	              return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
	            }
	          }
	        }
	      }
	    });

    </script>
    
    <script>
	    var ctx = document.getElementById("myPieChart");
	    var myPieChart = new Chart(ctx, {
	      type: 'doughnut',
	      data: {
	        labels: ${chartOrderLabels}, 
	        datasets: [{
	          data: ${chartOrderData}, 
	          backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b', '#858796', '#f8f9fc', '#5a5c69', '#e83e8c', '#20c997', '#fd7e14', '#6f42c1'],
	          hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#f4b619', '#e02d1b', '#6e707e', '#dee2e6', '#373a3c', '#d63384', '#198754', '#dc3545', '#5c29a3'],
	          hoverBorderColor: "rgba(234, 236, 244, 1)",
	        }],
	      },
	      options: {
	        maintainAspectRatio: false,
	        tooltips: {
	          backgroundColor: "rgb(255,255,255)",
	          bodyFontColor: "#858796",
	          borderColor: '#dddfeb',
	          borderWidth: 1,
	          xPadding: 15,
	          yPadding: 15,
	          displayColors: false,
	          caretPadding: 10,
	        },
	        legend: {
	          display: false
	        },
	        cutoutPercentage: 80,
	      },
	    });
	</script>


</body>

</html>