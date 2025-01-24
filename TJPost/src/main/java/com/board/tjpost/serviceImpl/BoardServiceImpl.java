package com.board.tjpost.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.tjpost.dao.BoardDAO;
import com.board.tjpost.dto.BoardDTO;
import com.board.tjpost.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
    private BoardDAO boardDAO;

    // 모든 게시글 가져오기
    public List<BoardDTO> getAllBoards() {
        return boardDAO.getAllBoards();
    }

    // 게시글 작성하기
    @Transactional
    public void insertBoard(BoardDTO boardDTO) {
        boardDAO.insertBoard(boardDTO);
    }

    // 게시글 상세보기
	@Override
	public BoardDTO selectBoardId(Long boardId) {
		return boardDAO.selectBoardId(boardId);
	}
    
	
}
