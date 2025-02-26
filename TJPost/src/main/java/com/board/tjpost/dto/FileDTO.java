package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileDTO {
	private Integer fileId; // 파일번호
    private String fileName; // 파일이름
    private String fileOriginalName; // 파일오리지널이름
    private String filePath; // 파일경로
    private Date fileCreate; // 파일 생성일
    private Date fileUpdate; // 파일 수정일
    private String memberId; // 회원아이디
    private Integer boardId; // 공지사항번호
    private Integer productId; // 상품번호
}
