
package com.nike.memberInfo;

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
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberInfoDAO {

	private static final String namespace = "com.care.mybatis.memberMapper.memberMapper";
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
	
	/*마일리지 - 마이페이지조회*/
	public String mileage(String id) {
		String mileage = sqlSession.selectOne(namespace+".mileage",id);
		return mileage;
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
	
	/*회원정보 조회*/
	public MemberInfoDTO account(String id) {
		return sqlSession.selectOne(namespace +".account", id);
	}


}