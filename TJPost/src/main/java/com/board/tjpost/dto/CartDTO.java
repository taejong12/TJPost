package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CartDTO {
	private Integer cartId;
	private String cartProductName;
	private int cartProductPrice;
	private int cartCount;
	private int cartTotalPrice;
	private Date cartCreate;
	private String memberId;
	private Integer productId;
}
