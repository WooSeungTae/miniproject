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
		sqlSession.insert(namespace+".buyRegister",Odto);
	}
	
	
}
