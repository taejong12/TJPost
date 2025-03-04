package com.board.tjpost.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.board.tjpost.dao.CartDAO;
import com.board.tjpost.dao.ProductDAO;
import com.board.tjpost.dto.CartDTO;
import com.board.tjpost.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private ProductDAO productDAO;

	// 장바구니 목록
	public List<CartDTO> selectCartListByMemberId() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		List<CartDTO> cartList = cartDAO.selectCartListByMemberId(userDetails.getUsername());
		
		for(CartDTO cartDTO:cartList) {
			cartDTO.setProductStock(productDAO.selectProductStockByProductId(cartDTO.getProductId())); 
		}
		
		return cartList;
	}

	// 장바구니 추가
	public void insertCart(CartDTO cartDTO) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		cartDTO.setMemberId(userDetails.getUsername());
		cartDAO.insertCart(cartDTO);
	}

	// 장바구니 삭제
	public void deleteCart(List<Integer> cartIdList) {
		for(Integer cartId : cartIdList) {
			cartDAO.deleteCart(cartId);
		}
	}
}
