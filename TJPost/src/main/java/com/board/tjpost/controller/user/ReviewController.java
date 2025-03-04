package com.board.tjpost.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.dto.OrdersDetailDTO;
import com.board.tjpost.dto.ReviewDTO;
import com.board.tjpost.service.FileService;
import com.board.tjpost.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	@Autowired
	private FileService fileService;
	
	@GetMapping("/listPaging")
	public String reviewListPaging(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "3") int limit, Model model) {
		
		int startRow = (page -1 ) * limit + 1;
		int endRow = page * limit;
		
		Map<String , Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		
		List<ReviewDTO> reviewList = reviewService.selectReviewListPaging(paramMap);
		int totalCount = reviewService.selectReviewListTotalCount();
		
		int totalPage = (int) Math.ceil((double) totalCount / limit);
		int pageBlock = 3;
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > totalPage)
			endPage = totalPage;
		
		List<FileDTO> fileList = fileService.selectFileListByReviewIdAll();
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", page);
		model.addAttribute("limit", limit);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("fileList", fileList);
		
		return "user/review/reviewList";
	}
	
	@GetMapping("/detail/{reviewId}")
	public String reviewDetailPage(@PathVariable Integer reviewId, Model model) {
		ReviewDTO reviewDTO = reviewService.selectReviewDtailByReviewId(reviewId);
		List<FileDTO> fileList = fileService.selectFileListByReviewId(reviewId);
		model.addAttribute("reviewDTO", reviewDTO);
		model.addAttribute("fileList", fileList);
		return "user/review/reviewDetail";
	}
	
	@GetMapping("/insert/{ordersDetailId}")
	public String reviewInsertPage(@PathVariable Integer ordersDetailId, Model model) {
//		OrdersDetailDTO ordersDetailDTO = ordersSer
		model.addAttribute("ordersDetailId",ordersDetailId);
		return "user/review/reviewInsert";
	}
	
	@PostMapping("/insert")
	public String insertReview(@ModelAttribute ReviewDTO reviewDTO) {
		reviewService.insertReview(reviewDTO);
		return "redirect:/review/listPaging";
	}
	
}
