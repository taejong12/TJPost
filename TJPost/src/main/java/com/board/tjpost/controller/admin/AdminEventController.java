package com.board.tjpost.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/event")
public class AdminEventController {

	@GetMapping("/listPaging")
	public String adminEventListPage() {
		
		return "admin/event/adminEventList";
	}
}
