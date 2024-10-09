package com.bookstore.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.DAO.BookDAO;
import com.bookstore.entity.Book;

class BookDAOTest {
	private static BookDAO bookDAO;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		bookDAO = new BookDAO();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		bookDAO.close();
	}

	@Test
	public void findByTitle() {
		String title = "Effective Java (3rd Edition)";
		Book book = bookDAO.findByTitle(title);
		assertNull(book);
	}
	
	@Test
	public void findByCategory() {
		int categoryId = 13;
		List<Book> listBook = bookDAO.listByCategory(categoryId);
		assertTrue(listBook.size() > 0);
	}

	@Test
	public void searchTest() {
		String search = "Bocchi";
		String keyword = "%" + search + "%";
		List<Book> listBook = bookDAO.search(keyword);
		assertEquals(1, listBook.size());
	}
	
	@Test
	public void countByCategoryTest() {
		int categoryId = 13;
		long count = bookDAO.countByCategory(categoryId);
		assertTrue(count > 0);
	}
	
	@Test
	public void bestSellerBookTest() {
		List<Book> listBook = bookDAO.listBestSellingBook();
		for(Book book : listBook) {
			System.out.println("Book Title: " + book.getTitle());
		}
		
		assertEquals(6, listBook.size());
	}
	
	@Test
	public void favoritedBookTest() {
		List<Book> listBook = bookDAO.listFavoritedBook();
		for(Book book : listBook) {
			System.out.println("Book Title: " + book.getTitle());
		}
		assertTrue(listBook.size() > 0);
	}
}
