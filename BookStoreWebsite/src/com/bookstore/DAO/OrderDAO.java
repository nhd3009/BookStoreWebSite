package com.bookstore.DAO;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.BookOrder;

public class OrderDAO extends JpaDAO<BookOrder> implements GenericDAO<BookOrder> {

	@Override
	public BookOrder create(BookOrder order) {
		order.setOrderDate(new Date());
		order.setStatus("Processing");
		return super.create(order);
	}
	
	@Override
	public BookOrder update(BookOrder order) {
		return super.update(order);
	}
	
	@Override
	public BookOrder get(Object id) {
		return super.find(BookOrder.class, id);
	}
	
	public BookOrder get(int orderId, int customerId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("orderId", orderId);
		parameters.put("customerId", customerId);
		List<BookOrder> result = super.findWithNamedQuery("BookOrder.findIdAndCustomer", parameters);
		
		if(!result.isEmpty()) {
			return result.get(0);
		} else {
			return null;
		}
	}

	@Override
	public void delete(Object id) {
		super.delete(BookOrder.class, id);
	}

	@Override
	public List<BookOrder> listAll() {
		return super.findWithNamedQuery("BookOrder.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("BookOrder.countAll");
	}
	
	public long countBookInOrderDetail(int bookId) {
		return super.countWithNamedQuery("OrderDetail.countBook", "bookId", bookId);
	}
	
	public long countCustomer(int customerId) {
		return super.countWithNamedQuery("BookOrder.countCustomer", "customerId", customerId);
	}
	
	public List<BookOrder> listCustomer(int customerId) {
		return super.findWithNamedQuery("BookOrder.findCustomer", "customerId", customerId);
	}
	
	public List<BookOrder> mostRecentSales() {
		return super.findWithNamedQuery("BookOrder.findAll", 0, 3);
	}
	
	public Map<String, Double> monthTotalAmount() {
		Map<String, Double> totalAmountMap = new LinkedHashMap<>();
	    totalAmountMap.put("January", 0.0);
	    totalAmountMap.put("February", 0.0);
	    totalAmountMap.put("March", 0.0);
	    totalAmountMap.put("April", 0.0);
	    totalAmountMap.put("May", 0.0);
	    totalAmountMap.put("June", 0.0);
	    totalAmountMap.put("July", 0.0);
	    totalAmountMap.put("August", 0.0);
	    totalAmountMap.put("September", 0.0);
	    totalAmountMap.put("October", 0.0);
	    totalAmountMap.put("November", 0.0);
	    totalAmountMap.put("December", 0.0);

	    List<Object[]> result = super.findObjectWithNamedQuery("BookOrder.countTotalByMonth");
	    
	    if (!result.isEmpty()) {
	        for (Object[] index : result) {
	            int month = (int) index[0];
	            double total = (double) index[1]; 
	           
	            String monthName = getMonthName(month);
	            totalAmountMap.put(monthName, total);
	        }
	    }
	    
	    return totalAmountMap;
	}
	
	public Map<String, Long> monthOrder() {
		Map<String, Long> totalOrderMap = new LinkedHashMap<>();
		totalOrderMap.put("January", (long) 0);
		totalOrderMap.put("February", (long) 0);
		totalOrderMap.put("March", (long) 0);
		totalOrderMap.put("April", (long) 0);
		totalOrderMap.put("May", (long) 0);
		totalOrderMap.put("June", (long) 0);
		totalOrderMap.put("July", (long) 0);
		totalOrderMap.put("August", (long) 0);
		totalOrderMap.put("September", (long) 0);
		totalOrderMap.put("October", (long) 0);
		totalOrderMap.put("November", (long) 0);
		totalOrderMap.put("December", (long) 0);

	    List<Object[]> result = super.findObjectWithNamedQuery("BookOrder.countOrderByMonth");
	    
	    if (!result.isEmpty()) {
	        for (Object[] index : result) {
	            int month = (int) index[0];
	            long total = (long) index[1]; 
	           
	            String monthName = getMonthName(month);
	            totalOrderMap.put(monthName, total);
	        }
	    }
	    
	    return totalOrderMap;
	}

	private String getMonthName(int month) {
	    String[] months = {"January", "February", "March", "April", "May", "June", 
	                       "July", "August", "September", "October", "November", "December"};
	    
	    if (month >= 1 && month <= 12) {
	        return months[month - 1];
	    } else {
	        return "Unknown Month";
	    }
	}
	
	
}
