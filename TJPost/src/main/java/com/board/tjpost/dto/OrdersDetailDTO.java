package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersDetailDTO {
	// ORDERS_DETAIL 테이블 컬럼
	private Integer ordersDetailId; // 주문상세번호
	private String ordersDetailProductName; // 상품이름
	private int ordersDetailProductPrice; // 상품가격
	private int ordersDetailProductCount; // 상품구매수량
	private int ordersDetailProductPayPrice; // 상품총결제금액
	private String ordersDetailStatus; // 주문상세상태(배송준비, 배송중, 배송완료, 교환, 환불)
	private Date ordersDetailCreate; // 주문상세생성일
	private Date ordersDetailUpdate; // 주문상세수정일
	private Integer productId; // 상품번호
	private Integer deliveryId; // 배달번호
}
