package com.board.tjpost.service;

import java.util.List;
import java.util.Map;

import com.board.tjpost.dto.AddressDTO;

public interface AddressService {

	// 배송지 추가
	void insertAddress(AddressDTO addressDTO);

	// 배송지 목록 조회
	List<AddressDTO> selectAddressListByMemberId(Map<String, Object> paramMap);

	// 배송지 갯수
	int selectAddressTotalCountByMemberId();

	// 주소 아이디로 조회
	AddressDTO selectAddressByAddressId(Integer addressId);

	// 주소 아이디로 수정
	void updateAddressByAddressId(AddressDTO addressDTO);

	// 주소 아이디로 삭제
	void deleteAddressByAddressId(Integer addressId);

}
