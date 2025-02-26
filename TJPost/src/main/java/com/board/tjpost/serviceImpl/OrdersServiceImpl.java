package com.board.tjpost.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.tjpost.dao.OrdersDAO;
import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.OrdersDetailDTO;
import com.board.tjpost.dto.ProductDTO;
import com.board.tjpost.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersDAO ordersDAO;

	// 주문내역 & 주문상세내역 저장
	public void insertOrdersAndOrdersDetail(OrdersDTO ordersDTO) {

		ordersDAO.insertOrders(ordersDTO);
		for (OrdersDetailDTO ordersDetailDTO : ordersDTO.getOrdersDetailList()) {

			ordersDAO.insertOrdersDetail(ordersDetailDTO);
		}

	}

}
