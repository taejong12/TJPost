package com.board.tjpost.service;

import java.util.List;

import com.board.tjpost.dto.ProductDTO;

public interface ProductService {

	// 모든 상품 조회
	public List<ProductDTO> selectProductAll();

	// 상품 등록
	public void insertProduct(ProductDTO productDTO);

	// 상품 조회(아이디)
	public ProductDTO selectProductById(Integer productId);

	// 상품 수정
	public void updateProduct(ProductDTO productDTO);

	// 상품 삭제
	public void deleteProduct(Integer productId);

}
