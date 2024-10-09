package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.DAO.BookDAO;
import com.bookstore.DAO.CategoryDAO;
import com.bookstore.DAO.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookServices{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private BookDAO bookDAO;
	private CategoryDAO categoryDAO;
	
	public BookServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		bookDAO = new BookDAO();
		categoryDAO = new CategoryDAO();
	}
	
	public void listBook(String msg) throws ServletException, IOException {
		List<Book> listBook = bookDAO.listAll();
		request.setAttribute("listBook", listBook);
		
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("list_book.jsp");
		rd.forward(request, response);
	}
	
	public void listBook() throws ServletException, IOException {
		listBook(null);
	}
	
	public void newBook() throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		RequestDispatcher rd = request.getRequestDispatcher("form_book.jsp");
		rd.forward(request, response);
	}
	
	public void createBook() throws ServletException, IOException {
		
		String title = request.getParameter("title");
		
		Book existBook = bookDAO.findByTitle(title);
		if(existBook != null) {
			String msg = "Could not create book because this title " + title + " has already existed!";
			listBook(msg);
			return;
		}
		
		Book newBook = new Book();
		readBookField(newBook);
		Book createdBook = bookDAO.create(newBook);
		
		if(createdBook.getBookId() > 0) {
			String msg = "A new book has been created successfully";
			listBook(msg);
		}
		
	}
	
	public void editBook() throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("id"));
		Book book = bookDAO.get(bookId);
		String editPage = "form_book.jsp";
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		if (book != null) {
			request.setAttribute("book", book);
		} else {
			editPage = "message.jsp";
			String message = "Could not find book with ID " + bookId + ". Maybe another admin deleted it.";
			request.setAttribute("message", message);			
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);		

	}
	
	public void readBookField(Book book) throws ServletException, IOException {
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		float price = Float.parseFloat(request.getParameter("price"));
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date publishDate = null;
		try {
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
		} catch(ParseException ex) {
			ex.printStackTrace();
			throw new ServletException("Error Parsing publish date (yyyy-MM-dd)");
		}
		int categoryId = Integer.parseInt(request.getParameter("category"));
		Category category = categoryDAO.get(categoryId);
		book.setTitle(title);
		book.setAuthor(author);
		book.setDescription(description);
		book.setIsbn(isbn);
		book.setPublishDate(publishDate);
		book.setPrice(price);
		
		book.setCategory(category);
		
		Part part = request.getPart("image");
		if(part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];
			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			book.setImage(imageBytes);
		}
	}
	
	public void updateBook() throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		String title = request.getParameter("title");
		
		Book existBook = bookDAO.get(bookId);
		Book bookByTitle = bookDAO.findByTitle(title);
		
		System.out.println("Title exist book: " + existBook.getTitle() + "\tID: " + existBook.getBookId());
		System.out.println("Title bookByTitle: " +  title );
		
		if (bookByTitle != null && !bookByTitle.getBookId().equals(existBook.getBookId())) {
	        String msg = "Could not update book because this title has been taken!";
	        listBook(msg);
	        return;
	    }
		readBookField(existBook);
			
		bookDAO.update(existBook);
			
		String msg = "The book has been updated successfully!";
		listBook(msg);
	}
	
	public void deleteBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		Book book =  bookDAO.get(bookId);
		
		if (book == null) {
			String message = "Could not find book with ID " + bookId 
					+ ", or it might have been deleted by another admin";
			request.setAttribute("message", message);
			request.getRequestDispatcher("message.jsp").forward(request, response);
			
		} else {
			if(!book.getReviews().isEmpty()) {
				String msg = "Could not delete the book. Because of reviews from this book";
				listBook(msg);
			} else {
				OrderDAO orderDAO = new OrderDAO();
				long countOrder = orderDAO.countBookInOrderDetail(bookId);
				if(countOrder > 0) {
					String msg = "Could not delete book with ID " + bookId
							+ " because there are orders associated with it.";
					listBook(msg);
				} else {
					String msg = "The book has been deleted successfully.";
					bookDAO.delete(bookId);			
					listBook(msg);
				}	
			}	
		}
	}
	
	
	public void listByCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(categoryId);
		request.setAttribute("category", category);
		
		if (category == null) {
			String message = "Sorry, the category ID " + categoryId + " is not available.";
			request.setAttribute("message", message);
			request.getRequestDispatcher("client/message_error.jsp").forward(request, response);
			return;
		}
		
		List<Book> listBook = bookDAO.listByCategory(categoryId);
		request.setAttribute("listBook", listBook);
		
		String listPage = "client/view_book_list_by_category.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);	
	}
	
	@SuppressWarnings("unused")
	public void viewBookDetail() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		Book book = bookDAO.get(bookId);
		
		List<Book> listBookByCategory = bookDAO.listByCategory(book.getCategory().getCategoryId());
		request.setAttribute("listBookByCategory", listBookByCategory);
		String destPage = "client/book_detail.jsp";
		
		if (book != null) {
			request.setAttribute("book", book);
			
		} else {
			destPage = "client/message.jsp";
			String message = "Sorry, the book with ID " + bookId + " is not available.";
			request.setAttribute("message", message);			
		}

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
		requestDispatcher.forward(request, response);
	}
	
	public void search() throws ServletException, IOException {
		
		String search = request.getParameter("keyword");
		request.setAttribute("search", search);
		String keyword = "%" + search + "%";
		
		List<Book> result = null;
		if(keyword.equals("")) {
			result = bookDAO.listAll();
		} else {
			result = bookDAO.search(keyword);
		}
		
		request.setAttribute("result", result);
		
		String searchPage = "client/search_book.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(searchPage);
		rd.forward(request, response);
	}
	
}
