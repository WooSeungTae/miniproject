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
		return sqlSession.selectList(nameSpace+".AllListMenCategory",category);
	}


	/*세부 상품 조회*/
	public ProductDTO productdetail(String code) {
		return sqlSession.selectOne(nameSpace+".productdetail", code);
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
<<<<<<< HEAD

	
	
	public void product_input(Product_sizeDTO sizedto, ProductDTO dto) {
		// TODO Auto-generated method stub

	}


	//관리자 상품 목록 수정, 삭제를 위한 조회
	public ProductDTO productSelect(String code) {
		return sqlSession.selectOne(nameSpace+".productSelect", code);
	}
	//관리자 상품 삭제하기 위한 기능
	public void productDelete(String code) {
		
		sqlSession.delete(nameSpace+".productDelete", code);		
	}

=======
	/*상품등록 기본정보 등록*/
	public void product_input(ProductDTO pdto) {
		sqlSession.insert(nameSpace+".productinput",pdto);
	}
	/*상품등록 사이즈별 수량 등록*/
	public void product_size(Product_sizeDTO sizedto) {
		sqlSession.insert(nameSpace+".sizeinput",sizedto);
	}
	/*신발 코드로 검색 전체*/   
	public ProductDTO codeSearch(String code){
	    return sqlSession.selectOne(nameSpace+".codeSearch",code);      
	}	
	
>>>>>>> minhoeyk
}
