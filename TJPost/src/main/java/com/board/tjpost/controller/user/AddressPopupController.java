package com.board.tjpost.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.tjpost.dto.AddressDTO;
import com.board.tjpost.service.AddressService;

@Controller
@RequestMapping("/address/popup")
public class AddressPopupController {

	@Autowired
	private AddressService addressService;
	
	// 배송지 목록 팝업창
	@GetMapping("/listPaging")
	public String selectAddressPopupListPaging(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "3") int limit, Model model) {

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);

		List<AddressDTO> addressList = addressService.selectAddressListByMemberId(paramMap);
		int totalCount = addressService.selectAddressTotalCountByMemberId();

		int totalPage = (int) Math.ceil((double) totalCount / limit);
		int pageBlock = 3;
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		model.addAttribute("addressList", addressList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", page);
		model.addAttribute("limit", limit);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);

		return "user/address/popup/addressPopupList";
	}
	
	// 배송지 추가 팝업창
	@GetMapping("/insert")
	public String insertAddressPopupPage() {
		return "user/address/popup/addressPopupInsert";
	}
	
	// 배송지 추가
	@PostMapping("/insert")
	public String insertAddressPopup(@ModelAttribute AddressDTO addressDTO) {
		addressService.insertAddress(addressDTO);
		return "redirect:/address/popup/listPaging";
	}
}
