package com.board.tjpost.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.board.tjpost.dto.BoardDTO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.dto.ProductDTO;
import com.board.tjpost.service.BoardService;
import com.board.tjpost.service.FileService;
import com.board.tjpost.service.ProductService;

@Controller
public class MainController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private FileService fileService;
	@Autowired
	private ProductService productService;
	
	@GetMapping("/")
	public String selectMainPage(Model model) throws Exception {
		
		List<BoardDTO> boardList = boardService.selectBoardListAll();
		List<FileDTO> boardFileList = fileService.selectFileListByBoardIdAll();
		List<ProductDTO> productList = productService.selectProductListAll();
		List<FileDTO> productFileList = fileService.selectFileListByProductIdAll();
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardFileList", boardFileList);
		model.addAttribute("productList", productList);
		model.addAttribute("productFileList", productFileList);
		
		// /WEB-INF/views/main.jsp를 렌더링
		return "user/userMain";
	}

}
