package com.board.tjpost.service;

import com.board.tjpost.dto.BoardDTO;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface BoardService {

	// 공지사항 목록 조회
	public List<BoardDTO> selectBoardListAll();

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

	// 공지사항 총 갯수
	public int selectBoardTotalCount();

	// 공지사항 목록 페이징
	public List<BoardDTO> selectBoardListAllPaging(Map<String, Object> paramMap);
}
