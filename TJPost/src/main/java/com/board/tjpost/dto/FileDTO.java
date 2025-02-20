package com.board.tjpost.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileDTO {
	private Integer fileId;
    private String fileName;
    private String fileOriginalName;
    private String filePath;
    private Date fileCreate;
    private Date fileUpdate;
    private String memberId;
    private Integer boardId;
    private Integer productId;
}
