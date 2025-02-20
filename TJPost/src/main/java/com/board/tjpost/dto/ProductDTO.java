package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDTO {
	private Integer productId; // 상품_아이디(PK)
	private String productName; // 상품_이름
	private Integer productPrice; // 상품_가격
	private String productContent; // 상품_내용
	private Integer productdStock; // 상품_재고
	private String productCategory; // 상품_종류
	private String productMemberId; // 상품_등록아이디
	private Date productCreate; // 상품_생성일(기본값: 현재날짜)
	private Date productUpdate; // 상품_수정일(기본값: 현재날짜)
}
