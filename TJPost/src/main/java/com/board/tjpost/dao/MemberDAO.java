package com.board.tjpost.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.MemberDTO;

@Mapper
public interface MemberDAO {

	// 회원가입하기
	public void insertMemberJoin(MemberDTO memberDTO);

	// 아이디 확인
	public int memberIdCheck(String memberId);

	// 로그인 인증
	public MemberDTO memberLoginCheck(String memberId);

	// 권한 등록
	public void insertAuthorities(String memberId);

	// 회원 검색
	public List<MemberDTO> searchMemberList(String searchKeyword);

	// 회원 목록 페이징
	public List<MemberDTO> selectMemberListAllPaging(Map<String, Object> paramMap);

	// 회원 총 인원
	public int selectMemberTotalCount();

	// 회원 정보
	public MemberDTO selectMemberById(String memberId);
}
