package com.board.tjpost.service;

import com.board.tjpost.dto.BoardDTO;

import java.io.IOException;
import java.util.List;

public interface BoardService {

	// 모든 공지사항 가져오기
	public List<BoardDTO> selectBoardAll();

	// 공지사항 작성하기
	public void insertBoard(BoardDTO boardDTO) throws IllegalStateException, IOException;

	// 공지사항 아이디로 조회
	public BoardDTO selectBoardById(Integer boardId);

	// 공지사항 수정하기
	public void updateBoard(BoardDTO boardDTO) throws IllegalStateException, IOException;

	// 공지사항 삭제하기
	public void deleteBoard(Integer boardId);

	// 공지사항 검색
	public List<BoardDTO> searchBoardList(String searchKeyword);
}
