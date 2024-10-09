package com.bookstore.controller.client.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.OrderServices;

@WebServlet("/my_order_detail")
public class ShowMyOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowMyOrderDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderServices orderServices = new OrderServices(request, response);
		orderServices.myOrderDetail();
	}

}
