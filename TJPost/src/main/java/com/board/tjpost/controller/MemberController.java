package com.board.tjpost.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.tjpost.dto.MemberDTO;
import com.board.tjpost.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 회원가입 폼 이동
	@GetMapping("/join")
	public String memberJoinPage() {
		System.out.println("#### MemberController/join(get) ####");
		return "member/memberJoin";
	}

	// 회원가입하기
	@PostMapping("/join")
	public String memberJoin(MemberDTO memberDTO, Model model) {
		System.out.println("#### MemberController/join(post) ####");

		// 아이디 확인
		int idCheck = memberService.memberIdCheck(memberDTO);

		// 아이디 체크
		if (idCheck > 0) {
			System.out.println("이미 존재하는 아이디입니다.");
			// 중복된 아이디 메시지를 Model에 전달
			model.addAttribute("message", "이미 존재하는 아이디입니다.");
			return "member/memberJoin"; // join.jsp로 이동
		} else {

			// 회원가입
			memberService.insertMemberJoin(memberDTO);

			return "redirect:/member/login";
		}
	}

	// 로그인 창 이동
	@GetMapping("/login")
	public String memberLoginPage() {
		System.out.println("#### MemberController/login ####");
		return "member/memberLogin";
	}

	// 로그인 처리

	// 로그아웃
	@GetMapping("/logout")
	public String memberLogout() {
		System.out.println("#### MemberController/logout ####");
		return "redirect:/member/login";
	}

	// 마이페이지 이동
	@GetMapping("/mypage")
	public String memberMypage() {
		System.out.println("#### MemberController/mypage ####");
		return "member/memberMypage";
	}

}
