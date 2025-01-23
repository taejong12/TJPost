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
    
    // 모든 게시글 리스트 보기
    @GetMapping("/list")
    public String getAllBoards(Model model) {
        List<BoardDTO> boardList = boardService.getAllBoards();
        model.addAttribute("boardList", boardList);
        return "board/boardList"; // board/list.jsp
    }

    // 게시글 작성 폼
    @GetMapping("/write")
    public String writeBoardForm() {
        return "board/boardWrite"; // board/boardWrite.jsp
    }

    // 게시글 삽입 처리
    @PostMapping("/write")
    public String insertBoard(BoardDTO boardDTO) {
        boardService.insertBoard(boardDTO);
        return "redirect:/board/list"; // 작성 후 게시글 리스트로 리디렉션
    }
    
    

}
