package com.board.tjpost.service;

import java.util.List;

import com.board.tjpost.dto.FileDTO;

public interface FileService {

	List<FileDTO> selectFileListByBoardId(Integer boardId);

}
