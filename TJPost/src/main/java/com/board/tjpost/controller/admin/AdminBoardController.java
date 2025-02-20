package com.board.tjpost.controller.admin;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.tjpost.dto.BoardDTO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.service.BoardService;
import com.board.tjpost.service.FileService;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private FileService fileService;

	// 모든 게시글 리스트 보기
	@GetMapping("/list")
	public String selectAdminBoardAll(Model model) {
		System.out.println("#### AdminBoardController/selectAdminBoardAll ####");
		List<BoardDTO> adminBoardList = boardService.selectBoardAll();
		model.addAttribute("adminBoardList", adminBoardList);
		return "admin/board/adminBoardList";
	}

	// 게시글 작성 폼
	@GetMapping("/insert")
	public String insertAdminBoardPage() {
		System.out.println("#### AdminBoardController/insertAdminBoardPage ####");
		return "admin/board/adminBoardInsert";
	}

	// 게시글 삽입 처리
	@PostMapping("/insert")
	public String insertBoard(@ModelAttribute BoardDTO boardDTO) throws IllegalStateException, IOException {
		System.out.println("#### AdminBoardController/insertBoard ####");
		boardService.insertBoard(boardDTO);
		return "redirect:/admin/board/list"; // 작성 후 게시글 리스트로 리디렉션
	}

	// 게시글 상세보기
	// @PathVariable 은 Spring MVC 에서 URL 경로에 포함된 변수를 추출할 때 사용하는 애노테이션이다.
	// URL 경로에 정의된 변수 이름을 지정하여, 해당 값을 매핑하여 매개변수에 저장한다.
	@GetMapping("/detail/{boardId}")
	public String selectBoardById(@PathVariable Integer boardId, Model model) {
		System.out.println("#### AdminBoardController/selectBoardById ####");

		BoardDTO boardDTO = boardService.selectBoardById(boardId);
		List<FileDTO> fileList = fileService.selectFileListByBoardId(boardId);

		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("fileList", fileList);
		
		return "admin/board/adminBoardDetail";
	}

	// 게시글 수정페이지
	@GetMapping("/update/{boardId}")
	public String boardUpdateById(@PathVariable Integer boardId, Model model) {
		System.out.println("#### AdminBoardController/boardUpdateById ####");

		BoardDTO boardDTO = boardService.selectBoardById(boardId);

		model.addAttribute("boardDTO", boardDTO);

		return "admin/board/adminBoardUpdate";
	}

	// 게시글 수정하기
	@PostMapping("/update")
	public String updateBoard(BoardDTO boardDTO) throws IllegalStateException, IOException {
		System.out.println("#### AdminBoardController/updateBoard ####");

		boardService.updateBoard(boardDTO);

		return "redirect:/admin/board/list";
	}

	// 게시글 삭제하기
	@GetMapping("/delete/{boardId}")
	public String deleteBoard(@PathVariable Integer boardId) {
		System.out.println("#### AdminBoardController/deleteBoard ####");

		boardService.deleteBoard(boardId);

		return "redirect:/admin/board/list";
	}

}
