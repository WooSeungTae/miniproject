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

	public void buyRegisterDetails(Order_detailsDTO Ddto) {
		//System.out.println("디테일 정보 주문번호 : "+Ddto.getOrderNum());
		sqlSession.insert(namespace+".buyRegisterDetails",Ddto);
		
	}
	/* 주문내역 및 배송현황 조회 */
	public List<Order_detailsDTO> orderView(String id) {
		return sqlSession.selectList(namespace+".orderView", id);
	}

}
