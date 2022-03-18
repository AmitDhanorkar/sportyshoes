package com.sportyshoes.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sportyshoes.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
	List<Role> findByName(String name);
}
