package com.board.tjpost.service;

import java.util.List;
import java.util.Map;

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

	// 회원 목록 페이징
	List<MemberDTO> selectMemberListAllPaging(Map<String, Object> paramMap);

	// 회원 총 인원
	int selectMemberTotalCount();

	// 회원 정보
	MemberDTO selectMemberById(String memberId);


}
