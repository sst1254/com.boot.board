package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dormain.User;
import com.example.demo.dto.ResponseDTO;
import com.example.demo.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	// 메인페이지로 보내주는 매핑
	@GetMapping({ "", "/" })
	public String mainPage() {
		return "index";
	}

	@GetMapping("/auth/insertUser")
	public String insertUser() {
		return "user/insertUser";
	}

	@PostMapping("/auth/insertUser")
	public @ResponseBody ResponseDTO<?> insertUser(@RequestBody User user) {
		userService.insertUser(user);
		return new ResponseDTO<>(HttpStatus.OK.value(), user.getUsername() + "가입성공");
	}
}
