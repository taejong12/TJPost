package com.board.tjpost.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminMainController {

	@GetMapping("/")
	public String selectAdminMainPage() throws Exception {
		System.out.println("#### AdminMainController/selectAdminMainPage ####");
		return "admin/adminMain";
	}
}
