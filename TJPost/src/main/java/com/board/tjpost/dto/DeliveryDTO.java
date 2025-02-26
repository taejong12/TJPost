package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeliveryDTO {
	private Integer deliveryId; // 배송번호
	private String deliveryTrackingNumber; // 운송장번호
	private String deliveryStatus; // 배송상태(배송준비,배송중,배송완료)
	private String deliveryAddressName; // 주소이름
	private String deliveryRoadAddress; // 도로명주소
	private String deliveryDetailAddress; // 상세주소
	private String deliveryPostCode; // 우편번호
	private String deliveryPhoneNumber; // 핸드폰번호
	private Date deliveryCreate; // 생성일
	private Date deliveryUpdate; // 수정일
	private Date deliveryStart; // 배송시작(배송중으로 변경되는 시점)
	private Date deliveryEnd; // 배송완료(배송완료되는 시점)
	private Integer ordersId; // 주문번호
	private Integer ordersDetailId; // 주문상세번호
}
