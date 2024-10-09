package com.bookstore.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.DAO.OrderDAO;
import com.bookstore.controller.client.shoppingcart.ShoppingCart;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderServices {
	private OrderDAO orderDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public OrderServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		orderDAO = new OrderDAO();
	}
	
	public void listOrder(String msg) throws ServletException, IOException{
		List<BookOrder> listOrder = orderDAO.listAll();
		request.setAttribute("listOrder", listOrder);
		
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("list_order.jsp");
		rd.forward(request, response);
	}
	
	public void listOrder() throws ServletException, IOException{
		listOrder(null);
	}
	
	public void viewAdminOrderDetail() throws ServletException, IOException {
		int orderID = Integer.parseInt(request.getParameter("id"));
		BookOrder order = orderDAO.get(orderID);
		
		if(order != null) {
			request.setAttribute("order", order);
			String detailPage = "detail_order.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(detailPage);
			rd.forward(request, response);
		} else {
			String msg = "Could not find this order with ID: " + orderID;
			listOrder(msg);
		}
	}
	
	public void checkoutForm() throws ServletException, IOException {
		String page = "client/checkout.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
	
	public void placeOrder() throws ServletException, IOException {
		String recipientName = request.getParameter("fullname");
		String recipientPhone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String zipcode = request.getParameter("zipcode");
		String payment = request.getParameter("payment");
		
		String shippingAddress = address + ", " + city + ", " + zipcode + ", " + country;
		
		BookOrder order = new BookOrder();
		order.setRecipientName(recipientName);
		order.setRecipientPhone(recipientPhone);
		order.setShippingAddress(shippingAddress);
		order.setPaymentMethod(payment);
		
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		order.setCustomer(customer);
		
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		Map<Book, Integer> items = cart.getItems();
		Iterator<Book> iterator = items.keySet().iterator();
		Set<OrderDetail> orderDetails = new HashSet<>();
		
		while(iterator.hasNext()) {
			Book book = iterator.next();
			int quantity = items.get(book);
			float subtotal = quantity * book.getPrice();
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(book);
			orderDetail.setBookOrder(order);
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			
			orderDetails.add(orderDetail);
		}
		
		order.setOrderDetails(orderDetails);
		order.setTotal(cart.getTotalAmount());
		
		orderDAO.create(order);
		cart.clear();
		
		String msg = "Thank you. Your order has been received.";
		request.setAttribute("msg", msg);
		String checkoutPage = "client/message_announce.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(checkoutPage);
		rd.forward(request, response);
		
	}
	
	public void listOrderForCustomer() throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		List<BookOrder> listOrder = orderDAO.listCustomer(customer.getCustomerId());
		request.setAttribute("listOrderCustomer", listOrder);
		String myOrderPage = "client/my_order.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(myOrderPage);
		rd.forward(request, response);
	}
	
	public void myOrderDetail() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));
		
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		
		BookOrder bookOrder = orderDAO.get(orderId, customer.getCustomerId());
		request.setAttribute("order", bookOrder);
		
		String detailPage = "client/my_order_detail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(detailPage);
		rd.forward(request, response);
	}
	
	public void editOrder() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));
		BookOrder bookOrder = orderDAO.get(orderId);
		
		if(bookOrder == null) {
			String msg = "Could not find this order " + orderId;
			listOrder(msg);
			return;
		} else {
			HttpSession session = request.getSession();
			Object isPendingBook = session.getAttribute("newBookPending");
			if(isPendingBook == null) {
				session.setAttribute("order", bookOrder);
			} else {
				session.removeAttribute("newBookPending");
			}

			String editPage = "form_order.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(editPage);
			rd.forward(request, response);
		}
	}
	
	public void updateOrder() throws ServletException, IOException {
		HttpSession session = request.getSession();
		BookOrder order = (BookOrder) session.getAttribute("order");
		
		String recipientName = request.getParameter("recipientName");
		String recipientPhone = request.getParameter("recipientPhone");
		String address = request.getParameter("address");
		String payment = request.getParameter("payment");
		String orderStatus = request.getParameter("orderStatus");
		
		order.setRecipientName(recipientName);
		order.setRecipientPhone(recipientPhone);
		order.setShippingAddress(address);
		order.setPaymentMethod(payment);
		order.setStatus(orderStatus);
		
		String[] arrayBookId = request.getParameterValues("bookId");
		String[] arrayPrice = request.getParameterValues("price");
		String[] arrayQuantity = new String[arrayBookId.length];
		
		for(int i = 0; i < arrayQuantity.length; i++) {
			arrayQuantity[i] = request.getParameter("quantity" + (i+1));
		}
		
		Set<OrderDetail> orderDetails = order.getOrderDetails();
		orderDetails.clear();
		
		float totalAmount = 0.0f;
		
		for(int i = 0; i < arrayBookId.length; i++) {
			int bookId = Integer.parseInt(arrayBookId[i]);
			int quantity = Integer.parseInt(arrayQuantity[i]);
			float price = Float.parseFloat(arrayPrice[i]);
			
			float subtotal = price * quantity;
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(new Book(bookId));
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			orderDetail.setBookOrder(order);
			
			orderDetails.add(orderDetail);
			totalAmount += subtotal;
		}
		
		order.setTotal(totalAmount);
		orderDAO.update(order);
		
		String msg = "The order with ID: " + order.getOrderId() + "  has been updated successfully!";
		listOrder(msg);
	}
	
	public void deleteOrder() throws ServletException, IOException {
Integer orderId = Integer.parseInt(request.getParameter("id"));
		
		BookOrder order = orderDAO.get(orderId);
		
		if (order != null) {		
			orderDAO.delete(orderId);
		
			String msg = "The order ID " + orderId + " has been deleted.";
			listOrder(msg);
		} else {
			String msg = "Could not find order with ID " + orderId +
					", or it might have been deleted by another admin.";
			listOrder(msg);
		}

	}
}
