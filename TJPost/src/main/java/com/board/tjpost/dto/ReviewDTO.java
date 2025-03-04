package com.board.tjpost.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {
	private Integer reviewId;
	private String reviewTitle;
	private String reviewContent;
	private Integer reviewScore;
	private Date reviewCreate;
	private Date reviewUpdate;
	private String memberId;
	private Integer ordersDetailId;
	private MultipartFile[] reviewFiles;
}
