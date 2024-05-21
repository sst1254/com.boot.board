package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dormain.RoleType;
import com.example.demo.dormain.User;
import com.example.demo.persistence.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Transactional
	public void insertUser(User user) {
		user.setRole(RoleType.User);
		userRepository.save(user);
	}

	@Transactional(readOnly = true)
	public User getUser(String username) {
		User findUser = userRepository.findByUsername(username).orElseGet(() -> {
			return new User();
		});

		return findUser;
	}
}
