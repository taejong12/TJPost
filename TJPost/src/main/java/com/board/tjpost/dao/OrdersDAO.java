package com.board.tjpost.dao;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.OrdersDetailDTO;

@Mapper
public interface OrdersDAO {

	// 주문 내역 저장
	void insertOrders(OrdersDTO ordersDTO);

	// 주문 상세 내역 저장
	void insertOrdersDetail(OrdersDetailDTO ordersDetailDTO);
	
}
