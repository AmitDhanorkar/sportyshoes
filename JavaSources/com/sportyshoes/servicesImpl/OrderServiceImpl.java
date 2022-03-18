package com.sportyshoes.servicesImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportyshoes.entity.Order;
import com.sportyshoes.repository.OrderRepository;
import com.sportyshoes.services.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderRepository orderRepository;
	
	@Override
	public void addOrder(Order order) {
		orderRepository.save(order);
	}

	@Override
	public void deleteOrder(long orderId) {
		orderRepository.delete(orderId);

	}

	@Override
	public List<Order> listAllOrders() {
		return orderRepository.findAll();
	}

	@Override
	public Order findOrderById(long orderId) {
		return orderRepository.findOne(orderId);
	}

	@Override
	public List<Order> findOrdersByCustomerID(long customerID) {
		return orderRepository.findOrdersByCustomerID(customerID);
	}

	@Override
	public List<Order> findOrdersByFromDateAndToDate(Date fromDate, Date toDate) {
		return orderRepository.findOrdersByFromDateAndToDate(fromDate, toDate);
	}

	@Override
	public List<Order> findOrdersByCategory(String category) {
		return orderRepository.findOrdersByCategory(category);
	}

	@Override
	public List<Order> findOrdersByFromDateAndToDateAndCategory(String category, Date fromDate, Date toDate) {
		return orderRepository.findOrdersByFromDateAndToDateAndCategory(category, fromDate, toDate);
	}
}
