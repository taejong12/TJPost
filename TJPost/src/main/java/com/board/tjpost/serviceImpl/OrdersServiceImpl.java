package com.board.tjpost.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.board.tjpost.dao.FileDAO;
import com.board.tjpost.dao.OrdersDAO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.OrdersDetailDTO;
import com.board.tjpost.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersDAO ordersDAO;

	// 주문내역 & 주문상세내역 저장
	public OrdersDTO insertOrdersAndOrdersDetail(OrdersDTO ordersDTO) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		ordersDTO.setMemberId(userDetails.getUsername());

		ordersDAO.insertOrders(ordersDTO);

		for (OrdersDetailDTO ordersDetailDTO : ordersDTO.getOrdersDetailList()) {
			ordersDetailDTO.setOrdersId(ordersDTO.getOrdersId());
			ordersDAO.insertOrdersDetail(ordersDetailDTO);
		}
		
		return ordersDTO;
	}

	// 주문 내역 조회
	public List<OrdersDTO> selectOrdersList(Map<String, Object> paramMap) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		paramMap.put("memberId", userDetails.getUsername());
		return ordersDAO.selectOrdersList(paramMap);
	}

	// 주문내역 총갯수
	public int selectOrdersTotalCount() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		return ordersDAO.selectOrdersTotalCount(userDetails.getUsername());
	}

	// 주문상세내역 조회
	public List<OrdersDetailDTO> selectOrdersDetailListByOrdersId(Integer ordersId) {
		return ordersDAO.selectOrdersDetailListByOrdersId(ordersId);
	}

}
