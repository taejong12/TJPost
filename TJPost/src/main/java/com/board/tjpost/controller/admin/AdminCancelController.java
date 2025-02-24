package com.board.tjpost.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/cancel")
public class AdminCancelController {

	@GetMapping("/listPaging")
	public String adminCancelListPage() {
		return "admin/cancel/adminCancelList";
	}
}
