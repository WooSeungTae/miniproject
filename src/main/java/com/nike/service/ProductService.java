package com.nike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.ui.Model;

import com.nike.product.ProductDAO;


import com.nike.product.ProductDAO;
import com.nike.product.ProductDTO;
import com.nike.product.Product_sizeDTO;


@Service
public class ProductService {
	@Autowired
	private ProductDAO Pdao;
	/*남자 신발 전체 검색*/
	public void allListMen(Model model) {
		model.addAttribute("AllListMen", Pdao.allListMen());
	}
	/*남자 신발 카테고리별 전체 검색*/
	public void allListMenCategoly(Model model,String category) {
		model.addAttribute("AllListMenCategoly", Pdao.allListMenCategoly(category));
	}
	
	/*신발 전체 검색*/
	public void searchCode(Model model,String codename) {
		model.addAttribute("searchCode", Pdao.searchCode(codename));
	}
	
	
	public void product_input(Product_sizeDTO sizedto, ProductDTO dto) {
		Pdao.product_input(sizedto,dto);
	}
	/*세부 상품 조회*/
	public ProductDTO productdetail(String code) {
		return Pdao.productdetail(code);
	}
	
}
