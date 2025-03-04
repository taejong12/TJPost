package com.board.tjpost.serviceImpl;

import java.io.File;
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
import com.board.tjpost.dao.OrdersDAO;
import com.board.tjpost.dao.ReviewDAO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.dto.ReviewDTO;
import com.board.tjpost.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private FileDAO fileDAO;
	@Autowired
	private OrdersDAO ordersDAO;

	// 구매후기 목록패이징
	public List<ReviewDTO> selectReviewListPaging(Map<String, Object> paramMap) {
		return reviewDAO.selectReviewListPaging(paramMap);
	}

	// 구매후기 총갯수
	public int selectReviewListTotalCount() {
		return reviewDAO.selectReviewListTotalCount();
	}

	// 구매후기 상세보기
	public ReviewDTO selectReviewDtailByReviewId(Integer reviewId) {
		return reviewDAO.selectReviewDtailByReviewId(reviewId);
	}

	// 구매후기 작성
	public void insertReview(ReviewDTO reviewDTO) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		reviewDTO.setMemberId(userDetails.getUsername());
		reviewDAO.insertReview(reviewDTO);
		
		String parentPathName = "C:/Users/dbxow/git/TJPost/TJPost/src/main/resources/static/img/review/";
		for (MultipartFile reviewFile : reviewDTO.getReviewFiles()) {
			if (!reviewFile.isEmpty()) {
				String childPathName = UUID.randomUUID().toString() + "_" + reviewFile.getOriginalFilename();
				File saveReviewFile = new File(parentPathName, childPathName);

				if (!saveReviewFile.getParentFile().exists()) {
					saveReviewFile.getParentFile().mkdir();
				}

				try {
					reviewFile.transferTo(saveReviewFile);
				} catch (Exception e) {
					System.out.println("구매후기 파일 전송 실패");
					e.printStackTrace();
				}

				String reviewFilePath = parentPathName + childPathName;

				FileDTO fileDTO = new FileDTO();
				fileDTO.setFileName(childPathName);
				fileDTO.setFilePath(reviewFilePath);
				fileDTO.setFileOriginalName(reviewFile.getOriginalFilename());
				fileDTO.setReviewId(reviewDTO.getReviewId());

				fileDAO.insertReviewFile(fileDTO);
				
			}
		}
		
		ordersDAO.updateOrdersDetailReviewId(reviewDTO);
	}
	
}
