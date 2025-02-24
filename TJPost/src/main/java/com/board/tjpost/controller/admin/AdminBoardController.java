package com.board.tjpost.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	// 공지사항 목록 페이징
	@GetMapping("/listPaging")
	public String selectAdminBoardAllPaging(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "3") int limit, @RequestParam(defaultValue = "latest") String sort,
			Model model) {

		int startRow = (page - 1) * limit + 1; // 시작 행 번호
		int endRow = page * limit; // 끝 행 번호

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		paramMap.put("sort", sort);

		List<BoardDTO> adminBoardList = boardService.selectBoardListAllPaging(paramMap);
		int totalCount = boardService.selectBoardTotalCount(); // 전체 공지사항 갯수

		// 페이징 계산
		int totalPage = (int) Math.ceil((double) totalCount / limit); // 전체 페이지 수
		int pageBlock = 3; // 한 번에 보여줄 페이지 개수
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1; // 블록 시작 페이지
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalPage)
			endPage = totalPage; // 마지막 페이지 초과 방지

		model.addAttribute("adminBoardList", adminBoardList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", page);
		model.addAttribute("limit", limit);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("sort", sort);
		
		return "admin/board/adminBoardList";
	}
	

	// 공지사항 작성페이지
	@GetMapping("/insert")
	public String insertAdminBoardPage() {
		System.out.println("#### AdminBoardController/insertAdminBoardPage ####");
		return "admin/board/adminBoardInsert";
	}

	// 공지사항 등록
	@PostMapping("/insert")
	public String insertBoard(@ModelAttribute BoardDTO boardDTO) throws IllegalStateException, IOException {
		System.out.println("#### AdminBoardController/insertBoard ####");
		boardService.insertBoard(boardDTO);
		return "redirect:/admin/board/listPaging"; // 작성 후 게시글 리스트로 리디렉션
	}

	// 공지사항 상세보기
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

	// 공지사항 수정페이지
	@GetMapping("/update/{boardId}")
	public String boardUpdateById(@PathVariable Integer boardId, Model model) {
		System.out.println("#### AdminBoardController/boardUpdateById ####");

		BoardDTO boardDTO = boardService.selectBoardById(boardId);
		List<FileDTO> fileList = fileService.selectFileListByBoardId(boardId);

		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("fileList", fileList);

		return "admin/board/adminBoardUpdate";
	}

	// 공지사항 수정하기
	@PostMapping("/update")
	public String updateBoard(@ModelAttribute BoardDTO boardDTO) throws IllegalStateException, IOException {
		System.out.println("#### AdminBoardController/updateBoard ####");

		boardService.updateBoard(boardDTO);

		return "redirect:/admin/board/listPaging";
	}

	// 공지사항 삭제하기
	@GetMapping("/delete/{boardId}")
	public String deleteBoard(@PathVariable Integer boardId) {
		System.out.println("#### AdminBoardController/deleteBoard ####");

		boardService.deleteBoard(boardId);

		return "redirect:/admin/board/listPaging";
	}

}
