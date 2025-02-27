package com.board.tjpost.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.OrdersDetailDTO;

@Mapper
public interface OrdersDAO {

	// 주문 내역 저장
	void insertOrders(OrdersDTO ordersDTO);

	// 주문 상세 내역 저장
	void insertOrdersDetail(OrdersDetailDTO ordersDetailDTO);

	// 주문 내역 조회
	List<OrdersDTO> selectOrdersList(Map<String, Object> paramMap);

	// 주문내역 총갯수
	int selectOrdersTotalCount(String username);

	// 주문내역 상세페이지 조회
	List<OrdersDetailDTO> selectOrdersDetailListByOrdersId(Integer ordersId);
}
