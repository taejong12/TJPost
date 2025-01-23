package com.board.tjpost.service;

import com.board.tjpost.dao.BoardDAO;
import com.board.tjpost.dto.BoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardDAO boardDAO;

    // 모든 게시글 가져오기
    public List<BoardDTO> getAllBoards() {
        return boardDAO.getAllBoards();
    }

    // 게시글 삽입
    @Transactional
    public void insertBoard(BoardDTO boardDTO) {
        boardDAO.insertBoard(boardDTO);
    }
}
