package com.board.tjpost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.CartDTO;

@Mapper
public interface CartDAO {

	// 장바구니 조회
	List<CartDTO> selectCartListByMemberId(String memberId);

	// 장바구니 추가
	void insertCart(CartDTO cartDTO);

	// 장바구니 삭제
	void deleteCart(Integer cartId);
}
