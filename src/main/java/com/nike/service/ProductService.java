package com.nike.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nike.board.SearchBoardDTO;
import com.nike.memberInfo.MemberInfo_PagingVO;
import com.nike.product.InventoryCare_PagingVO;
import com.nike.product.Inventory_PagingVO;
import com.nike.product.ProductDAO;
import com.nike.product.ProductDTO;
import com.nike.product.Product_PagingVO;
import com.nike.product.Product_sizeDTO;


@Service
public class ProductService {
	@Autowired
	private ProductDAO Pdao;
	

	/*신발 코드로 검색 검색 결과 없다면 1 있다면 0*/
	public int codeSearch(Model model,String code) {
	   model.addAttribute("quickProduct", Pdao.codeSearch(code));
	   if(Pdao.codeSearch(code)==null) {
		   return 1;
	   }else {
		   return 0;
	   }
	}

	
	
	/*gender별 신발 전체 개수*/
	public int genderAll(String gender) {
		return Pdao.genderTotal(gender);
	}
	
	/*Category and gender별 신발 전체 개수*/
	public int categoryGenderAll(String gender,String category) {
		HashMap<String,String> hm = new LinkedHashMap<String, String>();
		hm.put("gender", gender);
		hm.put("category",category);
		return Pdao.categoryGenderTotal(hm);
	}
	
	/*신발 검색 전체 개수*/
	public int searchShose(String codename) {
		return Pdao.searchShose(codename);
	}

	/*남자 신발 전체 검색 및 컬러 조회*/
	public void allListMen(Model model,Product_PagingVO vo) {
		model.addAttribute("AlllistMen", Pdao.allListMen(vo));
		model.addAttribute("selectcolor", Pdao.selectcolor());
		model.addAttribute("paging", vo);

	}

	/*여자 신발 전체 검색*/
	public void allListWomen(Model model,Product_PagingVO vo) {
		model.addAttribute("allListWomen", Pdao.allListWomen(vo));
		model.addAttribute("paging", vo);
		model.addAttribute("selectcolor", Pdao.selectcolor());
	}

	/*Kids 신발 전체 검색*/
	public void allListKids(Model model,Product_PagingVO vo) {
		model.addAttribute("allListKids", Pdao.allListKids(vo));
		model.addAttribute("paging", vo);
		model.addAttribute("selectcolor", Pdao.selectcolor());
	}

	/*남자 신발 카테고리별 전체 검색*/
	public void allListMenCategory(Model model,Product_PagingVO vo) {
		model.addAttribute("AllListMenCategory", Pdao.allListMenCategoly(vo));
		model.addAttribute("paging", vo);
		model.addAttribute("selectcolor", Pdao.selectcolor());
	}
	
	/*여자 신발 카테고리별 전체 검색*/
	public void allListWomenCategory(Model model,Product_PagingVO vo) {
		model.addAttribute("AllListWomenCategory", Pdao.allListWomenCategoly(vo));
		model.addAttribute("paging", vo);
		model.addAttribute("selectcolor", Pdao.selectcolor());
	}



	/*Kids 신발 카테고리별 전체 검색*/
	public void allListKidsCategory(Model model,Product_PagingVO vo) {
		model.addAttribute("AllListKidsCategory", Pdao.allListKidsCategoly(vo));
		model.addAttribute("paging", vo);
		model.addAttribute("selectcolor", Pdao.selectcolor());
	}



	/*신발 전체 검색*/
	public void searchCode(Model model,Product_PagingVO vo) {
		model.addAttribute("searchCode", Pdao.searchCode(vo));
		model.addAttribute("paging", vo);
		model.addAttribute("selectcolor", Pdao.selectcolor());
	}

	/*상품 등록 기본 정보*/
	public void product_input(ProductDTO pdto) {
		if(pdto.getGender().equals("남,여")) {
			pdto.setGender("공용");
		}
		Pdao.product_input(pdto);
	}
	/*상품 등록 사이즈별 수량*/
	public void product_size(Product_sizeDTO sizedto) {
		Pdao.product_size(sizedto);
	}

	/*세부 상품 조회*/
	public ProductDTO productdetail(String code) {
		return Pdao.productdetail(code);
	}
	

	
		
	//상품 관리 페이지 상품 갯수를 가져오는 기능
	public int countProduct() {
		return Pdao.countProduct();
	}
	//상품 관리 페이지 상품을 가져오는 기능
	public List<ProductDTO> selectProduct(Inventory_PagingVO vo) {
		return Pdao.selectProduct(vo);
	}
	
	//장바구니에 대표사진 저장하는 기능
	public String image1get(String code) {
		return Pdao.image1get(code);
	}
	
	//장바구니에 상품명 저장하는 기능
	public String codnameget(String code) {
		return Pdao.codenameget(code);
	}
	
	//장바구니에 가격 저장하는 기능
	public int priceget(String code) {
		return Pdao.priceget(code);
	}

	//관리자 상품 목록 수정, 삭제를 위한 조회(상품)
	public ProductDTO productSelect(String code) {
		return Pdao.productSelect(code);
	}
	//관리자 상품 삭제하기 위한 기능
	public void productDelete(String code) {		
		Pdao.productDelete(code);	
	}
	//관리자 상품관리 - 수정기능
	public void product_update(ProductDTO pdto) {
		Pdao.product_update(pdto);
		
	}

	//관리자 상품관리 - 수정기능2
	public void size_update(Product_sizeDTO sizedto) {
		Pdao.size_update(sizedto);
		
	}


	//관리자 상품 목록 수정, 삭제를 위한 조회(사이즈)
	public Product_sizeDTO sizeSelect(String code) {
		return Pdao.sizeSelect(code);
	}


	/*관리자 상품 관리 검색 갯수*/
	public int searchShose(SearchBoardDTO searchdto) {
		return Pdao.searchShose(searchdto);
	}
	/*관리자 상품 관리 검색*/
	public List<ProductDTO> productserch(InventoryCare_PagingVO vo) {
		return Pdao.productserch(vo);
	}



}
