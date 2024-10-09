package com.bookstore.controller.admin.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.DAO.BookDAO;
import com.bookstore.entity.Book;


@WebServlet("/admin/add_book_form")
public class AddBookFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddBookFormServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDAO bookDAO = new BookDAO();
		List<Book> listBook = bookDAO.listAll();
		request.setAttribute("listBook", listBook);
		String addBookForm = "add_book_form.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(addBookForm);
		rd.forward(request, response);
	}

}
