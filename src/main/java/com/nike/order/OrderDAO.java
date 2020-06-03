package com.nike.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDAO {
	private static final String namespace = "com.care.mybatis.orderMapper.orderMapper";
	
	/*장바구니용 namespace*/
	private static final String namespace2 = "com.care.mybatis.orderMapper.ShoppingCartMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	/*장바구니 DB에 값을 저장*/
	public void insertcart(ShoppingCartDTO sdto) {
		sqlSession.insert(namespace2+".insertcart",sdto); 
	}

	/*장바구니 DB에서 회원별 리스트 가져오기*/
	public List<ShoppingCartDTO> selectcart(String id) {
		return sqlSession.selectList(namespace2+".selectcart", id);
	}
	
	/*장바구니 DB에서 리스트 개수 가져오기*/
	public int countcart(String id) {
		return sqlSession.selectOne(namespace2+".countcart",id);
	}
	
	/*회원별 장바구니에 있는 아이템 전부 삭제*/
	public void cartAlldelete(String id) {
		sqlSession.delete(namespace2+".cartAlldelete",id);
	}
	
	/*장바구니 DB에서 회원별 총 금액 가져오기*/
	public int totalprice(String id) {
		return sqlSession.selectOne(namespace2+".totalprice", id);
	}
	
	
	
	
	
}
