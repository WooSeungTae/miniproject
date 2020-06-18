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
	
	/*댓글 수정*/
	public void replyUpdate(CommentDTO Cdto){
		 sqlSession.update(namespace+".replyUpdate",Cdto);
	}
	/*댓글 삭제*/
	public void replyDelete(CommentDTO Cdto){
		System.out.println("댓글 삭제 번호 : "+Cdto.getNumComment());
		 sqlSession.delete(namespace+".replyDelete",Cdto);
	}
	/*게시글에 댓글 갯수*/
	public int replyint(CommentDTO Cdto) {
		return sqlSession.selectOne(namespace+".replyint",Cdto);
	}
}
