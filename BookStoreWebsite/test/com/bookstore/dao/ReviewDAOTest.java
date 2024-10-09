package com.bookstore.dao;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.DAO.ReviewDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

class ReviewDAOTest {
	private static ReviewDAO reviewDAO;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		reviewDAO = new ReviewDAO();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		reviewDAO.close();
	}

	@Test
	void testCreateReview() {
		Review review = new Review();
		Customer customer = new Customer();
		customer.setCustomerId(3);
		Book book = new Book();
		book.setBookId(11);
		review.setBook(book);
		review.setCustomer(customer);
		
		review.setHeadline("Absolute Cinema");
		review.setRating(5);
		review.setComment("Bocchi is a good girl. I am one of her fan.");
		
		Review newReview = reviewDAO.create(review);
		System.out.println("Comment:" + newReview.getComment());
		assertNotNull(newReview);
	}
	
	@Test
	void testGetReview() {
		Review review = reviewDAO.get(1);
		assertNotNull(review);
	}
	
	@Test
	void testUpdateReview() {
		int id = 1;
		Review review = reviewDAO.get(id);
		review.setHeadline("Shikanokono Nokotan");
		
		Review reviewUpdated = reviewDAO.update(review);
		
		assertEquals(review.getHeadline(), reviewUpdated.getHeadline());
	}
	
	@Test
	void testListAll() {
		List<Review> listReview = reviewDAO.listAll();
		for(Review review : listReview) {
			System.out.println("Headline: " + review.getHeadline());
		}
		assertTrue(listReview.size() > 0);
	}
	
	@Test
	void testCountAll() {
		long count = reviewDAO.count();
		assertEquals(4, count);
	}
	
	@Test
	void testDelete() {
		int id = 4;
		reviewDAO.delete(id);
		Review review = reviewDAO.get(id);
		assertNull(review);
	}
	
	@Test 
	void testFindCustomerAndBook(){
		int customerId = 3;
		int bookId = 11;
		Review result = reviewDAO.findCustomerAndBook(customerId, bookId);
		assertNotNull(result);
	}

}
