package com.bookstore.DAO;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Customer;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDAO<Customer> {

	
	
	@Override
	public Customer create(Customer customer) {
		customer.setRegisterDate(new Date());
		return super.create(customer);
	}

	@Override
	public Customer get(Object id) {
		return super.find(Customer.class, id);
	}
	
	@Override
	public Customer update(Customer customer) {
		return super.update(customer);
	}

	@Override
	public void delete(Object id) {
		super.delete(Customer.class, id);
	}

	@Override
	public List<Customer> listAll() {
		return super.findWithNamedQuery("Customer.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Customer.countAll");
	}
	
	public Customer findByEmail(String email) {
		List<Customer> customers = super.findWithNamedQuery("Customer.findByEmail", "email", email);
		
		if(customers != null && customers.size() > 0) {
			return customers.get(0);
		} else {
			return null;
		}
	}
	
	public Customer checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<>();
		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
		parameters.put("password", encryptedPassword);
		
		List<Customer> listCustomer = super.findWithNamedQuery("Customer.checkLogin", parameters);
		
		if(!listCustomer.isEmpty()) {
			return listCustomer.get(0);
		} else {
			return null;
		}
	}
	
}
