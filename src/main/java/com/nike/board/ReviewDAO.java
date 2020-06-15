package com.nike.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nike.order.OrderCare_PagingVO;

@Repository
public class ReviewDAO {
	
	private static final String namespace = "com.care.mybatis.boardMapper.reviewMapper";
	@Autowired
	private SqlSession sqlSession;
	
	//리뷰 저장
	public void review_save(ReviewDTO rdto) {
		sqlSession.insert(namespace+".reviewsave", rdto);
	}
		
	//마이페이지 나의 리뷰 보여주기
	public List<ReviewDTO> review_list(String id) {
		return sqlSession.selectList(namespace+".review_list", id);
	}
	
	//마이페이지 나의 리뷰 수정하기, 삭제하기 하기 위한 폼
	public ReviewDTO reviewitem(ReviewDTO rdto) {
		return sqlSession.selectOne(namespace+".reviewitem", rdto);
	}
	
	//마이페이지 나의 리뷰 삭제하기
	public void reviewdelete(ReviewDTO rdto) {
		sqlSession.delete(namespace+".reviewdelete", rdto);
	}
	
	//마이페이지 나의 리뷰 수정하기
	public void reviewmodify(ReviewDTO rdto) {
		sqlSession.update(namespace+".reviewmodify", rdto);
	}

	
	/*코드별 리뷰 리스트 총 개수*/
	public int rvtotal(String code) {
		return sqlSession.selectOne(namespace+".rvtotal",code);
	}
	
	/*코드별 리뷰 리스트 조회*/
	public List<ReviewDTO> rvlist(Board_PagingVO vo) {
		return sqlSession.selectList(namespace+".rvlist",vo);
	}
	

	/*review 게시판 전체 갯 수*/

	public int countreview() {
		return sqlSession.selectOne(namespace+".countreview");
	}
	/*review 게시판 전체 보기*/
	public List<ReviewDTO> selectreview(OrderCare_PagingVO vo) {
		return sqlSession.selectList(namespace+".selectreview",vo);
	}
	/*review 관리자 페이지 삭제*/
	public void review_board_care_delete(String reviewnum) {
		sqlSession.delete(namespace+".review_board_care_delete",reviewnum);
	}
	/*review게시판 검색 갯수*/
	public int searchreviewcount(SearchBoardDTO searchdto) {
		return sqlSession.selectOne(namespace+".searchreviewcount",searchdto);
	}
	/*review게시판 검색*/
	public List<ReviewDTO> searchreview(OrderCare_PagingVO vo) {
		return sqlSession.selectList(namespace+".searchreview",vo);
	}


}
