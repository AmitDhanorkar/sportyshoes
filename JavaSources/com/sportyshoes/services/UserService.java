package com.sportyshoes.services;

import java.util.List;

import com.sportyshoes.entity.User;

public interface UserService {
	void save(User user);
	
	void update(User user);

	User findByUsername(String username);
	
	List<User> listOfAllSignUpUsers();
	
	public User findUserById(long userId);
}
