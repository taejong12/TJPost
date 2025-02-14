package com.board.tjpost.dao;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.MemberDTO;

@Mapper
public interface MemberDAO {

	// 회원가입하기
	public void insertMemberJoin(MemberDTO memberDTO);

	// 아이디 확인
	public int memberIdCheck(MemberDTO memberDTO);
}
