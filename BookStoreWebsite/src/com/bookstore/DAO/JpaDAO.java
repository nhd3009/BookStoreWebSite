package com.bookstore.DAO;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class JpaDAO<E> {
	private static EntityManagerFactory entityManagerFactory;
	
	static {
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");

	}
	
	public JpaDAO() {
		
	}
	
	public E create(E entity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.persist(entity);
		entityManager.flush();
		entityManager.refresh(entity);
		entityManager.getTransaction().commit();
		entityManager.close();
		return entity;
	}
	
	public E update(E entity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		entity = entityManager.merge(entity);
		entityManager.getTransaction().commit();
		entityManager.close();
		return entity;
	}
	
	public E find(Class<E> type, Object id) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		E entity = entityManager.find(type, id);
		if(entity != null) {
			entityManager.refresh(entity);
		}
		entityManager.close();
		return entity;
	}
	
	public void delete(Class<E> type, Object id) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		Object reference = entityManager.getReference(type, id);
		entityManager.remove(reference);
		entityManager.getTransaction().commit();
		entityManager.close();
	}

	@SuppressWarnings("unchecked")
	public List<E> findWithNamedQuery(String _query){
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(_query);
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findWithNamedQuery(String _query, String paramName, Object paramValue){
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(_query);
		query.setParameter(paramName, paramValue);
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findWithNamedQuery(String _query, int firstResult, int maxResult){
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(_query);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> findObjectWithNamedQuery(String _query, int firstResult, int maxResult){
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(_query);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		List<Object[]> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> findObjectWithNamedQuery(String _query){
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(_query);
		List<Object[]> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findWithNamedQuery(String _query, Map<String, Object> parameters){
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(_query);
		Set<Entry<String, Object>> setParameters = parameters.entrySet();
		for(Entry<String, Object> entry : setParameters) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	public long countWithNamedQuery(String _query) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(_query);
		long result = (long) query.getSingleResult();
		entityManager.close();
		return result;
	}
	
	public long countWithNamedQuery(String _query, String paramName, Object paramValue) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(_query);
		query.setParameter(paramName, paramValue);
		long result = (long) query.getSingleResult();
		entityManager.close();
		return result;
	}
	
	public void close() {
		if(entityManagerFactory != null) {
			entityManagerFactory.close();
		}
	}
}
