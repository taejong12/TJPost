package com.board.tjpost.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/coupon")
public class AdminCouponController {

	@GetMapping("/listPaging")
	public String adminCouponListPage() {
		return "admin/coupon/adminCouponList";
	}
	
}
