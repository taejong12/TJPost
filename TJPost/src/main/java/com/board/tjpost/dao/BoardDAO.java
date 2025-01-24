package com.board.tjpost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.BoardDTO;

@Mapper
public interface BoardDAO {
	
    List<BoardDTO> getAllBoards(); 			// 모든 게시글 가져오기
    void insertBoard(BoardDTO boardDTO); 	// 새로운 게시글 삽입
    BoardDTO selectBoardId(Long boardId);	// 게시글 상세보기
    void updateBoard(BoardDTO boardDTO);	// 게시글 수정하기
}
