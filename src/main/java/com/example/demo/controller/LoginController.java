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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@GetMapping("/auth/login")
	public String loginpage() {
		return "system/login";
	}

	@PostMapping("/auth/login")
	public @ResponseBody ResponseDTO<?> login(@RequestBody User user, HttpSession session) {

		User findUser = userService.getUser(user.getUsername());

		if (findUser.getUsername() == null) {
			return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "아이디 존재 안함");
		} else {
			if (user.getPassword().equals(findUser.getPassword())) {
				session.setAttribute("principal", findUser);
				return new ResponseDTO<>(HttpStatus.OK.value(), findUser.getUsername() + "님 로그인 성공");
			} else {
				return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "비밀번호 틀림");
			}
		}
	}

	@GetMapping("/auth/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 요청");
		session.invalidate();
		return "system/login";
	}
}
