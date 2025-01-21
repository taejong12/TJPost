package com.board.tjpost.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping(value="/")
    public String getMainPage() throws Exception{
		System.out.println("메인 페이지");
		// /WEB-INF/views/main.jsp를 렌더링
		return "main"; 
    }
}
