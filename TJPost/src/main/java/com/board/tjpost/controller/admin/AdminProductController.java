package com.board.tjpost.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.tjpost.service.ProductService;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

	@Autowired
	ProductService productService;
	
	@GetMapping("/list")
	public String selectProductAll(Model model) {
		productService.selectProductAll();
		return "admin/product/adminProductList";
	}
}
