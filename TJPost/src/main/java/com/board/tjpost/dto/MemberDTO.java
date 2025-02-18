package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {

	// MEMBER 테이블
	private String memberId; // 회원_아이디(PK)
	private String memberPassword; // 회원_비밀번호
	private String memberName; // 회원_이름
	private String memberPhoneNumber; // 회원_핸드폰번호
	private String memberEmail; // 회원_이메일
	private String memberEnabled; // 회원_계정활성화(기본값: Y(활성화), N(비활성화))-휴면회원
	private Date memberCreate; // 회원_생성일(기본값: 현재날짜)
	private Date memberUpdate; // 회원_수정일(기본값: 현재날짜)

	// AUTHORITIES 테이블
	private int authoritiesId; // 회원권한_아이디(PK)
	private String authoritiesAuthority; // 회원권한_권한(기본값: ROLE_USER(회원), ROLE_ADMIN(관리자))

}
