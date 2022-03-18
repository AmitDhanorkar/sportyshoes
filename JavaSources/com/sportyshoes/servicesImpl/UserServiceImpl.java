package com.sportyshoes.servicesImpl;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sportyshoes.entity.User;
import com.sportyshoes.repository.RoleRepository;
import com.sportyshoes.repository.UserRepository;
import com.sportyshoes.services.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public void save(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		
		if("Y".equals(user.getIsAdmin())) 
			user.setRoles(new HashSet<>(roleRepository.findByName("ROLE_ADMIN")));
		else
			user.setRoles(new HashSet<>(roleRepository.findByName("ROLE_USER")));
		
		userRepository.save(user);
	}

	
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public void update(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		userRepository.updatePassword(user.getPassword(), user.getUsername());
	}
	
	public List<User> listOfAllSignUpUsers() {
		return userRepository.findAll();
	}


	@Override
	public User findUserById(long userId) {
		return userRepository.findOne(userId);
	}
}
