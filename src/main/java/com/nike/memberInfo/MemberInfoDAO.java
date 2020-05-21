package com.nike.memberInfo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberInfoDAO {
	private static final String namespace = "com.care.mybatis.mapper";
	@Autowired
	private SqlSession sqlSession;
}
