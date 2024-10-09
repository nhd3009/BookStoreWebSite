package book.bookstore.cart;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Map;

import org.junit.jupiter.api.Test;

import com.bookstore.controller.client.shoppingcart.ShoppingCart;
import com.bookstore.entity.Book;

class ShoppingCartTest {

	@Test
	void testAddItems() {
		ShoppingCart cart = new ShoppingCart();
		
		Book book = new Book();
		book.setBookId(2);
		cart.addItem(book);
		Map<Book, Integer> items = cart.getItems();
		int quantity = items.get(book);
		
		assertEquals(1, quantity);
	}

	@Test
	void testRemoveItems() {
		ShoppingCart cart = new ShoppingCart();
		Book book = new Book();
		book.setBookId(2);
		cart.addItem(book);
		cart.removeItem(book);
		assertEquals(null, cart.getItems().get(book));
	}
	
	@Test
	void testGetTotalQuantity() {
		ShoppingCart cart = new ShoppingCart();
		
		Book book = new Book();
		book.setBookId(2);
		cart.addItem(book);
		cart.addItem(book);
		cart.addItem(book);
		
		
		assertEquals(3, cart.getTotalQuantity());
	}
	
	@Test
	void testGetTotalAmount() {
		ShoppingCart cart = new ShoppingCart();
		Book book = new Book();
		book.setBookId(2);
		book.setPrice(1.5f);
		cart.addItem(book);
		cart.addItem(book);
		
		Book book2 = new Book();
		book2.setBookId(3);
		book2.setPrice(2);
		cart.addItem(book2);
		
		
		assertEquals(5.0f, cart.getTotalAmount());
	}
	
	@Test
	void testUpdateCart() {
		ShoppingCart cart = new ShoppingCart();
		Book book1 = new Book(3);
		Book book2 = new Book(4);
		
		cart.addItem(book1);
		cart.addItem(book2);
		
		int[] bookId = {3, 4};
		int[] quantity = {2, 4};
		
		cart.updateCart(bookId, quantity);
		
		assertEquals(6, cart.getTotalQuantity());
	}
	
}
