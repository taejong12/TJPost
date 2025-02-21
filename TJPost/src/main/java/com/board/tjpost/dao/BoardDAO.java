package com.board.tjpost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.BoardDTO;

@Mapper
public interface BoardDAO {

	// 모든 공지사항 조회
	List<BoardDTO> selectBoardAll(); 

	// 공지사항 삽입
	void insertBoard(BoardDTO boardDTO); 

	// 공지사항 상세보기
	BoardDTO selectBoardById(Integer boardId); 

	// 공지사항 수정하기
	void updateBoard(BoardDTO boardDTO); 

	// 공지사항 삭제하기
	void deleteBoard(Integer boardId); 

	// 공지사항 검색
	List<BoardDTO> searchBoardList(String searchKeyword);
}
