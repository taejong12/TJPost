package com.board.tjpost.service;

import java.util.List;
import java.util.Map;

import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.OrdersDetailDTO;

public interface OrdersService {

	// 주문내역 저장
	OrdersDTO insertOrdersAndOrdersDetail(OrdersDTO ordersDTO);

	// 주문내역 조회
	List<OrdersDTO> selectOrdersList(Map<String, Object> paramMap);

	// 주문내역 총 갯수
	int selectOrdersTotalCount();

	// 주문내역상세조회
	List<OrdersDetailDTO> selectOrdersDetailListByOrdersId(Integer ordersId);

}
