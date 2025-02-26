package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddressDTO {
	private Integer addressId; // 주소번호
	private String addressName; // 주소이름
	private String addressRoadAddress; // 도로명주소
	private String addressDetailAddress; // 상세주소
	private String addressPostCode; // 우편번호
	private String addressPhoneNumber; // 핸드폰번호
	private String addressDefaultAddress; // 기본배송지여부
	private Date addressCreate; // 주소생성일
	private Date addressUpdate; // 주소수정일
	private String memberId; // 회원아이디
}
