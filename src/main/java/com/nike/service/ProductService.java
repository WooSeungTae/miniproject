package com.nike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nike.product.ProductDAO;

@Service
public class ProductService {
	@Autowired
	private ProductDAO Pdao;
	
	public void allListMen(Model model) {
		model.addAttribute("AllListMen", Pdao.allListMen());
	}
}
