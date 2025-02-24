package com.board.tjpost.serviceImpl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.board.tjpost.dao.BoardDAO;
import com.board.tjpost.dao.FileDAO;
import com.board.tjpost.dto.BoardDTO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private FileDAO fileDAO;
	
	// 모든 공지사항 조회
	public List<BoardDTO> selectBoardAll() {
		return boardDAO.selectBoardAll();
	}

	// 공지사항 작성
	@Transactional
	public void insertBoard(BoardDTO boardDTO) throws IllegalStateException, IOException {
		
		// 현재 로그인한 사용자 가져오기
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
	    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	    
		boardDTO.setMemberId(userDetails.getUsername());
		
		boardDAO.insertBoard(boardDTO);
		
		String parentPathName= "C:/Users/dbxow/git/TJPost/TJPost/src/main/resources/static/img/board/";
		for(MultipartFile boardFile : boardDTO.getBoardFiles()) {
			if(!boardFile.isEmpty()) {
				String childPathName= UUID.randomUUID().toString() + "_" + boardFile.getOriginalFilename();
				File saveBoardFile = new File(parentPathName, childPathName);
				
				if(!saveBoardFile.getParentFile().exists()) {
					saveBoardFile.getParentFile().mkdir();
				}
				
				boardFile.transferTo(saveBoardFile);
				
				String boardFilePath = parentPathName+childPathName;
				
				FileDTO fileDTO = new FileDTO();
				fileDTO.setFileName(childPathName);
				fileDTO.setFilePath(boardFilePath);
				fileDTO.setFileOriginalName(boardFile.getOriginalFilename());
				fileDTO.setBoardId(boardDTO.getBoardId());
				
				fileDAO.insertBoardFile(fileDTO);
			}
		}

	}

	// 공지사항 상세정보
	@Override
	public BoardDTO selectBoardById(Integer boardId) {
		return boardDAO.selectBoardById(boardId);
	}

	// 공지사항 수정
	@Transactional
	public void updateBoard(BoardDTO boardDTO) throws IllegalStateException, IOException {
		
		// 현재 로그인한 사용자 가져오기
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
	    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	    
		boardDTO.setMemberId(userDetails.getUsername());
		
		boardDAO.updateBoard(boardDTO);
		
		if(boardDTO.getBoardFiles() != null) {

			List<FileDTO> deleteBoardFileList = fileDAO.selectFileListByBoardId(boardDTO.getBoardId());
			
			String parentPathName= "C:/Users/dbxow/git/TJPost/TJPost/src/main/resources/static/img/board/";

			 // 폴더 내 기존 파일 삭제
	        for (FileDTO file : deleteBoardFileList) {
	            File oldFile = new File(parentPathName, file.getFileName());
	            if (oldFile.exists()) {
	                oldFile.delete();  // 실제 파일 삭제
	            }
	        }

			fileDAO.deleteBoardFileByBoardId(boardDTO.getBoardId());
			
			for(MultipartFile boardFile : boardDTO.getBoardFiles()) {
				if(!boardFile.isEmpty()) {
					String childPathName= UUID.randomUUID().toString() + "_" + boardFile.getOriginalFilename();
					File saveBoardFile = new File(parentPathName, childPathName);
					
					if(!saveBoardFile.getParentFile().exists()) {
						saveBoardFile.getParentFile().mkdir();
					}
					
					boardFile.transferTo(saveBoardFile);
					
					String boardFilePath = parentPathName+childPathName;
					
					FileDTO fileDTO = new FileDTO();
					fileDTO.setFileName(childPathName);
					fileDTO.setFilePath(boardFilePath);
					fileDTO.setFileOriginalName(boardFile.getOriginalFilename());
					fileDTO.setBoardId(boardDTO.getBoardId());
					
					fileDAO.insertBoardFile(fileDTO);
				}
			}
		}
	}

	// 공지사항 삭제하기
	@Override
	public void deleteBoard(Integer boardId) {
		
		List<FileDTO> deleteBoardFileList = fileDAO.selectFileListByBoardId(boardId);
		
		String parentPathName= "C:/Users/dbxow/git/TJPost/TJPost/src/main/resources/static/img/board/";

		 // 폴더 내 기존 파일 삭제
        for (FileDTO file : deleteBoardFileList) {
            File oldFile = new File(parentPathName, file.getFileName());
            if (oldFile.exists()) {
                oldFile.delete();  // 실제 파일 삭제
            }
        }

		fileDAO.deleteBoardFileByBoardId(boardId);
		
		boardDAO.deleteBoard(boardId);

	}

	// 공지사항 검색
	public List<BoardDTO> searchBoardList(String searchKeyword) {
		return boardDAO.searchBoardList(searchKeyword);
	}

	// 공지사항 총 갯수
	public int selectBoardTotalCount() {
		return boardDAO.selectBoardTotalCount();
	}

	// 공지사항 목록 페이징
	public List<BoardDTO> selectBoardListAllPaging(Map<String, Object> paramMap) {
		return boardDAO.selectBoardListAllPaging(paramMap);
	}

}
