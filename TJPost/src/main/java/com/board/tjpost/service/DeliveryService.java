package com.board.tjpost.service;

import java.util.List;

import com.board.tjpost.dto.AddressDTO;
import com.board.tjpost.dto.DeliveryDTO;
import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.ProductDTO;

public interface DeliveryService {

	// 배송 목록 조회
	List<DeliveryDTO> selectDeliveryListByMemberId();

	// 결제 완료 배송 저장
	void insertDeliveryOrdersComplete(OrdersDTO ordersDTO, AddressDTO addressDTO);

}
