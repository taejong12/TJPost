package com.board.tjpost.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.tjpost.dto.BoardDTO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.service.BoardService;
import com.board.tjpost.service.FileService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private FileService fileService;

	// 공지사항 목록 조회
	@GetMapping("/list")
	public String selectBoardListAll(Model model) {
		List<BoardDTO> boardList = boardService.selectBoardListAll();
		model.addAttribute("boardList", boardList);
		return "user/board/boardList"; // user/board/boardList.jsp
	}

	// 공지사항 상세보기
	// @PathVariable 은 Spring MVC 에서 URL 경로에 포함된 변수를 추출할 때 사용하는 애노테이션이다.
	// URL 경로에 정의된 변수 이름을 지정하여, 해당 값을 매핑하여 매개변수에 저장한다.
	@GetMapping("/detail/{boardId}")
	public String selectBoardById(@PathVariable Integer boardId, Model model) {
		BoardDTO boardDTO = boardService.selectBoardById(boardId);
		List<FileDTO> fileList = fileService.selectFileListByBoardId(boardId);
		
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("fileList", fileList);
		return "user/board/boardDetail";
	}

	// 공지사항 목록 페이징
	@GetMapping("/listPaging")
	public String selectBoardListAllPaging(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "3") int limit, @RequestParam(defaultValue = "latest") String sort,
			Model model) {
		
		int startRow = (page-1) * limit + 1;
		int endRow = page * limit;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		paramMap.put("sort", sort);
		
		List<BoardDTO> boardList = boardService.selectBoardListAllPaging(paramMap);
		int totalCount = boardService.selectBoardTotalCount();
		
		int totalPage = (int) Math.ceil((double) totalCount / limit);
		int pageBlock = 3;
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > totalPage)
			endPage = totalPage;
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", page);
		model.addAttribute("limit", limit);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("sort", sort);
		
		return "user/board/boardList";
	}

}
