package com.nike.board;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CommentDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace="com.care.mybatis.boardMapper.commnetMapper";
	
	
	/*댓글 등록*/
	public void commnetRegister(CommentDTO Cdto) {
		sqlSession.insert(namespace+".commnetRegister",Cdto);
	}

	/*댓글 indexnum으로 조회*/
	public List<CommentDTO> searchComment(String indexnum){
		 return sqlSession.selectList(namespace+".searchComment",indexnum);
	}
}
