package com.board.tjpost.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.OrdersDetailDTO;
import com.board.tjpost.service.OrdersService;

@Controller
@RequestMapping("/admin/orders")
public class AdminOrdersController {

	@Autowired
	private OrdersService ordersService;
	
	// 주문내역 페이징
	@GetMapping("/listPaging")
	public String adminOrdersListPage(@RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "3") int limit, Model model) {
		
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		
		List<OrdersDTO> adminOrdersList = ordersService.selectAdminOrdersListAllPaging(paramMap);
		int totalCount = ordersService.selectAdminOrdersTotalCount();
		
		int totalPage = (int) Math.ceil((double) totalCount / limit); // 전체 페이지 수
		int pageBlock = 3; // 한 번에 보여줄 페이지 개수
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1; // 블록 시작 페이지
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalPage)
			endPage = totalPage; // 마지막 페이지 초과 방지

		model.addAttribute("adminOrdersList", adminOrdersList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", page);
		model.addAttribute("limit", limit);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		
		return "admin/orders/adminOrdersList";
	}
	
	@GetMapping("/detail/{ordersId}")
	public String adminOrdersDetailPage(@PathVariable Integer ordersId, Model model) {
		
		List<OrdersDetailDTO> adminOrdersDetailList = ordersService.selectAdminOrdersDetailByOrdersId(ordersId);
		
		model.addAttribute("adminOrdersDetailList", adminOrdersDetailList);
		return "admin/orders/adminOrdersDetail";
	}
	
	// 관리자 환불 승인
	@PostMapping("/return")
	public ResponseEntity<String> adminOrdersReturn(@RequestBody Integer ordersId){
		ordersService.adminOrdersReturn(ordersId);
		return ResponseEntity.ok("환불승인완료");
	}
	
	
}
