package com.board.tjpost.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.tjpost.dto.ProductDTO;
import com.board.tjpost.service.ProductService;



@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService productService;
	
	@GetMapping("/list")
	public String selectProductListAll(Model model) {
		
		List<ProductDTO> productList = productService.selectProductAll();
		
		model.addAttribute("productList", productList);
		
		return "user/product/productList";
	}
}
