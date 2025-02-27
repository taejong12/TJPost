package com.board.tjpost.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.tjpost.dto.CartDTO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.service.CartService;
import com.board.tjpost.service.FileService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private FileService fileService;
	
	// 장바구니 목록
	@GetMapping("/list")
	public String selectCartListByMemberId(Model model) {
		List<CartDTO> cartList = cartService.selectCartListByMemberId();
		List<FileDTO> fileList = fileService.selectFileListByProductIdAll();
		model.addAttribute("cartList", cartList);
		model.addAttribute("fileList", fileList);
		return "user/cart/cartList";
	}
	
	// 장바구니 담기
	@PostMapping("/insert")
	public ResponseEntity<String> insertCart(@RequestBody CartDTO cartDTO) {
		cartService.insertCart(cartDTO);
		return ResponseEntity.ok("장바구니에 추가되었습니다.\n장바구니 목록으로 이동하시겠습니까?");
	}
}
