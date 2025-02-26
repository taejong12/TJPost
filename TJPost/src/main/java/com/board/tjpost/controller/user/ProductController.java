package com.board.tjpost.controller.user;

import java.util.ArrayList;
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

import com.board.tjpost.dto.AddressDTO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.ProductDTO;
import com.board.tjpost.service.AddressService;
import com.board.tjpost.service.DeliveryService;
import com.board.tjpost.service.FileService;
import com.board.tjpost.service.OrdersService;
import com.board.tjpost.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private FileService fileService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private DeliveryService deliveryService;


	// 상품 목록 조회
	@GetMapping("/list")
	public String selectProductListAll(Model model) {

		List<ProductDTO> productList = productService.selectProductListAll();

		model.addAttribute("productList", productList);

		return "user/product/productList";
	}

	// 상품 목록 페이징
	@GetMapping("/listPaging")
	public String selectProductListAllPaging(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "3") int limit, @RequestParam(defaultValue = "latest") String sort,
			Model model) {

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		paramMap.put("sort", sort);

		List<ProductDTO> productList = productService.selectProductListAllPaging(paramMap);
		int totalCount = productService.selectProductTotalCount();

		int totalPage = (int) Math.ceil((double) totalCount / limit);
		int pageBlock = 3;
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		List<FileDTO> productFileList = fileService.selectFileListByProductIdAll();

		model.addAttribute("productList", productList);
		model.addAttribute("productFileList", productFileList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", page);
		model.addAttribute("limit", limit);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("sort", sort);

		return "user/product/productList";
	}

	// 상품 상세페이지
	@GetMapping("/detail/{productId}")
	public String selectProductDetailPage(@PathVariable Integer productId, Model model) {

		ProductDTO productDTO = productService.selectProductById(productId);
		List<FileDTO> fileList = fileService.selectFileListByProductId(productId);

		model.addAttribute("productDTO", productDTO);
		model.addAttribute("fileList", fileList);
		return "user/product/productDetail";
	}

	// 상품 결제페이지
	@GetMapping("/pay")
	public String productPayPage(@ModelAttribute ProductDTO productDTO, Model model) {
		List<FileDTO> fileList = fileService.selectFileListByProductId(productDTO.getProductId());
		AddressDTO addressDTO = addressService.selectAddressByDefaultAddress();
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		
		productList.add(productDTO);
		
		model.addAttribute("productList", productList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("addressDTO", addressDTO);
		return "user/product/productPay";
	}

	// 상품 결제하기
	@PostMapping("/pay")
	public String insertProductPay(@ModelAttribute OrdersDTO orderDTO, @ModelAttribute AddressDTO addressDTO, Model model) {
		
		//결제성공시
		
		//주문내역&상세내역 저장
		ordersService.insertOrdersAndOrdersDetail(orderDTO);
		
		//배송 저장
		deliveryService.insertDeliveryOrdersComplete(orderDTO, addressDTO);

		//상품 재고 업데이트
		productService.updateProductOrdersComplete(orderDTO);
	
		return "user/product/productPayComplete";
	}

}
