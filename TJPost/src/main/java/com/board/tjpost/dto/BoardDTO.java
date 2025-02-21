package com.board.tjpost.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	private Integer boardId; // 공지사항_아이디(PK)
	private String boardTitle; // 공지사항_제목
	private String boardContent; // 공지사항_내용
	private Date boardCreate; // 공지사항_생성일(기본값: 현재날짜)
	private Date boardUpdate; // 공지사항_수정일(기본값: 현재날짜)
	private MultipartFile[] boardFiles; // 공지사항_파일
	private String memberId; // 공지사항_작성자
}
