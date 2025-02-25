package com.board.tjpost.service;

import java.util.List;

import com.board.tjpost.dto.DeliveryDTO;

public interface DeliveryService {

	// 배송 목록 조회
	List<DeliveryDTO> selectDeliveryListByMemberId();

}
