package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	private int boardId; // 게시판_아이디(PK)
	private String boardTitle; // 게시판_제목
	private String boardContent; // 게시판_내용
	private String boardAuthor; // 게시판_작성자
	private Date boardCreatedDate; // 게시판_생성일(기본값: 현재날짜)
	private Date boardUpdatedDate; // 게시판_수정일(기본값: 현재날짜)

}
