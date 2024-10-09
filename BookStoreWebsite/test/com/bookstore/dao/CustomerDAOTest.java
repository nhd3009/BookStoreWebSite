package com.bookstore.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.DAO.CustomerDAO;
import com.bookstore.entity.Customer;

class CustomerDAOTest {
	private static CustomerDAO customerDAO;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		customerDAO = new CustomerDAO();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

	@Test
	void testCreateCustomer() {
		Customer newCustomer =  new Customer();
		newCustomer.setEmail("helloitsme@gmail.com");
		newCustomer.setFullname("Dang Nguyen");
		newCustomer.setAddress("Cau Giay District");
		newCustomer.setCity("Hanoi");
		newCustomer.setCountry("Vietnam");
		newCustomer.setPhone("0987654321");
		newCustomer.setZipcode("100000");
		newCustomer.setPassword("helloitsme");
		
		Customer testCustomer = customerDAO.create(newCustomer);
		
		assertTrue(testCustomer.getCustomerId() > 0);
	}

	@Test
	void testGet() {
		int id = 3;
		Customer getCustomer = customerDAO.get(id);
		assertEquals("Minh Hoang Tuan", getCustomer.getFullname());
		System.out.println("Full name:" + getCustomer.getFullname());
	}
	
	@Test
	void testUpdate() {
		Customer customer = customerDAO.get(2);
		customer.setFullname("Nam Duy Tran");
		Customer updatedCustomer = customerDAO.update(customer);
		assertEquals("Nam Duy Tran", updatedCustomer.getFullname());
	}

	@Test
	void testDeleteObject() {
		int id = 1;
		customerDAO.delete(id);
		Customer deletedCustomer = customerDAO.get(id);
		assertNull(deletedCustomer);
	}

	@Test
	void testListAll() {
		List<Customer> customers = customerDAO.listAll();
		
		assertTrue(!customers.isEmpty());
		
		System.out.println("Full name:" + customers.get(0).getFullname());
	}
	
	@Test
	void testCount() {
		long count = customerDAO.count();
		assertEquals(1, count);
	}
	
	@Test
	void testLogin() {
		String email = "lmao@example.com";
		String password = "lmao1";
		Customer customer = customerDAO.checkLogin(email, password);
		
		assertNull(customer);
	}
}
