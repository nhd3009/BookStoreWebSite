package com.bookstore.dao;

import static org.junit.Assert.assertNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.DAO.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

class BookOrderDAOTest {
	private static OrderDAO orderDAO;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

	@Test
	void testCreate() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(4);
		
		order.setCustomer(customer);
		order.setPaymentMethod("Cash on Delivery");
		order.setRecipientName("Minh Tran");
		order.setRecipientPhone("0987676481");
		order.setShippingAddress("Nam Tu Liem, Hanoi City, Vietnam");
		order.setStatus("Processing");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();
		
		Book book = new Book(3);
		orderDetail.setBook(book);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(21.0f);
		orderDetail.setBookOrder(order);
		
		orderDetails.add(orderDetail);
		order.setOrderDetails(orderDetails);
		
		BookOrder savedOrder = orderDAO.create(order);
		assertTrue(savedOrder != null && savedOrder.getOrderDetails().size() > 0);
	}
	
	@Test
	void testGet() {
		int orderId = 3;
		BookOrder order = orderDAO.get(orderId);
		
		assertEquals(1, order.getOrderDetails().size());
	}
	
	@Test
	void testListAll() {
		List<BookOrder> listOrders = orderDAO.listAll();
		for(BookOrder order : listOrders) {
			System.out.println(order.getOrderId() + " / " + order.getCustomer().getFullname() + " / " + order.getTotal() + " / " + order.getStatus());
			for(OrderDetail detail : order.getOrderDetails()) {
				Book book = detail.getBook();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println(" / " + book.getTitle() + " / " + quantity + " / " + subtotal);
			}
		}
		
		assertTrue(listOrders.size() > 0 );
	}
	
	@Test
	void testUpdate() {
		int orderId = 3;
		BookOrder order = orderDAO.get(orderId);
		order.setShippingAddress("New Address");
		orderDAO.update(order);
		
		BookOrder updatedOrder = orderDAO.get(orderId);
		
		assertEquals(order.getShippingAddress(), updatedOrder.getShippingAddress());
	}
	
	@Test
	void testAnotherUpdate() {
		Integer orderId = 3;
		BookOrder order = orderDAO.get(orderId);
		
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 11) {
				orderDetail.setQuantity(4);
				orderDetail.setSubtotal(9.64f);
			}
		}
			
		orderDAO.update(order);
		
		iterator = order.getOrderDetails().iterator();
		
		int expectedQuantity = 4;
		float expectedSubtotal = 9.64f;
		int actualQuantity = 0;
		float actualSubtotal = 0;
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 11) {
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
			}
		}		
		
		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);
		
	}
	
	@Test
	void testCount() {
		long totalOrder = orderDAO.count();
		assertEquals(1, totalOrder);
	}
	
	@Test
	void testDelete() {
		int orderId = 4;
		orderDAO.delete(orderId);
		BookOrder order = orderDAO.get(orderId);
		assertNull(order);
	}
	
	@Test
	void testFindCustomer() {
		int customerId = 4;
		List<BookOrder> listOrder  = orderDAO.listCustomer(customerId);
		assertTrue(listOrder.size() == 2);
	}
	
	@Test
	void testMonthTotal() {
		Map<String, Double> test =  orderDAO.monthTotalAmount();
		for(Map.Entry<String, Double> entry : test.entrySet()) {
			String month = entry.getKey();
	        Double total = entry.getValue();
	        
	        System.out.println("Month: " + month + " - Total: " + String.format("%.2f", total));
	        assertTrue(total >= 0, "Total amount should not be negative.");
		}
		 assertEquals(12, test.size(), "There should be 12 months in the result.");
	}
	
	@Test
	void testOrderTotal() {
		Map<String, Long> test =  orderDAO.monthOrder();
		for(Map.Entry<String, Long> entry : test.entrySet()) {
			String month = entry.getKey();
			Long total = entry.getValue();
	        
	        System.out.println("Month: " + month + " - Total: " + total);
	        assertTrue(total >= 0, "Total amount should not be negative.");
		}
		 assertEquals(12, test.size(), "There should be 12 months in the result.");
	}
}
