package com.board.tjpost.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/delivery")
public class AdminDeliveryController {

	@GetMapping("/listPaging")
	public String adminDeliveryListPage() {
		
		return "admin/delivery/adminDeliveryList";
	}
	
}
