package com.board.tjpost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.FileDTO;

@Mapper
public interface FileDAO {

	// 공지사항 파일 저장
	void insertBoardFile(FileDTO fileDTO); 

	List<FileDTO> selectFileListByBoardId(Integer boardId);

	// 공지사항 파일 전부 조회
	List<FileDTO> selectFileListByBoardIdAll(); 

	// 상품 파일 저장
	void insertProductFile(FileDTO fileDTO);

}
