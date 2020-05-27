package com.nike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.product.ProductDAO;
import com.nike.product.ProductDTO;
import com.nike.product.Product_sizeDTO;

@Service
public class ProductService {
	@Autowired
	private ProductDAO dao;

	public void product_input(Product_sizeDTO sizedto, ProductDTO dto) {
		dao.product_input(sizedto,dto);
	}
}
