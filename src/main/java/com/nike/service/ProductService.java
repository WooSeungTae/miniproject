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

	public void allListMen(Model model) {
		model.addAttribute("AllListMen", Pdao.allListMen());
	}

	public void allListMenRun(Model model) {
		model.addAttribute("AllListMenRun", Pdao.allListMenRun());
	}

	public void allListMenBasket(Model model) {
		model.addAttribute("AllListMenBasket", Pdao.allListMenBasket());
	}

	public void allListMenSoccer(Model model) {
		model.addAttribute("AllListMenSoccer", Pdao.allListMenSoccer());
	}
	public void product_input(Product_sizeDTO sizedto, ProductDTO dto) {
		Pdao.product_input(sizedto,dto);
	}
	/*세부 상품 조회*/
	public ProductDTO productdetail(String code) {
		return Pdao.productdetail(code);
	}
	
}
