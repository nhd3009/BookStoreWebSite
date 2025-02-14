package com.bookstore.DAO;

import java.util.List;

import com.bookstore.entity.Category;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category>{
	
	public CategoryDAO() {
		
	}
	
	@Override
	public Category create(Category category) {
		return super.create(category);
	}
	
	@Override
	public Category update(Category category) {
		return super.update(category);
	}

	@Override
	public Category get(Object id) {
		return super.find(Category.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Category.class, id);
	}

	@Override
	public List<Category> listAll() {
		return super.findWithNamedQuery("Category.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Category.countAll");
	}
	
	
	public Category findByName(String name) {
		List<Category> result = super.findWithNamedQuery("Category.findByName", "name", name);
		
		if(result != null && result.size() > 0) {
			return result.get(0);
		} else {
			return null;
		}
		
	}
}
