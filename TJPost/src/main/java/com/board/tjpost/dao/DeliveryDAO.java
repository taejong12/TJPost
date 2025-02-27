package com.board.tjpost.dao;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.DeliveryDTO;

@Mapper
public interface DeliveryDAO {

	// 배송 저장
	void insertDeliveryOrdersComplete(DeliveryDTO deliveryDTO);

}
