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
import com.board.tjpost.dto.AddressDTO;
import com.board.tjpost.dto.FileDTO;
import com.board.tjpost.dto.OrdersDTO;
import com.board.tjpost.dto.OrdersDetailDTO;
import com.board.tjpost.dto.ProductDTO;
import com.board.tjpost.service.DeliveryService;
import com.board.tjpost.service.OrdersService;
import com.board.tjpost.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private FileDAO fileDAO;
	
	// 모든 상품 조회
	public List<ProductDTO> selectProductListAll() {
		return productDAO.selectProductListAll();
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
		return productDAO.selectProductById(productId);
	}

	// 상품 수정
	public void updateProduct(ProductDTO productDTO) {

		// 현재 로그인한 사용자 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		productDTO.setMemberId(userDetails.getUsername());

		productDAO.updateProduct(productDTO);

		if (productDTO.getProductFiles() != null) {

			List<FileDTO> deleteProductFileList = fileDAO.selectFileListByProductId(productDTO.getProductId());

			String parentPathName = "C:/Users/dbxow/git/TJPost/TJPost/src/main/resources/static/img/product/";

			// 폴더 내 기존 파일 삭제
			for (FileDTO file : deleteProductFileList) {
				File oldFile = new File(parentPathName, file.getFileName());
				if (oldFile.exists()) {
					oldFile.delete(); // 실제 파일 삭제
				}
			}

			fileDAO.deleteProductFileByProductId(productDTO.getProductId());

			for (MultipartFile productFile : productDTO.getProductFiles()) {
				if (!productFile.isEmpty()) {
					String childPathName = UUID.randomUUID().toString() + "_" + productFile.getOriginalFilename();
					File saveProductFile = new File(parentPathName, childPathName);

					if (!saveProductFile.getParentFile().exists()) {
						saveProductFile.getParentFile().mkdir();
					}

					try {
						productFile.transferTo(saveProductFile);
					} catch (Exception e) {
						System.out.println("상품 파일 수정 실패");
						e.printStackTrace();
					}

					String productFilePath = parentPathName + childPathName;

					FileDTO fileDTO = new FileDTO();
					fileDTO.setFileName(childPathName);
					fileDTO.setFilePath(productFilePath);
					fileDTO.setFileOriginalName(productFile.getOriginalFilename());
					fileDTO.setProductId(productDTO.getProductId());

					fileDAO.insertProductFile(fileDTO);
				}
			}
		}

	}

	// 상품 삭제
	public void deleteProduct(Integer productId) {
		
		List<FileDTO> deleteProductFileList = fileDAO.selectFileListByProductId(productId);
		
		String parentPathName= "C:/Users/dbxow/git/TJPost/TJPost/src/main/resources/static/img/product/";

		 // 폴더 내 기존 파일 삭제
        for (FileDTO file : deleteProductFileList) {
            File oldFile = new File(parentPathName, file.getFileName());
            if (oldFile.exists()) {
                oldFile.delete();  // 실제 파일 삭제
            }
        }

		fileDAO.deleteProductFileByProductId(productId);
		
		productDAO.deleteProduct(productId);
	}

	// 상품 목록 페이징처리
	public List<ProductDTO> selectProductListAllPaging(Map<String, Object> paramMap) {
		return productDAO.selectProductListAllPaging(paramMap);
	}

	// 상품 전체 갯수
	public int selectProductTotalCount() {
		return productDAO.selectProductTotalCount();
	}

	// 회원 검색
	public List<ProductDTO> searchProductList(String searchKeyword) {
		return productDAO.searchProductList(searchKeyword);
	}

	// 결제 시 재고 업데이트
	public void updateProductOrdersComplete(OrdersDTO ordersDTO) {
		
		for(OrdersDetailDTO ordersDetailDTO : ordersDTO.getOrdersDetailList()) {
			
			ProductDTO productDTO = productDAO.selectProductById(ordersDetailDTO.getProductId());
			
			int salesCount = productDTO.getProductTotalSalesCount() + ordersDetailDTO.getOrdersDetailProductCount();
			productDTO.setProductTotalSalesCount(salesCount);
			int productStock = productDTO.getProductStock() - ordersDetailDTO.getOrdersDetailProductCount();
			productDTO.setProductStock(productStock);

			productDAO.updateProductOrdersComplete(productDTO);
		}
	}

}
