package com.board.tjpost.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/Q&A")
public class AdminQandAController {

	@GetMapping("/listPaging")
	public String adminQandAListPageA(){
		return "admin/q&a/adminQ&AList";
	}
	
}
