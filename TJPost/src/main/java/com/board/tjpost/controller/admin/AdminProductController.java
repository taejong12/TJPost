package com.board.tjpost.controller.admin;

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
import com.board.tjpost.dto.ProductDTO;
import com.board.tjpost.service.FileService;
import com.board.tjpost.service.ProductService;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private FileService fileService;

	// 상품 목록 페이징
	@GetMapping("/listPaging")
	public String selectProductListAllPaging(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "3") int limit, @RequestParam(defaultValue = "latest") String sort,
			Model model) {

		int startRow = (page - 1) * limit + 1; // 시작 행 번호
		int endRow = page * limit; // 끝 행 번호

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		paramMap.put("sort", sort);

		// 상품 목록 조회
		List<ProductDTO> adminProductList = productService.selectProductListAllPaging(paramMap);
		int totalCount = productService.selectProductTotalCount(); // 전체 상품 개수

		// 페이징 계산
		int totalPage = (int) Math.ceil((double) totalCount / limit); // 전체 페이지 수
		int pageBlock = 3; // 한 번에 보여줄 페이지 개수
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1; // 블록 시작 페이지
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalPage)
			endPage = totalPage; // 마지막 페이지 초과 방지

		// 모델에 값 전달
		model.addAttribute("adminProductList", adminProductList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", page);
		model.addAttribute("limit", limit);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("sort", sort);

		return "admin/product/adminProductList";
	}

	// 상품등록페이지
	@GetMapping("/insert")
	public String insertProductPage() {
		return "admin/product/adminProductInsert";
	}

	// 상품등록
	@PostMapping("/insert")
	public String inserProduct(@ModelAttribute ProductDTO productDTO) {
		productService.insertProduct(productDTO);
		return "redirect:/admin/product/listPaging";
	}

	// 상품 상세페이지
	@GetMapping("/detail/{productId}")
	public String adminProductDetailPage(@PathVariable Integer productId, Model model) {

		ProductDTO adminProductDTO = productService.selectProductById(productId);
		List<FileDTO> fileList = fileService.selectFileListByProductId(productId);

		model.addAttribute("adminProductDTO", adminProductDTO);
		model.addAttribute("fileList", fileList);

		return "admin/product/adminProductDetail";
	}

	// 상품 수정페이지
	@GetMapping("/update/{productId}")
	public String updateAdminProductPage(@PathVariable Integer productId, Model model) {

		ProductDTO adminProductDTO = productService.selectProductById(productId);
		List<FileDTO> fileList = fileService.selectFileListByProductId(productId);

		model.addAttribute("adminProductDTO", adminProductDTO);
		model.addAttribute("fileList", fileList);
		return "admin/product/adminProductUpdate";
	}

	// 상품수정
	@PostMapping("/update")
	public String updateAdminProduct(@ModelAttribute ProductDTO productDTO) {
		productService.updateProduct(productDTO);
		return "redirect:/admin/product/listPaging";
	}

	// 상품삭제
	@GetMapping("/delete/{productId}")
	public String deleteProduct(@PathVariable Integer productId) {
		productService.deleteProduct(productId);
		return "redirect:/admin/product/listPaging";
	}

}
