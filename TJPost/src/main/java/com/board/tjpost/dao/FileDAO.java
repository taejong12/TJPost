package com.board.tjpost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.FileDTO;

@Mapper
public interface FileDAO {

	void insertBoardFile(FileDTO fileDTO); // 공지사항 파일 저장

	List<FileDTO> selectFileListByBoardId(Integer boardId);

}
