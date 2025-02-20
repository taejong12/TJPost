package com.board.tjpost.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.tjpost.dto.BoardDTO;
import com.board.tjpost.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 모든 게시글 리스트 보기
	@GetMapping("/list")
	public String selectBoardAll(Model model) {
		System.out.println("#### BoardController/selectBoardAll ####");
		List<BoardDTO> boardList = boardService.selectBoardAll();
		model.addAttribute("boardList", boardList);
		return "user/board/boardList"; // user/board/boardList.jsp
	}

	// 게시글 상세보기
	// @PathVariable 은 Spring MVC 에서 URL 경로에 포함된 변수를 추출할 때 사용하는 애노테이션이다.
	// URL 경로에 정의된 변수 이름을 지정하여, 해당 값을 매핑하여 매개변수에 저장한다.
	@GetMapping("/detail/{boardId}")
	public String selectBoardById(@PathVariable Integer boardId, Model model) {
		System.out.println("#### BoardController/selectBoardById ####");

		BoardDTO boardDTO = boardService.selectBoardById(boardId);

		model.addAttribute("boardDTO", boardDTO);

		return "user/board/boardDetail";
	}

}
