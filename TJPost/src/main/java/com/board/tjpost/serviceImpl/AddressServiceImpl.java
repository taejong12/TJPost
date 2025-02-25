package com.board.tjpost.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.board.tjpost.dao.AddressDAO;
import com.board.tjpost.dto.AddressDTO;
import com.board.tjpost.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressDAO addressDAO;
	
	// 배송지 추가
	public void insertAddress(AddressDTO addressDTO) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		addressDTO.setMemberId(userDetails.getUsername());
		
		// 기본 배송지 설정
		if("Y".equals(addressDTO.getAddressDefaultAddress())) {
			addressDAO.updateAddressDefaultAddress(addressDTO.getMemberId());
		} else if(!("Y".equals(addressDTO.getAddressDefaultAddress()))) {
			addressDTO.setAddressDefaultAddress("N");
		}
		
		addressDAO.insertAddress(addressDTO);
	}

	// 배송지 목록 조회 페이징
	public List<AddressDTO> selectAddressListByMemberId(Map<String, Object> paramMap) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		paramMap.put("memberId", userDetails.getUsername());
		return addressDAO.selectAddressListByMemberId(paramMap);
	}

	// 회원 배송지 갯수 조회
	public int selectAddressTotalCountByMemberId() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		return addressDAO.selectAddressTotalCountByMemberId(userDetails.getUsername());
	}

	// 주소 아이디로 조회
	public AddressDTO selectAddressByAddressId(Integer addressId) {
		return addressDAO.selectAddressByAddressId(addressId);
	}

	// 주소 아이디로 수정
	public void updateAddressByAddressId(AddressDTO addressDTO) {
		
		// 기본 배송지 설정
		if("Y".equals(addressDTO.getAddressDefaultAddress())) {
			addressDAO.updateAddressDefaultAddress(addressDTO.getMemberId());
		} else if(!("Y".equals(addressDTO.getAddressDefaultAddress()))) {
			addressDTO.setAddressDefaultAddress("N");
		}
		
		addressDAO.updateAddressByAddressId(addressDTO);
	}

	// 주소 아이디로 삭제
	public void deleteAddressByAddressId(Integer addressId) {
		addressDAO.deleteAddressByAddressId(addressId);
	}

	
}
