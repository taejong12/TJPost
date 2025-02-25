package com.board.tjpost.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.AddressDTO;

@Mapper
public interface AddressDAO {

	// 배송지 목록 조회
	List<AddressDTO> selectAddressListByMemberId(Map<String, Object> paramMap);

	// 배송지 추가
	void insertAddress(AddressDTO addressDTO);

	// 회원 배송지 갯수 조회
	int selectAddressTotalCountByMemberId(String memberId);

	// 기본 배송지 N으로 변경
	void updateAddressDefaultAddress(String memberId);

	// 주소 아이디로 조회
	AddressDTO selectAddressByAddressId(Integer addressId);

	// 배송지 수정
	void updateAddressByAddressId(AddressDTO addressDTO);

	// 배송지 삭제
	void deleteAddressByAddressId(Integer addressId);

	
}
