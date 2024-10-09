package com.bookstore.dao;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.DAO.UsersDAO;
import com.bookstore.entity.Users;

public class UsersDAOTest {
	private static UsersDAO userDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		userDAO = new UsersDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		userDAO.close();
	}

	@Test
	public void testListAllUser() {
		List<Users> listUser = userDAO.listAll();

		assertTrue(listUser.size() > 0);
	}
	
	@Test
	public void testCountAllUser() {
		long count = userDAO.count();
		assertTrue(count > 0);
	}
	
	@Test
	public void testCheckLoginUser() {
		String email = "kobayashi@example.jp";
		String password = "kobayashi";
		boolean result = userDAO.checkLogin(email, password);
		assertTrue(result);
	}

}
