package com.nike.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDAO {
	private  final String namespace = "com.care.mybatis.orderMapper.orderMapper";
	@Autowired
	private SqlSession sqlSession;
	
	
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
		System.out.println("정보 주문번호 : "+Odto.getordernum());
		sqlSession.insert(namespace+".buyRegister",Odto);
		}
	
	
}
