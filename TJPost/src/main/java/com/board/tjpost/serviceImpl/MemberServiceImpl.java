package com.board.tjpost.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.tjpost.dao.MemberDAO;
import com.board.tjpost.dto.MemberDTO;
import com.board.tjpost.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	// 회원가입하기
	@Override
	public void insertMemberJoin(MemberDTO memberDTO) {
		memberDAO.insertMemberJoin(memberDTO);
	}

	// 아이디 확인하기
	@Override
	public int memberIdCheck(MemberDTO memberDTO) {
		return memberDAO.memberIdCheck(memberDTO);
	}
}
