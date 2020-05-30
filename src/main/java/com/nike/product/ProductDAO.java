package com.nike.product;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
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
	/*여자 전체신발 조회*/
	public List<ProductDTO> allListWomen(Product_PagingVO vo) {
		return sqlSession.selectList(nameSpace+".AllListWomen",vo);
	}
	/*Kids 전체신발 조회*/
	public List<ProductDTO> allListKids(Product_PagingVO vo) {
		return sqlSession.selectList(nameSpace+".AllListKids",vo);
	}
	
	
	
	/*남자 카테고리별 전체신발 조회*/
	public List<ProductDTO> allListMenCategoly(Product_PagingVO vo) {
		return sqlSession.selectList(nameSpace+".AllListMenCategory",vo);
	}
	/*여자 카테고리별 전체신발 조회*/
	public List<ProductDTO> allListWomenCategoly(Product_PagingVO vo) {
		return sqlSession.selectList(nameSpace+".AllListWomenCategory",vo);
	}
	
	/*Kids 카테고리별 전체신발 조회*/
	public List<ProductDTO> allListKidsCategoly(Product_PagingVO vo) {
		return sqlSession.selectList(nameSpace+".AllListKidsCategory",vo);
	}

	/* 신발 검색 */
	public List<ProductDTO> searchCode(Product_PagingVO vo) {
		return sqlSession.selectList(nameSpace+".searchCode",vo);
	}
	
	
	
	
	/* ======== 갯수  ========== */
	/*gender별 신발 전체 개수*/
	public int genderTotal(String gender) {
		return sqlSession.selectOne(nameSpace+".countProduct",gender);
	}
	
	/*Category and gender별 신발 전체 개수*/
	public int categoryGenderTotal(HashMap<String,String> hm) {
		return sqlSession.selectOne(nameSpace+".countProductGender",hm);
	}
	
	/*신발 검색 전체 개수*/
	public int searchShose(String codename) {
		return sqlSession.selectOne(nameSpace+".searchProduct",codename);
	}
	
	public void product_input(Product_sizeDTO sizedto, ProductDTO dto) {
		// TODO Auto-generated method stub

	}


}
