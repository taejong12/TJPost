package com.board.tjpost.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@GetMapping("/list")
	public String selectPurchaseList() {
		System.out.println("#### PurchaseController/selectPurchaseList ####");
		return "user/purchase/purchaseList";
	}
}
