package com.nike.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDAO {
<<<<<<< HEAD
	private static final String namespace = "com.care.mybatis.orderMapper.orderMapper";
=======
	private  final String namespace = "com.care.mybatis.orderMapper.orderMapper";
>>>>>>> minhoeyk
	@Autowired
	private SqlSession sqlSession;
	
	
<<<<<<< HEAD
	
=======
	public void buyRegister(OrderDTO Odto) {
		sqlSession.insert(namespace+".buyRegister",Odto);
	}
>>>>>>> minhoeyk
	
	
}
