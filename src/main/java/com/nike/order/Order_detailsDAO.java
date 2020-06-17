package com.nike.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Order_detailsDAO {
	private  final String namespace = "com.care.mybatis.orderMapper.orderMapper";
	@Autowired
	private SqlSession sqlSession;

	/*구매 세부목록 저장*/
	public void buyRegisterDetails(Order_detailsDTO Ddto) {
		sqlSession.insert(namespace+".buyRegisterDetails",Ddto);
		
	}
	/* 주문내역 및 배송현황 조회 */
	public List<Order_detailsDTO> orderList(String id) {
		return sqlSession.selectList(namespace+".orderList", id);
	}
	/* 주문내역 및 배송현황 페이지 - 배송 상태 */
	public void delivery(Order_detailsDTO Ddto) {
		sqlSession.update(namespace+".delivery",Ddto);
	}
	/* 주문내역 및 배송현황 조회 */
	public List<Order_detailsDTO> orderList_num(String ordernum) {
		return sqlSession.selectList(namespace+".orderList_num", ordernum);
	}
	
	/* 구매 수량 삭제*/
	public void sizeDelete(Order_detailsDTO Ddto) {
		sqlSession.update(namespace+".sizeDelete",Ddto);
	}
	//최근 주문 내역 페이지
		public List<Order_detailsDTO> myPage1(String id) {
			return sqlSession.selectList(namespace+".myPage1", id);
		}


}
