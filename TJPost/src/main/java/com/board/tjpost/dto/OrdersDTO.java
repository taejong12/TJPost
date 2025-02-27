package com.board.tjpost.dto;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersDTO {
	// ORDERS 테이블 컬럼
	private Integer ordersId; // 주문번호
	private int ordersTotalCount; // 주문총수량
	private int ordersTotalPrice; // 주문총금액
	private String ordersPaymentMethod; // 결제수단
	private String ordersStatus; // 주문상태 (결제완료, 결제취소)
	private Date ordersCreate; // 주문생성
	private Date ordersUpdate; // 주문수정
	private String memberId; // 회원아이디
	private List<OrdersDetailDTO> ordersDetailList; // 여러개의 상품 구매시
	private AddressDTO addressDTO;
}
