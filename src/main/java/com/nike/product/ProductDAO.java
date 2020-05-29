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
	
	/*신발 전체 조회*/
	public List<ProductDTO> allList(){
		return sqlSession.selectList(nameSpace+".AllList");
	}
		
	/*남자 전체신발 조회*/
	public List<ProductDTO> allListMen(Product_PagingVO vo) {
		System.out.println(vo.getNowPage());
		return sqlSession.selectList(nameSpace+".AllListMen",vo);
	}
	/*남자 카테고리별 전체신발 조회*/
	public List<ProductDTO> allListMenCategoly(String category) {
		return sqlSession.selectList(nameSpace+".AllListMenCategory",category);
	}

	/* 신발 검색 */
	public List<ProductDTO> searchCode(String codename) {
		return sqlSession.selectList(nameSpace+".searchCode",codename);
	}
	
	/*여자 전체신발 조회*/
	public List<ProductDTO> allListWomen() {
		return sqlSession.selectList(nameSpace+".AllListWomen");
	}
	
	/*여자 카테고리별 전체신발 조회*/
	public List<ProductDTO> allListWomenCategoly(String category) {
		return sqlSession.selectList(nameSpace+".AllListWomenCategory",category);
	}
	
	/*Kids 전체신발 조회*/
	public List<ProductDTO> allListKids() {
		return sqlSession.selectList(nameSpace+".AllListKids");
	}
	
	/*Kids 카테고리별 전체신발 조회*/
	public List<ProductDTO> allListKidsCategoly(String category) {
		return sqlSession.selectList(nameSpace+".AllListKidsCategory",category);
	}
	
	
	/* ======== 갯수  ========== */
	/*gender별 신발 전체 개수*/
	public int genderTotal(String gender) {
		return sqlSession.selectOne(nameSpace+".countProduct",gender);
	}
	
	
	public void product_input(Product_sizeDTO sizedto, ProductDTO dto) {
		// TODO Auto-generated method stub

	}


}
