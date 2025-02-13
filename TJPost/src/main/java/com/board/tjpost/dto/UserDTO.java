package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {

	private String memberId; // 유저 아이디
	private String memberPassword; // 유저 비밀번호
	private String memberName; // 유저 이름
	private String memberEmail; // 유저 이메일
	private Date memberCreatedDate; // 유저 가입일자
	private Date memberLastUpdatedDate; // 유저 수정일자
										// 유저 마지막 로그인일자
}
