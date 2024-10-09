package com.bookstore.dao;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.DAO.CategoryDAO;
import com.bookstore.entity.Category;

public class CategoryDAOTest {

	private static CategoryDAO categoryDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		categoryDAO = new CategoryDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		categoryDAO.close();
	}

	@Test
	public void testCreateCategory() {
		Category newCategory = new Category("Test");
		Category category = categoryDAO.create(newCategory);
		
		assertTrue(category != null && category.getCategoryId() > 0);
	}
	
	@Test
	public void testUpdateCategory() {
		Category updateCategory = new Category("Test_2");
		
		updateCategory.setCategoryId(18);
		Category category = categoryDAO.update(updateCategory);
		
		assertEquals(updateCategory.getName(), category.getName());
	}
	
	@Test
	public void testGetMethod() {
		Category category = categoryDAO.get(18);
		
		assertEquals(category.getName(), "Test_2");
	}
	
	@Test
	public void testDeleteMethod() {
		categoryDAO.delete(18);;
		Category deletedCategory = categoryDAO.get(18);
		assertNull(deletedCategory);
	}

	
	@Test
	public void testListAllCategory() {
		List<Category> listCategory = categoryDAO.listAll();

		assertTrue(listCategory.size() > 0);
	}
	
	@Test
	public void testCountAllCategory() {
		long count = categoryDAO.count();
		assertTrue(count > 0);
	}
}
