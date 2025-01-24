package com.board.tjpost.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.tjpost.dto.UserDTO;
import com.board.tjpost.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	//회원가입 폼 이동
	@GetMapping("/join")
	public String userJoinPage() {
		System.out.println("#### UserController/join(get) ####");
		return "user/userJoin";
	}
	
	//회원가입하기
	@PostMapping("/join")
	public String userJoin(UserDTO userDTO) {
		System.out.println("#### UserController/join(post) ####");
		System.out.println("아이디: "+userDTO.getMemberId());
		System.out.println("비밀번호: "+userDTO.getMemberPassword());
		System.out.println("이름: "+userDTO.getMemberName());
		System.out.println("이메일: "+userDTO.getMemberEmail());

		userService.insertUserJoin(userDTO);
		
		return "redirect:/user/login";
	}
	
	//로그인 창 이동
	@GetMapping("/login")
	public String userLoginPage() {
		System.out.println("#### UserController/login ####");
		return"user/userLogin";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String userLogout() {
		System.out.println("#### UserController/logout ####");
		return "redirect:/user/login";
	}
	
	//마이페이지 이동
	@GetMapping("/mypage")
	public String userMypage() {
		System.out.println("#### UserController/mypage ####");
		return "user/userMypage";
	}
	
	
}
