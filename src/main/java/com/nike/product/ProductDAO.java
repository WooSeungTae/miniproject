package com.nike.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	
	private final String nameSpace="com.care.mybatis.productMapper.productMapper";
	@Autowired
	private SqlSession sqlSession;

	public List<ProductDTO> allListMen() {
		return sqlSession.selectList(nameSpace+".AllListMen");
	}
}
