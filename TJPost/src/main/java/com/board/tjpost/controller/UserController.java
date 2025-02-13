package com.board.tjpost.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	// 회원가입 폼 이동
	@GetMapping("/join")
	public String userJoinPage() {
		System.out.println("#### UserController/join(get) ####");
		return "user/userJoin";
	}

	// 회원가입하기
	@PostMapping("/join")
	public String userJoin(UserDTO userDTO, Model model) {
		System.out.println("#### UserController/join(post) ####");

		// 아이디 확인
		int idCheck = userService.userIdCheck(userDTO);

		// 아이디 체크
		if (idCheck > 0) {
			System.out.println("이미 존재하는 아이디입니다.");
			// 중복된 아이디 메시지를 Model에 전달
			model.addAttribute("message", "이미 존재하는 아이디입니다.");
			return "user/userJoin"; // join.jsp로 이동
		} else {

			// 회원가입
			userService.insertUserJoin(userDTO);

			return "redirect:/user/login";
		}
	}

	// 로그인 창 이동
	@GetMapping("/login")
	public String userLoginPage() {
		System.out.println("#### UserController/login ####");
		return "user/userLogin";
	}

	// 로그인 처리

	// 로그아웃
	@GetMapping("/logout")
	public String userLogout() {
		System.out.println("#### UserController/logout ####");
		return "redirect:/user/login";
	}

	// 마이페이지 이동
	@GetMapping("/mypage")
	public String userMypage() {
		System.out.println("#### UserController/mypage ####");
		return "user/userMypage";
	}

}
