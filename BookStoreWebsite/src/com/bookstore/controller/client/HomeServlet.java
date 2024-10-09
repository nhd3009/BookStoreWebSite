package com.bookstore.controller.client;

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


@WebServlet("")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HomeServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		BookDAO bookDAO = new BookDAO();
		List<Book> listNewBook = bookDAO.listNewBook();
		List<Book> listBestSeller = bookDAO.listBestSellingBook();
		List<Book> listfavoritedBook = bookDAO.listFavoritedBook();
		request.setAttribute("listNewBook", listNewBook);
		request.setAttribute("listBestSeller", listBestSeller);
		request.setAttribute("listfavoritedBook", listfavoritedBook);
		
		String homePage = "client/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homePage);
		dispatcher.forward(request, response);
	}


}
