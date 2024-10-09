package com.bookstore.controller.client.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/register")
public class CustomerRegisterFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CustomerRegisterFormServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String registerForm = "client/register.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(registerForm);
		rd.forward(request, response);
	}

}
