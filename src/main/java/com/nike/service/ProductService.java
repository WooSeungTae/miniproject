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
	public void allListMenCategory(Model model,String category) {
		model.addAttribute("AllListMenCategory", Pdao.allListMenCategoly(category));
	}
	
	/*신발 전체 검색*/
	public void searchCode(Model model,String codename) {
		model.addAttribute("searchCode", Pdao.searchCode(codename));
	}
	
	/*여자 신발 전체 검색*/
	public void allListWomen(Model model) {
		model.addAttribute("allListWomen", Pdao.allListWomen());
	}
	
	/*여자 신발 카테고리별 전체 검색*/
	public void allListWomenCategory(Model model,String category) {
		model.addAttribute("AllListWomenCategory", Pdao.allListWomenCategoly(category));
	}
	
	/*Kids 신발 전체 검색*/
	public void allListKids(Model model) {
		model.addAttribute("allListKids", Pdao.allListKids());
	}
	
	/*Kids 신발 카테고리별 전체 검색*/
	public void allListKidsCategory(Model model,String category) {
		model.addAttribute("AllListKidsCategory", Pdao.allListKidsCategoly(category));
	}
	
	public void product_input(Product_sizeDTO sizedto, ProductDTO dto) {
		Pdao.product_input(sizedto,dto);
	}

}
