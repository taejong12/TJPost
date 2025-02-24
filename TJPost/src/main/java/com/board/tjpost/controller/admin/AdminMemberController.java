package com.board.tjpost.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.tjpost.dto.MemberDTO;
import com.board.tjpost.service.MemberService;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/listPaging")
	public String selectMemberListAllPaging(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "3") int limit, @RequestParam(defaultValue = "latest") String sort,
			Model model) {

		int startRow = (page-1) * limit + 1;
		int endRow = page * limit;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		paramMap.put("sort", sort);
		
		List<MemberDTO> adminMemberList = memberService.selectMemberListAllPaging(paramMap);
		int totalCount = memberService.selectMemberTotalCount();
		
		int totalPage = (int) Math.ceil((double) totalCount / limit);
		int pageBlock = 3;
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		
		model.addAttribute("adminMemberList", adminMemberList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", page);
		model.addAttribute("limit", limit);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("sort", sort);
				
		return "admin/member/adminMemberList";
	}
	
	@GetMapping("/detail/{memberId}")
	public String selectMemberById(@PathVariable String memberId, Model model) {
		
		MemberDTO adminMemberDTO = memberService.selectMemberById(memberId);
		
		model.addAttribute("adminMemberDTO", adminMemberDTO);
		return "admin/member/adminMemberDetail";
	}
}
