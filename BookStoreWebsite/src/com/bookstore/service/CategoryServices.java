package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.DAO.BookDAO;
import com.bookstore.DAO.CategoryDAO;
import com.bookstore.entity.Category;


public class CategoryServices {
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		categoryDAO = new CategoryDAO();
	}
	
	public void listCategory(String msg) throws ServletException, IOException{
		
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		String listPage = "list_category.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(listPage);
		rd.forward(request, response);
	}
	
	public void listCategory() throws ServletException, IOException{
		listCategory(null);
	}
	
	public void newCategory() throws ServletException, IOException{
		String page = "form_category.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
	
	public void createCategory() throws ServletException, IOException{
		String name = request.getParameter("name");
		Category existCategory = categoryDAO.findByName(name);	
		if(existCategory != null) {
			String msg = "Could not create category. This category already exists";
			request.setAttribute("msg", msg);
			String msgPage = "common/message.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(msgPage);
			rd.forward(request, response);
		} else {
			Category newCategory = new Category(name);
			categoryDAO.create(newCategory);
			listCategory("A category has been created successfully!");
		}
	}
	
	public void editCategory() throws ServletException, IOException{
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(categoryId);
		request.setAttribute("category", category);
		String editPage = "form_category.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(editPage);
		rd.forward(request, response);
	}
	
	public void updateCategory() throws ServletException, IOException{
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("name");
		Category categoryById = categoryDAO.get(categoryId);
		Category categoryByName = categoryDAO.findByName(categoryName);
		
		if(categoryByName != null && categoryById.getCategoryId() != categoryByName.getCategoryId()) {
			String msg = "Couldn't update category. This category with name" + categoryName + " already exists.";
			request.setAttribute("msg", msg);
			String msgPage = "common/message.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(msgPage);
			rd.forward(request, response);
		} else {
			categoryById.setName(categoryName);
			categoryDAO.update(categoryById);
			String msg = "Category has been updated successfully";
			listCategory(msg);
		}
	}
	
	public void deleteCategory() throws ServletException, IOException{
		int categoryId = Integer.parseInt(request.getParameter("id"));
		String name = categoryDAO.get(categoryId).getName();
		BookDAO bookDAO = new BookDAO();
		long numBook = bookDAO.countByCategory(categoryId);
		String msg;
		if(numBook > 0) {
			msg = "Could not delete the category " + name + " because it contains some books";
			
		} else {
			categoryDAO.delete(categoryId);
			msg = "Category with " + name + " has been removed successfully!";
			
		}
		listCategory(msg);
	}
}
