package com.sportyshoes.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sportyshoes.entity.Order;

@Repository
public interface OrderRepository  extends JpaRepository<Order, Long> {

	@Query("SELECT o FROM Order o where o.customerID = ?")
	List<Order> findOrdersByCustomerID(long customerID);

	@Query("SELECT o FROM Order o WHERE o.createdDt between ?1 AND ?2")
	public List<Order> findOrdersByFromDateAndToDate(Date fromDate, Date toDate);

	@Query("SELECT o FROM Order o, Product p WHERE o.productId = p.id AND p.category=?")
	public List<Order> findOrdersByCategory(String category);

	@Query("SELECT o FROM Order o, Product p WHERE o.productId = p.id AND p.category=?1 AND (o.createdDt between ?2 AND ?3)")
	public List<Order> findOrdersByFromDateAndToDateAndCategory( String category, Date fromDate, Date toDate);
}
