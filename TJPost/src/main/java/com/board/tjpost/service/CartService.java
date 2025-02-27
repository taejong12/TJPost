package com.board.tjpost.service;

import java.util.List;

import com.board.tjpost.dto.CartDTO;

public interface CartService {

	// 장바구니 목록
	List<CartDTO> selectCartListByMemberId();

	// 장바구니 추가
	void insertCart(CartDTO cartDTO);

}
