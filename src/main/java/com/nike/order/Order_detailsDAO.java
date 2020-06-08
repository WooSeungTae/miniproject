package com.nike.order;

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


}
