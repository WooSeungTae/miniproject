package com.nike.memberInfo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MemberInfoDAO {
	private static final String namespace = "com.care.mybatis.myMapper";
	@Autowired
	private SqlSession sqlSession;
	
	public MemberInfoDTO searchId(String idtel) {
		return sqlSession.selectOne(namespace+".searchId",idtel);
	}
	
	public void pwdUpdate(MemberInfoDTO dto) {
		int result = sqlSession.update(namespace+".pwdUpdate",dto);
	}
}
