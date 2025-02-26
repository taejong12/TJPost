package com.board.tjpost.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

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
	private Integer productStock; // 상품_재고
	private String productCategory; // 상품_종류
	private Date productCreate; // 상품_생성일(기본값: 현재날짜)
	private Date productUpdate; // 상품_수정일(기본값: 현재날짜)
	private String memberId; // 상품_등록아이디
	private MultipartFile[] productFiles; // 상품_파일
	
	// 결제관련
	private int productPayTotalCount; // 총 결제갯수
	private int productTotalPayment; // 총 결제금액
	private String productPaymentMethod; // 결제수단
}
