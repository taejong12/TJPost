package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {

	private String memberId; // 회원 아이디
	private String memberPassword; // 회원 비밀번호
	private String memberName; // 회원 이름
	private String memberPhoneNumber; // 회원 핸드폰번호
	private String memberEmail; // 회원 이메일
	private Date memberCreate; // 회원 가입일자
	private Date memberUpdate; // 회원 수정일자

}
