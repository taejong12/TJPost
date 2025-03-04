package com.board.tjpost.controller.user;

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

import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.OrdersDetailDTO;
import com.board.tjpost.service.FileService;
import com.board.tjpost.service.OrdersService;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersService ordersService;
	@Autowired
	private FileService fileService;
	
	// 주문내역 페이지
	@GetMapping("/listPaging")
	public String selectOrdersListPaging(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "3") int limit, Model model) {
		int startRow = (page-1) * limit + 1;
		int endRow = page * limit;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		
		List<OrdersDTO> ordersList = ordersService.selectOrdersList(paramMap);
		int totalCount = ordersService.selectOrdersTotalCount();
		
		int totalPage = (int) Math.ceil((double)totalCount/limit);
		int pageBlock = 3;
		int startPage =((page-1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > totalPage)
			endPage = totalPage;
		
		model.addAttribute("ordersList", ordersList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", page);
		model.addAttribute("limit", limit);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		
		return "user/orders/ordersList";
	}
	
	// 주문내역 상세페이지
	@GetMapping("/detail/{ordersId}")
	public String ordersDetailPage(@PathVariable Integer ordersId, Model model) {
		List<OrdersDetailDTO> ordersDetailList = ordersService.selectOrdersDetailListByOrdersId(ordersId);
		List<FileDTO> fileList = fileService.selectFileListByProductIdAll();
		
		for(OrdersDetailDTO a:ordersDetailList) {
			System.out.println("구매후기 번호 확인: "+a.getReviewId());
		}
		model.addAttribute("ordersDetailList", ordersDetailList);
		model.addAttribute("fileList", fileList);
		return "user/orders/ordersDetail";
	}
	
	// 환불신청
	@PostMapping("/return")
	public ResponseEntity<String> ordersReturn(@RequestBody Integer ordersId){
		
		ordersService.ordersReturn(ordersId);
		
		return ResponseEntity.ok("환불신청완료");
	}
}
