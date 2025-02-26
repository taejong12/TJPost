package com.board.tjpost.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@GetMapping("/listPaging")
	public String selectOrdersListPaging() {
		return "user/orders/ordersList";
	}
}
