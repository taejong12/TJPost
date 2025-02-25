package com.board.tjpost.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@GetMapping("/listPaging")
	public String selectPurchaseList() {
		return "user/purchase/purchaseList";
	}
}
