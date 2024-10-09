package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.DAO.HashGenerator;
import com.bookstore.DAO.UsersDAO;
import com.bookstore.entity.Users;

public class UsersServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private UsersDAO usersDAO;
	
	public UsersServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		usersDAO = new UsersDAO();
	}
	
	public void listUser(String msg) throws ServletException, IOException{
		List<Users> listUser = usersDAO.listAll();
		request.setAttribute("listUser", listUser);
		
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		
		String listPage = "list_user.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(listPage);
		rd.forward(request, response);
	}
	
	public void listUser() throws ServletException, IOException{
		listUser(null);
	}
	
	public void newUser() throws ServletException, IOException{
		String page = "form_user.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
	
	public void createUser() throws ServletException, IOException{
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		Users existUser = usersDAO.findByEmail(email);
		
		if(existUser != null) {
			String msg = "Could not create user. This user already exists";
			request.setAttribute("msg", msg);
			String msgPage = "common/message.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(msgPage);
			rd.forward(request, response);
		} else {
			Users user = new Users();
			user.setEmail(email);
			user.setFullName(fullName);
			user.setPassword(password);	
			usersDAO.create(user);
			listUser("User has been created successfully!");
		}
	}
	
	public void editUser() throws ServletException, IOException{
		int userId = Integer.parseInt(request.getParameter("id"));
		Users user = usersDAO.get(userId );

		String destPage = "form_user.jsp";
		
		if (user == null) {
			destPage = "message.jsp";
			String errorMessage = "Could not find user with ID " + userId;
			request.setAttribute("message", errorMessage);
		} else {
			user.setPassword(null);
			request.setAttribute("user", user);			
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
		requestDispatcher.forward(request, response);
	}
	
	public void updateUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String fullName = request.getParameter("fullname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Users userById = usersDAO.get(userId);
		Users userByEmail = usersDAO.findByEmail(email);
		
		if(userByEmail != null && userById.getUserId() != userByEmail.getUserId()) {
			String msg = "Cannot update this user because This user email:" + email
					+ " has been taken";
			request.setAttribute("msg", msg);
			String msgPage = "common/message.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(msgPage);
			rd.forward(request, response);
		} else {
			userById.setEmail(email);
			userById.setFullName(fullName);
			
			if (password != null && !password.isEmpty()) {
				String encryptedPassword = HashGenerator.generateMD5(password);
				userById.setPassword(encryptedPassword);				
			}
			
			usersDAO.update(userById);
			listUser("User with email: " + email + " has been updated successfully!");
		}
	}
	
	public void deleteUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		
		if (userId == 1) {
			String msg = "The default admin user account cannot be deleted.";
			
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("message.jsp").forward(request, response);
			return;
		}
		
		Users user = usersDAO.get(userId);
		
		if (user == null) {
			String msg = "Could not find user with Id: " + userId
					+ ", or it might have been deleted by another admin";
			
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("message.jsp").forward(request, response);	
		} else {
			String msg = "User has been deleted successfully";
			usersDAO.delete(userId);
			listUser(msg);
		}		
	}
	
	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean loginResult = usersDAO.checkLogin(email, password);
		if(loginResult) {
			request.getSession().setAttribute("userEmail", email);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/");
			rd.forward(request, response);
		} else {
			String msg = "Login failed";
			request.setAttribute("msg", msg);
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}
}
