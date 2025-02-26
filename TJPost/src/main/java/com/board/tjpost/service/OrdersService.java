package com.board.tjpost.service;

import com.board.tjpost.dto.OrdersDTO;

public interface OrdersService {

	// 주문내역 저장
	void insertOrdersAndOrdersDetail(OrdersDTO ordersDTO);

}
