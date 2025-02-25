package com.board.tjpost.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.tjpost.dto.DeliveryDTO;
import com.board.tjpost.service.DeliveryService;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {

	@Autowired
	private DeliveryService deliveryService;
	
	// 배송지 목록 페이지
	@GetMapping("/listPaging")
	public String selectDeliveryListByMemberId(Model model) {
		List<DeliveryDTO> deliveryList = deliveryService.selectDeliveryListByMemberId();
		model.addAttribute("deliveryList", deliveryList);
		return "user/delivery/deliveryList";
	}
}
