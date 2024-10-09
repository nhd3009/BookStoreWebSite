package com.bookstore.DAO;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Review;

public class ReviewDAO extends JpaDAO<Review> implements GenericDAO<Review> {
	
	public ReviewDAO() {
		
	}
	
	@Override
	public Review create(Review review) {
		review.setReviewTime(new Date());
		return super.create(review);
	}
	
	@Override
	public Review update(Review review) {
		return super.update(review);
	}
	

	@Override
	public Review get(Object id) {
		return super.find(Review.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Review.class, id);
	}

	@Override
	public List<Review> listAll() {
		return super.findWithNamedQuery("Review.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Review.countAll");
	}
	
	public long countCustomer(int customerId) {
		return super.countWithNamedQuery("Review.countCustomer", "customerId", customerId);
	}
	
	public Review findCustomerAndBook(int customerId, int bookId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("customerId", customerId);
		parameters.put("bookId", bookId);
		
		List<Review> result = super.findWithNamedQuery("Review.findCustomerAndBook", parameters);
		if(!result.isEmpty()) {
			return result.get(0);
		} else {
			return null;
		}
	}
	
	public List<Review> listRecentReview() {
		return super.findWithNamedQuery("Review.findAll", 0, 3);
	}
}
