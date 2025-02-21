package com.board.tjpost.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.board.tjpost.dto.BoardDTO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.service.BoardService;
import com.board.tjpost.service.FileService;

@Controller
public class MainController {

	@Autowired
	BoardService boardService;
	@Autowired
	FileService fileService;
	
	@GetMapping("/")
	public String selectMainPage(Model model) throws Exception {
		System.out.println("#### MainController/selectMainPage ####");
		List<BoardDTO> boardList = boardService.selectBoardAll();
		List<FileDTO> fileList = fileService.selectFileListByBoardIdAll();
		model.addAttribute("boardList", boardList);
		model.addAttribute("fileList", fileList);
		// /WEB-INF/views/main.jsp를 렌더링
		return "user/userMain";
	}

}
