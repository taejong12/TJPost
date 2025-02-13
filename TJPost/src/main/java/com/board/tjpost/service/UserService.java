package com.board.tjpost.service;

import com.board.tjpost.dto.UserDTO;

public interface UserService {

	// 회원가입하기
	void insertUserJoin(UserDTO userDTO);

	// 아이디 확인하기
	int userIdCheck(UserDTO userDTO);
}
