package com.bookstore.controller.client.shoppingcart;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/update_cart")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateCartServlet() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] arrayBookId = request.getParameterValues("bookId");
		String[] arrayQuantity = new String[arrayBookId.length];
		
		for(int i = 1; i <= arrayQuantity.length; i++) {
			String quantity = request.getParameter("quantity" + i);
			arrayQuantity[i - 1] = quantity;
		}
		
		int[] bookIds = Arrays.stream(arrayBookId).mapToInt(Integer::parseInt).toArray();
		int[] quantities = Arrays.stream(arrayQuantity).mapToInt(Integer::parseInt).toArray();
		
		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
		cart.updateCart(bookIds, quantities);
		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}

}
