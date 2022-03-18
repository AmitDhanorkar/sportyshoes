package com.sportyshoes.services;

import java.util.Date;
import java.util.List;

import com.sportyshoes.entity.Order;

public interface OrderService {

	public void addOrder(Order order);
	
	public void deleteOrder(long orderId);
	
	public List<Order> listAllOrders();
	
	public Order findOrderById(long orderId);

	public List<Order> findOrdersByCustomerID(long customerID);

	public List<Order> findOrdersByFromDateAndToDate(Date fromDate, Date toDate);

	public List<Order> findOrdersByCategory(String category);

	public List<Order> findOrdersByFromDateAndToDateAndCategory(String category, Date fromDate, Date toDate);
	
}
