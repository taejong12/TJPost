package com.board.tjpost.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println("#### MemberController/memberJoinPage ####");
		return "user/member/memberJoin";
	}

	// 아이디 중복 확인
	@ResponseBody
	@PostMapping("/memberIdCheck")
	public boolean memberIdCheck(@RequestParam("memberId") String memberId) {
		System.out.println("#### MemberController/memberIdCheck ####");

		System.out.println("memberId: " + memberId);

		// 아이디 중복 확인
		boolean idCreating = memberService.memberIdCheck(memberId);

		if (idCreating) {
			System.out.println("아이디 생성 가능");
		} else {
			System.out.println("이미 존재하는 아이디입니다.");
		}

		return idCreating;
	}

	// 회원가입하기
	@PostMapping("/join")
	public String memberJoin(MemberDTO memberDTO, Model model) {
		System.out.println("#### MemberController/memberJoin ####");

		// 회원가입
		memberService.insertMemberJoin(memberDTO);

		return "redirect:/user/member/login";
	}

	// 로그인 창 이동
	@GetMapping("/login")
	public String memberLoginPage() {
		System.out.println("#### MemberController/memberLoginPage ####");
		return "user/member/memberLogin";
	}

	// 로그인 처리
	@PostMapping("/login")
	public void memberLogin(MemberDTO memberDTO) {
		System.out.println("#### MemberController/memberLogin ####");
		memberService.loadUserByUsername(memberDTO.getMemberId());
	}

	// 마이페이지 이동
	@GetMapping("/mypage")
	public String memberMyPage() {
		System.out.println("#### MemberController/memberMypage ####");
		return "user/member/memberMypage";
	}
}