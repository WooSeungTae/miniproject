package com.nike.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDAO {
	private  final String namespace = "com.care.mybatis.orderMapper.orderMapper";
	/*장바구니용 namespace*/
	private  final String namespace2 = "com.care.mybatis.orderMapper.ShoppingCartMapper";
	@Autowired
	private SqlSession sqlSession;

	/*구매 물품 등록*/
	public void buyRegister(OrderDTO Odto) {
		sqlSession.insert(namespace+".buyRegister",Odto);
	}

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
	/*주문 관리 물품 갯수*/
	public int countOrder() {
		return sqlSession.selectOne(namespace+".countorder");
	}
	/*주문 관리 물품 일정량만 가져옴(페이징 기능)*/
	public List<OrderDTO> selectOrder(OrderCare_PagingVO vo) {
		return sqlSession.selectList(namespace+".selectorber",vo);
	}
	/*주문 관리 물품 확인, 취소 기능*/
	public void deliveryChange(OrderDTO Odto) {
		System.out.println("배송상태 : "+Odto.getDelivery()+"ㅁㄴㅇㄻㄴㅇㄹ");
		System.out.println("배송번호 : "+Odto.getordernum()+"ㅁㅇㄻㅇㄴㄻㄴㅇㄹ");
		try {
		sqlSession.update(namespace+".deliveryChange",Odto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("나온다!");
	}
	/*주문 관리 물품 하나만 검색해 가져오기*/
	public OrderDTO orderserch(String id) {
		return sqlSession.selectOne(namespace+".orderserch",id);
	}
	
	/*장바구니 DB에서 회원별 총 금액 가져오기*/
	public int totalprice(String id) {
		return sqlSession.selectOne(namespace2+".totalprice", id);
		
	}
	
	/*회원별 장바구니에서 x누른 아이템 삭제*/
	public void cartitemdelete(ShoppingCartDTO sdto) {
		sqlSession.delete(namespace2+".cartitemdelete", sdto);
	}
	
	/*이미 있는 아이템은 더이상 장바구니에 추가 못함*/
	public int checkitem(ShoppingCartDTO sdto) {
		return sqlSession.selectOne(namespace2+".checkitem", sdto);

	}

	/*장바구니 옵션 변경*/
	public void cartoptionchange(ShoppingCartDTO sdto) {
		sqlSession.update(namespace2+".cartoptionchange", sdto);
		
	}

	/* 주문내역 상세페이지 - 주문자 및 결제정보 */
	public List<OrderDTO> orderView(String id){
		return sqlSession.selectList(namespace+".orderView",id);
	}
	/* 주문내역 상세페이지 - 주문자 및 결제정보 */
	public List<OrderDTO> orderView_num(String ordernum){
		return sqlSession.selectList(namespace+".orderView_num",ordernum);
	}

}
