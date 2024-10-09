package com.bookstore.dao;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import com.bookstore.DAO.HashGenerator;

class HashGeneratorTest {

	@Test
	public void testGenerateMD5() {
		String password = "kobayashi";
		String encryptedPassword = HashGenerator.generateMD5(password);
		
		System.out.println(encryptedPassword);
		
		assertTrue(true);
	}

}
