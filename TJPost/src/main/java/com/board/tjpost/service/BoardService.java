package com.board.tjpost.service;

import com.board.tjpost.dto.BoardDTO;

import java.io.IOException;
import java.util.List;

public interface BoardService {

	// 모든 게시글 가져오기
	public List<BoardDTO> selectBoardAll();

	// 게시글 작성하기
	public void insertBoard(BoardDTO boardDTO) throws IllegalStateException, IOException;

	// 게시글 아이디로 조회
	public BoardDTO selectBoardById(Integer boardId);

	// 게시글 수정하기
	public void updateBoard(BoardDTO boardDTO) throws IllegalStateException, IOException;

	// 게시글 삭제하기
	public void deleteBoard(Integer boardId);
}
