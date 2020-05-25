package com.nike.memberInfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


@Repository
public class MemberInfoDAO {
	
	private static final String namespace = "com.care.mybatis.myMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public void saveUserInfo(MemberInfoDTO dto) {
		sqlSession.insert(namespace+".saveUserInfo",dto);
	}

	public int loginChk(MemberInfoDTO dto) {
		MemberInfoDTO dto2 = sqlSession.selectOne(namespace+".loginChk",dto);
		if(dto2==null) {
			return 0;
		}else {
			return 1;
		}
	}
}
