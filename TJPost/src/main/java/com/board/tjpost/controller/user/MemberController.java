package com.board.tjpost.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
		return "user/member/memberJoin";
	}

	// 아이디 중복 확인
	@ResponseBody
	@PostMapping("/memberIdCheck")
	public boolean memberIdCheck(@RequestParam("memberId") String memberId) {
		// 아이디 중복 확인
		boolean idCreating = memberService.memberIdCheck(memberId);
		return idCreating;
	}

	// 회원가입하기
	@PostMapping("/join")
	public String memberJoin(MemberDTO memberDTO, Model model) {
		memberService.insertMemberJoin(memberDTO);
		return "redirect:/user/member/login";
	}

	// 로그인 창 이동
	@GetMapping("/login")
	public String memberLoginPage() {
		return "user/member/memberLogin";
	}

	// 로그인 처리
	@PostMapping("/login")
	public void memberLogin(MemberDTO memberDTO) {
		memberService.loadUserByUsername(memberDTO.getMemberId());
	}

	// 내정보페이지
	@GetMapping("/mypage")
	public String memberMyPage(Model model) {
		MemberDTO memberDTO = memberService.selectMemberInfo();
		model.addAttribute("memberDTO", memberDTO);
		return "user/member/memberMypage";
	}
	
	// 회원정보 수정페이지
	@GetMapping("/update")
	public String updateMemberPage(Model model) {
		MemberDTO memberDTO = memberService.selectMemberInfo();
		model.addAttribute("memberDTO", memberDTO);
		return "user/member/memberUpdate";
	}
	
	// 회원정보수정
	@PostMapping("/update")
	public String updateMember(@ModelAttribute MemberDTO memberDTO) {
		memberService.updateMember(memberDTO);
		return "redirect:/member/mypage";
	}
	
	// 회원삭제
	@GetMapping("/delete/{memberId}")
	public String deleteMember(@PathVariable String memberId) {
		memberService.deleteMember(memberId);
		return "redirect:/member/logout";
	}
}