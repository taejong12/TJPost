package com.board.tjpost.dao;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.UserDTO;

@Mapper
public interface UserDAO {

	//회원가입하기
	public void insertUserJoin(UserDTO userDTO);

}
