package com.bookstore.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Users;

public class UsersDAO extends JpaDAO<Users> implements GenericDAO<Users>{
	
	public UsersDAO() {
	}
	
	public Users create(Users user) {
		String encryptedPassword = HashGenerator.generateMD5(user.getPassword());
		user.setPassword(encryptedPassword);		
		return super.create(user);
	}
	
	public Users Update(Users user) {
		return super.update(user);
	}
	

	@Override
	public Users get(Object userId) {
		return super.find(Users.class, userId);
	}

	@Override
	public void delete(Object userId) {
		super.delete(Users.class, userId);
	}

	@Override
	public List<Users> listAll() {
		return super.findWithNamedQuery("Users.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Users.countAll");
	}
	
	public Users findByEmail(String email) {
		List<Users> listUser = super.findWithNamedQuery("Users.findByEmail", "email", email);
		
		if(listUser != null && listUser.size() > 0) {
			return listUser.get(0);
		} else {
			return null;
		}
		
	}
	
	public boolean checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<>();
		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
		parameters.put("password", encryptedPassword);
		
		List<Users> listUsers = super.findWithNamedQuery("Users.checkLogin", parameters);
		
		if (listUsers.size() == 1) {
			return true;
		} else {
			return false;
		}
	}
	
}
