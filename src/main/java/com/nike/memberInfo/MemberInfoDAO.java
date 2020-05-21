package com.nike.memberInfo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberInfoDAO {
	private static final String namespace = "com.care.mybatis.myMapper";
	@Autowired
	private SqlSession sqlSession;
	
	public MemberInfoDTO searchId(String id) {
		return sqlSession.selectOne(namespace+".searchId",id);
	}
}
