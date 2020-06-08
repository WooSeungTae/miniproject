package com.nike.order;

<<<<<<< HEAD
import java.util.ArrayList;
=======
>>>>>>> minhoeyk
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDAO {
	private  final String namespace = "com.care.mybatis.orderMapper.orderMapper";
	@Autowired
	private SqlSession sqlSession;
	
	/*장바구니용 namespace*/
	private static final String namespace2 = "com.care.mybatis.orderMapper.ShoppingCartMapper";

	public void buyRegister(OrderDTO Odto) {
//		System.out.println("이름 : "+Odto.getName());
//		System.out.println("주소 : "+Odto.getAddr());
//		System.out.println("은행 : "+Odto.getBank());
//		System.out.println("예금주 : "+Odto.getbankname());
//		System.out.println("id: "+Odto.getId());
//		System.out.println("mile : "+Odto.getMile());
//		System.out.println("배송메모 : "+Odto.getordermemo());
//		System.out.println("배송타입 : "+Odto.getOrdertype());
//		System.out.println("전화번호 : "+Odto.getTel());
//		System.out.println("총가격 : "+Odto.gettotalprice());
		//System.out.println("정보 주문번호 : "+Odto.getordernum());
		sqlSession.insert(namespace+".buyRegister",Odto);
	}
<<<<<<< HEAD
		

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
=======

	public int countOrder() {
		return sqlSession.selectOne(namespace+".countorder");
	}

	public List<OrderDTO> selectOrder(OrderCare_PagingVO vo) {
		return sqlSession.selectList(namespace+".selectorber",vo);
	}

	public void deliveryChange(OrderDTO Odto) {
		sqlSession.update(namespace+".deliveryChange",Odto);
	}

	public OrderDTO orderserch(String id) {
		return sqlSession.selectOne(namespace+".orderserch",id);
>>>>>>> minhoeyk
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


}
