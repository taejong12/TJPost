package com.board.tjpost.serviceImpl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.board.tjpost.dao.FileDAO;
import com.board.tjpost.dao.ProductDAO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.dto.ProductDTO;
import com.board.tjpost.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;

	@Autowired
	FileDAO fileDAO;

	// 모든 상품 조회
	public List<ProductDTO> selectProductAll() {
		return productDAO.selectProductAll();
	}

	// 상품 등록
	public void insertProduct(ProductDTO productDTO) {

		// 현재 로그인한 사용자 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		productDTO.setMemberId(userDetails.getUsername());

		productDAO.insertProduct(productDTO);

		String parentPathName = "C:/Users/dbxow/git/TJPost/TJPost/src/main/resources/static/img/product/";
		for (MultipartFile producFile : productDTO.getProductFiles()) {
			if (!producFile.isEmpty()) {
				String childPathName = UUID.randomUUID().toString() + "_" + producFile.getOriginalFilename();
				File saveProductFile = new File(parentPathName, childPathName);

				if (!saveProductFile.getParentFile().exists()) {
					saveProductFile.getParentFile().mkdir();
				}

				try {
					producFile.transferTo(saveProductFile);
				} catch (Exception e) {
					System.out.println("상품 파일 전송 실패");
					e.printStackTrace();
				}

				String productFilePath = parentPathName + childPathName;

				FileDTO fileDTO = new FileDTO();
				fileDTO.setFileName(childPathName);
				fileDTO.setFilePath(productFilePath);
				fileDTO.setFileOriginalName(producFile.getOriginalFilename());
				fileDTO.setProductId(productDTO.getProductId());

				fileDAO.insertProductFile(fileDTO);
			}
		}
	}

	// 상품 조회(아이디)
	public ProductDTO selectProductById(Integer productId) {
		return null;
	}

	// 상품 수정
	public void updateProduct(ProductDTO productDTO) {

	}

	// 상품 삭제
	public void deleteProduct(Integer productId) {

	}

	// 상품 목록 페이징처리
	public List<ProductDTO> selectProductAllPaging(Map<String, Object> paramMap) {
		return productDAO.selectProductAllPaging(paramMap);
	}

	// 상품 전체 갯수
	public int selectProductTotalCount() {
		return productDAO.selectProductTotalCount();
	}

	// 회원 검색
	public List<ProductDTO> searchProductList(String searchKeyword) {
		return productDAO.searchProductList(searchKeyword);
	}

}
