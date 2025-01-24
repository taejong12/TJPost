package com.board.tjpost.controller;

import com.board.tjpost.dto.BoardDTO;
import com.board.tjpost.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;
    
    //모든 게시글 리스트 보기
    @GetMapping("/list")
    public String getAllBoards(Model model) {
    	System.out.println("#### BoardController/board/list ####");
        List<BoardDTO> boardList = boardService.getAllBoards();
        model.addAttribute("boardList", boardList);
        return "board/boardList"; // board/list.jsp
    }

    //게시글 작성 폼
    @GetMapping("/write")
    public String writeBoardForm() {
    	System.out.println("#### BoardController/board/write(get) ####");
        return "board/boardWrite"; // board/boardWrite.jsp
    }

    //게시글 삽입 처리
    @PostMapping("/write")
    public String insertBoard(BoardDTO boardDTO) {
    	System.out.println("#### BoardController/board/write(post) ####");
        boardService.insertBoard(boardDTO);
        return "redirect:/board/list"; // 작성 후 게시글 리스트로 리디렉션
    }
    
    //게시글 상세보기
    //@PathVariable 은 Spring MVC 에서 URL 경로에 포함된 변수를 추출할 때 사용하는 애노테이션이다.
    //URL 경로에 정의된 변수 이름을 지정하여, 해당 값을 매핑하여 매개변수에 저장한다.
    @GetMapping("/detail/{boardId}")
    public String boardDetailById(@PathVariable Long boardId, Model model) {
    	System.out.println("#### BoardController/board/detail ####");
    	
    	BoardDTO boardDTO =  boardService.selectBoardId(boardId);
    	
    	model.addAttribute("boardDTO", boardDTO);
    	
    	return "board/boardView";
    }
    
    //게시글 수정페이지
    @GetMapping("/update/{boardId}")
    public String boardUpdateById(@PathVariable Long boardId, Model model) {
    	System.out.println("#### BoardController/board/update(get) ####");
    	
    	BoardDTO boardDTO =  boardService.selectBoardId(boardId);
    	
    	model.addAttribute("boardDTO", boardDTO);
    	
    	return "board/boardUpdate";
    }
    
    //게시글 수정하기
    @PostMapping("/update")
    public String boardUpdate(BoardDTO boardDTO) {
    	System.out.println("#### BoardController/board/update(post) ####");
    	
    	boardService.updateBoard(boardDTO);
    	 	
    	return "redirect:/board/list";
    }
    
    
    

}
