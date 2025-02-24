package com.board.tjpost.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/purchase")
public class AdminPurchaseController {

	@GetMapping("/listPaging")
	public String adminPurchaseListPage() {
		
		return "admin/purchase/adminPurchaseList";
	}
}
