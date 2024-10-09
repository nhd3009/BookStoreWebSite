package com.bookstore.DAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bookstore.entity.Book;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book>{
	
	public BookDAO() {
		
	}
	
	@Override
	public Book create(Book book) {
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}
	
	@Override
	public Book update(Book book) {
		book.setLastUpdateTime(new Date());
		return super.update(book);
	}

	@Override
	public Book get(Object id) {
		return super.find(Book.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Book.class, id);
	}

	@Override
	public List<Book> listAll() {
		return super.findWithNamedQuery("Book.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Book.countAll");
	}
	
	public Book findByTitle(String title) {
		List<Book> result = super.findWithNamedQuery("Book.findByTitle", "title", title);
		
		if(!result.isEmpty()) {
			return result.get(0);
		} else {
			return null;
		}
	}
	
	public List<Book> listByCategory(int categoryId){
		return super.findWithNamedQuery("Book.findByCategory", "categoryId" , categoryId);
	}
	
	public List<Book> search(String keyword){
		return super.findWithNamedQuery("Book.search", "keyword", keyword);
	}
	
	public List<Book> listNewBook(){
		return super.findWithNamedQuery("Book.listNewBook", 0, 6);
	}
	
	public long countByCategory(int categoryId) {
		return super.countWithNamedQuery("Book.countByCategory", "categoryId", categoryId);
	}
	
	public List<Book> listBestSellingBook() {
		List<Book> bestsellerBook = new ArrayList<>();
		List<Object[]> result = super.findObjectWithNamedQuery("OrderDetail.bestSellerBook", 0, 6);
		if(!result.isEmpty()) {
			for(Object[] index : result) {
				Book book = (Book) index[0];
				bestsellerBook.add(book);
			}
		}
		return bestsellerBook;
	}
	
	public List<Book> listFavoritedBook() {
		List<Book> mostFavoritedBook = new ArrayList<>();
		List<Object[]> result = super.findObjectWithNamedQuery("Review.favoritedBook", 0, 6);
		if(!result.isEmpty()) {
			for(Object[] index : result) {
				Book book = (Book) index[0];
				mostFavoritedBook.add(book);
			}
		}
		
		return mostFavoritedBook;
	}
}
