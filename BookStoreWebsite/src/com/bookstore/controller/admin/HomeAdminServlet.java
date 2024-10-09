package com.bookstore.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.DAO.OrderDAO;
import com.bookstore.DAO.ReviewDAO;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Review;


@WebServlet("/admin/")
public class HomeAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public HomeAdminServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO orderDAO = new OrderDAO();
		List<BookOrder> mostRecentSales = orderDAO.mostRecentSales();
		request.setAttribute("listMostRecentSales", mostRecentSales);
		
		
		Map<String, Double> totalAmountByMonth = orderDAO.monthTotalAmount();
		request.setAttribute("totalAmountByMonth", totalAmountByMonth);
		StringBuilder labels = new StringBuilder();
		StringBuilder data = new StringBuilder();
		labels.append("[");
		data.append("[");
		for (Map.Entry<String, Double> entry : totalAmountByMonth.entrySet()) {
		    labels.append("\"").append(entry.getKey()).append("\",");
		    data.append(entry.getValue()).append(",");
		}
		if (!totalAmountByMonth.isEmpty()) {
		    labels.deleteCharAt(labels.length() - 1);
		    data.deleteCharAt(data.length() - 1);
		}
		labels.append("]");
		data.append("]");
		request.setAttribute("chartLabels", labels.toString());
		request.setAttribute("chartData", data.toString());
		
		
		Map<String, Long> totalOrder = orderDAO.monthOrder();
		request.setAttribute("totalOrder", totalOrder);
		StringBuilder orderLabels = new StringBuilder();
		StringBuilder orderData = new StringBuilder();
		orderLabels.append("[");
		orderData.append("[");
		for (Map.Entry<String, Long> entry : totalOrder.entrySet()) {
			orderLabels.append("\"").append(entry.getKey()).append("\",");
			orderData.append(entry.getValue()).append(",");
		}
		if (!totalOrder.isEmpty()) {
			orderLabels.deleteCharAt(orderLabels.length() - 1);
			orderData.deleteCharAt(orderData.length() - 1);
		}
		orderLabels.append("]");
		orderData.append("]");
		request.setAttribute("chartOrderLabels", orderLabels.toString());
		request.setAttribute("chartOrderData", orderData.toString());
		
		ReviewDAO reviewDAO = new ReviewDAO();
		List<Review> listReview = reviewDAO.listRecentReview();
		request.setAttribute("listRecentReview", listReview);
		
		
		
		String homePage = "index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homePage);
		dispatcher.forward(request, response);
	}

}
