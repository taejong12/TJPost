package com.board.tjpost.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.tjpost.dao.FileDAO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.service.FileService;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	FileDAO fileDAO;

	// 공지사항 아이디 파일
	@Override
	public List<FileDTO> selectFileListByBoardId(Integer boardId) {
		return fileDAO.selectFileListByBoardId(boardId);
	}


	// 공지사항 파일 전체
	@Override
	public List<FileDTO> selectFileListByBoardIdAll() {
		return fileDAO.selectFileListByBoardIdAll();
	}

}
