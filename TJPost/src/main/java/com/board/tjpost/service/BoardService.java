package com.board.tjpost.service;

import com.board.tjpost.dto.BoardDTO;
import java.util.List;

public interface BoardService {

	// 모든 게시글 가져오기
	public List<BoardDTO> getAllBoards();

	// 게시글 작성하기
	public void insertBoard(BoardDTO boardDTO);

	// 게시글 상세보기
	public BoardDTO selectBoardId(Long boardId);

	// 게시글 수정하기
	public void updateBoard(BoardDTO boardDTO);

	// 게시글 삭제하기
	public void deleteBoard(Long boardId);
}
