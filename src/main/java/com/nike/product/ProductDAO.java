package com.nike.product;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nike.memberInfo.MemberInfo_PagingVO;

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


	/*세부 상품 조회*/
	public ProductDTO productdetail(String code) {
		return sqlSession.selectOne(nameSpace+".productdetail", code);
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
	
	//관리자 상품 목록 수정, 삭제를 위한 조회
	public ProductDTO productSelect(String code) {
		return sqlSession.selectOne(nameSpace+".productSelect", code);
	}
	//관리자 상품 삭제하기 위한 기능
	public void productDelete(String code) {
		
		sqlSession.delete(nameSpace+".productDelete", code);		
	}
	
	//장바구니에 대표사진 저장하는 기능
	public String image1get(String code) {
		return sqlSession.selectOne(nameSpace+".image1get", code);
	}
	
	//장바구니에 상품명 저장하는 기능
	public String codenameget(String code) {
		return sqlSession.selectOne(nameSpace+".codnameget", code);
	}
	
	//장바구니에 가격 저장하는 기능
	public int priceget(String code) {
		System.out.println("타입변환====================="+Integer.valueOf(sqlSession.selectOne(nameSpace+".priceget", code).toString()));
		return Integer.valueOf(sqlSession.selectOne(nameSpace+".priceget", code).toString());
	}

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
	//상품 관리 페이지 상품 갯수를 가져오는 기능
	public int countProduct() {
		return sqlSession.selectOne(nameSpace+".countproduct");
	}
	//상품 관리 페이지 상품을 가져오는 기능
	public List<ProductDTO> selectProduct(Inventory_PagingVO vo) {
		return sqlSession.selectList(nameSpace+".selectproduct",vo);
	}	
	
}
