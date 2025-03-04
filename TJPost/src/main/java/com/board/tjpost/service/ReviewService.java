package com.board.tjpost.service;

import java.util.List;
import java.util.Map;

import com.board.tjpost.dto.ReviewDTO;

public interface ReviewService {

	// 구매후기 목록 페이징
	List<ReviewDTO> selectReviewListPaging(Map<String, Object> paramMap);

	// 구매후기 총갯수
	int selectReviewListTotalCount();

	// 구매후기 상세보기
	ReviewDTO selectReviewDtailByReviewId(Integer reviewId);

	// 구매후기 작성
	void insertReview(ReviewDTO reviewDTO);

}
