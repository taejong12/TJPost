package com.board.tjpost.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.tjpost.dto.BoardDTO;
import com.board.tjpost.dto.MemberDTO;
import com.board.tjpost.dto.ProductDTO;
import com.board.tjpost.service.BoardService;
import com.board.tjpost.service.MemberService;
import com.board.tjpost.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminMainController {

	@Autowired
	ProductService productService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/")
	public String selectAdminMainPage() throws Exception {
		System.out.println("#### AdminMainController/selectAdminMainPage ####");
		return "admin/adminMain";
	}
	
	@GetMapping("/search")
	public String selectAdminSearch(@RequestParam("searchKeyword") String searchKeyword, Model model) {
	    // 검색어가 비어있으면 처리하지 않거나, 기본 데이터를 반환
	    if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
	        List<ProductDTO> productListSearch = productService.searchProductList(searchKeyword);
	        List<MemberDTO> memberListSearch = memberService.searchMemberList(searchKeyword);
	        List<BoardDTO> boardListSearch = boardService.searchBoardList(searchKeyword);
	        
	        model.addAttribute("productListSearch", productListSearch);
	        model.addAttribute("memberListSearch", memberListSearch);
	        model.addAttribute("boardListSearch", boardListSearch);
	        model.addAttribute("searchKeyword", searchKeyword);
	    }
	    
	    return "admin/search/adminSearchList"; // 검색 결과를 보여줄 JSP 페이지로 이동
	}
}
