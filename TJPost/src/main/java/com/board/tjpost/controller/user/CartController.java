package com.board.tjpost.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartController {

	@GetMapping("/list")
	public String selectCartListByMemberId() {
		return "user/cart/cartList";
	}
}
