package com.board.tjpost.dao;

import java.util.List;

import com.board.tjpost.dto.BoardDTO;

public interface BoardDAO {
	
    List<BoardDTO> getAllBoards(); 			// 모든 게시글 가져오기
    void insertBoard(BoardDTO BoardDTO); 	// 새로운 게시글 삽입
    
}
