package com.board.tjpost.dto;

import java.sql.Date;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	private int boardId; // 게시글 고유번호
	private String boardTitle; // 게시글 제목
	private String boardContent; // 게시글 내용
	private String boardAuthor; // 게시글 작성자

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date boardCreatedDate; // 게시글 작성일자

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date boardUpdatedDate; // 게시글 수정일자

}
