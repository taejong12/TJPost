package com.board.tjpost.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.board.tjpost.dto.BoardDTO;
import com.board.tjpost.service.BoardService;

@Controller
public class MainController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("/")
	public String selectMainPage(Model model) throws Exception {
		System.out.println("#### MainController/selectMainPage ####");
		List<BoardDTO> boardList = boardService.selectBoardAll();
		model.addAttribute("boardList", boardList);
		// /WEB-INF/views/main.jsp를 렌더링
		return "user/userMain";
	}

}
