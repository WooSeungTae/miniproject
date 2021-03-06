
package com.nike.memberInfo;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nike.order.OrderDTO;
import com.nike.order.ShoppingCartDTO;
import com.nike.product.ProductDTO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberInfoDAO {
	private  final String sNamespace = "com.care.mybatis.orderMapper.ShoppingCartMapper";
	private  final String oNamespace = "com.care.mybatis.orderMapper.orderMapper";
	private  final String namespace = "com.care.mybatis.memberMapper.memberMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public void saveUserInfo(MemberInfoDTO dto) {
		sqlSession.insert(namespace+".saveUserInfo",dto);
	}
	/* 카카오톡 로그인시 회원가입 */
	public void kakaoUserSave(MemberInfoDTO dto) {
		sqlSession.insert(namespace+".kakaoUserSave",dto);
	}

	public int loginChk(MemberInfoDTO dto) {
		MemberInfoDTO dto2 = sqlSession.selectOne(namespace+".loginChk",dto);
		if(dto2==null) {
			return 0;
		}else {
			return 1;
		}
	}

	/*비밀번호 모를경우 재설정 , 아이디 or 번호로 검색 */
	public MemberInfoDTO searchId(String idtel) {
		return sqlSession.selectOne(namespace+".searchId",idtel);
	}

	/*비밀번호 재설정*/
	public void pwdUpdate(MemberInfoDTO dto) {
		int result = sqlSession.update(namespace+".pwdUpdate",dto);
	}

	/*회원정보 수정*/
	public void memberinfoModify(MemberInfoDTO dto) {
		int result = sqlSession.update(namespace+".memberinfoModify", dto);
	}

	/*마일리지 조회*/
	public String mileage(String id) {
		String mileage = sqlSession.selectOne(namespace+".mileage", id);
		return mileage;
	}
	/*마일리지 수정*/
	public void mileageModify(MemberInfoDTO dto) {
		sqlSession.update(namespace+".mileageModify",dto);
	}
	/*마일리지 적립*/
	public void mileageBuy(OrderDTO Odto) {
		sqlSession.update(namespace+".mileageBuy",Odto);
	}
	

	/*회원정보 수정을 위한 회원정보 조회*/
	public MemberInfoDTO account(String id) {
		return sqlSession.selectOne(namespace +".account", id);
	}
	/*모든 회원목록 출력*/
	public List<MemberInfoDTO> memberlists(){
		return sqlSession.selectList(namespace+".memberlists");
	}
	/*아이디를 토대로 검색 회원목록 출력*/
	public MemberInfoDTO memberlist(String id) {
		return sqlSession.selectOne(namespace+".memberlist",id);
	}
	/*아이디를 토대로 회원 삭제*/
	public void memberdelete(String id) {
		sqlSession.delete(namespace+".memberdelete",id);
	}

	/*멤버 수 반환*/
	public int countBoard() {
		return sqlSession.selectOne(namespace+".countmember");
	}
	/*모든 회원목록 출력 일정량만*/
	public List<MemberInfoDTO> selectBoard(MemberInfo_PagingVO vo){
		return sqlSession.selectList(namespace+".selectmember",vo);
	}
	/* 마이페이지 회원 기존비밀번호 조회 */
	public String beforePwd(String id) {
		return sqlSession.selectOne(namespace+".beforePwd",id);
	}
	/* 마이페이지 회원 비밀번호 변경 */
	public void pwdModify(MemberInfoDTO dto) {
		sqlSession.update(namespace+".pwdModify",dto);
	}
	/* 마이페이지 회원탈퇴 */
	public void userDelete(MemberInfoDTO dto ) {			// 각 테이블 별로 해당 아이디에 대한 데이터 값들 삭제
		sqlSession.delete(namespace+".userDelete",dto);		//(memberInfo table)
		sqlSession.delete(sNamespace+".suserDelete",dto);	//(shoppingcart table)
		sqlSession.delete(oNamespace+".oduserDelete",dto);	//(orderDetailsInfo table)
		sqlSession.delete(oNamespace+".ouserDelete",dto);	//(orderInfo table)
	}
	/* 로그인시 이름출력 */
	public String nameget(String id) {
		return sqlSession.selectOne(namespace+".nameget",id);
	}
	/*회원가입 마일리지 2000점*/
	public void joinmileage(MemberInfoDTO dto) {
		sqlSession.insert(namespace+".joinmileage", dto);
		
	}
	/*memberinfo 테이블 마일리지 업데이트*/
	public void mileageupdate(MemberInfoDTO dto) {
		sqlSession.update(namespace+".udpatemileage", dto);
		
	}
	/*로그인 마일리지 100점*/
	public void loginmileage(String id) {
		sqlSession.insert(namespace+".loginmileage", id);
		
	}
	public void mileageupdate2(MemberInfoDTO dto) {
		sqlSession.update(namespace+".udpatemileage2", dto);
		
	}
	/*mileage 테이블 정보가져오기*/
	public List<MileageDTO> mileagelist(Mileage_PagingVO mvo) {
		return sqlSession.selectList(namespace+".mileagelist", mvo);
	}
	/*구매시 마일리지 테이블에 insert*/
	public void mileagetablebuy(OrderDTO odto) {
		sqlSession.insert(namespace+".mileagetablebuy", odto);
		
	}
	public void mileagetablebuy2(OrderDTO odto) {
		sqlSession.insert(namespace+".mileagetablebuy2", odto);
		
	}

	public int mileagelistcount(String id) {
		return sqlSession.selectOne(namespace+".mileagelistcount", id);
	}

}
