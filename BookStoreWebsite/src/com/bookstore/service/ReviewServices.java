package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.DAO.ReviewDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ReviewDAO reviewDAO;
	
	public ReviewServices(HttpServletRequest request, HttpServletResponse response){
		super();
		this.request = request;
		this.response = response;
		reviewDAO = new ReviewDAO();
	}
	
	public void listReview(String msg) throws ServletException, IOException {
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		List<Review> listReview = reviewDAO.listAll();
		request.setAttribute("listReview", listReview);
		String listPage = "list_review.jsp";
		RequestDispatcher rd  = request.getRequestDispatcher(listPage);
		rd.forward(request, response);
	}
	
	public void listReview() throws ServletException, IOException {
		listReview(null);
	}
	
	public void deleteReview() throws ServletException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("id"));
		Review review = reviewDAO.get(reviewId);
		
		if(review != null) {
			reviewDAO.delete(reviewId);
			String msg = "The review has been deleted successfully.";
			listReview(msg);
		} else {
			String msg = "Could not find review. Maybe it has been deleted";
			listReview(msg);
		}
	}
	
	public void submitReview() throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		Book book = new Book();
		book.setBookId(bookId);
		
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		
		int stars = Integer.parseInt(request.getParameter("starRating"));
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");
		
		Review review = new Review();
		review.setHeadline(headline);
		review.setComment(comment);
		review.setRating(stars);
		review.setBook(book);
		review.setCustomer(customer);
		
		Review existReview = reviewDAO.findCustomerAndBook(customer.getCustomerId(), bookId);
		
		if(existReview == null) {
			reviewDAO.create(review);
		    String contextPath = request.getContextPath();
		    String redirectURL = contextPath + "/book_detail?id=" + bookId;
		    response.sendRedirect(redirectURL);
		} else {
			String msg = "You already reviewed this book";
			request.setAttribute("msg", msg);
			RequestDispatcher rd = request.getRequestDispatcher("client/message_error.jsp");
			rd.forward(request, response);
		}
		
		
	}
}
