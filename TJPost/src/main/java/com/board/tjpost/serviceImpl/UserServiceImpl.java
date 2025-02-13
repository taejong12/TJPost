package com.board.tjpost.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.tjpost.dao.UserDAO;
import com.board.tjpost.dto.UserDTO;
import com.board.tjpost.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	// 회원가입하기
	@Override
	public void insertUserJoin(UserDTO userDTO) {
		userDAO.insertUserJoin(userDTO);
	}

	// 아이디 확인하기
	@Override
	public int userIdCheck(UserDTO userDTO) {
		return userDAO.userIdCheck(userDTO);
	}
}
