package com.bookstore.controller.client.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.BookServices;


@WebServlet("/view_category")
public class ViewBookByCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ViewBookByCategory() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(request, response);
		bookServices.listByCategory();
	}


}
