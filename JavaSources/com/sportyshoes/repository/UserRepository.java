package com.sportyshoes.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.sportyshoes.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);
	
	@Transactional
	@Modifying
	@Query("UPDATE User SET password = ?1 WHERE username = ?2)")
	void updatePassword(String password, String username);
	
}
