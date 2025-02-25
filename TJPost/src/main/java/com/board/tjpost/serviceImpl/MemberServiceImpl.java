package com.board.tjpost.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.board.tjpost.dao.MemberDAO;
import com.board.tjpost.dto.MemberDTO;
import com.board.tjpost.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService, UserDetailsService {

	@Autowired
	private MemberDAO memberDAO;

	// 회원가입하기
	public void insertMemberJoin(MemberDTO memberDTO) {
		// 비밀번호 암호화
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		memberDTO.setMemberPassword(passwordEncoder.encode(memberDTO.getMemberPassword()));
		System.out.println("회원등록아이디: " + memberDTO.getMemberId());
		memberDAO.insertMemberJoin(memberDTO);
		
		//권한 등록
		memberDAO.insertAuthorities(memberDTO.getMemberId());
	}

	// 아이디 확인하기
	public boolean memberIdCheck(String memberId) {
		boolean idCreating = true;

		int result = memberDAO.memberIdCheck(memberId);

		if (result >= 1) {
			System.out.println("동일한 아이디가 존재합니다.");
			idCreating = false;
		}

		return idCreating;
	}

	// 로그인 인증
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		MemberDTO memberDTO = memberDAO.memberLoginCheck(memberId);

		// 사용자 정보가 없으면 예외를 발생시킴
		if (memberDTO == null) {
			throw new UsernameNotFoundException("아이디가 없습니다: " + memberId);
		}

		boolean memberEnabled = true;

		if (memberDTO.getMemberEnabled().equals("Y")) {
			memberEnabled = false;
		}

		//UserDetailsService - UserDetail 정보 저장 반환 (로그인 인증 해줌)
		return User.builder().username(memberDTO.getMemberId()) // 아이디
				.password(memberDTO.getMemberPassword()) // 암호화된 비밀번호
				.disabled(memberEnabled) // 사용 여부: memberEnabled가 true이면 disabled는 false / true = 휴면, false = 사용
				.authorities(memberDTO.getAuthoritiesAuthority()) // 권한 (권한이 여러 개일 경우 처리 필요)
				.build();
	}

	// 회원 검색
	public List<MemberDTO> searchMemberList(String searchKeyword) {
		return memberDAO.searchMemberList(searchKeyword);
	}

	// 회원 목록 페이징
	public List<MemberDTO> selectMemberListAllPaging(Map<String, Object> paramMap) {
		return memberDAO.selectMemberListAllPaging(paramMap);
	}

	// 회원 총 인원
	public int selectMemberTotalCount() {
		return memberDAO.selectMemberTotalCount();
	}

	// 회원 정보
	public MemberDTO selectMemberById(String memberId) {
		return memberDAO.selectMemberById(memberId);
	}

	// 내 정보
	public MemberDTO selectMemberInfo() {
		// 현재 로그인한 사용자 가져오기
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	    return memberDAO.selectMemberById(userDetails.getUsername()); 
	}

	// 회원정보수정
	public void updateMember(MemberDTO memberDTO) {
		memberDAO.updateMember(memberDTO);
	}

	// 회원탈퇴
	public void deleteMember(String memberId) {
		memberDAO.deleteMember(memberId);
	}
}
