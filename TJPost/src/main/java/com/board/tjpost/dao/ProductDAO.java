package com.board.tjpost.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.tjpost.dto.ProductDTO;

@Mapper
public interface ProductDAO {

	// 상품 등록
	public void insertProduct(ProductDTO productDTO);

	// 모든 상품 조회
	public List<ProductDTO> selectProductAll();
	
	// 상품 조회 페이징 처리
	public List<ProductDTO> selectProductListAllPaging(Map<String, Object> paramMap);

	// 상품 전체 갯수
	public int selectProductTotalCount();

	// 상품 검색
	public List<ProductDTO> searchProductList(String searchKeyword);

	// 상품 아아디 조회
	public ProductDTO selectProductById(Integer productId);

	// 상품 수정
	public void updateProduct(ProductDTO productDTO);

	// 상품 삭제
	public void deleteProduct(Integer productId);

}
