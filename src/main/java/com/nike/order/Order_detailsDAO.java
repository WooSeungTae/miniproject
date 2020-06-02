package com.nike.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Order_detailsDAO {
	private  final String namespace = "com.care.mybatis.orderMapper.orderMapper";
	@Autowired
	private SqlSession sqlSession;
	
	public void buyRegisterDetails(Order_detailsDTO Ddto,int num) {
		System.out.println(Ddto.getCode());
		System.out.println(Ddto.getCount());
		System.out.println(Ddto.getId());
		System.out.println(Ddto.getOrdersize());
		System.out.println(Ddto.getPrice());
		String snum=num+"";
		Ddto.setOrderNum(snum);		
		sqlSession.insert(namespace+".buyRegisterDetails",Ddto);
	}

}
