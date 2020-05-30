package com.nike.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDAO {
	private static final String namespace = "com.care.mybatis.memberMapper.memberMapper";
	@Autowired
	private SqlSession sqlSession;
}
