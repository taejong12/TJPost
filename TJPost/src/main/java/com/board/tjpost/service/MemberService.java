package com.board.tjpost.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

import com.board.tjpost.dto.MemberDTO;

public interface MemberService {

	// 회원가입하기
	void insertMemberJoin(MemberDTO memberDTO);

	// 아이디 확인하기
	boolean memberIdCheck(String memberId);

	// 회원 로그인 인증
	UserDetails loadUserByUsername(String memberId);

	// 회원 검색
	List<MemberDTO> searchMemberList(String searchKeyword);


}
