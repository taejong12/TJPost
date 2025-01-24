package com.board.tjpost.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


public class BoardDTO {
    private int boardId;				//게시글 고유번호
    private String boardTitle;			//게시글 제목
    private String boardContent;		//게시글 내용
    private String boardAuthor;			//게시글 작성자
    private Date boardCreatedDate;		//게시글 작성일자
    private Date boardUpdatedDate;		//게시글 수정일자
    
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardAuthor() {
		return boardAuthor;
	}
	public void setBoardAuthor(String boardAuthor) {
		this.boardAuthor = boardAuthor;
	}
	public Date getBoardCreatedDate() {
		return boardCreatedDate;
	}
	public void setBoardCreatedDate(Date boardCreatedDate) {
		this.boardCreatedDate = boardCreatedDate;
	}
	public Date getBoardUpdatedDate() {
		return boardUpdatedDate;
	}
	public void setBoardUpdatedDate(Date boardUpdatedDate) {
		this.boardUpdatedDate = boardUpdatedDate;
	}

}
