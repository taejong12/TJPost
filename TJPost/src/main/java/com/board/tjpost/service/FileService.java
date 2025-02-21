package com.board.tjpost.service;

import java.util.List;

import com.board.tjpost.dto.FileDTO;

public interface FileService {

	// 공지사항 아이디 파일 조회
	List<FileDTO> selectFileListByBoardId(Integer boardId);

	// 공지사항 전체 파일 조회
	List<FileDTO> selectFileListByBoardIdAll();

}
