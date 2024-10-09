package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.DAO.CustomerDAO;
import com.bookstore.DAO.HashGenerator;
import com.bookstore.DAO.OrderDAO;
import com.bookstore.DAO.ReviewDAO;
import com.bookstore.entity.Customer;

public class CustomerServices {
	private CustomerDAO customerDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		customerDAO = new CustomerDAO();
	}

	public void ListCustomer(String msg) throws ServletException, IOException {
		if (msg != null) {
			request.setAttribute("msg", msg);
		}
		List<Customer> listCustomer = customerDAO.listAll();
		request.setAttribute("listCustomer", listCustomer);
		String listPage = "list_customer.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(listPage);
		rd.forward(request, response);

	}

	public void ListCustomer() throws ServletException, IOException {
		ListCustomer(null);
	}

	public void newCustomer() throws ServletException, IOException {
		String page = "form_customer.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		if (existCustomer != null) {
			String msg = "Could not create customer. This customer already exists";
			ListCustomer(msg);
		} else {
			String fullname = request.getParameter("fullname");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String phone = request.getParameter("phone");
			String zipcode = request.getParameter("zipcode");
			String password = request.getParameter("password");

			Customer newCustomer = new Customer();
			newCustomer.setEmail(email);
			newCustomer.setAddress(address);
			newCustomer.setFullname(fullname);
			newCustomer.setCity(city);
			newCustomer.setCountry(country);
			newCustomer.setPhone(phone);
			newCustomer.setZipcode(zipcode);

			if (password != null) {
				String encryptedPassword = HashGenerator.generateMD5(password);
				newCustomer.setPassword(encryptedPassword);
			}

			Customer createdCustomer = customerDAO.create(newCustomer);
			if (createdCustomer.getCustomerId() > 0) {
				String msg = "A customer has been created successfully";
				ListCustomer(msg);
			} else {
				String msg = "Failed to create a customer";
				ListCustomer(msg);
			}

		}
	}

	public void EditCustomer() throws ServletException, IOException {
		int customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		if (customer == null) {
			String msg = "Could not update customer. This customer doesn't exist";
			ListCustomer(msg);
		} else {
			customer.setPassword(null);
			request.setAttribute("customer", customer);
			RequestDispatcher rd = request.getRequestDispatcher("form_customer.jsp");
			rd.forward(request, response);
		}

	}

	public void updateCustomer() throws ServletException, IOException {
		int customerID = Integer.parseInt(request.getParameter("customerId"));
		Customer customerByID = customerDAO.get(customerID);

		String email = request.getParameter("email");
		Customer customerByEmail = customerDAO.findByEmail(email);
		if (customerByEmail != null && customerByID.getCustomerId() != customerByEmail.getCustomerId()) {
			String msg = "Could not update customer. This customer email has been taken.";
			ListCustomer(msg);
		} else {
			String fullname = request.getParameter("fullname");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String phone = request.getParameter("phone");
			String zipcode = request.getParameter("zipcode");
			String password = request.getParameter("password");

			customerByID.setEmail(email);
			customerByID.setFullname(fullname);
			customerByID.setAddress(address);
			customerByID.setCity(city);
			customerByID.setCountry(country);
			customerByID.setPhone(phone);
			customerByID.setZipcode(zipcode);

			if (password != null) {
				String encryptedPassword = HashGenerator.generateMD5(password);
				customerByID.setPassword(encryptedPassword);
			}

			customerDAO.update(customerByID);
			ListCustomer("Customer has been updated successfully");
		}
	}

	public void deleteCustomer() throws ServletException, IOException {
		int customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);

		if (customer != null) {
			
			ReviewDAO reviewDAO = new ReviewDAO();
			long reviewCount = reviewDAO.countCustomer(customerId);
			if(reviewCount == 0) {
				OrderDAO orderDAO = new OrderDAO();
				long orderCount = orderDAO.countCustomer(customerId);
				if(orderCount > 0) {
					String msg = "Could not delete customer with ID " + customerId 
							+ " because this customer placed orders.";
					ListCustomer(msg);
				} else {
					customerDAO.delete(customerId);
					String msg = "Customer has been deleted successfully.";
					ListCustomer(msg);
				}
			} else {
				String msg = "Could not delete this customer because of reviews from this customer.";
				ListCustomer(msg);
			}
			
			
		} else {
			String msg = "Couldn't find customer. Maybe customer has been deleted by another admin";
			ListCustomer(msg);
		}
	}

	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);

		String msg = "";
		if (existCustomer != null) {
			msg = "Could not register. This email has been taken.";
			request.setAttribute("msg_error", msg);
			RequestDispatcher rd = request.getRequestDispatcher("client/message_announce.jsp");
			rd.forward(request, response);
		} else {
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String phone = request.getParameter("phone");
			String zipcode = request.getParameter("zipcode");
			String password = request.getParameter("password");

			Customer newCustomer = new Customer();
			newCustomer.setEmail(email);
			newCustomer.setAddress(address);
			newCustomer.setFullname(firstname + " " + lastname);
			newCustomer.setCity(city);
			newCustomer.setCountry(country);
			newCustomer.setPhone(phone);
			newCustomer.setZipcode(zipcode);

			if (password != null) {
				String encryptedPassword = HashGenerator.generateMD5(password);
				newCustomer.setPassword(encryptedPassword);
			}

			Customer createdCustomer = customerDAO.create(newCustomer);
			if (createdCustomer.getCustomerId() > 0) {
				msg = "A customer has been registered successfully.";
				request.setAttribute("msg_success", msg);
				RequestDispatcher rd = request.getRequestDispatcher("client/message_announce.jsp");
				rd.forward(request, response);
			} else {
				msg = "Failed to register a customer";
				request.setAttribute("msg_error", msg);
				RequestDispatcher rd = request.getRequestDispatcher("client/message_announce.jsp");
				rd.forward(request, response);
			}
		}

	}

	public void showLoginForm() throws ServletException, IOException {
		String loginPage = "client/login.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(loginPage);
		rd.forward(request, response);
	}

	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Customer customer = customerDAO.checkLogin(email, password);

		if (customer == null) {
			String msg = "Failed to login. Email or Password is incorrect.";
			request.setAttribute("msg_login", msg);
			showLoginForm();
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loggedCustomer", customer);
			Object objectRedirectURL = session.getAttribute("redirectURL");
			if(objectRedirectURL != null) {
				String redirectURL = (String) objectRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			} else {
				response.sendRedirect(request.getContextPath() + "/");
			}
		}
	}

	public void showProfile() throws ServletException, IOException {
		String profilePage = "client/profile.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(profilePage);
		rd.forward(request, response);
	}

	public void editCustomerProfile() throws ServletException, IOException {
		String editPage = "client/edit_profile.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(editPage);
		rd.forward(request, response);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		String email = request.getParameter("email");
		String fullName = request.getParameter("firstname") + " " + request.getParameter("lastname");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipCode = request.getParameter("zipcode");
		String country = request.getParameter("country");

		if (email != null && !email.equals("")) {
			customer.setEmail(email);
		}

		customer.setFullname(fullName);

		if (password != null & !password.isEmpty()) {
			String encryptedPassword = HashGenerator.generateMD5(password);
			customer.setPassword(encryptedPassword);
		}

		customer.setPhone(phone);
		customer.setAddress(address);
		customer.setCity(city);
		customer.setZipcode(zipCode);
		customer.setCountry(country);

		customerDAO.update(customer);

		showProfile();
	}
}
