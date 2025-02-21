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
	public List<ProductDTO> selectProductAllPaging(Map<String, Object> paramMap);

	// 상품 전체 갯수
	public int selectProductTotalCount();

	// 상품 검색
	public List<ProductDTO> searchProductList(String searchKeyword);

}
