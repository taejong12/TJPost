package com.board.tjpost.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.tjpost.dao.DeliveryDAO;
import com.board.tjpost.dto.AddressDTO;
import com.board.tjpost.dto.DeliveryDTO;
import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.ProductDTO;
import com.board.tjpost.service.DeliveryService;

@Service
public class DeliveryServiceImpl implements DeliveryService {

	@Autowired
	private DeliveryDAO deliveryDAO;

	// 배송지 목록 조회
	public List<DeliveryDTO> selectDeliveryListByMemberId() {
		
		return null;
	}

	// 배송 저장
	public void insertDeliveryOrdersComplete(OrdersDTO ordersDTO, AddressDTO addressDTO) {
		// TODO Auto-generated method stub
		
	}
	
}
