package com.board.tjpost.service;

import com.board.tjpost.dto.MemberDTO;

public interface MemberService {

	// 회원가입하기
	void insertMemberJoin(MemberDTO memberDTO);

	// 아이디 확인하기
	int memberIdCheck(MemberDTO memberDTO);
}
