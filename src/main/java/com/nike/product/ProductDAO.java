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
	/*남자 전체신발 조회*/
	public List<ProductDTO> allListMen() {
		return sqlSession.selectList(nameSpace+".AllListMen");
	}
	/*남자 카테고리별 전체신발 조회*/
	public List<ProductDTO> allListMenCategoly(String category) {
		return sqlSession.selectList(nameSpace+".AllListMenCategoly",category);
	}

<<<<<<< HEAD
	/*세부 상품 조회*/
	public ProductDTO productdetail(String code) {
		return sqlSession.selectOne(nameSpace+".productdetail", code);
	}


=======
	/* 신발 검색 */
	public List<ProductDTO> searchCode(String codename) {
		return sqlSession.selectList(nameSpace+".searchCode",codename);
	}
	
>>>>>>> refs/heads/master
	public void product_input(Product_sizeDTO sizedto, ProductDTO dto) {
		// TODO Auto-generated method stub

	}


}
