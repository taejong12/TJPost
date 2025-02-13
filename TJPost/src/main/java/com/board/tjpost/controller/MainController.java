package com.board.tjpost.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class MainController {

	@GetMapping("/")
	public String getMainPage() throws Exception {
		System.out.println("#### MainController ####");
		// /WEB-INF/views/main.jsp를 렌더링
		return "main";
	}

}
