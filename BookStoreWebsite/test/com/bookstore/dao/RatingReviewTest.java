package com.bookstore.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.HashSet;
import java.util.Set;

import org.junit.jupiter.api.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Review;

class RatingReviewTest {

	@Test
	void testAvgRating() {
		Book book = new Book();
		Set<Review> reviews = new HashSet<Review>();
		Review review_1 = new Review();
		review_1.setRating(5);
		reviews.add(review_1);
		
		book.setReviews(reviews);
		
		float avarageRating = book.getAvarageRating();
		
		assertEquals(5.0, avarageRating, 0.0);
	}
	
	@Test
	void testRatingString() {
		float avgRating = 4.5f;
		Book book = new Book();
		
		String actual = book.getRatingString(avgRating);
		String expected = "on,on,on,on,half";
		System.out.println("Actual:" + actual);
		assertEquals(expected, actual);
	}

}
