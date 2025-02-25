package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddressDTO {
	private Integer addressId;
	private String addressName;
	private String addressRoadAddress;
	private String addressDetailAddress;
	private String addressPostCode;
	private String addressPhoneNumber;
	private String addressDefaultAddress;
	private Date addressCreate;
	private Date addressUpdate;
	private String memberId;
}
